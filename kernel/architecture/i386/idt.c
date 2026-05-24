#include "idt.h"
#include "isr.h"
#include "ports.h"
#include "irq.h"

struct idt_entry idt[256];
struct idt_ptr   idtp;

// 汇编写的加载 IDT 函数（或内联）
extern void idt_flush(uint32_t ptr);

void idt_set_gate(uint8_t num, uint32_t base, uint16_t sel, uint8_t flags) {
    idt[num].base_low  = base & 0xFFFF;
    idt[num].sel       = sel;
    idt[num].always0   = 0;
    idt[num].flags     = flags;
    idt[num].base_high = (base >> 16) & 0xFFFF;
}

void idt_install() {
    idtp.limit = (sizeof(struct idt_entry) * 256) - 1;
    idtp.base  = (uint32_t)&idt;

    // 先全部填入空处理函数（防止漏填）
    for (int i = 0; i < 256; i++)
        idt_set_gate(i, 0, 0, 0);

    // 由 isr.c 和 irq.c 提供的初始化函数填充具体门
    isr_install();
    irq_install();

    idt_flush((uint32_t)&idtp);
}