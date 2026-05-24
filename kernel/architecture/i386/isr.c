#include "isr.h"
#include "idt.h"
#include "ports.h"
#include "../../terminal.h"   // 用于显示中断信息

// 声明所有 ISR stub 函数 (0-31)
extern void isr0(), isr1(), isr2(), isr3(), isr4(), isr5(), isr6(), isr7();
extern void isr8(), isr9(), isr10(), isr11(), isr12(), isr13(), isr14(), isr15();
extern void isr16(), isr17(), isr18(), isr19(), isr20(), isr21(), isr22(), isr23();
extern void isr24(), isr25(), isr26(), isr27(), isr28(), isr29(), isr30(), isr31();

// 异常名称对照表
static const char* exception_messages[] = {
    "Division By Zero",
    "Debug",
    "Non Maskable Interrupt",
    "Breakpoint",
    "Overflow",
    "Bound Range Exceeded",
    "Invalid Opcode",
    "Device Not Available",
    "Double Fault",
    "Coprocessor Segment Overrun",
    "Invalid TSS",
    "Segment Not Present",
    "Stack-Segment Fault",
    "General Protection Fault",
    "Page Fault",
    "Reserved",
    "x87 FPU Error",
    "Alignment Check",
    "Machine Check",
    "SIMD Floating-Point Exception",
    "Reserved", "Reserved", "Reserved", "Reserved",
    "Reserved", "Reserved", "Reserved", "Reserved",
    "Reserved", "Reserved", "Reserved", "Reserved"
};

// 把 uint32 转成 16进制字符串
static void hex_to_str(uint32_t val, char* str) {
    const char* hex = "0123456789ABCDEF";
    str[0] = '0';
    str[1] = 'x';
    for (int i = 7; i >= 0; i--) {
        str[2 + 7 - i] = hex[(val >> (i * 4)) & 0x0F];
    }
    str[10] = '\0';
}

void isr_install() {
    // 设置所有 32 个异常处理入口
    idt_set_gate(0,  (uint32_t)isr0,  0x08, 0x8E);
    idt_set_gate(1,  (uint32_t)isr1,  0x08, 0x8E);
    idt_set_gate(2,  (uint32_t)isr2,  0x08, 0x8E);
    idt_set_gate(3,  (uint32_t)isr3,  0x08, 0x8E);
    idt_set_gate(4,  (uint32_t)isr4,  0x08, 0x8E);
    idt_set_gate(5,  (uint32_t)isr5,  0x08, 0x8E);
    idt_set_gate(6,  (uint32_t)isr6,  0x08, 0x8E);
    idt_set_gate(7,  (uint32_t)isr7,  0x08, 0x8E);
    idt_set_gate(8,  (uint32_t)isr8,  0x08, 0x8E);
    idt_set_gate(9,  (uint32_t)isr9,  0x08, 0x8E);
    idt_set_gate(10, (uint32_t)isr10, 0x08, 0x8E);
    idt_set_gate(11, (uint32_t)isr11, 0x08, 0x8E);
    idt_set_gate(12, (uint32_t)isr12, 0x08, 0x8E);
    idt_set_gate(13, (uint32_t)isr13, 0x08, 0x8E);
    idt_set_gate(14, (uint32_t)isr14, 0x08, 0x8E);
    idt_set_gate(15, (uint32_t)isr15, 0x08, 0x8E);
    idt_set_gate(16, (uint32_t)isr16, 0x08, 0x8E);
    idt_set_gate(17, (uint32_t)isr17, 0x08, 0x8E);
    idt_set_gate(18, (uint32_t)isr18, 0x08, 0x8E);
    idt_set_gate(19, (uint32_t)isr19, 0x08, 0x8E);
    idt_set_gate(20, (uint32_t)isr20, 0x08, 0x8E);
    idt_set_gate(21, (uint32_t)isr21, 0x08, 0x8E);
    idt_set_gate(22, (uint32_t)isr22, 0x08, 0x8E);
    idt_set_gate(23, (uint32_t)isr23, 0x08, 0x8E);
    idt_set_gate(24, (uint32_t)isr24, 0x08, 0x8E);
    idt_set_gate(25, (uint32_t)isr25, 0x08, 0x8E);
    idt_set_gate(26, (uint32_t)isr26, 0x08, 0x8E);
    idt_set_gate(27, (uint32_t)isr27, 0x08, 0x8E);
    idt_set_gate(28, (uint32_t)isr28, 0x08, 0x8E);
    idt_set_gate(29, (uint32_t)isr29, 0x08, 0x8E);
    idt_set_gate(30, (uint32_t)isr30, 0x08, 0x8E);
    idt_set_gate(31, (uint32_t)isr31, 0x08, 0x8E);
}

