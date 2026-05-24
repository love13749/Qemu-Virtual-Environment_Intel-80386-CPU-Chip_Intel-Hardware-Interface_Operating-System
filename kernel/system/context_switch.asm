; context_switch.asm
; 上下文切换：保存当前寄存器，恢复目标寄存器
; C 原型: void context_switch(context_t* old_context, context_t* new_context);
;
; context_t 结构体布局 (偏移量):
;  +0: eax, +4: ebx, +8: ecx, +12: edx
; +16: esi, +20: edi, +24: ebp, +28: esp
; +32: eip, +36: eflags
; +40: cs, +44: ss, +48: ds, +52: es, +56: fs, +60: gs
;
; IMPORTANT: 当 old_context 为 NULL（首次调度）时，只加载新上下文，不保存

global context_switch

context_switch:
    ; 参数: [esp+4] = old_context, [esp+8] = new_context
    
    mov eax, [esp+4]        ; eax = old_context
    test eax, eax
    jz .restore_only        ; 如果 old_context == NULL，只恢复
    
    ; ======== 保存当前上下文到 old_context ========
    ; 先保存所有能保存的寄存器（eax 最后保存）
    mov [eax+4],  ebx       ; ebx
    mov [eax+8],  ecx       ; ecx
    mov [eax+12], edx       ; edx
    mov [eax+16], esi       ; esi
    mov [eax+20], edi       ; edi
    mov [eax+24], ebp       ; ebp
    
    ; 保存栈指针 (调用后的 esp)
    lea ecx, [esp+8]        ; 跳过 old, new 两个参数和返回地址
    mov [eax+28], ecx       ; esp
    
    ; 保存返回地址作为 eip
    mov ecx, [esp]          ; 返回地址
    mov [eax+32], ecx       ; eip
    
    ; 保存 eflags（强制开启中断）
    pushf
    pop ecx
    or ecx, 0x200           ; 强制设置 IF=1
    mov [eax+36], ecx       ; eflags
    
    ; 保存段寄存器
    xor ecx, ecx
    mov cx, cs
    mov [eax+40], ecx       ; cs
    mov cx, ss
    mov [eax+44], ecx       ; ss
    mov cx, ds
    mov [eax+48], ecx       ; ds
    mov cx, es
    mov [eax+52], ecx       ; es
    mov cx, fs
    mov [eax+56], ecx       ; fs
    mov cx, gs
    mov [eax+60], ecx       ; gs
    
    ; 最后保存 eax（当前值就是 old_context 地址）
    mov [eax+0], eax        ; 保存当前 eax
    
.restore_only:
    ; ======== 恢复新上下文 ========
    mov eax, [esp+8]        ; eax = new_context
    
    ; 恢复段寄存器
    mov ecx, [eax+48]       ; ds
    mov ds, cx
    mov ecx, [eax+52]       ; es
    mov es, cx
    mov ecx, [eax+56]       ; fs
    mov fs, cx
    mov ecx, [eax+60]       ; gs
    mov gs, cx
    
    ; 恢复通用寄存器
    mov ebx, [eax+4]
    mov ecx, [eax+8]
    mov edx, [eax+12]
    mov esi, [eax+16]
    mov edi, [eax+20]
    mov ebp, [eax+24]
    
    ; 恢复栈指针
    mov esp, [eax+28]
    
    ; 恢复 eflags
    push dword [eax+36]     ; eflags
    popf
    
    ; 把目标 eip 压栈
    push dword [eax+32]     ; eip
    
    ; 最后恢复 eax
    mov eax, [eax+0]
    
    ; 跳转到目标 eip
    ret

; ==================== 系统调用入口 ====================
; 使用 int 0x80 作为系统调用
; eax = 系统调用号
; ebx, ecx, edx = 参数 1-3

global syscall_handler
extern system_call_handler

syscall_handler:
    ; 保存用户上下文
    push ds
    push es
    push fs
    push gs
    pusha
    
    ; 切换到内核数据段
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    ; 调用 C 处理函数
    push edx                ; 参数3
    push ecx                ; 参数2
    push ebx                ; 参数1
    push eax                ; 系统调用号
    call system_call_handler
    add esp, 16
    
    ; 将返回值保存到 eax 位置
    mov [esp+28], eax       ; 在 pusha 栈帧中更新 eax
    
    ; 恢复用户上下文
    popa
    pop gs
    pop fs
    pop es
    pop ds
    
    iret
