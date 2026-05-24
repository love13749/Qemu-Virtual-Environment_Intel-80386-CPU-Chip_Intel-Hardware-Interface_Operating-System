# X86 OS v0.2 — 自制 x86 操作系统内核

一个从零开始构建的、支持多进程/多线程与同步机制的 **x86 架构 32 位操作系统内核**，可在 QEMU 模拟器上运行。

## 目录

- [项目概览](#项目概览)
- [功能特性](#功能特性)
- [项目结构](#项目结构)
- [编译与运行](#编译与运行)
- [启动流程](#启动流程)
- [模块详解](#模块详解)
  - [引导与启动 (boot)](#引导与启动-boot)
  - [终端 (Terminal)](#终端-terminal)
  - [架构层 (Architecture)](#架构层-architecture)
  - [内存管理 (Memory)](#内存管理-memory)
  - [进程与线程 (Process/Thread)](#进程与线程-processthread)
  - [同步机制 (Synchronization)](#同步机制-synchronization)
  - [系统调用 (Syscall)](#系统调用-syscall)
  - [驱动 (Drivers)](#驱动-drivers)
  - [可执行文件加载器 (EXE Loader)](#可执行文件加载器-exe-loader)
  - [内置调试器 (Debugger)](#内置调试器-debugger)
- [快捷键](#快捷键)
- [未来计划](#未来计划)

---

## 项目概览

这是一个 **i386 架构** 的操作系统内核，用 **C 语言 + 汇编 (NASM)** 编写。内核在 **QEMU** 模拟器中运行（使用 `qemu-system-i386`），支持 **Multiboot 规范**，可被 GRUB 等引导程序加载。

内核旨在展示操作系统底层核心概念，包括：
- CPU 保护模式下的**分段与中断管理**
- **伙伴系统**物理内存分配 + **Slab 分配器** + **内核堆分配器**
- 抢占式多任务调度（**进程/线程**）
- **互斥锁、信号量、消息队列**等同步原语
- **int 0x80** 系统调用接口
- **PC Speaker** 音频驱动（可播放旋律和背景音乐）
- **8237 DMA** 控制器驱动（硬件的内存到内存拷贝）
- **PS/2 鼠标**驱动（支持图形/文本双模式光标）
- **VBE 图形帧缓冲**（1024×768×32bpp）
- 内置**调试器**（支持断点、单步、反汇编、内存查看等）

> ⚠️ 注意：这是一个教学/实验性质的内核，许多功能（如文件系统、网络、分页）是预留接口但尚未实现。

---

## 功能特性

| 特性 | 说明 |
|------|------|
| **架构** | i386 (x86 32-bit)，保护模式 |
| **引导** | Multiboot 1 规范，支持 VBE 图形模式 |
| **中断** | IDT (256 个中断门)，PIC 8259 可编程中断控制器 |
| **GDT** | 6 个描述符（NULL、内核代码/数据、用户代码/数据、TSS） |
| **物理内存** | 伙伴系统 (Buddy System)，最多管理 4GB 物理内存 |
| **内核堆** | First-Fit 算法 + 金丝雀溢出检测 + 边界标记 |
| **Slab 分配器** | 8B~2KB 小对象高效缓存 (9 级缓存) |
| **进程/线程** | PCB、TCB、就绪队列、时间片轮转调度 |
| **同步** | 互斥锁 (Mutex)、信号量 (Semaphore)、消息队列 (MsgQueue) |
| **系统调用** | int 0x80，22 个系统调用号 |
| **键盘** | PS/2 键盘驱动，US 键盘布局，支持 Shift/Caps |
| **鼠标** | PS/2 鼠标驱动，图形模式像素级光标，文本模式字符级光标 |
| **定时器** | PIT 8253/8254，可编程频率（默认 100Hz），右下角实时时钟显示 |
| **帧缓冲** | VBE 1024×768×32bpp 图形模式（线性帧缓冲） |
| **DMA** | 8237 DMA 控制器，支持 24 位地址（16MB 范围），内存到内存传输 |
| **PC Speaker** | 蜂鸣器驱动，支持单音、旋律、循环背景音乐 |
| **调试器** | 类 DOS DEBUG 风格内置调试器 |
| **ELF/PE 加载** | 支持解析并加载 ELF 和 PE (EXE) 格式的可执行文件 |
| **图形模式** | VBE 1024×768×32bpp（Multiboot 协商） |

---

## 项目结构

```
├── boot/
│   └── boot.asm                     # Multiboot 引导扇区汇编代码
├── kernel/
│   ├── kernel.c                     # 内核主入口 & 初始化流程 & 主循环
│   ├── terminal.c                   # 80×25 VGA 文本模式终端
│   ├── terminal.h
│   ├── architecture/
│   │   └── i386/
│   │       ├── gdt.c / gdt.h        # 全局描述符表 (GDT + TSS)
│   │       ├── idt.c / idt.h        # 中断描述符表 (IDT)
│   │       ├── isr.c / isr.h        # 异常处理 (ISR 0-31) + 中断注册
│   │       ├── irq.c                # 硬件中断处理 (IRQ 0-15)
│   │       ├── pic.c / pic.h        # 8259 可编程中断控制器重映射
│   │       ├── ports.h              # I/O 端口操作内联汇编
│   │       └── *.asm                # 对应的汇编 stub 文件
│   ├── drivers/
│   │   ├── keyboard.c / keyboard.h  # PS/2 键盘驱动
│   │   ├── timer.c / timer.h        # PIT 定时器驱动
│   │   ├── mouse.c / mouse.h        # PS/2 鼠标驱动
│   │   ├── framebuffer.c / .h       # VBE 图形帧缓冲驱动
│   │   ├── dma.c / dma.h            # 8237 DMA 控制器驱动
│   │   └── sound.c / sound.h        # PC Speaker 蜂鸣器驱动
│   ├── fileSystem/                  # 文件系统预留（暂空）
│   ├── lib/
│   │   ├── libk.c / libk.h          # 内核 C 标准库 (memcpy, memset, itoa, strlen 等)
│   ├── memory/
│   │   ├── memory.c / memory.h      # 伙伴系统 + 堆分配器 + Slab 分配器
│   ├── system/
│   │   ├── process.c / process.h    # 进程/线程管理 & 调度器
│   │   ├── context_switch.asm       # 上下文切换汇编实现
│   │   ├── sync.c / sync.h          # 同步机制 (锁、信号量、消息队列)
│   │   ├── syscall.c / syscall.h    # int 0x80 系统调用处理
│   │   ├── exe_loader.c / exe_loader.h  # ELF/PE 可执行文件加载器
│   │   └── debugger.c / debugger.h  # 内置调试器
│   └── wirelessCommuncation/        # 无线通信预留（暂空）
├── linker.ld                        # 链接脚本
├── run.cmd                          # Windows 编译 & 运行脚本（NASM + GCC 交叉编译器）
├── build_log.txt                    # 构建日志
├── Objecting/                       # 编译输出目录
└── README.md                        # 本文件
```

---

## 编译与运行

### 环境需求

- **NASM** 汇编器
- **i686-elf-gcc** 交叉编译器（用于编译 freestanding C 代码）
- **i686-elf-ld** 交叉链接器
- **QEMU** 模拟器（`qemu-system-i386`）

### 快速运行 (Windows)

确保以上工具在 PATH 中，然后直接执行：

```cmd
run.cmd
```

`run.cmd` 会自动完成：编译全部源代码 → 链接 → 生成内核 ELF → 启动 QEMU。

### 手动编译步骤

```bash
# 1. 创建输出目录
mkdir -p Objecting

# 2. 编译汇编文件
nasm -f elf32 boot/boot.asm -o Objecting/boot.o
nasm -f elf32 kernel/architecture/i386/isr_stubs.asm -o Objecting/isr_stubs.o
nasm -f elf32 kernel/architecture/i386/idt_flush.asm -o Objecting/idt_flush.o
nasm -f elf32 kernel/architecture/i386/gdt_flush.asm -o Objecting/gdt_flush.o
nasm -f elf32 kernel/system/context_switch.asm -o Objecting/context_switch.o

# 3. 编译 C 文件
i686-elf-gcc -c -ffreestanding -nostdlib -O2 -Wall -Wextra -Ikernel \
    kernel/kernel.c -o Objecting/kernel.o
# ...（其他所有 .c 文件同理）

# 4. 链接
i686-elf-ld -T linker.ld <所有目标文件> -o Objecting/kernel.elf

# 5. 运行
qemu-system-i386 -kernel Objecting/kernel.elf -vga std -m 256M
```

### 运行效果

启动后将看到：
1. 系统初始化信息输出（终端初始化、GDT、IDT、PIC、帧缓冲、内存、进程系统、系统调用、同步机制、驱动）
2. 时间显示在屏幕右下角
3. 系统自动创建两个演示进程 (`demo1` 和 `demo2`)，它们不断递增共享计数器并显示
4. 循环播放 8-bit 风格背景音乐
5. 键盘输入会回显到终端
6. 按 F1/F12 进入内置调试器

---

## 启动流程

内核启动的完整顺序（见 `kernel_main`）：

```
1. terminal_initialize()         # 清屏，重置 VGA 终端光标
2. gdt_init()                    # 设置 GDT（NULL、代码段、数据段、用户段、TSS）
3. idt_install() + pic_remap()   # 安装 256 个中断门，重映射 PIC（偏移 0x20/0x28）
4. framebuffer_init()            # 尝试启用 VBE 1024×768×32bpp 图形模式
5. memory_init()                 # 初始化伙伴系统 + 内核堆 + Slab 分配器
6. process_init()                # 初始化进程/线程系统（PCB、TCB、就绪队列）
7. syscall_init()                # 注册 int 0x80 系统调用处理函数
8. sync_init()                   # 初始化同步机制（信号量池、互斥锁池、消息队列池）
9. debugger_init()               # 注册 INT1/INT3 调试异常处理
10. keyboard_init()              # PS/2 键盘驱动
11. timer_init(100)              # PIT 定时器，100Hz
12. mouse_init()                 # PS/2 鼠标驱动
13. dma_init()                   # 8237 DMA 控制器
14. sound_init()                 # PC Speaker 驱动
15. demo_processes()             # 创建演示进程
16. dma_demo()                   # DMA 内存拷贝演示
17. sound_loop_melody()          # 启动循环背景音乐
18. sti                          # 开启中断
19. while(1) { hlt; }            # 主循环：检测调试器请求 + 键盘回显
```

---

## 模块详解

### 引导与启动 (boot)

`boot/boot.asm` — 符合 **Multiboot 1** 规范的引导扇区。

- **Multiboot Header**：包含 magic、flags、校验和以及 VBE 图形模式参数（1024×768×32bpp）
- **栈设置**：分配 16KB 栈空间
- **入口**：将 multiboot 信息结构体指针保存到 `multiboot_info`，然后调用 C 函数 `kernel_main`

### 终端 (Terminal)

`kernel/terminal.c` / `.h` — 80×25 VGA 文本模式终端。

- 直接操作 **0xB8000** 处的 VGA 显存
- 支持控制字符：`\n`（换行并滚动）、`\r`（回车）、`\b`（退格）、`\t`（4空格制表符）
- `terminal_writeat()` — 在指定行列直接写入，不移动光标（用于固定位置刷新，如进程计数显示）
- 屏幕滚动功能

### 架构层 (Architecture)

#### GDT — 全局描述符表

`kernel/architecture/i386/gdt.c`

6 个 GDT 描述符：

| 索引 | 用途 | 类型 |
|------|------|------|
| 0 | NULL 描述符 | — |
| 1 | 内核代码段 | ring 0, 代码, 可执行/可读 |
| 2 | 内核数据段 | ring 0, 数据, 可读写 |
| 3 | 用户代码段 | ring 3, 代码, 可执行/可读 |
| 4 | 用户数据段 | ring 3, 数据, 可读写 |
| 5 | TSS (任务状态段) | 用于进程切换时的栈切换 |

所有段均覆盖 0~4GB 平坦地址空间。

#### IDT — 中断描述符表

`kernel/architecture/i386/idt.c` / `isr.c` / `irq.c`

- **ISR 0-31**：CPU 异常处理（除零、页错误、通用保护故障等），发生时会显示详细的寄存器信息并停机
- **IRQ 0-15**：硬件中断，通过 PIC 重映射到向量 32-47
  - IRQ0 (32) = 定时器
  - IRQ1 (33) = 键盘
  - IRQ12 (44) = 鼠标
- **int 0x80 (128)**：系统调用
- 提供 `register_interrupt_handler()` 统一注册接口

#### PIC — 可编程中断控制器

`kernel/architecture/i386/pic.c`

- 将主片 PIC 重映射到向量 0x20~0x27，从片到 0x28~0x2F
- 支持级联模式（从片连接到主片 IRQ2）

### 内存管理 (Memory)

`kernel/memory/memory.c` — 三层内存分配体系。

#### 1. 伙伴系统 (Buddy System) — 物理页分配

- 管理所有物理页（4KB/页）
- 支持 0~10 阶（1 页 ~ 1024 页，即 ~4MB 连续块）
- 分配时自动分裂，释放时自动合并伙伴块
- 位图辅助，快速标记已用页面
- 支持 `alloc_page()` / `free_page()` / `alloc_pages(n)` / `free_pages(n)`
- 假设 128MB 物理内存

#### 2. 内核堆分配器 (Heap Allocator) — kmalloc/kfree

- First-Fit 算法，遍历空闲链表寻找最合适的块
- 堆区域：0x01000000 ~ 0x10000000（16MB ~ 256MB）
- **安全特性**：
  - 魔数验证 (`0xDEADBEEF`)
  - 金丝雀值 (`0xCAFEBABE`) 检测溢出
  - 边界标记 (`0xABABABAB`) 检测缓冲区溢出
  - 释放后毒化模式填充
  - 双重释放检测
- 支持 `kmalloc()` / `kfree()` / `kcalloc()` / `krealloc()`
- 支持 `kmalloc_aligned()` 对齐分配
- 空闲块自动合并（双向）

#### 3. Slab 分配器 — 小对象缓存

- 9 级缓存：8B、16B、32B、64B、128B、256B、512B、1024B、2048B
- 每 slab 使用一页 (4KB)，对象链接成空闲链表
- `kmalloc` 对小对象自动使用 slab，超出 slab 范围的走普通堆分配

### 进程与线程 (Process/Thread)

`kernel/system/process.c` — 抢占式多任务调度。

#### 数据结构

- **PCB** (进程控制块)：PID、名称、状态、线程列表、优先级、时间片、父子进程关系
- **TCB** (线程控制块)：TID、名称、状态、所属进程、寄存器上下文、内核栈、优先级、时间片
- 最多 64 个进程、128 个线程

#### 调度器

- 就绪队列（双向链表）
- **时间片轮转调度** — 由定时器中断 (`schedule_tick()`) 驱动
- 默认时间片 = 5 ticks（tick = 10ms，因此约 50ms）
- 空闲线程（`idle`）在没有就绪线程时运行，执行 HLT 指令省电

#### 上下文切换

`kernel/system/context_switch.asm` — 纯汇编实现

- 保存全部通用寄存器、段寄存器、EFLAGS、EIP、ESP 到 old_context
- 从 new_context 恢复全部寄存器
- 首次调度时（old_context == NULL）只加载不保存

#### 进程/线程创建

- `process_create()` / `process_create_ex()` — 分配 PCB，创建主线程（可指定内核/用户模式）
- `thread_create()` / `thread_create_ex()` — 分配 TCB，设置内核栈，初始化上下文
- 支持用户模式（ring 3）段选择子

### 同步机制 (Synchronization)

`kernel/system/sync.c` — 三种同步原语。

#### 互斥锁 (Mutex)

- 二值锁，`locked` + `owner` 追踪锁持有者
- 可重入（同一线程重复加锁不会死锁）
- 阻塞时线程加入等待队列
- `mutex_lock()` / `mutex_unlock()` / `mutex_try_lock()`

#### 信号量 (Semaphore)

- 经典 Dijkstra 信号量，value 可任意初始值
- `sem_wait()` (P 操作) — value--，若 < 0 则阻塞
- `sem_signal()` (V 操作) — value++，若 ≤ 0 则唤醒一个等待线程
- `sem_try_wait()` — 非阻塞版本

#### 消息队列 (Message Queue)

- 环形缓冲区，最多 16 条消息，每条最大 64 字节数据
- 消息包含 type、sender_pid、data
- 队列满时发送者阻塞，队列空时接收者阻塞
- `msg_send()` / `msg_recv()` / `msg_try_send()` / `msg_try_recv()`

所有同步操作均通过 `cli`/`sti` 保证原子性。

### 系统调用 (Syscall)

`kernel/system/syscall.c` — int 0x80 系统调用接口。

| 编号 | 名称 | 功能 |
|------|------|------|
| 0 | SYS_EXIT | 进程退出 |
| 1 | SYS_FORK | 创建子进程（未实现） |
| 2 | SYS_EXEC | 执行新程序 |
| 3 | SYS_WAITPID | 等待子进程结束 |
| 4 | SYS_GETPID | 获取当前 PID |
| 5 | SYS_GETTID | 获取当前 TID |
| 6 | SYS_SLEEP | 线程睡眠 |
| 7 | SYS_YIELD | 主动让出 CPU |
| 8 | SYS_PRINT | 输出字符串 |
| 9-15 | SYS_OPEN/WRITE/... | 文件操作（简化版） |
| 16-21 | SYS_SEM_MTX_MSG | 同步原语操作（预留） |

- 汇编入口 `syscall_handler` 保存/恢复用户寄存器，切换到内核段
- C 处理函数 `system_call_handler` 查表分发
- IDT 门设置为 **DPL=3** (0xEE)，允许用户程序调用

### 驱动 (Drivers)

#### 键盘 (PS/2)

- US 键盘布局，完整扫描码→ASCII 映射（含 Shift 状态）
- 支持 Caps Lock 切换
- 环形缓冲区 (256 字节)，中断写入，主循环读取
- **F1/F12** 触发 `debugger_requested` 标志

#### 定时器 (PIT)

- 8253/8254 可编程间隔定时器
- 默认 100Hz 频率
- 驱动调度器时间片 (`schedule_tick()`)
- 驱动音乐播放进度 (`sound_tick()`)
- 屏幕右下角实时时钟 (`HH:MM:SS`)

#### 鼠标 (PS/2)

- 三字节数据包解码
- **图形模式**：像素级 16×16 箭头光标，绘制前保存/恢复背景
- **文本模式**：字符级块状光标 (`█`)，累加像素偏移达阈值才移动
- Y 轴自动翻转（屏幕坐标系）

#### 帧缓冲 (VBE)

- 从 Multiboot 信息结构读取 VBE 控制器信息
- 支持 `fb_putpixel()`、`fb_fill_rect()`、`fb_clear()`
- 帧缓冲物理地址、宽高、pitch、bpp 查询

#### DMA (8237)

- 完整 8237 DMA 控制器初始化（DMA1 通道 0-3、DMA2 通道 5-7）
- 通道 4 为级联通道，保留
- `dma_setup_transfer()` — 配置传输（地址、大小、方向、模式）
- `dma_memcpy_phys()` — 内存到内存 DMA 传输（使用通道 0+1）
- 地址范围限制在 0~16MB (24 位地址)
- 最大单次传输 64KB
- 内置验证函数 `dma_verify_transfer()`

#### PC Speaker (蜂鸣器)

- 使用 PIT 通道 2 产生方波声音
- 频率计算公式：`divisor = 1193182 / frequency`
- 多个预置旋律：小星星、超级玛丽主题、生日快乐、8-bit 背景音乐
- 非阻塞播放，由定时器中断驱动
- 支持静音切换、音量控制

### 可执行文件加载器 (EXE Loader)

`kernel/system/exe_loader.c` — 支持加载 **ELF** 和 **PE (EXE)** 格式。

- **ELF 加载**：解析 ELF 头部，遍历 PT_LOAD 段，分配连续内存，加载各段并清零 .bss
- **PE 加载**：解析 MZ/PE 头部，加载各节，应用基址重定位（.reloc）
- **格式自动检测**：根据文件魔数自动识别 ELF/PE
- 加载后使用 `process_create()` 创建进程来执行

> ⚠️ 简化实现：使用 `simple_alloc()` 而非完整的内存映射，缺乏用户态页表隔离。

### 内置调试器 (Debugger)

`kernel/system/debugger.c` — 类 DOS DEBUG 风格的内置调试器。

按 **F1** 或 **F12** 进入，支持以下命令：

| 命令 | 功能 |
|------|------|
| `?` | 显示帮助 |
| `r` | 显示 CPU 寄存器值及标志位 (CF/PF/AF/ZF/SF/TF/IF/DF/OF) |
| `d [addr] [n]` | 转储内存（十六进制 + ASCII 视图） |
| `e addr [byte...]` | 修改内存（交互式或批量） |
| `u [addr] [n]` | 反汇编 (x86 指令解码，支持常见指令) |
| `g` | 继续运行（保留断点） |
| `t` | 单步跟踪（设置 EFLAGS.TF） |
| `b addr` | 设置 INT3 断点 |
| `bc idx` | 清除断点 |
| `bl` | 列出所有断点 |
| `a addr` | 汇编（十六进制字节输入模式） |
| `f s e d` | 填充内存区域 |
| `s s e d` | 在内存中搜索值 |
| `c a1 a2 n` | 比较两块内存 |
| `m s d n` | 移动（拷贝）内存 |
| `h v1 v2` | 十六进制计算（+ - * /） |
| `q` | 退出调试器 |
| `map` | 显示内存映射信息 |
| `heap` | 显示内核堆块信息 |
| `slab` | 显示 slab 缓存状态 |
| `ps` | 显示进程列表 |
| `cls` | 清屏 |
| `dma` | DMA 状态 |
| `dmach` | DMA 通道信息 |
| `dmademo` | DMA 内存拷贝演示 |

支持最多 **16 个 INT3 断点**，命中断点时自动恢复原指令字节。

---

## 快捷键

| 键 | 功能 |
|----|------|
| **F1** | 进入调试器 |
| **F12** | 进入调试器（备选） |
| **F2** | 播放背景音乐（8-bit BGM） |
| **F3** | 停止背景音乐 |
| **F4** | 静音切换 |

---

## 未来计划

- [ ] 分页 (Paging) 支持 — 为进程提供独立虚拟地址空间
- [ ] 用户态模式 (Ring 3) 运行用户程序
- [ ] 文件系统 (FAT12/16/32 或 ext2)
- [ ] 完整的 ELF/PE 加载器与用户进程执行
- [ ] 系统调用完善（fork, exec, file I/O）
- [ ] 多核 SMP 支持
- [ ] 网络协议栈（无线通信目录已预留）
- [ ] 图形化 GUI（基于帧缓冲）

---

## 许可证

个人学习/教学项目，仅供学习和参考。
