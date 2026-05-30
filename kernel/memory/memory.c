#include "memory.h"
#include "../terminal.h"
#include "../lib/libk.h"
#include "../system/process.h"

// ======================================================================
//  物理内存管理 - 使用伙伴系统 (Buddy System) 分配物理页
// ======================================================================

#define PAGE_SIZE           4096            // 4KB 标准页
#define PAGE_SHIFT          12              // 页偏移位数 (2^12 = 4096)
#define MAX_ORDER           10              // 最大阶 (2^10 = 1024 pages ≈ 4MB 连续块)
#define MEMORY_MAX_PAGES    0x100000        // 最多 4GB
#define BITMAP_WORDS        (MEMORY_MAX_PAGES / 32)

// 伙伴系统的空闲链表：每个 order 对应一个链表
typedef struct page_frame {
    struct page_frame* next;                // 空闲链表指针
    struct page_frame* prev;
    uint32_t           order;               // 当前块的阶数
    bool               used;                // 是否已分配
} page_frame_t;

// 物理页信息数组（每个物理页对应一个描述符）
static page_frame_t page_frames[MEMORY_MAX_PAGES];
static uint32_t     total_pages = 0;
static uint32_t     used_pages  = 0;

// 伙伴系统空闲链表头
static page_frame_t* free_areas[MAX_ORDER + 1];

// 位图（用于快速标记已用页面, 兼容旧版代码）
static uint32_t page_bitmap[BITMAP_WORDS];

// ======================================================================
//  内核堆管理 - 改进的链表分配器 (First-Fit + 合并)
// ======================================================================

#define KERNEL_HEAP_START   0x01000000      // 内核堆起始 (16MB)
#define KERNEL_HEAP_SIZE    0x0F000000      // 内核堆大小 (240MB)

// 堆块头部（含金丝雀校验值）
typedef struct heap_block {
    uint32_t             size;              // 数据区大小（不含头部）
    uint32_t             magic;             // 魔数校验 0xDEADBEEF
    uint32_t             canary;            // 金丝雀值（检测溢出）
    struct heap_block*   next;              // 链表指针
    struct heap_block*   prev;              // 前驱指针
    bool                 free;              // 是否空闲
    uint8_t              padding[3];        // 填充对齐
    uint8_t              data[];            // 数据区起点（灵活数组成员）
} __attribute__((packed)) heap_block_t;

#define HEAP_MAGIC          0xDEADBEEF
#define HEAP_CANARY         0xCAFEBABE
#define HEAP_FREED_CANARY   0xBAADF00D      // 释放后的魔数
#define HEAP_MIN_SIZE       16
#define HEAP_ALIGN          4

// 堆边界标记（用于检测堆溢出）
#define HEAP_BOUNDARY_MAGIC 0xABABABAB
typedef struct heap_boundary {
    uint32_t magic;
} __attribute__((packed)) heap_boundary_t;

static uint32_t heap_start = KERNEL_HEAP_START;
static uint32_t heap_end   = KERNEL_HEAP_START + KERNEL_HEAP_SIZE;
static uint32_t heap_cur   = KERNEL_HEAP_START;

static heap_block_t* heap_list = NULL;      // 空闲块链表的头

// 堆统计
static uint32_t heap_total_allocated = 0;
static uint32_t heap_total_freed     = 0;
static uint32_t heap_alloc_count     = 0;
static uint32_t heap_free_count      = 0;

// ======================================================================
//  Slab 分配器 - 对小对象进行高效缓存
// ======================================================================

// Slab 缓存大小列表 (8, 16, 32, 64, 128, 256, 512, 1024, 2048)
#define SLAB_CACHE_COUNT    9
static const uint32_t slab_sizes[SLAB_CACHE_COUNT] = {
    8, 16, 32, 64, 128, 256, 512, 1024, 2048
};

// 一个 slab 包含的 object 个数（每个 slab 使用一页 4KB）
#define SLAB_OBJECTS_PER_PAGE   (PAGE_SIZE / sizeof(void*))

typedef struct slab_object {
    struct slab_object* next;               // 空闲对象链表
} slab_object_t;

typedef struct slab_cache {
    uint32_t            object_size;        // 对象大小（对齐后）
    uint32_t            objects_per_slab;   // 每 slab 的对象数
    slab_object_t*      free_list;          // 空闲对象链表
    uint32_t            total_objects;      // 总对象数
    uint32_t            used_objects;       // 已用对象数
    uint32_t            slab_count;         // 使用的 slab 页数
    bool                initialized;
} slab_cache_t;

static slab_cache_t slab_caches[SLAB_CACHE_COUNT];

// ======================================================================
//  内存调试支持
// ======================================================================

static bool memory_debug_mode = false;

// 调试用的填充模式
#define MEMORY_PATTERN_ALLOC  0xAB           // 分配时填充
#define MEMORY_PATTERN_FREE   0xDE           // 释放后填充
#define MEMORY_PATTERN_CANARY 0xEF           // 金丝雀区域填充

