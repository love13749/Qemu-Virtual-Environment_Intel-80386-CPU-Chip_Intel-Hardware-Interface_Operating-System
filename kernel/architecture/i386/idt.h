#ifndef IDT_H
#define IDT_H

#include <stdint.h>

// 中断描述符结构
struct idt_entry {
    uint16_t base_low;
    uint16_t sel;        // 段选择子，内核代码段
    uint8_t  always0;
    uint8_t  flags;      // 类型 + DPL 等
    uint16_t base_high;
} __attribute__((packed));

// IDT 指针
struct idt_ptr {
    uint16_t limit;
    uint32_t base;
} __attribute__((packed));

void idt_set_gate(uint8_t num, uint32_t base, uint16_t sel, uint8_t flags);
void idt_install();

#endif
