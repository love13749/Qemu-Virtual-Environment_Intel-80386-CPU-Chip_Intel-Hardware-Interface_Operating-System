#include "dma.h"
#include "../terminal.h"
#include "../memory/memory.h"
#include "../lib/libk.h"
#include "../architecture/i386/isr.h"

// ======================================================================
//  8237 DMA 控制器驱动实现
// ======================================================================

// 通道状态表
static dma_channel_t dma_channels[8];

// 内存到内存传输标志（用于指示传输完成）
static volatile bool dma_memcpy_done = false;

// ==================== 内部辅助函数 ====================

// 将通道号转换为屏蔽寄存器的位码
// 单通道屏蔽: 低2位=通道号, bit2=1屏蔽/0解除屏蔽
static inline uint8_t dma_mask_bit(uint8_t channel, bool mask) {
    return (channel & 0x03) | (mask ? 0x04 : 0x00);
}

// 复位字节指针触发器 (先/后字节触发器)
// 8237 有 16 位内部寄存器，需要分两次写入
// 第一次写低字节，第二次写高字节
static inline void dma_reset_ff(uint8_t channel) {
    outb(dma_ff_port(channel), 0xFF);  // 写入任意值即可复位
}

// 将 24 位物理地址分解为页寄存器和 16 位偏移
// 地址格式: [页寄存器: 8位] [地址寄存器: 16位]
//          bit23-bit16     bit15-bit0
static void dma_set_address(uint8_t channel, uint32_t phys_addr) {
    uint16_t page_port = dma_page_port(channel);
    if (page_port == 0) return;
    
    // 地址低 16 位 (偏移)
    uint16_t offset = phys_addr & 0xFFFF;
    
    // 地址高 8 位 (页号, 64KB 为一页)
    uint8_t page = (phys_addr >> 16) & 0xFF;
    
    // 获取通道在所属控制器内的索引
    int idx = dma_channel_index(channel);
    
    // 获取该通道的地址端口
    uint16_t addr_port;
    if (channel < 4) {
        addr_port = DMA1_CH0_ADDR + idx * 2;
    } else {
        addr_port = DMA2_CH4_ADDR + idx * 2;
    }
    
    // 复位字节指针触发器
    dma_reset_ff(channel);
    
    // 写入地址偏移 (低16位)
    outb(addr_port, offset & 0xFF);       // 低字节
    outb(addr_port, (offset >> 8) & 0xFF); // 高字节
    
    // 写入页寄存器 (高8位)
    outb(page_port, page);
    
    // 对于通道 0 (内存到内存), 源地址由通道0指定, 目标地址由通道1指定
    // 如果是内存到内存传输, 且设置了通道0, 还需要设置通道1的地址为目标地址
}

// 设置传输大小 (计数寄存器的值 = 传输字节数 - 1)
static void dma_set_count(uint8_t channel, uint32_t size) {
    if (size == 0 || size > 0x10000) return;  // 最大 64KB
    
    int idx = dma_channel_index(channel);
    
    uint16_t count_port;
    if (channel < 4) {
        count_port = DMA1_CH0_COUNT + idx * 2;
    } else {
        count_port = DMA2_CH4_COUNT + idx * 2;
    }
    
    uint16_t count = (uint16_t)(size - 1);  // 计数 = 传输字节数 - 1
    
    dma_reset_ff(channel);
    outb(count_port, count & 0xFF);
    outb(count_port, (count >> 8) & 0xFF);
}

// 设置模式寄存器
static void dma_set_mode(uint8_t channel, uint8_t mode) {
    uint16_t mode_port = dma_mode_port(channel);
    uint8_t idx = dma_channel_index(channel);
    
    // 模式寄存器格式:
    // bit7-6: 传输模式 (00=请求, 01=单次, 10=块, 11=级联)
    // bit5:   地址方向 (0=递增, 1=递减)
    // bit4:   自动初始化 (0=禁用, 1=启用)
    // bit3-2: 传输类型 (00=校验, 01=写, 10=读, 11=非法)
    // bit1-0: 通道选择
    
    outb(mode_port, mode | idx);
}

