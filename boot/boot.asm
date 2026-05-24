; boot.asm – 符合 Multiboot 1 的引导入口
; 支持 VBE 图形模式（1024x768x32bpp）
bits 32

section .multiboot               ; 这个节必须放在内核映像最前面
align 4

MULTIBOOT_MAGIC    equ 0x1BADB002
; bit0: 加载内存信息
; bit1: 加载图形/帧缓冲信息
; bit2: 告诉 bootloader 使用我们指定的 VBE 模式
MULTIBOOT_FLAGS    equ 0x00000007
MULTIBOOT_CHECKSUM equ -(MULTIBOOT_MAGIC + MULTIBOOT_FLAGS)

; 在 multiboot header 中指定 VBE 图形模式（需要 flags bit2=1）
; 结构：magic(4) + flags(4) + checksum(4) +
;       header_addr(4) + load_addr(4) + load_end_addr(4) + bss_end_addr(4) +
;       entry_addr(4) + mode_type(4) + width(4) + height(4) + depth(4)
multiboot_header:
    dd MULTIBOOT_MAGIC
    dd MULTIBOOT_FLAGS
    dd MULTIBOOT_CHECKSUM
    ; 以下字段仅在 flags bit2=1 时需要
    dd 0                          ; header_addr（填0由bootloader自动填充）
    dd 0                          ; load_addr
    dd 0                          ; load_end_addr
    dd 0                          ; bss_end_addr
    dd 0                          ; entry_addr
    dd 0                          ; mode_type = 0（线性图形模式）
    dd 1024                       ; width  = 1024
    dd 768                        ; height = 768
    dd 32                         ; depth  = 32 位色（每像素4字节）

section .text
global _start                     ; 链接器需要的入口符号
extern kernel_main                ; 你在 kernel.c 里的主函数

_start:
    ; 保存 multiboot 信息结构指针（ebx 指向它，由 bootloader 传入）
    mov [multiboot_info], ebx
    mov esp, stack_top            ; 设置 16 KB 栈
    call kernel_main              ; 跳转至你的 VGA 终端代码

    cli
.hang:
    hlt
    jmp .hang

section .data
global multiboot_info
multiboot_info:
    dd 0                          ; 保存 Multiboot 信息结构地址

section .bss
align 16
stack_bottom:
    resb 16384                    ; 预留 16 KB 栈空间
stack_top: