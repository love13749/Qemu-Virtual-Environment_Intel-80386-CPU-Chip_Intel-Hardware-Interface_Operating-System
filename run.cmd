@echo off
REM === 创建 Objecting 文件夹 ===
if not exist Objecting mkdir Objecting

REM === 编译汇编 ===
nasm -f elf32 boot\boot.asm -o Objecting\boot.o
nasm -f elf32 kernel\architecture\i386\isr_stubs.asm -o Objecting\isr_stubs.o
nasm -f elf32 kernel\architecture\i386\idt_flush.asm -o Objecting\idt_flush.o
nasm -f elf32 kernel\system\context_switch.asm -o Objecting\context_switch.o

REM === 编译 GDT 模块 ===
nasm -f elf32 kernel\architecture\i386\gdt_flush.asm -o Objecting\gdt_flush.o

REM === 编译内核 C 文件 ===
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\kernel.c -o Objecting\kernel.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\lib\libk.c -o Objecting\libk.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\terminal.c -o Objecting\terminal.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\system\sync.c -o Objecting\sync.o

i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\architecture\i386\gdt.c -o Objecting\gdt.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\architecture\i386\pic.c -o Objecting\pic.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\architecture\i386\idt.c -o Objecting\idt.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\architecture\i386\isr.c -o Objecting\isr.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\architecture\i386\irq.c -o Objecting\irq.o

i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\drivers\keyboard.c -o Objecting\keyboard.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\drivers\timer.c -o Objecting\timer.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\drivers\mouse.c -o Objecting\mouse.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\drivers\framebuffer.c -o Objecting\framebuffer.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\drivers\dma.c -o Objecting\dma.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\drivers\sound.c -o Objecting\sound.o

i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\memory\memory.c -o Objecting\memory.o

i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\system\process.c -o Objecting\process.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\system\syscall.c -o Objecting\syscall.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\system\exe_loader.c -o Objecting\exe_loader.o
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel kernel\system\debugger.c -o Objecting\debugger.o

REM === 链接所有目标文件 ===
i686-elf-ld -T linker.ld ^
    Objecting\boot.o ^
    Objecting\kernel.o ^
    Objecting\libk.o ^
    Objecting\terminal.o ^
    Objecting\gdt.o ^
    Objecting\gdt_flush.o ^
    Objecting\pic.o ^
    Objecting\idt.o ^
    Objecting\isr.o ^
    Objecting\irq.o ^
    Objecting\isr_stubs.o ^
    Objecting\idt_flush.o ^
    Objecting\keyboard.o ^
    Objecting\timer.o ^
    Objecting\mouse.o ^
    Objecting\framebuffer.o ^
    Objecting\dma.o ^
    Objecting\memory.o ^
    Objecting\process.o ^
    Objecting\syscall.o ^
    Objecting\exe_loader.o ^
    Objecting\context_switch.o ^
    Objecting\sync.o ^
    Objecting\debugger.o ^
    Objecting\sound.o ^
    -o Objecting\kernel.elf

REM === 生成反汇编文件 ===
i686-elf-objdump -d Objecting\kernel.elf > Objecting\kernel.asm

REM === 运行 QEMU ===
qemu-system-i386 -kernel Objecting\kernel.elf -vga std -m 256M

REM === 清理中间文件 ===
del /Q Objecting\boot.o
del /Q Objecting\kernel.o
del /Q Objecting\libk.o
del /Q Objecting\terminal.o
del /Q Objecting\gdt.o
del /Q Objecting\gdt_flush.o
del /Q Objecting\pic.o
del /Q Objecting\idt.o
del /Q Objecting\isr.o
del /Q Objecting\irq.o
del /Q Objecting\isr_stubs.o
del /Q Objecting\idt_flush.o
del /Q Objecting\keyboard.o
del /Q Objecting\timer.o
del /Q Objecting\mouse.o
del /Q Objecting\framebuffer.o
del /Q Objecting\dma.o
del /Q Objecting\memory.o
del /Q Objecting\process.o
del /Q Objecting\syscall.o
del /Q Objecting\exe_loader.o
del /Q Objecting\context_switch.o
del /Q Objecting\debugger.o
del /Q Objecting\sync.o
del /Q Objecting\sound.o
pause