// 屏蔽/解除屏蔽通道
static void dma_set_mask(uint8_t channel, bool mask) {
    uint16_t mask_port = dma_mask_port(channel);
    outb(mask_port, dma_mask_bit(channel, mask));
}

// 解除所有通道的屏蔽
__attribute__((unused))
static void dma_clear_all_masks(uint8_t channel) {
    uint16_t port = dma_clear_mask_port(channel);
    outb(port, 0xFF);  // 写入任意值
}

// ==================== 初始化 ====================

void dma_init(void) {
    terminal_writestring("Initializing 8237 DMA controller...\n");
    
    // 清空通道状态表
    memset(dma_channels, 0, sizeof(dma_channels));
    
    // 初始化所有通道为 FREE
    for (int i = 0; i < 8; i++) {
        dma_channels[i].channel = i;
        dma_channels[i].used = false;
        dma_channels[i].state = DMA_CH_FREE;
    }
    
    // 通道 4 是级联通道, 不能用于数据传输
    dma_channels[4].used = true;  // 标记为已用
    dma_channels[4].state = DMA_CH_BUSY;
    
    // ---- DMA1 (通道 0-3) 初始化 ----
    
    // 1. 发送主清除命令 (复位整个 DMA 控制器)
    outb(DMA1_MASTER_CLR, 0xFF);
    
    // 2. 解除所有屏蔽
    outb(DMA1_CLR_MASK, 0xFF);
    
    // 3. 设置命令寄存器:
    //    bit0 = 0: 禁用内存到内存
    //    bit1 = 0: 禁用通道0地址保持
    //    bit2 = 0: 允许控制器工作
    //    bit3 = 0: 正常时序
    //    bit4 = 0: 固定优先级 (通道0最高)
    //    bit5 = 0: 正常写入
    //    bit6 = 0: DREQ 高电平有效
    //    bit7 = 0: DACK 低电平有效
    outb(DMA1_COMMAND, 0x00);
    
    // ---- DMA2 (通道 4-7) 初始化 ----
    
    outb(DMA2_MASTER_CLR, 0xFF);
    outb(DMA2_CLR_MASK, 0xFF);
    outb(DMA2_COMMAND, 0x00);
    
    // 配置通道 4 为级联模式 (用于级联 DMA1)
    // 通道 4 在 DMA2 中的索引为 0
    outb(DMA2_MODE, DMA_MODE_CASCADE | 0x00);  // 通道4 = 级联
    
    // 屏蔽通道 4 (它只作为级联通道)
    dma_set_mask(4, true);
    
    terminal_writestring("DMA controller initialized.\n");
    terminal_writestring("  Channels 0-3: available (DMA1)\n");
    terminal_writestring("  Channels 5-7: available (DMA2)\n");
    terminal_writestring("  Channel 4: reserved (cascade)\n");
    terminal_writestring("  Max transfer: 64KB per operation\n");
    terminal_writestring("  Address range: 0x000000 - 0xFFFFFF (16MB)\n");
}

// ==================== 通道管理 ====================

int dma_channel_alloc(uint8_t channel) {
    if (channel > 7) return DMA_ERR_INVAL_CH;
    if (channel == 4) return DMA_ERR_INVAL_CH;  // 通道4是级联通道
    
    if (dma_channels[channel].used) {
        terminal_writestring("dma_channel_alloc: channel ");
        char buf[8];
        itoa(channel, buf, 10);
        terminal_writestring(buf);
        terminal_writestring(" already in use.\n");
        return DMA_ERR_BUSY;
    }
    
    dma_channels[channel].used = true;
    dma_channels[channel].state = DMA_CH_FREE;
    
    return DMA_SUCCESS;
}

void dma_channel_free(uint8_t channel) {
    if (channel > 7 || channel == 4) return;
    
    // 停止传输
    dma_stop_transfer(channel);
    
    dma_channels[channel].used = false;
    dma_channels[channel].state = DMA_CH_FREE;
}

// ==================== 传输配置 ====================

