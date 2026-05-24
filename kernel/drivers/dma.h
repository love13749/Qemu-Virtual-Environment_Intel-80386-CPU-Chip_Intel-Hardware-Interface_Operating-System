#ifndef DMA_H
#define DMA_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

// ======================================================================
//  8237 DMA 控制器驱动
//  支持: DMA 通道 0-3 (DMA1), 通道 4-7 (DMA2)
//  支持: 内存到内存传输, 内存到外设传输
//  参考: Intel 8237A-5 DMA Controller Datasheet
// ======================================================================

// ==================== DMA 通道定义 ====================

// DMA 控制器基地址
#define DMA1_BASE       0x00        // 主 DMA (通道 0-3)
#define DMA2_BASE       0xC0        // 从 DMA (通道 4-7)

// DMA1 (通道 0-3) 端口定义
#define DMA1_CH0_ADDR   0x00        // 通道 0 地址寄存器 (内存地址低16位)
#define DMA1_CH0_COUNT  0x01        // 通道 0 计数寄存器
#define DMA1_CH1_ADDR   0x02        // 通道 1
#define DMA1_CH1_COUNT  0x03
#define DMA1_CH2_ADDR   0x04        // 通道 2
#define DMA1_CH2_COUNT  0x05
#define DMA1_CH3_ADDR   0x06        // 通道 3
#define DMA1_CH3_COUNT  0x07
#define DMA1_STATUS     0x08        // 状态寄存器 (读) / 命令寄存器 (写)
#define DMA1_COMMAND    0x08        // 命令寄存器
#define DMA1_REQUEST    0x09        // 请求寄存器
#define DMA1_CHMASK     0x0A        // 单通道屏蔽寄存器
#define DMA1_MODE       0x0B        // 模式寄存器
#define DMA1_FF_RESET   0x0C        // 字节指针触发器复位 (先/后字节)
#define DMA1_TEMP       0x0D        // 暂存寄存器 (读)
#define DMA1_MASTER_CLR 0x0D        // 主清除 (写)
#define DMA1_CLR_MASK   0x0E        // 清除所有屏蔽位
#define DMA1_MASK_ALL   0x0F        // 多通道屏蔽寄存器

// DMA2 (通道 4-7) 端口定义
#define DMA2_CH4_ADDR   0xC0        // 通道 4 地址寄存器
#define DMA2_CH4_COUNT  0xC2        // 通道 4 计数寄存器
#define DMA2_CH5_ADDR   0xC4        // 通道 5
#define DMA2_CH5_COUNT  0xC6
#define DMA2_CH6_ADDR   0xC8        // 通道 6
#define DMA2_CH6_COUNT  0xCA
#define DMA2_CH7_ADDR   0xCC        // 通道 7
#define DMA2_CH7_COUNT  0xCE
#define DMA2_STATUS     0xD0        // 状态寄存器
#define DMA2_COMMAND    0xD0        // 命令寄存器
#define DMA2_REQUEST    0xD2        // 请求寄存器
#define DMA2_CHMASK     0xD4        // 单通道屏蔽寄存器
#define DMA2_MODE       0xD6        // 模式寄存器
#define DMA2_FF_RESET   0xD8        // 字节指针触发器复位
#define DMA2_TEMP       0xDA        // 暂存寄存器
#define DMA2_MASTER_CLR 0xDA        // 主清除
#define DMA2_CLR_MASK   0xDC        // 清除所有屏蔽位
#define DMA2_MASK_ALL   0xDE        // 多通道屏蔽寄存器

// 页寄存器端口 (8237 使用 24 位地址, 需要设置页寄存器)
// 这些是 16MB 地址空间的高 8 位 (A16-A23)
#define DMA_PAGE_CH0    0x87        // 通道 0 页寄存器
#define DMA_PAGE_CH1    0x83        // 通道 1
#define DMA_PAGE_CH2    0x81        // 通道 2
#define DMA_PAGE_CH3    0x82        // 通道 3
#define DMA_PAGE_CH5    0x8B        // 通道 5
#define DMA_PAGE_CH6    0x89        // 通道 6
#define DMA_PAGE_CH7    0x8A        // 通道 7