// ======================================================================
//  位图操作（辅助函数）
// ======================================================================

static inline void bitmap_set(uint32_t page) {
    if (page < MEMORY_MAX_PAGES)
        page_bitmap[page / 32] |= (1 << (page % 32));
}

static inline void bitmap_clear(uint32_t page) {
    if (page < MEMORY_MAX_PAGES)
        page_bitmap[page / 32] &= ~(1 << (page % 32));
}

static inline bool bitmap_test(uint32_t page) {
    if (page >= MEMORY_MAX_PAGES) return true;
    return (page_bitmap[page / 32] & (1 << (page % 32))) != 0;
}

// ======================================================================
//  伙伴系统核心函数
// ======================================================================

// 获取页框的伙伴地址
static uint32_t buddy_get_buddy(uint32_t page_idx, uint32_t order) {
    return page_idx ^ (1 << order);
}

// 将页框插入空闲链表（按 order）
static void buddy_free_list_add(page_frame_t* frame, uint32_t order) {
    if (order > MAX_ORDER) return;
    
    frame->order = order;
    frame->used  = false;
    
    // 插入链表头部
    frame->prev = NULL;
    frame->next = free_areas[order];
    
    if (free_areas[order]) {
        free_areas[order]->prev = frame;
    }
    free_areas[order] = frame;
}

// 从空闲链表中移除页框
static void buddy_free_list_remove(page_frame_t* frame, uint32_t order) {
    if (order > MAX_ORDER) return;
    
    if (frame->prev) {
        frame->prev->next = frame->next;
    } else {
        free_areas[order] = frame->next;
    }
    
    if (frame->next) {
        frame->next->prev = frame->prev;
    }
    
    frame->next = NULL;
    frame->prev = NULL;
}

// 分配 2^order 个连续物理页
static uint32_t buddy_alloc_pages(uint32_t order) {
    if (order > MAX_ORDER) return 0xFFFFFFFF;
    
    // 查找可用的块
    uint32_t current_order = order;
    while (current_order <= MAX_ORDER) {
        if (free_areas[current_order]) {
            break;
        }
        current_order++;
    }
    
    if (current_order > MAX_ORDER) {
        return 0xFFFFFFFF;  // 没有可用内存
    }
    
    // 取出块
    page_frame_t* block = free_areas[current_order];
    buddy_free_list_remove(block, current_order);
    
    // 如果找到的块比需要的大，进行分裂
    while (current_order > order) {
        current_order--;
        
        // 计算伙伴：块的另一半
        uint32_t block_idx = block - page_frames;
        uint32_t buddy_idx = block_idx + (1 << current_order);
        
        // 将伙伴块加入空闲链表
        buddy_free_list_add(&page_frames[buddy_idx], current_order);
        
        // block 保持为原块的前半部分
    }
    
    uint32_t page_idx = block - page_frames;
    block->used = true;
    block->order = order;
    
    // 更新位图
    for (uint32_t i = 0; i < (uint32_t)(1 << order); i++) {
        bitmap_set(page_idx + i);
    }
    used_pages += (1 << order);
    
    return page_idx;
}

// 释放 2^order 个连续物理页，并尝试合并伙伴
static void buddy_free_pages(uint32_t page_idx, uint32_t order) {
    if (order > MAX_ORDER) return;
    if (page_idx >= total_pages) return;
    
    // 更新位图
    for (uint32_t i = 0; i < (uint32_t)(1 << order); i++) {
        if (page_idx + i < total_pages) {
            bitmap_clear(page_idx + i);
        }
    }
    used_pages -= (1 << order);
    
    // 尝试向上合并伙伴
    uint32_t current_idx = page_idx;
    uint32_t current_order = order;
    
    while (current_order < MAX_ORDER) {
        uint32_t buddy_idx = buddy_get_buddy(current_idx, current_order);
        
        // 检查伙伴是否合法且空闲且同阶
        if (buddy_idx >= total_pages) break;
        
        page_frame_t* buddy = &page_frames[buddy_idx];
        if (buddy->used || buddy->order != current_order) break;
        
        // 从空闲链表中移除伙伴
        buddy_free_list_remove(buddy, current_order);
        
        // 合并：取较低的地址为新的块
        if (buddy_idx < current_idx) {
            current_idx = buddy_idx;
        }
        
        current_order++;
    }
    
    // 将合并后的块加入空闲链表
    buddy_free_list_add(&page_frames[current_idx], current_order);
}

