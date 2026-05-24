#ifndef GDT_H
#define GDT_H

#include <stdint.h>

// GDT 选择子
#define GDT_NULL_SEG     0x00  // 空描述符
#define GDT_CODE_SEG     0x08  // 内核代码段 (ring 0)
#define GDT_DATA_SEG     0x10  // 内核数据段 (ring 0)
#define GDT_USER_CODE    0x1B  // 用户代码段 (ring 3)
#define GDT_USER_DATA    0x23  // 用户数据段 (ring 3)
#define GDT_TSS_SEG      0x28  // TSS 段

// GDT 入口结构
typedef struct {
    uint16_t limit_low;
    uint16_t base_low;
    uint8_t  base_mid;
    uint8_t  access;
    uint8_t  granularity;
    uint8_t  base_high;
} __attribute__((packed)) gdt_entry_t;

// GDT 指针结构
typedef struct {
    uint16_t limit;
    uint32_t base;
} __attribute__((packed)) gdt_ptr_t;

// TSS 结构
typedef struct {
    uint32_t prev_tss;
    uint32_t esp0;
    uint32_t ss0;
    uint32_t esp1;
    uint32_t ss1;
    uint32_t esp2;
    uint32_t ss2;
    uint32_t cr3;
    uint32_t eip;
    uint32_t eflags;
    uint32_t eax, ecx, edx, ebx;
    uint32_t esp, ebp, esi, edi;
    uint32_t es, cs, ss, ds, fs, gs;
    uint32_t ldt;
    uint16_t trap;
    uint16_t iomap_base;
} __attribute__((packed)) tss_entry_t;

// 初始化 GDT
void gdt_init(void);

// 更新 TSS 的 ESP0（用于从用户态切换到内核态时的栈）
void tss_set_esp0(uint32_t esp0);

#endif // GDT_H
