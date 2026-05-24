global isr0, isr1, isr2, isr3, isr4, isr5, isr6, isr7
global isr8, isr9, isr10, isr11, isr12, isr13, isr14, isr15
global isr16, isr17, isr18, isr19, isr20, isr21, isr22, isr23
global isr24, isr25, isr26, isr27, isr28, isr29, isr30, isr31
global irq0, irq1, irq2, irq3, irq4, irq5, irq6, irq7
global irq8, irq9, irq10, irq11, irq12, irq13, irq14, irq15
extern isr_handler
extern irq_handler

; ISR 0: Division By Zero (no error code)
isr0:
    cli
    push byte 0
    push byte 0
    jmp isr_common_stub
; ISR 1: Debug
isr1:
    cli
    push byte 0
    push byte 1
    jmp isr_common_stub

; ISR 2: Non Maskable Interrupt
isr2:
    cli
    push byte 0
    push byte 2
    jmp isr_common_stub

; ISR 3: Breakpoint
isr3:
    cli
    push byte 0
    push byte 3
    jmp isr_common_stub

; ISR 4: Overflow
isr4:
    cli
    push byte 0
    push byte 4
    jmp isr_common_stub

; ISR 5: Bound Range Exceeded
isr5:
    cli
    push byte 0
    push byte 5
    jmp isr_common_stub

; ISR 6: Invalid Opcode
isr6:
    cli
    push byte 0
    push byte 6
    jmp isr_common_stub

; ISR 7: Device Not Available
isr7:
    cli
    push byte 0
    push byte 7
    jmp isr_common_stub
; ISR 8: Double Fault (has error code)
isr8:
    cli
    push byte 8
    jmp isr_common_stub

; ISR 9: Coprocessor Segment Overrun
isr9:
    cli
    push byte 0
    push byte 9
    jmp isr_common_stub

; ISR 10: Invalid TSS (has error code)
isr10:
    cli
    push byte 10
    jmp isr_common_stub

; ISR 11: Segment Not Present (has error code)
isr11:
    cli
    push byte 11
    jmp isr_common_stub

; ISR 12: Stack-Segment Fault (has error code)
isr12:
    cli
    push byte 12
    jmp isr_common_stub

; ISR 13: General Protection Fault (has error code)
isr13:
    cli
    push byte 13
    jmp isr_common_stub

; ISR 14: Page Fault (has error code)
isr14:
    cli
    push byte 14
    jmp isr_common_stub

; ISR 15: Reserved
isr15:
    cli
    push byte 0
    push byte 15
    jmp isr_common_stub
; ISR 16: x87 FPU Error
isr16:
    cli
    push byte 0
    push byte 16
    jmp isr_common_stub

; ISR 17: Alignment Check
isr17:
    cli
    push byte 0
    push byte 17
    jmp isr_common_stub

; ISR 18: Machine Check
isr18:
    cli
    push byte 0
    push byte 18
    jmp isr_common_stub

; ISR 19: SIMD Floating-Point Exception
isr19:
    cli
    push byte 0
    push byte 19
    jmp isr_common_stub

; ISR 20-31: Reserved
isr20:
    cli
    push byte 0
    push byte 20
    jmp isr_common_stub
isr21:
    cli
    push byte 0
    push byte 21
    jmp isr_common_stub
isr22:
    cli
    push byte 0
    push byte 22
    jmp isr_common_stub
isr23:
    cli
    push byte 0
    push byte 23
    jmp isr_common_stub
isr24:
    cli
    push byte 0
    push byte 24
    jmp isr_common_stub
isr25:
    cli
    push byte 0
    push byte 25
    jmp isr_common_stub
isr26:
    cli
    push byte 0
    push byte 26
    jmp isr_common_stub
isr27:
    cli
    push byte 0
    push byte 27
    jmp isr_common_stub
isr28:
    cli
    push byte 0
    push byte 28
    jmp isr_common_stub
isr29:
    cli
    push byte 0
    push byte 29
    jmp isr_common_stub
isr30:
    cli
    push byte 0
    push byte 30
    jmp isr_common_stub
isr31:
    cli
    push byte 0
    push byte 31
    jmp isr_common_stub
; ============ IRQ 0-15 ============
irq0:
    cli
    push byte 0
    push byte 32
    jmp irq_common_stub
irq1:
    cli
    push byte 0
    push byte 33
    jmp irq_common_stub
irq2:
    cli
    push byte 0
    push byte 34
    jmp irq_common_stub
irq3:
    cli
    push byte 0
    push byte 35
    jmp irq_common_stub
irq4:
    cli
    push byte 0
    push byte 36
    jmp irq_common_stub
irq5:
    cli
    push byte 0
    push byte 37
    jmp irq_common_stub
irq6:
    cli
    push byte 0
    push byte 38
    jmp irq_common_stub
irq7:
    cli
    push byte 0
    push byte 39
    jmp irq_common_stub
irq8:
    cli
    push byte 0
    push byte 40
    jmp irq_common_stub
irq9:
    cli
    push byte 0
    push byte 41
    jmp irq_common_stub
irq10:
    cli
    push byte 0
    push byte 42
    jmp irq_common_stub
irq11:
    cli
    push byte 0
    push byte 43
    jmp irq_common_stub
irq12:
    cli
    push byte 0
    push byte 44
    jmp irq_common_stub
irq13:
    cli
    push byte 0
    push byte 45
    jmp irq_common_stub
irq14:
    cli
    push byte 0
    push byte 46
    jmp irq_common_stub
irq15:
    cli
    push byte 0
    push byte 47
    jmp irq_common_stub
; ============ ?????? ============
isr_common_stub:
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    call isr_handler
    pop eax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    popa
    add esp, 8
    iret

irq_common_stub:
    pusha
    mov ax, ds
    push eax
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    call irq_handler
    pop ebx
    mov ds, bx
    mov es, bx
    mov fs, bx
    mov gs, bx
    popa
    add esp, 8
    iret