// 初始化伙伴系统
static void buddy_init(void) {
    // 初始化空闲链表
    for (uint32_t i = 0; i <= MAX_ORDER; i++) {
        free_areas[i] = NULL;
    }
    
    // 初始化页框描述符
    for (uint32_t i = 0; i < total_pages; i++) {
        page_frames[i].next  = NULL;
        page_frames[i].prev  = NULL;
        page_frames[i].order = 0;
        page_frames[i].used  = true;    // 默认全部已用
    }
    
    // 前 kernel_pages 页是内核使用的（标记在位图中）
    uint32_t kernel_pages = KERNEL_HEAP_START / PAGE_SIZE;
    if (kernel_pages > total_pages) kernel_pages = total_pages;
    
    // 将内核占用区域之后的空闲页加入伙伴系统
    uint32_t remaining = total_pages - kernel_pages;
    uint32_t start_page = kernel_pages;
    
    // 从大到小，将剩余页面按最大可能 order 加入空闲链表
    while (remaining > 0) {
        uint32_t order = MAX_ORDER;
        while (order > 0 && (1u << order) > remaining) {
            order--;
        }
        
        // 确保起始地址对齐到 2^order
        while (start_page & ((1u << order) - 1)) {
            order--;
        }
        
        buddy_free_list_add(&page_frames[start_page], order);
        
        start_page += (1 << order);
        remaining  -= (1 << order);
    }
    
    // 确保位图正确
    for (uint32_t i = 0; i < kernel_pages && i < total_pages; i++) {
        bitmap_set(i);
    }
}

// ======================================================================
//  物理页分配接口
// ======================================================================

void* alloc_page(void) {
    uint32_t page_idx = buddy_alloc_pages(0);  // order 0 = 1 page
    if (page_idx == 0xFFFFFFFF) {
        terminal_writestring("alloc_page: out of memory!\n");
        return NULL;
    }
    
    void* addr = (void*)(page_idx * PAGE_SIZE);
    memset(addr, 0, PAGE_SIZE);
    return addr;
}

void free_page(void* addr) {
    if (!addr) return;
    uint32_t page_idx = (uint32_t)addr / PAGE_SIZE;
    if (page_idx >= total_pages) return;
    
    buddy_free_pages(page_idx, 0);
}

void* alloc_pages(uint32_t count) {
    if (count == 0) return NULL;
    
    // 计算需要的 order
    uint32_t order = 0;
    uint32_t size = 1;
    while (size < count) {
        size <<= 1;
        order++;
        if (order > MAX_ORDER) {
            terminal_writestring("alloc_pages: count too large!\n");
            return NULL;
        }
    }
    
    uint32_t page_idx = buddy_alloc_pages(order);
    if (page_idx == 0xFFFFFFFF) {
        terminal_writestring("alloc_pages: out of memory!\n");
        return NULL;
    }
    
    void* addr = (void*)(page_idx * PAGE_SIZE);
    memset(addr, 0, count * PAGE_SIZE);
    return addr;
}

void free_pages(void* addr, uint32_t count) {
    if (!addr || count == 0) return;
    
    uint32_t page_idx = (uint32_t)addr / PAGE_SIZE;
    if (page_idx >= total_pages) return;
    
    // 计算 order
    uint32_t order = 0;
    uint32_t size = 1;
    while (size < count) {
        size <<= 1;
        order++;
    }
    
    buddy_free_pages(page_idx, order);
}

// ======================================================================
//  堆块辅助函数
// ======================================================================

static inline uint32_t heap_align_up(uint32_t size) {
    return (size + HEAP_ALIGN - 1) & ~(HEAP_ALIGN - 1);
}

// 在堆块尾部写入边界标记
static inline void heap_set_boundary(heap_block_t* block) {
    heap_boundary_t* boundary = (heap_boundary_t*)((uint8_t*)block + sizeof(heap_block_t) + block->size);
    boundary->magic = HEAP_BOUNDARY_MAGIC;
}

// 验证堆块尾部的边界标记
static inline bool heap_check_boundary(heap_block_t* block) {
    heap_boundary_t* boundary = (heap_boundary_t*)((uint8_t*)block + sizeof(heap_block_t) + block->size);
    return boundary->magic == HEAP_BOUNDARY_MAGIC;
}

// 验证堆块头部
static inline bool heap_check_block(heap_block_t* block) {
    if ((uint32_t)block < heap_start || (uint32_t)block >= heap_cur) {
        return false;
    }
    if (block->magic != HEAP_MAGIC && block->magic != HEAP_FREED_CANARY) {
        return false;
    }
    if (block->size > KERNEL_HEAP_SIZE) {
        return false;
    }
    return true;
}

// 用调试模式填充内存
static inline void heap_poison_mem(void* ptr, uint32_t size, uint8_t pattern) {
    if (memory_debug_mode) {
        memset(ptr, pattern, size);
    }
}

// ======================================================================
//  内核堆分配器 (kmalloc / kfree)
// ======================================================================