int dma_setup_transfer(
    uint8_t             channel,
    uint32_t            phys_addr,
    uint32_t            size,
    dma_direction_t     direction,
    dma_transfer_mode_t transfer_mode,
    bool                auto_init
) {
    if (channel > 7 || channel == 4) return DMA_ERR_INVAL_CH;
    if (!dma_channels[channel].used) return DMA_ERR_INVAL_CH;
    
    // 检查地址范围 (8237 只能访问 0x000000-0xFFFFFF)
    if (phys_addr >= 0x1000000 || phys_addr + size > 0x1000000) {
        terminal_writestring("dma_setup_transfer: address beyond 16MB!\n");
        return DMA_ERR_ADDR_RANGE;
    }
    
    // 检查大小 (最大 64KB)
    if (size == 0 || size > 0x10000) {
        terminal_writestring("dma_setup_transfer: invalid size (max 64KB).\n");
        return DMA_ERR_INVAL_CH;
    }
    
    // 保存配置
    dma_channels[channel].phys_addr = phys_addr;
    dma_channels[channel].transfer_size = size;
    dma_channels[channel].direction = direction;
    dma_channels[channel].mode = transfer_mode;
    dma_channels[channel].auto_init = auto_init;
    
    // 1. 屏蔽通道 (防止在配置过程中触发)
    dma_set_mask(channel, true);
    
    // 2. 复位字节指针触发器
    dma_reset_ff(channel);
    
    // 3. 设置地址
    dma_set_address(channel, phys_addr);
    
    // 4. 设置传输大小
    dma_set_count(channel, size);
    
    // 5. 设置模式
    uint8_t mode = transfer_mode;
    mode |= DMA_ADDR_INCREMENT;  // 默认地址递增
    
    if (auto_init) {
        mode |= DMA_MODE_AUTOINIT;
    }
    
    // 如果是内存到内存传输 (仅限通道0+1)
    if (channel == 0 && direction == DMA_DIR_MEMCPY) {
        mode |= DMA_MODE_READ;  // 内存到内存时, 通道0为读模式
    } else {
        mode |= (uint8_t)direction;
    }
    
    dma_set_mode(channel, mode);
    
    // 6. 解除屏蔽
    dma_set_mask(channel, false);
    
    dma_channels[channel].state = DMA_CH_FREE;
    
    return DMA_SUCCESS;
}

// ==================== 启动/停止/等待 ====================

int dma_start_transfer(uint8_t channel) {
    if (channel > 7 || channel == 4) return DMA_ERR_INVAL_CH;
    
    dma_channel_t* ch = &dma_channels[channel];
    if (!ch->used) return DMA_ERR_INVAL_CH;
    
    // 解除屏蔽 (这会让 DMA 开始传输)
    dma_set_mask(channel, false);
    
    ch->state = DMA_CH_BUSY;
    
    return DMA_SUCCESS;
}

int dma_wait_completion(uint8_t channel, uint32_t timeout_ms) {
    if (channel > 7) return DMA_ERR_INVAL_CH;
    
    // 对于内存到内存传输，检查 dma_memcpy_done 标志
    if (channel == 0) {
        uint32_t ticks = 0;
        while (!dma_memcpy_done) {
            if (timeout_ms > 0) {
                // 简单的时间轮询 (大约 1ms 粒度)
                for (volatile uint32_t i = 0; i < 10000; i++);
                ticks++;
                if (ticks >= timeout_ms) {
                    terminal_writestring("dma_wait_completion: timeout!\n");
                    return DMA_ERR_TIMEOUT;
                }
            } else {
                asm volatile("hlt");  // 无限等待时让出 CPU
            }
        }
        dma_memcpy_done = false;
        return DMA_SUCCESS;
    }
    
    // 其他通道: 轮询状态寄存器
    // 状态寄存器: bit0-3 = 通道0-3 是否传输完成 (1=完成)
    // bit4-7 = 通道0-3 是否有 DMA 请求
    uint16_t status_port = dma_status_port(channel);
    uint8_t ch_bit = 1 << dma_channel_index(channel);
    
    uint32_t ticks = 0;
    while (1) {
        uint8_t status = inb(status_port);
        
        // TC (Terminal Count) 位表示传输完成
        if (status & ch_bit) {
            dma_channels[channel].state = DMA_CH_DONE;
            return DMA_SUCCESS;
        }
        
        if (timeout_ms > 0) {
            for (volatile uint32_t i = 0; i < 10000; i++);
            ticks++;
            if (ticks >= timeout_ms) {
                dma_channels[channel].state = DMA_CH_ERROR;
                return DMA_ERR_TIMEOUT;
            }
        } else {
            asm volatile("hlt");
        }
    }
}