// ==================== DMA 模式定义 ====================

// 模式寄存器位定义
#define DMA_MODE_DEMAND     0x00    // 请求模式
#define DMA_MODE_SINGLE     0x40    // 单字节模式
#define DMA_MODE_BLOCK      0x80    // 块传输模式
#define DMA_MODE_CASCADE    0xC0    // 级联模式

#define DMA_MODE_VERIFY     0x00    // 校验传输
#define DMA_MODE_WRITE      0x04    // 写传输 (I/O → 内存)
#define DMA_MODE_READ       0x08    // 读传输 (内存 → I/O)

#define DMA_MODE_AUTOINIT   0x10    // 自动初始化

// 地址递增/递减
#define DMA_ADDR_INCREMENT  0x00    // 地址递增
#define DMA_ADDR_DECREMENT  0x20    // 地址递减

// 通道 0 的特殊命令 (内存到内存传输)
#define DMA_MEM_TO_MEM      0x01    // 命令寄存器 bit0 = 1 启用内存到内存
#define DMA_MEM_TO_MEM_SRC  0x00    // 通道 0 为源地址 (固定)
#define DMA_MEM_TO_MEM_DST  0x01    // 通道 1 为目标地址 (固定)

// ==================== 页寄存器地址映射 (16MB 空间) ====================

// 计算 24 位物理地址所需的页面 (64KB 一页)
// 物理地址 = (page << 16) | offset
// 其中 page 由页寄存器提供, offset 由地址寄存器提供

#define DMA_PAGE_SHIFT      16
#define DMA_OFFSET_MASK     0xFFFF

// ==================== 错误码 ====================

#define DMA_SUCCESS         0
#define DMA_ERR_INVAL_CH   -1      // 无效通道
#define DMA_ERR_ADDR_RANGE -2      // 地址超出 16MB 范围
#define DMA_ERR_BUSY       -3      // 通道忙
#define DMA_ERR_TIMEOUT    -4      // 传输超时

// ==================== DMA 通道描述 ====================

// DMA 传输方向
typedef enum {
    DMA_DIR_READ    = 0x08,     // 内存 → I/O (读外设)
    DMA_DIR_WRITE   = 0x04,     // I/O → 内存 (写外设)
    DMA_DIR_VERIFY  = 0x00,     // 校验
    DMA_DIR_MEMCPY  = 0x00      // 内存到内存 (通道 0+1)
} dma_direction_t;

// DMA 传输模式
typedef enum {
    DMA_MODE_SINGLE_TRANSFER   = DMA_MODE_SINGLE,   // 单字节模式
    DMA_MODE_BLOCK_TRANSFER    = DMA_MODE_BLOCK,     // 块传输模式
    DMA_MODE_DEMAND_TRANSFER   = DMA_MODE_DEMAND,    // 请求模式
    DMA_MODE_CASCADE_MODE      = DMA_MODE_CASCADE    // 级联模式
} dma_transfer_mode_t;

// DMA 通道状态
typedef enum {
    DMA_CH_FREE     = 0,
    DMA_CH_BUSY     = 1,
    DMA_CH_DONE     = 2,
    DMA_CH_ERROR    = 3
} dma_channel_state_t;

// DMA 通道信息结构
typedef struct {
    uint8_t             channel;        // 通道号 (0-7)
    bool                used;           // 是否已被分配
    dma_channel_state_t state;          // 当前状态
    uint32_t            phys_addr;      // 物理地址 (24位, 最大16MB)
    uint32_t            transfer_size;  // 传输大小 (字节)
    dma_direction_t     direction;      // 传输方向
    dma_transfer_mode_t mode;           // 传输模式
    bool                auto_init;      // 自动初始化
} dma_channel_t;

// ==================== 导出函数 ====================

// DMA 初始化
void dma_init(void);

// 分配一个 DMA 通道
int dma_channel_alloc(uint8_t channel);

// 释放一个 DMA 通道
void dma_channel_free(uint8_t channel);

// 配置 DMA 传输参数
int dma_setup_transfer(
    uint8_t             channel,
    uint32_t            phys_addr,
    uint32_t            size,
    dma_direction_t     direction,
    dma_transfer_mode_t mode,
    bool                auto_init
);