void* kmalloc(uint32_t size) {
    if (size == 0) return NULL;
    
    // 尝试从 slab 分配器分配小对象
    if (size <= slab_sizes[SLAB_CACHE_COUNT - 1]) {
        return slab_alloc(size);
    }
    
    // 对齐到 4 字节
    size = heap_align_up(size);
    if (size < HEAP_MIN_SIZE) size = HEAP_MIN_SIZE;
    
    // 搜索空闲链表 (First-Fit)
    heap_block_t* block = heap_list;
    while (block) {
        // 验证块有效性
        if (!heap_check_block(block)) {
            if (memory_debug_mode) {
                terminal_writestring("kmalloc: corrupted block detected in free list!\n");
            }
            block = block->next;
            continue;
        }
        
        if (block->free && block->size >= size) {
            // 找到合适的块
            block->free = false;
            block->magic = HEAP_MAGIC;
            block->canary = HEAP_CANARY;
            
            // 分裂：如果剩余空间足够大
            uint32_t remaining = block->size - size;
            if (remaining > sizeof(heap_block_t) + HEAP_MIN_SIZE) {
                heap_block_t* new_block = (heap_block_t*)((uint8_t*)block + sizeof(heap_block_t) + size);
                new_block->size   = remaining - sizeof(heap_block_t);
                new_block->magic  = HEAP_MAGIC;
                new_block->canary = HEAP_CANARY;
                new_block->free   = true;
                new_block->next   = block->next;
                new_block->prev   = block;
                
                if (block->next) {
                    block->next->prev = new_block;
                }
                block->next = new_block;
                block->size = size;
                
                heap_set_boundary(new_block);
            }
            
            heap_set_boundary(block);
            
            // 填充调试模式
            heap_poison_mem(block->data, block->size, MEMORY_PATTERN_ALLOC);
            
            heap_total_allocated += block->size;
            heap_alloc_count++;
            
            return block->data;
        }
        block = block->next;
    }
    
    // 没有找到合适的空闲块，从堆顶扩展
    uint32_t total_needed = sizeof(heap_block_t) + size + sizeof(heap_boundary_t);
    if (heap_cur + total_needed > heap_end) {
        terminal_writestring("kmalloc: OUT OF MEMORY (kernel heap full)!\n");
        return NULL;
    }
    
    block = (heap_block_t*)heap_cur;
    block->size   = size;
    block->magic  = HEAP_MAGIC;
    block->canary = HEAP_CANARY;
    block->free   = false;
    
    // 插入链表头部
    block->next = heap_list;
    block->prev = NULL;
    if (heap_list) {
        heap_list->prev = block;
    }
    heap_list = block;
    
    heap_cur += sizeof(heap_block_t) + size + sizeof(heap_boundary_t);
    heap_cur = heap_align_up(heap_cur);
    
    heap_set_boundary(block);
    heap_poison_mem(block->data, block->size, MEMORY_PATTERN_ALLOC);
    
    heap_total_allocated += size;
    heap_alloc_count++;
    
    return block->data;
}

void* kcalloc(uint32_t num, uint32_t size) {
    uint32_t total = num * size;
    
    // 防止溢出
    if (num != 0 && total / num != size) {
        terminal_writestring("kcalloc: integer overflow!\n");
        return NULL;
    }
    
    void* ptr = kmalloc(total);
    if (ptr) {
        memset(ptr, 0, total);
    }
    return ptr;
}

void* krealloc(void* ptr, uint32_t size) {
    if (!ptr) return kmalloc(size);
    if (size == 0) {
        kfree(ptr);
        return NULL;
    }
    
    // 尝试从 slab 分配器获取块信息
    // 如果是 slab 分配的对象，直接分配新块拷贝
    heap_block_t* block = (heap_block_t*)((uint8_t*)ptr - sizeof(heap_block_t));
    
    // 验证堆块
    if (!heap_check_block(block) || block->free) {
        // 可能是 slab 对象，退化为 kmalloc
        void* new_ptr = kmalloc(size);
        if (new_ptr) {
            // 保守复制原大小
            memcpy(new_ptr, ptr, size < 256 ? size : 256);
            // 注意：我们不知道 slab 对象的原始大小，这里简化处理
        }
        return new_ptr;
    }
    
    if (block->magic != HEAP_MAGIC) {
        terminal_writestring("krealloc: invalid pointer!\n");
        return NULL;
    }
    
    // 如果新大小小于等于原大小，直接返回
    uint32_t aligned_size = heap_align_up(size);
    if (aligned_size <= block->size) {
        return ptr;
    }
    
    // 检查下一个块是否空闲且可以合并
    heap_block_t* next = block->next;
    if (next && next->free && 
        ((uint8_t*)next == (uint8_t*)block + sizeof(heap_block_t) + block->size + sizeof(heap_boundary_t))) {
        uint32_t combined = block->size + sizeof(heap_block_t) + next->size;
        if (combined >= aligned_size) {
            // 从下一个块取走需要的空间
            uint32_t needed = aligned_size - block->size;
            uint32_t remaining = next->size - needed;
            
            if (remaining > sizeof(heap_block_t) + HEAP_MIN_SIZE) {
                // 分裂
                heap_block_t* new_next = (heap_block_t*)((uint8_t*)next + sizeof(heap_block_t) + needed);
                new_next->size = remaining - sizeof(heap_block_t);
                new_next->magic = HEAP_MAGIC;
                new_next->canary = HEAP_CANARY;
                new_next->free = true;
                new_next->next = next->next;
                new_next->prev = block;
                
                if (next->next) {
                    next->next->prev = new_next;
                }
                
                block->next = new_next;
                block->size = aligned_size;
            } else {
                // 直接合并
                block->size = combined;
                block->next = next->next;
                if (next->next) {
                    next->next->prev = block;
                }
                // 如果 next 恰好在堆顶，回缩 heap_cur
                if ((uint32_t)next + sizeof(heap_block_t) + next->size + sizeof(heap_boundary_t) >= heap_cur) {
                    heap_cur = (uint32_t)next;
                }
            }
            
            heap_set_boundary(block);
            heap_total_allocated += (block->size - (aligned_size - needed)); // 调整
            return ptr;
        }
    }
    
    // 无法就地扩展，分配新块并拷贝
    void* new_ptr = kmalloc(size);
    if (new_ptr) {
        uint32_t copy_size = block->size < size ? block->size : size;
        memcpy(new_ptr, ptr, copy_size);
        kfree(ptr);
    }
    return new_ptr;
}