dma_channel_state_t dma_get_channel_state(uint8_t channel) {
    if (channel > 7) return DMA_CH_ERROR;
    return dma_channels[channel].state;
}

void dma_stop_transfer(uint8_t channel) {
    if (channel > 7 || channel == 4) return;
    
    // 屏蔽通道 (停止传输)
    dma_set_mask(channel, true);
    
    dma_channels[channel].state = DMA_CH_FREE;
}

// ==================== DMA 内存拷贝 ====================

// 内存到内存 DMA 传输中断处理函数
__attribute__((unused))
static void dma_memcpy_isr(registers_t* regs) {
    (void)regs;
    
    // 读取 DMA1 状态寄存器, 清除 TC 标志
    uint8_t status = inb(DMA1_STATUS);
    (void)status;  // 读取状态即可清除
    
    // 内存到内存传输完成
    // 注意: 在块传输模式下, 传输完成后 TC (Terminal Count) 被设置
    // 通道0 的 TC 位 = status bit0
    
    dma_memcpy_done = true;
}

int dma_memcpy_phys(uint32_t dst_phys, uint32_t src_phys, uint32_t size) {
    // 参数检查
    if (size == 0 || size > 0x8000) {  // 限制最大 32KB 以免占用太久
        terminal_writestring("dma_memcpy_phys: invalid size (max 32KB).\n");
        return DMA_ERR_INVAL_CH;
    }
    
    // 8237 DMA 只能访问 0x000000 - 0xFFFFFF
    if (src_phys >= 0x1000000 || dst_phys >= 0x1000000) {
        terminal_writestring("dma_memcpy_phys: address >= 16MB, DMA cannot access!\n");
        char buf[32];
        terminal_writestring("  src=0x"); itoa((int)src_phys, buf, 16); terminal_writestring(buf);
        terminal_writestring(" dst=0x"); itoa((int)dst_phys, buf, 16); terminal_writestring(buf);
        terminal_writestring("\n");
        return DMA_ERR_ADDR_RANGE;
    }
    if (src_phys + size > 0x1000000 || dst_phys + size > 0x1000000) {
        terminal_writestring("dma_memcpy_phys: transfer crosses 16MB boundary!\n");
        return DMA_ERR_ADDR_RANGE;
    }
    
    // 检查通道可用性
    if (dma_channels[0].used || dma_channels[1].used) {
        terminal_writestring("dma_memcpy_phys: channels 0/1 busy.\n");
        return DMA_ERR_BUSY;
    }
    
    char buf[32];
    terminal_writestring("\n[DMA] Memory copy: 0x");
    itoa((int)src_phys, buf, 16);
    terminal_writestring(buf);
    terminal_writestring(" -> 0x");
    itoa((int)dst_phys, buf, 16);
    terminal_writestring(buf);
    terminal_writestring(", ");
    itoa((int)size, buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" bytes\n");
    
    // ---- 配置内存到内存传输 ----
    // 内存到内存传输需要占用通道 0 和通道 1
    // 通道 0: 源地址
    // 通道 1: 目标地址
    
    // 标记通道 0 和 1 为已用
    dma_channels[0].used = true;
    dma_channels[1].used = true;
    
    // 1. 屏蔽通道 0 和 1
    dma_set_mask(0, true);
    dma_set_mask(1, true);
    
    // 2. 复位字节指针触发器
    dma_reset_ff(0);
    dma_reset_ff(1);
    
    // 3. 启用内存到内存传输 (命令寄存器 bit0 = 1)
    //    启用后, 通道 0 自动作为源, 通道 1 作为目标
    outb(DMA1_COMMAND, DMA_MEM_TO_MEM);
    
    // 4. 设置通道 0 (源地址)
    dma_set_address(0, src_phys);
    
    // 5. 设置通道 1 (目标地址)
    dma_set_address(1, dst_phys);
    
    // 6. 设置传输大小 (通道 0 的计数寄存器决定传输量)
    dma_set_count(0, size);
    
    // 7. 设置通道 1 的大小为相同的值
    dma_set_count(1, size);
    
    // 8. 设置模式:
    //    通道 0: 内存读, 块传输, 地址递增
    //    通道 1: 内存写, 块传输, 地址递增
    outb(DMA1_MODE, DMA_MODE_BLOCK | DMA_MODE_READ  | 0x00);   // 通道0
    outb(DMA1_MODE, DMA_MODE_BLOCK | DMA_MODE_WRITE | 0x01);   // 通道1
    
    // 9. 解除通道 0 和 1 的屏蔽 (开始传输)
    dma_memcpy_done = false;
    
    // 注意: 解除屏蔽的顺序很重要, 通道 1 必须在通道 0 之前解除屏蔽
    // 因为通道 1 需要在通道 0 开始前准备好
    dma_set_mask(1, false);
    dma_set_mask(0, false);
    
    // DMA 块传输模式下, 传输会一直进行到完成, 不会暂停
    // 在块传输期间, CPU 被暂停 (DMA 控制总线)
    // 但 8237 实际上是在系统总线上"窃取"总线周期
    
    // 10. 等待传输完成
    // 对于 8237 的块传输模式, 传输是同步的
    // 我们可以通过在循环中轮询状态寄存器来等待
    
    // 方式 1: 轮询等待
    terminal_writestring("[DMA] Waiting for transfer to complete...\n");
    
    uint32_t timeout = 5000000;  // 超时保护
    while (timeout > 0) {
        uint8_t status = inb(DMA1_STATUS);
        if (status & 0x01) {  // 通道 0 TC (Terminal Count)
            break;
        }
        timeout--;
        if (timeout == 0) {
            terminal_writestring("[DMA] ERROR: Transfer timeout!\n");
            dma_set_mask(0, true);
            dma_set_mask(1, true);
            outb(DMA1_COMMAND, 0x00);  // 禁用内存到内存模式
            dma_channels[0].used = false;
            dma_channels[1].used = false;
            return DMA_ERR_TIMEOUT;
        }
    }
    
    // 11. 恢复命令寄存器 (禁用内存到内存模式)
    outb(DMA1_COMMAND, 0x00);
    
    // 12. 屏蔽通道
    dma_set_mask(0, true);
    dma_set_mask(1, true);
    
    // 13. 释放通道
    dma_channels[0].used = false;
    dma_channels[1].used = false;
    dma_channels[0].state = DMA_CH_DONE;
    dma_channels[1].state = DMA_CH_DONE;
    
    terminal_writestring("[DMA] Transfer complete!\n");
    
    return (int)size;
}