// 启动 DMA 传输 (非阻塞)
int dma_start_transfer(uint8_t channel);

// 等待 DMA 传输完成 (阻塞)
int dma_wait_completion(uint8_t channel, uint32_t timeout_ms);

// 获取 DMA 通道状态
dma_channel_state_t dma_get_channel_state(uint8_t channel);

// 停止 DMA 传输
void dma_stop_transfer(uint8_t channel);

// ==================== DMA 内存拷贝函数 ====================

// 使用 DMA 通道 0 (内存到内存模式) 进行内存拷贝
// 注意: 源和目标地址都必须是物理地址, 且在 16MB 以下
// 返回: 实际拷贝的字节数, 负数表示错误
int dma_memcpy_phys(uint32_t dst_phys, uint32_t src_phys, uint32_t size);

// 使用 DMA 进行内核虚拟地址到虚拟地址的拷贝 (自动转换地址)
// src 和 dst 是内核虚拟地址 (线性地址 = 物理地址, 因为没有分页)
// 如果有分页, 需要先转换成物理地址
int dma_memcpy(void* dst, const void* src, uint32_t size);

// ==================== DMA 缓冲区操作 ====================

// 分配 DMA 安全缓冲区 (16MB 以下, 物理地址连续)
// flags: bit0 = 是否需要清零
void* dma_alloc_buffer(uint32_t size, int flags);

// 释放 DMA 缓冲区
void dma_free_buffer(void* buf, uint32_t size);

// ==================== DMA 调试 ====================

// 打印 DMA 控制器状态
void dma_dump_status(void);

// 打印所有通道信息
void dma_dump_channels(void);

// DMA 内存拷贝演示 (在 kernel_main 和调试器中调用)
void dma_demo(void);

// 验证 DMA 传输结果 (返回差异字节数)
int dma_verify_transfer(const void* src, const void* dst, uint32_t size);

// ==================== DMA 内部函数 ====================

// 获取通道所属的 DMA 控制器 (0 或 1)
static inline int dma_controller(uint8_t channel) {
    return (channel < 4) ? 0 : 1;
}

// 获取通道在所属控制器内的索引 (0-3)
static inline int dma_channel_index(uint8_t channel) {
    return channel & 0x03;
}

// 获取某个 DMA 控制器的命令端口
static inline uint16_t dma_cmd_port(uint8_t channel) {
    return (channel < 4) ? DMA1_COMMAND : DMA2_COMMAND;
}

// 获取某个 DMA 控制器的模式端口
static inline uint16_t dma_mode_port(uint8_t channel) {
    return (channel < 4) ? DMA1_MODE : DMA2_MODE;
}

// 获取某个 DMA 控制器的 FF 复位端口
static inline uint16_t dma_ff_port(uint8_t channel) {
    return (channel < 4) ? DMA1_FF_RESET : DMA2_FF_RESET;
}

// 获取某个 DMA 控制器的单通道屏蔽端口
static inline uint16_t dma_mask_port(uint8_t channel) {
    return (channel < 4) ? DMA1_CHMASK : DMA2_CHMASK;
}

// 获取某个 DMA 控制器的清除所有屏蔽端口
static inline uint16_t dma_clear_mask_port(uint8_t channel) {
    return (channel < 4) ? DMA1_CLR_MASK : DMA2_CLR_MASK;
}

// 获取某个 DMA 控制器的状态端口
static inline uint16_t dma_status_port(uint8_t channel) {
    return (channel < 4) ? DMA1_STATUS : DMA2_STATUS;
}

// 获取某个通道的页寄存器端口
static inline uint16_t dma_page_port(uint8_t channel) {
    static const uint8_t page_ports[] = {
        DMA_PAGE_CH0, DMA_PAGE_CH1, DMA_PAGE_CH2, DMA_PAGE_CH3,
        0, DMA_PAGE_CH5, DMA_PAGE_CH6, DMA_PAGE_CH7
    };
    if (channel > 7 || channel == 4) return 0;
    return page_ports[channel];
}

#endif // DMA_H