void kfree(void* ptr) {
    if (!ptr) return;
    
    // 检查是否是 slab 对象（slab 对象没有堆块头部，直接转 slab_free 处理）
    // 快速判断：检查反向读取的魔数是否有效
    heap_block_t* block = (heap_block_t*)((uint8_t*)ptr - sizeof(heap_block_t));
    
    // 检查魔数
    if (block->magic == HEAP_FREED_CANARY) {
        terminal_writestring("kfree: double free detected!\n");
        return;
    }
    
    if (block->magic != HEAP_MAGIC) {
        // 可能是 slab 对象，尝试 slab 释放
        slab_free(ptr);
        return;
    }
    
    // 验证金丝雀
    if (block->canary != HEAP_CANARY) {
        terminal_writestring("kfree: heap corruption detected (canary mismatch)!\n");
        if (memory_debug_mode) {
            // 打印调试信息
            terminal_writestring("  Block at 0x");
            char buf[16];
            itoa((int)(uint32_t)block, buf, 16);
            terminal_writestring(buf);
            terminal_writestring(", size=");
            itoa(block->size, buf, 10);
            terminal_writestring(buf);
            terminal_writestring("\n");
        }
        return;
    }
    
    // 检查边界标记
    if (!heap_check_boundary(block)) {
        terminal_writestring("kfree: buffer overflow detected!\n");
        if (memory_debug_mode) {
            terminal_writestring("  Block corrupted beyond its boundary.\n");
        }
        return;
    }
    
    // 用毒化模式填充数据区
    heap_poison_mem(block->data, block->size, MEMORY_PATTERN_FREE);
    block->free = true;
    block->magic = HEAP_FREED_CANARY;
    block->canary = 0;
    
    heap_total_freed += block->size;
    heap_free_count++;
    
    // 合并相邻的空闲块（双向合并）
    // 先尝试与后一个块合并
    if (block->next && block->next->free) {
        heap_block_t* next = block->next;
        // 检查是否物理相邻
        if ((uint8_t*)block + sizeof(heap_block_t) + block->size + sizeof(heap_boundary_t) == (uint8_t*)next) {
            block->size += sizeof(heap_block_t) + next->size + sizeof(heap_boundary_t);
            block->next = next->next;
            if (next->next) {
                next->next->prev = block;
            }
            // 如果 next 是堆顶最后一个块，回缩
            if ((uint32_t)next + sizeof(heap_block_t) + next->size + sizeof(heap_boundary_t) >= heap_cur) {
                heap_cur = (uint32_t)block + sizeof(heap_block_t) + block->size + sizeof(heap_boundary_t);
                heap_cur = heap_align_up(heap_cur);
            }
        }
    }
    
    // 再尝试与前一个块合并
    if (block->prev && block->prev->free) {
        heap_block_t* prev = block->prev;
        if ((uint8_t*)prev + sizeof(heap_block_t) + prev->size + sizeof(heap_boundary_t) == (uint8_t*)block) {
            prev->size += sizeof(heap_block_t) + block->size + sizeof(heap_boundary_t);
            prev->next = block->next;
            if (block->next) {
                block->next->prev = prev;
            }
            block = prev;  // 继续尝试与后续块合并
            // 回缩堆顶
            if ((uint32_t)block + sizeof(heap_block_t) + block->size + sizeof(heap_boundary_t) >= heap_cur) {
                heap_cur = (uint32_t)block + sizeof(heap_block_t) + block->size + sizeof(heap_boundary_t);
                heap_cur = heap_align_up(heap_cur);
            }
        }
    }
}