int dma_memcpy(void* dst, const void* src, uint32_t size) {
    // 在没有分页的情况下, 内核虚拟地址 = 物理地址
    // 所以可以直接转换
    uint32_t src_phys = (uint32_t)src;
    uint32_t dst_phys = (uint32_t)dst;
    
    return dma_memcpy_phys(dst_phys, src_phys, size);
}

// ==================== DMA 缓冲区管理 ====================

// DMA 缓冲区头信息
typedef struct dma_buffer_header {
    struct dma_buffer_header* next;     // 链表指针
    uint32_t                 phys;      // 物理地址
    uint32_t                 size;      // 大小
    bool                     free;      // 是否空闲
} dma_buffer_header_t;

// DMA 缓冲区链表 (简化版, 使用 kmalloc 分配内存, 地址通常就在 16MB 以下)
__attribute__((unused))
static dma_buffer_header_t* dma_buf_list = NULL;

void* dma_alloc_buffer(uint32_t size, int flags) {
    // 对齐到 16 字节 (DMA 要求)
    size = (size + 15) & ~15;
    if (size == 0) return NULL;
    
    // 使用 kmalloc 分配 (在当前配置下, 内核堆在 16MB~256MB)
    // 注意: kmalloc 返回的地址可能在 16MB 以上!
    // 对于真正的 DMA, 需要使用 alloc_pages 分配低于 16MB 的物理页
    
    // 为了简单, 我们尝试使用 alloc_pages 分配低于 16MB 的页
    uint32_t num_pages = (size + 4095) / 4096;
    void* addr = alloc_pages(num_pages);
    
    if (!addr) {
        terminal_writestring("dma_alloc_buffer: out of memory!\n");
        return NULL;
    }
    
    // 确保地址在 16MB 以下
    if ((uint32_t)addr >= 0x1000000) {
        terminal_writestring("dma_alloc_buffer: warning, addr > 16MB!\n");
        // 实际上伙伴系统分配器从 KERNEL_HEAP_START (16MB) 之后的页开始分配
        // 对于真正的低于 16MB 的 DMA 内存, 需要特殊的内存池
        // 这里我们返回地址, 但打印警告
    }
    
    if (flags & 1) {
        memset(addr, 0, size);
    }
    
    return addr;
}