// 共同的异常处理 C 函数 — 显示详细的中断信息
void isr_handler(registers_t regs) {
    // 在屏幕顶部显示异常信息
    terminal_writestring("\n>>> KERNEL EXCEPTION <<<\n");
    
    // 显示异常号
    char buf[64];
    terminal_writestring("Exception: ");
    terminal_writestring(exception_messages[regs.int_no]);
    
    // 显示异常号
    terminal_writestring(" (#");
    hex_to_str(regs.int_no, buf);
    terminal_writestring(buf);
    terminal_writestring(")\n");

    // 显示错误码
    terminal_writestring("Error Code: ");
    hex_to_str(regs.err_code, buf);
    terminal_writestring(buf);
    terminal_writestring("\n");

    // 显示寄存器
    terminal_writestring("  EAX: "); hex_to_str(regs.eax, buf); terminal_writestring(buf);
    terminal_writestring("  EBX: "); hex_to_str(regs.ebx, buf); terminal_writestring(buf);
    terminal_writestring("  ECX: "); hex_to_str(regs.ecx, buf); terminal_writestring(buf);
    terminal_writestring("  EDX: "); hex_to_str(regs.edx, buf); terminal_writestring(buf);
    terminal_writestring("\n");
    
    terminal_writestring("  ESI: "); hex_to_str(regs.esi, buf); terminal_writestring(buf);
    terminal_writestring("  EDI: "); hex_to_str(regs.edi, buf); terminal_writestring(buf);
    terminal_writestring("  EBP: "); hex_to_str(regs.ebp, buf); terminal_writestring(buf);
    terminal_writestring("  ESP: "); hex_to_str(regs.esp, buf); terminal_writestring(buf);
    terminal_writestring("\n");
    
    terminal_writestring("  EIP: "); hex_to_str(regs.eip, buf); terminal_writestring(buf);
    terminal_writestring("  CS: "); hex_to_str(regs.cs, buf); terminal_writestring(buf);
    terminal_writestring("  EFLAGS: "); hex_to_str(regs.eflags, buf); terminal_writestring(buf);
    terminal_writestring("\n");
    
    // 如果是 Page Fault，额外显示 CR2（出错地址）
    if (regs.int_no == 14) {
        uint32_t cr2;
        asm volatile("mov %%cr2, %0" : "=r"(cr2));
        terminal_writestring("CR2 (Fault Addr): ");
        hex_to_str(cr2, buf);
        terminal_writestring(buf);
        terminal_writestring("\n");
        
        // 分析 Page Fault 错误码
        terminal_writestring("Page Fault Info:\n");
        if (regs.err_code & 0x01) terminal_writestring("  - Protection violation\n");
        else                       terminal_writestring("  - Non-present page\n");
        if (regs.err_code & 0x02) terminal_writestring("  - Write access\n");
        else                       terminal_writestring("  - Read access\n");
        if (regs.err_code & 0x04) terminal_writestring("  - User mode\n");
        else                       terminal_writestring("  - Supervisor mode\n");
    }

    terminal_writestring("\nSystem Halted!\n");
    
    // 死循环
    while(1) {
        asm volatile("hlt");
    }
}

// 中断处理函数注册表
isr_t interrupt_handlers[256];

void register_interrupt_handler(uint8_t n, isr_t handler) {
    interrupt_handlers[n] = handler;
}