// ======================================================================
//  带对齐的内存分配
// ======================================================================

typedef struct aligned_header {
    void*    original_ptr;       // kmalloc 返回的原始指针
    uint32_t alignment;
} aligned_header_t;

void* kmalloc_aligned(uint32_t size, uint32_t alignment) {
    if (size == 0 || alignment == 0) return NULL;
    
    // 对齐必须是 2 的幂
    if (alignment & (alignment - 1)) {
        alignment = 16;  // 默认 16 字节对齐
    }
    
    // 多分配 alignment + header 大小，保证对齐
    uint32_t header_size = sizeof(aligned_header_t);
    uint32_t extra = alignment + header_size;
    
    void* raw = kmalloc(size + extra);
    if (!raw) return NULL;
    
    // 计算对齐地址
    uint32_t raw_addr = (uint32_t)raw;
    uint32_t aligned_addr = (raw_addr + header_size + alignment - 1) & ~(alignment - 1);
    
    // 写入头部信息
    aligned_header_t* header = (aligned_header_t*)(aligned_addr - header_size);
    header->original_ptr = raw;
    header->alignment = alignment;
    
    return (void*)aligned_addr;
}

void kfree_aligned(void* ptr) {
    if (!ptr) return;
    
    // 读取头部信息
    aligned_header_t* header = (aligned_header_t*)((uint32_t)ptr - sizeof(aligned_header_t));
    
    // 验证头部
    if (header->alignment == 0 || header->alignment > 4096) {
        terminal_writestring("kfree_aligned: invalid pointer!\n");
        return;
    }
    
    // 释放原始指针
    kfree(header->original_ptr);
}

// ======================================================================
//  Slab 分配器实现
// ======================================================================

// 获取最合适的小对象缓存
static slab_cache_t* slab_get_cache(uint32_t size) {
    for (int i = 0; i < SLAB_CACHE_COUNT; i++) {
        if (size <= slab_sizes[i]) {
            return &slab_caches[i];
        }
    }
    return NULL;
}

// 初始化 slab 缓存
static void slab_cache_init(slab_cache_t* cache, uint32_t object_size) {
    cache->object_size     = object_size;
    cache->objects_per_slab = (PAGE_SIZE - sizeof(void*)) / object_size;
    if (cache->objects_per_slab == 0) cache->objects_per_slab = 1;
    cache->free_list       = NULL;
    cache->total_objects   = 0;
    cache->used_objects    = 0;
    cache->slab_count      = 0;
    cache->initialized     = true;
}

// 为 slab 缓存添加一页新的对象
static bool slab_cache_grow(slab_cache_t* cache) {
    void* page = alloc_page();
    if (!page) return false;
    
    uint32_t obj_size = cache->object_size;
    uint32_t count = cache->objects_per_slab;
    
    // 将页面中的对象链接成空闲链表
    uint8_t* addr = (uint8_t*)page;
    for (uint32_t i = 0; i < count; i++) {
        slab_object_t* obj = (slab_object_t*)(addr + i * obj_size);
        obj->next = cache->free_list;
        cache->free_list = obj;
    }
    
    cache->total_objects += count;
    cache->slab_count++;
    
    return true;
}

void* slab_alloc(uint32_t size) {
    if (size == 0) return NULL;
    
    slab_cache_t* cache = slab_get_cache(size);
    if (!cache) {
        // 超出 slab 范围，走 kmalloc
        return NULL;
    }
    
    if (!cache->initialized) {
        slab_cache_init(cache, slab_sizes[cache - slab_caches]);
    }
    
    // 如果没有空闲对象，扩展一个新的 slab
    if (!cache->free_list) {
        if (!slab_cache_grow(cache)) {
            terminal_writestring("slab_alloc: failed to grow cache!\n");
            return NULL;
        }
    }
    
    // 从空闲链表头部取一个对象
    slab_object_t* obj = cache->free_list;
    cache->free_list = obj->next;
    cache->used_objects++;
    
    // 清除对象内容（安全）
    memset(obj, 0, cache->object_size);
    
    return (void*)obj;
}

void slab_free(void* ptr) {
    if (!ptr) return;
    
    // 确定 ptr 属于哪个 slab 缓存
    // 通过检查页框归属来判断
    uint32_t page_addr = (uint32_t)ptr & ~(PAGE_SIZE - 1);
    
    // 遍历所有缓存
    for (int i = 0; i < SLAB_CACHE_COUNT; i++) {
        if (!slab_caches[i].initialized) continue;
        
        slab_cache_t* cache = &slab_caches[i];
        uint32_t obj_size = cache->object_size;
        
        // 检查对齐：对象必须落在缓存页的整数倍偏移上
        uint32_t offset = (uint32_t)ptr - page_addr;
        if (offset < PAGE_SIZE && (offset % obj_size) == 0) {
            // 确认该页属于此缓存（通过检查该页是否在已分配的 slab 中）
            // 简化：假设有效指针一定在 slab 范围内
            slab_object_t* obj = (slab_object_t*)ptr;
            obj->next = cache->free_list;
            cache->free_list = obj;
            cache->used_objects--;
            
            // 如果该 slab 的所有对象都空闲了，可以考虑释放页面
            // （简化实现暂不回收整页）
            return;
        }
    }
    
    // 没找到对应的缓存，输出警告
    if (memory_debug_mode) {
        terminal_writestring("slab_free: pointer not found in any cache, ignoring.\n");
    }
}