void dma_free_buffer(void* buf, uint32_t size) {
    if (!buf) return;
    
    uint32_t num_pages = (size + 4095) / 4096;
    free_pages(buf, num_pages);
}

// ==================== 调试函数 ====================

void dma_dump_status(void) {
    terminal_writestring("\n=== DMA Controller Status ===\n");
    
    // 读取 DMA1 状态
    uint8_t status1 = inb(DMA1_STATUS);
    uint8_t status2 = inb(DMA2_STATUS);
    
    char buf[16];
    
    terminal_writestring("  DMA1 Status: 0x");
    itoa((int)status1, buf, 16);
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    terminal_writestring("  DMA2 Status: 0x");
    itoa((int)status2, buf, 16);
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    // 解码状态位
    terminal_writestring("  [DMA1] TC: ");
    for (int i = 0; i < 4; i++) {
        terminal_writestring(status1 & (1 << i) ? "1" : "0");
    }
    terminal_writestring("  Request: ");
    for (int i = 0; i < 4; i++) {
        terminal_writestring(status1 & (1 << (i + 4)) ? "1" : "0");
    }
    terminal_writestring("\n");
    
    terminal_writestring("  [DMA2] TC: ");
    for (int i = 0; i < 4; i++) {
        terminal_writestring(status2 & (1 << i) ? "1" : "0");
    }
    terminal_writestring("  Request: ");
    for (int i = 0; i < 4; i++) {
        terminal_writestring(status2 & (1 << (i + 4)) ? "1" : "0");
    }
    terminal_writestring("\n");
    terminal_writestring("============================\n");
}

