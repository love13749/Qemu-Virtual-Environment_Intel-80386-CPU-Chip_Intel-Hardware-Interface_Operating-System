#ifndef ISR_H
#define ISR_H
#include <stdint.h>

// 寄存器结构体（压栈顺序必须与 stub 对应）
typedef struct {
    uint32_t ds, edi, esi, ebp, esp, ebx, edx, ecx, eax;
    uint32_t int_no, err_code;
    uint32_t eip, cs, eflags, useresp, ss;
} registers_t;

typedef void (*isr_t)(registers_t*);
void register_interrupt_handler(uint8_t n, isr_t handler);

// 安装异常处理（ISR 0-31）
void isr_install(void);

// 声明中断处理函数数组
extern isr_t interrupt_handlers[256];

// IRQ 向量偏移（应与 pic_remap 的参数一致）
#define IRQ0   32
#define IRQ1   33
#define IRQ2   34
#define IRQ3   35
#define IRQ4   36
#define IRQ5   37
#define IRQ6   38
#define IRQ7   39
#define IRQ8   40
#define IRQ9   41
#define IRQ10  42
#define IRQ11  43
#define IRQ12  44
#define IRQ13  45
#define IRQ14  46
#define IRQ15  47

#endif