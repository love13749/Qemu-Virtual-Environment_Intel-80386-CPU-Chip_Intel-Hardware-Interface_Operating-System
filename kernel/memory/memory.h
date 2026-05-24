#ifndef MEMORY_H
#define MEMORY_H

#include <stdint.h>
#include <stdbool.h>

// ==================== 内存管理初始化 ====================
void memory_init(void);

// ==================== 物理内存页分配 (4KB pages) ====================
void* alloc_page(void);
void  free_page(void* addr);
void* alloc_pages(uint32_t count);
void  free_pages(void* addr, uint32_t count);

// ==================== 通用内核内存分配 ====================
void* kmalloc(uint32_t size);
void* kcalloc(uint32_t num, uint32_t size);
void* krealloc(void* ptr, uint32_t size);
void  kfree(void* ptr);

// 带对齐的内存分配
void* kmalloc_aligned(uint32_t size, uint32_t alignment);
void  kfree_aligned(void* ptr);

// ==================== Slab 分配器 ====================
// 适用于小对象的高效分配，避免碎片
void* slab_alloc(uint32_t size);
void  slab_free(void* ptr);

// ==================== 内存调试 ====================
// 开启后会在分配/释放时进行检查
void memory_debug_enable(bool enable);

// 检查堆完整性，返回损坏块数
uint32_t memory_heap_validate(void);

// 打印所有堆块信息
void memory_heap_dump(void);

// 打印 slab 缓存状态
void memory_slab_dump(void);

// ==================== 内存信息 ====================
uint32_t get_total_memory(void);
uint32_t get_used_memory(void);
uint32_t get_free_memory(void);
uint32_t get_heap_used(void);
uint32_t get_heap_free(void);

// ==================== 内存映射 ====================
void memory_map_dump(void);

// ==================== 内存保护 ====================
// 标记内存区域为只读/读写
void memory_set_readonly(void* addr, uint32_t size);
void memory_set_readwrite(void* addr, uint32_t size);

#endif // MEMORY_H
