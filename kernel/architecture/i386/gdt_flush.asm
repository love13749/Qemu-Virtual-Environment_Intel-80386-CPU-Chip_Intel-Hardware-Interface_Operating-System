global gdt_flush
global tss_flush

gdt_flush:
    mov eax, [esp+4]        ; GDT 指针地址
    lgdt [eax]
    
    ; 重新加载段寄存器
    mov ax, 0x10            ; 内核数据段
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    
    ; 远跳转刷新 CS
    jmp 0x08:.flush
.flush:
    ret

tss_flush:
    mov ax, 0x28            ; TSS 段选择子
    ltr ax
    ret
