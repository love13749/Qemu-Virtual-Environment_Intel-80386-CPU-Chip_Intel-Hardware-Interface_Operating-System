#include "architecture/i386/idt.h"
#include "architecture/i386/pic.h"
#include "architecture/i386/isr.h"
#include "architecture/i386/gdt.h"
#include "drivers/timer.h"
#include "drivers/keyboard.h"
#include "drivers/mouse.h"
#include "drivers/framebuffer.h"
#include "drivers/dma.h"
#include "drivers/sound.h"
#include "terminal.h"
#include "memory/memory.h"
#include "system/process.h"
#include "system/syscall.h"
#include "system/exe_loader.h"
#include "system/sync.h"
#include "system/debugger.h"
#include "lib/libk.h"

// 全局共享计数器（两个进程共享）
static volatile int shared_count = 0;

// 用于演示同步机制：共享输出锁和信号量
static mutex_t output_lock;         // 保护终端输出的互斥锁
static semaphore_t* sync_sem;       // 用于进程同步的信号量
static msg_queue_t* demo_queue;     // 进程间消息队列

// 测试程序1：在固定位置更新计数值（使用互斥锁保护输出）
void test_program1(void) {
    char buf[32];
    while (1) {
        shared_count++;
        if (shared_count % 200000 == 0) {
            mutex_lock(&output_lock);
            terminal_writeat(22, 0, "[demo1] Count: ");
            itoa(shared_count, buf, 10);
            terminal_writeat(22, 15, buf);
            terminal_writeat(22, 15 + strlen(buf), "          ");
            mutex_unlock(&output_lock);
        }
    }
}

// 测试程序2：在固定位置更新计数值（使用互斥锁保护输出）
void test_program2(void)
{
    char buf[32];
    while (1)
    {
        shared_count++;
        if (shared_count % 200000 == 0)
        {
            mutex_lock(&output_lock);
            terminal_writeat(23, 0, "[demo2] Count: ");
            itoa(shared_count, buf, 10);
            terminal_writeat(23, 15, buf);
            terminal_writeat(23, 15 + strlen(buf), "          ");
            mutex_unlock(&output_lock);
        }
    }
}

// 演示创建多个进程
void demo_processes(void) {
    terminal_writestring("\n=== Process/Thread Demo ===\n");

    // 创建两个测试进程（内核模式）
    int pid1 = process_create_ex("demo1", (uint32_t)test_program1, 128, false);
    int pid2 = process_create_ex("demo2", (uint32_t)test_program2, 100, false);

    if (pid1 > 0) {
        terminal_writestring("Created process demo1 with PID: ");
        char buf[16];
        itoa(pid1, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("\n");
    }

    if (pid2 > 0) {
        terminal_writestring("Created process demo2 with PID: ");
        char buf[16];
        itoa(pid2, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("\n");
    }

    // 显示进程列表
    process_list();
}

void kernel_main() {
    // 初始化终端
    terminal_initialize();

    // 显示信息
    terminal_writestring("X86 OS v0.2 - With Process/Thread Support\n");
    terminal_writestring("Loading...\n");

    // ===== 顺序很重要 =====

    // 1. 先初始化 GDT（段描述符，包括用户模式段和 TSS）
    gdt_init();

    // 2. 再安装 IDT 并重映射 PIC（中断系统依赖 GDT）
    idt_install();
    pic_remap(0x20, 0x28);

    // 3. 初始化帧缓冲（尝试进入图形模式）
    framebuffer_init();

    // 4. 初始化内存管理（kmalloc 等）
    memory_init();

    // 5. 初始化进程系统（PCB、TCB、就绪队列）
    process_init();

    // 6. 初始化系统调用（int 0x80 注册）
    syscall_init();

    // 7. 初始化同步机制（信号量、互斥锁、消息队列）
    sync_init();

    // 初始化内置调试器（注册 INT1/INT3 处理）
    debugger_init();

    // 创建演示用的同步对象
    mutex_init(&output_lock, "output_lock");
    sync_sem = sem_create("demo_sem", 0);
    demo_queue = msg_queue_create("demo_queue");

    // 8. 初始化外设驱动
    keyboard_init();
    timer_init(100);
    mouse_init();
    dma_init();
    sound_init();                       // 初始化 PC Speaker 声音驱动

    terminal_writestring("System ready. Interrupts enabled.\n");

    // 9. 演示进程创建
    demo_processes();

    // 10. 演示 DMA 数据传输
    dma_demo();

    // 11. 启动背景音乐（循环播放 8-bit 风格背景音乐）
    terminal_writestring("\nStarting background music...\n");
    sound_loop_melody(melody_8bit_bgm);

    // 12. 开启中断
    asm volatile("sti");

    terminal_writestring("\nKernel main loop running.\n");
    terminal_writestring("Press F1 or F12 to enter debugger.\n");
    terminal_writestring("Press F2 to play BGM, F3 to stop, F4 to toggle mute.\n");

    char key;
    // 主循环
    while (1) {
        // 检测 F1/F12 按键请求，进入内置调试器
        if (debugger_requested) {
            debugger_requested = 0;
            terminal_writestring("\n[DEBUG] Entering debugger...\n");
            debugger_run();
            terminal_writestring("\nReturned from debugger.\n");
        }

        // 读取键盘缓冲区中的字符并回显到终端
        while (keyboard_buffer_read(&key)) {
            terminal_putchar(key);

            // 快捷键控制音乐播放
            // F2 -> 播放/切换背景音乐
            // F3 -> 停止音乐
            // F4 -> 静音切换
            // 这些功能键通过 ASCII 控制字符传入
        }

        asm volatile("hlt");
    }
}