// 初始化所有 slab 缓存
static void slab_init(void) {
    for (int i = 0; i < SLAB_CACHE_COUNT; i++) {
        slab_caches[i].initialized = false;
    }
    
    // 预分配常用的 slab 缓存
    // 8字节、16字节、32字节 的缓存预先分配一页
    for (int i = 0; i < 3 && i < SLAB_CACHE_COUNT; i++) {
        slab_cache_init(&slab_caches[i], slab_sizes[i]);
        slab_cache_grow(&slab_caches[i]);
    }
}

// ======================================================================
//  内存调试函数
// ======================================================================

void memory_debug_enable(bool enable) {
    memory_debug_mode = enable;
    terminal_writestring("Memory debug mode ");
    terminal_writestring(enable ? "enabled.\n" : "disabled.\n");
}

uint32_t memory_heap_validate(void) {
    uint32_t corrupted = 0;
    heap_block_t* block = heap_list;
    
    while (block) {
        // 检查地址范围
        if ((uint32_t)block < heap_start || (uint32_t)block >= heap_cur) {
            corrupted++;
            if (memory_debug_mode) {
                terminal_writestring("  [ERROR] Block outside heap range!\n");
            }
            block = block->next;
            continue;
        }
        
        // 检查魔数
        if (block->magic != HEAP_MAGIC && block->magic != HEAP_FREED_CANARY) {
            corrupted++;
            if (memory_debug_mode) {
                terminal_writestring("  [ERROR] Block corrupted magic (0x");
                char buf[16];
                itoa((int)block->magic, buf, 16);
                terminal_writestring(buf);
                terminal_writestring(")\n");
            }
            block = block->next;
            continue;
        }
        
        // 检查金丝雀
        if (!block->free && block->canary != HEAP_CANARY) {
            corrupted++;
            if (memory_debug_mode) {
                terminal_writestring("  [ERROR] Canary mismatch on used block!\n");
            }
        }
        
        // 检查空闲块的魔数
        if (block->free && block->magic != HEAP_FREED_CANARY && block->magic != HEAP_MAGIC) {
            corrupted++;
            if (memory_debug_mode) {
                terminal_writestring("  [ERROR] Freed block has invalid magic!\n");
            }
        }
        
        // 检查边界标记
        if (!block->free && !heap_check_boundary(block)) {
            corrupted++;
            if (memory_debug_mode) {
                terminal_writestring("  [ERROR] Buffer overflow detected at block!\n");
            }
        }
        
        // 检查链表完整性（双向）
        if (block->next && block->next->prev != block) {
            corrupted++;
            if (memory_debug_mode) {
                terminal_writestring("  [ERROR] Broken doubly linked list!\n");
            }
        }
        
        block = block->next;
    }
    
    if (corrupted == 0 && memory_debug_mode) {
        terminal_writestring("  Heap validation: OK (no corruption)\n");
    }
    
    return corrupted;
}

// ======================================================================
//  堆信息输出
// ======================================================================