void dma_dump_channels(void) {
    terminal_writestring("\n=== DMA Channels ===\n");
    terminal_writestring("Ch  Used State      Mode\n");
    terminal_writestring("--------------------------\n");
    
    char buf[16];
    for (int i = 0; i < 8; i++) {
        dma_channel_t* ch = &dma_channels[i];
        
        itoa(i, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("  ");
        
        terminal_writestring(ch->used ? "YES " : "NO  ");
        
        switch (ch->state) {
            case DMA_CH_FREE:  terminal_writestring("FREE      "); break;
            case DMA_CH_BUSY:  terminal_writestring("BUSY      "); break;
            case DMA_CH_DONE:  terminal_writestring("DONE      "); break;
            case DMA_CH_ERROR: terminal_writestring("ERROR     "); break;
        }
        
        terminal_writestring("\n");
    }
    terminal_writestring("========================\n");
}

// 验证 DMA 传输结果
// 比较源和目标内存区域, 返回不同的字节数
int dma_verify_transfer(const void* src, const void* dst, uint32_t size) {
    int diff_count = 0;
    const uint8_t* s = (const uint8_t*)src;
    const uint8_t* d = (const uint8_t*)dst;
    
    for (uint32_t i = 0; i < size; i++) {
        if (s[i] != d[i]) {
            diff_count++;
            if (diff_count <= 10) {
                terminal_writestring("  Mismatch at offset ");
                char buf[16];
                itoa((int)i, buf, 10);
                terminal_writestring(buf);
                terminal_writestring(": ");
                itoa((int)s[i], buf, 16);
                terminal_writestring(buf);
                terminal_writestring(" != ");
                itoa((int)d[i], buf, 16);
                terminal_writestring(buf);
                terminal_writestring("\n");
            }
        }
    }
    
    return diff_count;
}

// ==================== DMA 演示函数 ====================

// 在 16MB 以下保留一块 DMA 安全的内存区域
// 使用 1MB 之后的区域（内核通常在 1MB 加载，但实际 page_align 加载）
// 实际上 Multiboot 信息结构在 0x100000 附近，但内核通常只占用很小一部分
// 我们用 0x100000 ~ 0x101000 之间的区域（刚好在内核代码段之后、堆之前）
// 不过更安全的方法是使用 VGA 显存之后的区域
// 这里使用 0x00F00000 (15MB) 开始的 64KB 区域做测试
// (假设这部分未被使用)
#define DMA_DEMO_BUFFER_BASE  0x00F00000
#define DMA_DEMO_BUFFER_SIZE  0x10000    // 64KB

// 演示 DMA 内存拷贝功能
void dma_demo(void) {
    terminal_writestring("\n==================================\n");
    terminal_writestring("  DMA Memory Copy Demo\n");
    terminal_writestring("==================================\n");
    
    char buf[64];

    // 使用 15MB 物理地址区域的缓冲区
    // 这样确保地址在 0x000000 - 0xFFFFFF (16MB) 范围内
    void* src_buf = (void*)DMA_DEMO_BUFFER_BASE;
    void* dst_buf = (void*)(DMA_DEMO_BUFFER_BASE + 0x1000);  // 偏移 4KB

    // 先确保目标区域可用（简单检查）
    terminal_writestring("  Using DMA-safe buffer at 0x00F00000\n");

    // 在源缓冲区中填充测试数据
    for (int i = 0; i < 256; i++) {
        ((uint8_t*)src_buf)[i] = (uint8_t)(i & 0xFF);
    }
    
    // 在目标缓冲区中填充不同的数据 (以便确认拷贝生效)
    memset(dst_buf, 0xAA, 256);

    terminal_writestring("  Source: 0x");
    itoa((int)(uint32_t)src_buf, buf, 16);
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    terminal_writestring("  Dest:   0x");
    itoa((int)(uint32_t)dst_buf, buf, 16);
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    terminal_writestring("  Source data (first 16 bytes): ");
    for (int i = 0; i < 16; i++) {
        itoa((int)((uint8_t*)src_buf)[i], buf, 16);
        if (((uint8_t*)src_buf)[i] < 0x10) terminal_writestring("0");
        terminal_writestring(buf);
        terminal_writestring(" ");
    }
    terminal_writestring("\n");
    
    terminal_writestring("  Dest data before copy (first 16 bytes): ");
    for (int i = 0; i < 16; i++) {
        itoa((int)((uint8_t*)dst_buf)[i], buf, 16);
        if (((uint8_t*)dst_buf)[i] < 0x10) terminal_writestring("0");
        terminal_writestring(buf);
        terminal_writestring(" ");
    }
    terminal_writestring("\n");
    
    // 执行 DMA 内存拷贝
    terminal_writestring("\n  Starting DMA transfer...\n");
    int result = dma_memcpy(dst_buf, src_buf, 256);
    
    if (result < 0) {
        terminal_writestring("  DMA transfer failed with error code: ");
        itoa(result, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("\n");
    } else {
        terminal_writestring("  DMA transfer completed: ");
        itoa(result, buf, 10);
        terminal_writestring(buf);
        terminal_writestring(" bytes copied.\n");
        
        terminal_writestring("  Dest data after copy (first 16 bytes): ");
        for (int i = 0; i < 16; i++) {
            itoa((int)((uint8_t*)dst_buf)[i], buf, 16);
            if (((uint8_t*)dst_buf)[i] < 0x10) terminal_writestring("0");
            terminal_writestring(buf);
            terminal_writestring(" ");
        }
        terminal_writestring("\n");
        
        // 验证传输
        int diffs = dma_verify_transfer(src_buf, dst_buf, 256);
        if (diffs == 0) {
            terminal_writestring("\n  ✅ DMA transfer VERIFIED: data matches!\n");
        } else {
            terminal_writestring("\n  ❌ DMA transfer MISMATCH: ");
            itoa(diffs, buf, 10);
            terminal_writestring(buf);
            terminal_writestring(" differences.\n");
        }
    }
    
    // 恢复目标区域（清理）
    memset(dst_buf, 0, 256);

    terminal_writestring("==================================\n\n");
}
