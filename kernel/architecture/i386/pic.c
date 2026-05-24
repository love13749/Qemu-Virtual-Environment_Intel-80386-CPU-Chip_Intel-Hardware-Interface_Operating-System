#include "pic.h"
#include "ports.h"

#define PIC1_COMMAND 0x20
#define PIC1_DATA    0x21
#define PIC2_COMMAND 0xA0
#define PIC2_DATA    0xA1

void pic_remap(uint8_t offset1, uint8_t offset2) {
    // 保存掩码
    uint8_t a1 = inb(PIC1_DATA);
    uint8_t a2 = inb(PIC2_DATA);

    // 初始化命令，outb函数的目的是增加汇编指令
    outb(PIC1_COMMAND, 0x11);   // ICW1: 边沿触发，级联，需要ICW4
    outb(PIC2_COMMAND, 0x11);

    outb(PIC1_DATA, offset1);   // ICW2: 主片向量偏移
    outb(PIC2_DATA, offset2);   // 从片向量偏移

    outb(PIC1_DATA, 0x04);      // ICW3: 主片 IRQ2 连接从片
    outb(PIC2_DATA, 0x02);      // 从片的级联标识

    outb(PIC1_DATA, 0x01);      // ICW4: 8086模式
    outb(PIC2_DATA, 0x01);

    // 恢复掩码（先全开，后面可以关掉不想用的）
    outb(PIC1_DATA, a1);
    outb(PIC2_DATA, a2);
}

void pic_send_eoi(uint8_t irq) {
    if (irq >= 8)
        outb(PIC2_COMMAND, 0x20);
    outb(PIC1_COMMAND, 0x20);
}