void memory_heap_dump(void) {
    terminal_writestring("\n=== Heap Block Dump ===\n");
    
    char buf[16];
    uint32_t count = 0;
    heap_block_t* block = heap_list;
    
    while (block) {
        terminal_writestring("  [");
        itoa((int)count, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("] ");
        
        terminal_writestring("addr=0x");
        itoa((int)(uint32_t)block, buf, 16);
        terminal_writestring(buf);
        
        terminal_writestring(" size=");
        itoa((int)block->size, buf, 10);
        terminal_writestring(buf);
        
        terminal_writestring(block->free ? " FREE" : " USED");
        terminal_writestring(" magic=0x");
        itoa((int)block->magic, buf, 16);
        terminal_writestring(buf);
        terminal_writestring("\n");
        
        block = block->next;
        count++;
        if (count > 100) {
            terminal_writestring("  ... (truncated)\n");
            break;
        }
    }
    
    terminal_writestring("  Total blocks: ");
    itoa((int)count, buf, 10);
    terminal_writestring(buf);
    terminal_writestring("\n  Heap cur: 0x");
    itoa((int)heap_cur, buf, 16);
    terminal_writestring(buf);
    terminal_writestring("\n==================\n");
}

// ======================================================================
//  Slab 状态输出
// ======================================================================

void memory_slab_dump(void) {
    terminal_writestring("\n=== Slab Cache Dump ===\n");
    char buf[16];
    
    for (int i = 0; i < SLAB_CACHE_COUNT; i++) {
        slab_cache_t* cache = &slab_caches[i];
        terminal_writestring("  [");
        itoa(i, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("] size=");
        itoa((int)cache->object_size, buf, 10);
        terminal_writestring(buf);
        
        if (!cache->initialized) {
            terminal_writestring(" (uninit)\n");
            continue;
        }
        
        terminal_writestring(" slabs=");
        itoa((int)cache->slab_count, buf, 10);
        terminal_writestring(buf);
        terminal_writestring(" tot=");
        itoa((int)cache->total_objects, buf, 10);
        terminal_writestring(buf);
        terminal_writestring(" used=");
        itoa((int)cache->used_objects, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("\n");
    }
    terminal_writestring("=========================\n");
}

// ======================================================================
//  内存信息函数
// ======================================================================

uint32_t get_total_memory(void) { return total_pages * PAGE_SIZE; }
uint32_t get_used_memory(void)  { return used_pages * PAGE_SIZE; }
uint32_t get_free_memory(void)  { return (total_pages - used_pages) * PAGE_SIZE; }

uint32_t get_heap_used(void) {
    return heap_total_allocated - heap_total_freed;
}

uint32_t get_heap_free(void) {
    uint32_t free_in_list = 0;
    heap_block_t* block = heap_list;
    while (block) {
        if (block->free) free_in_list += block->size;
        block = block->next;
    }
    return (heap_end - heap_cur) + free_in_list;
}

// ======================================================================
//  内存映射输出
// ======================================================================

void memory_map_dump(void) {
    terminal_writestring("\n========== Memory Map ==========\n");
    char buf[16];
    
    terminal_writestring("  Physical: ");
    itoa((int)(get_total_memory()/(1024*1024)), buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" MB total, ");
    itoa((int)(get_used_memory()/(1024*1024)), buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" MB used, ");
    itoa((int)(get_free_memory()/(1024*1024)), buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" MB free\n");
    
    terminal_writestring("  Heap: 0x");
    itoa((int)heap_start, buf, 16);
    terminal_writestring(buf);
    terminal_writestring(" - 0x");
    itoa((int)heap_cur, buf, 16);
    terminal_writestring(buf);
    terminal_writestring(" / 0x");
    itoa((int)heap_end, buf, 16);
    terminal_writestring(buf);
    terminal_writestring(" (");
    itoa((int)heap_alloc_count, buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" allocs, ");
    itoa((int)heap_free_count, buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" frees)\n");
    
    terminal_writestring("  Buddy free blocks:");
    for (int i = 0; i <= MAX_ORDER; i++) {
        uint32_t cnt = 0;
        page_frame_t* f = free_areas[i];
        while (f) { cnt++; f = f->next; }
        if (cnt > 0) {
            terminal_writestring(" order");
            itoa(i, buf, 10);
            terminal_writestring(buf);
            terminal_writestring(":");
            itoa((int)cnt, buf, 10);
            terminal_writestring(buf);
        }
    }
    terminal_writestring("\n===============================\n");
}

// ======================================================================
//  内存保护（需要分页支持，暂为占位）
// ======================================================================

void memory_set_readonly(void* addr, uint32_t size) {
    (void)addr; (void)size;
    if (memory_debug_mode)
        terminal_writestring("memory_set_readonly: needs paging support\n");
}

void memory_set_readwrite(void* addr, uint32_t size) {
    (void)addr; (void)size;
    if (memory_debug_mode)
        terminal_writestring("memory_set_readwrite: needs paging support\n");
}

// ======================================================================
//  内存管理器初始化
// ======================================================================

void memory_init(void) {
    terminal_writestring("Initializing memory manager...\n");
    
    char buf[16];
    
    // 假设有 128MB 物理内存
    total_pages = 128 * 1024 * 1024 / PAGE_SIZE;
    memset(page_bitmap, 0, sizeof(page_bitmap));
    
    // 初始化伙伴系统
    buddy_init();
    
    // 初始化内核堆
    heap_start = KERNEL_HEAP_START;
    heap_end   = KERNEL_HEAP_START + KERNEL_HEAP_SIZE;
    heap_cur   = KERNEL_HEAP_START;
    heap_list  = NULL;
    heap_total_allocated = 0;
    heap_total_freed     = 0;
    heap_alloc_count     = 0;
    heap_free_count      = 0;
    
    // 初始化 slab 分配器
    slab_init();
    
    terminal_writestring("  Total: ");
    itoa((int)(total_pages * PAGE_SIZE/(1024*1024)), buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" MB (");
    itoa((int)total_pages, buf, 10);
    terminal_writestring(buf);
    terminal_writestring(" pages)\n");
    
    terminal_writestring("  Heap: 0x01000000-0x10000000, Slab: 8-2048B\n");
    terminal_writestring("Memory manager initialized.\n");
}