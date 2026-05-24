#include "process.h"
#include "../memory/memory.h"
#include "../terminal.h"
#include "../lib/libk.h"
#include "../architecture/i386/ports.h"
#include "../architecture/i386/isr.h"

// ==================== 全局变量 ====================
static pcb_t  process_table[MAX_PROCESSES];
static tcb_t  thread_table[MAX_THREADS];
static uint32_t pid_counter = 1;   // 0 保留给空闲进程
static uint32_t tid_counter = 1;

// 就绪队列（简单的双向链表）
static tcb_t* ready_queue_head = NULL;
static tcb_t* ready_queue_tail = NULL;

// 当前运行的线程和进程
static tcb_t* current_thread = NULL;
static pcb_t* current_process = NULL;

// 内核空闲线程控制块
static tcb_t idle_tcb;
static uint32_t idle_stack[256];

// ==================== 辅助函数 ====================

/*
 * @brief 分配进程 ID
*/
uint32_t allocate_pid(void) {
    uint32_t pid = pid_counter++;
    if (pid_counter >= 0xFFFFFF00) pid_counter = 1;
    return pid;
}

/*
 * @brief 分配线程 ID
*/
static uint32_t allocate_tid(void) {
    uint32_t tid = tid_counter++;
    if (tid_counter >= 0xFFFFFF00) tid_counter = 1;
    return tid;
}

/*
 * @brief 找一个空闲的 PCB 槽位
*/
static pcb_t* find_free_pcb(void) {
    for (int i = 0; i < MAX_PROCESSES; i++) {
        if (process_table[i].pid == 0) {
            return &process_table[i];
        }
    }
    return NULL;
}

/*
 * @brief 找一个空闲的 TCB 槽位
*/
static tcb_t* find_free_tcb(void) {
    for (int i = 0; i < MAX_THREADS; i++) {
        if (thread_table[i].tid == 0) {
            return &thread_table[i];
        }
    }
    return NULL;
}

/*
 * @brief 将线程加入就绪队列尾部
*/
static void enqueue_ready(tcb_t* thread) {
    if (!thread) return;
    
    thread->state = PROCESS_READY;
    thread->next = NULL;
    thread->prev = NULL;
    
    if (!ready_queue_head) {
        ready_queue_head = thread;
        ready_queue_tail = thread;
    } else {
        ready_queue_tail->next = thread;
        thread->prev = ready_queue_tail;
        ready_queue_tail = thread;
    }
}

/*
 * @brief 从就绪队列头部取出一个线程
*/
static tcb_t* dequeue_ready(void) {
    if (!ready_queue_head) return NULL;
    
    tcb_t* thread = ready_queue_head;
    ready_queue_head = thread->next;
    if (ready_queue_head) {
        ready_queue_head->prev = NULL;
    } else {
        ready_queue_tail = NULL;
    }
    
    thread->next = NULL;
    thread->prev = NULL;
    return thread;
}

/*
 * @brief 从就绪队列中移除指定线程
*/
static void remove_from_ready(tcb_t* thread) {
    if (!thread) return;
    
    if (thread->prev) {
        thread->prev->next = thread->next;
    } else {
        ready_queue_head = thread->next;
    }
    
    if (thread->next) {
        thread->next->prev = thread->prev;
    } else {
        ready_queue_tail = thread->prev;
    }
    
    thread->next = NULL;
    thread->prev = NULL;
}

// ==================== 上下文切换（汇编实现） ====================
/*
 * @brief 保存当前上下文到 old_context，然后从 new_context 恢复
*/
extern void context_switch(context_t* old_context, context_t* new_context);

// ==================== 内核空闲线程 ====================

/*
 * @brief 内核空闲线程入口函数
*/
static void idle_thread_entry(void) {
    while (1) {
        asm volatile("hlt");  // 空闲时让 CPU 休眠
    }
}

// ==================== 进程/线程创建 ====================

/*
 * @brief 初始化上下文
*/
static void init_context(context_t* ctx, uint32_t entry, uint32_t stack, bool user_mode) {
    memset(ctx, 0, sizeof(context_t));
    
    ctx->eip = entry;
    ctx->esp = stack;
    ctx->ebp = stack;
    
    if (user_mode) {
        // 用户模式：使用用户代码段和数据段
        ctx->cs = 0x1B;      // 用户代码段 (ring 3)
        ctx->ss = 0x23;      // 用户数据段 (ring 3)
        ctx->ds = 0x23;
        ctx->es = 0x23;
        ctx->fs = 0x23;
        ctx->gs = 0x23;
        ctx->eflags = 0x202; // IF=1 (允许中断)
    } else {
        // 内核模式：使用内核代码段和数据段
        ctx->cs = 0x08;      // 内核代码段 (ring 0)
        ctx->ss = 0x10;      // 内核数据段 (ring 0)
        ctx->ds = 0x10;
        ctx->es = 0x10;
        ctx->fs = 0x10;
        ctx->gs = 0x10;
        ctx->eflags = 0x202; // IF=1
    }
}

/*
 * @brief 创建线程
*/
int thread_create(pcb_t* proc, const char* name, uint32_t entry_point, uint32_t priority) {
    return thread_create_ex(proc, name, entry_point, priority, false);
}

/*
 * @brief 创建线程（扩展）
*/
int thread_create_ex(pcb_t* proc, const char* name, uint32_t entry_point, uint32_t priority, bool user_mode) {
    if (!proc || proc->num_threads >= MAX_THREADS_PER_PROC) return -1;
    
    tcb_t* tcb = find_free_tcb();
    if (!tcb) return -1;
    
    memset(tcb, 0, sizeof(tcb_t));
    tcb->tid = allocate_tid();
    if (name) {
        strncpy(tcb->name, name, THREAD_NAME_LEN - 1);
        tcb->name[THREAD_NAME_LEN - 1] = '\0';
    }
    
    tcb->state = PROCESS_CREATED;
    tcb->process = proc;
    tcb->priority = priority;
    tcb->time_quantum = DEFAULT_TIME_QUANTUM;
    tcb->ticks_used = 0;
    
    // 分配内核栈（4KB）
    tcb->kernel_stack = (uint32_t)kmalloc(4096);
    if (!tcb->kernel_stack) return -1;
    uint32_t stack_top = tcb->kernel_stack + 4096;
    
    // 初始化上下文（根据 user_mode 决定内核/用户模式）
    init_context(&tcb->context, entry_point, stack_top, user_mode);
    
    // 添加到进程的线程列表
    proc->threads[proc->num_threads++] = tcb;
    
    // 加入就绪队列
    enqueue_ready(tcb);
    
    return tcb->tid;
}

/*
 * @brief 创建进程
*/
int process_create(const char* name, uint32_t entry_point, uint32_t priority) {
    return process_create_ex(name, entry_point, priority, true);
}

/*
 * @brief 创建进程（扩展）
*/
int process_create_ex(const char* name, uint32_t entry_point, uint32_t priority, bool user_mode) {
    pcb_t* pcb = find_free_pcb();
    if (!pcb) return -1;
    
    memset(pcb, 0, sizeof(pcb_t));
    pcb->pid = allocate_pid();
    if (name) {
        strncpy(pcb->name, name, PROCESS_NAME_LEN - 1);
        pcb->name[PROCESS_NAME_LEN - 1] = '\0';
    }
    pcb->state = PROCESS_CREATED;
    pcb->priority = priority;
    pcb->time_quantum = DEFAULT_TIME_QUANTUM;
    pcb->num_threads = 0;
    pcb->num_regions = 0;
    pcb->parent = NULL;
    
    // 创建主线程（内核模式或用户模式）
    int tid = thread_create_ex(pcb, "main", entry_point, priority, user_mode);
    if (tid < 0) {
        pcb->pid = 0;
        return -1;
    }
    
    return pcb->pid;
}

// ==================== 核心调度器 ====================

/*
 * @brief 调度下一个线程
*/
void schedule(void) {
    // 如果当前线程还在运行且不是 init 线程，放回就绪队列
    // （init 线程是内核主循环的抽象，不参与调度轮转）
    // 如果当前线程还在运行，放回就绪队列（所有进程都参与调度轮转）
    if (current_thread && current_thread->state == PROCESS_RUNNING) {
        current_thread->state = PROCESS_READY;
        enqueue_ready(current_thread);
    }
    
    // 从就绪队列取出下一个线程
    tcb_t* next = dequeue_ready();
    if (!next) {
        // 没有就绪线程，使用空闲线程
        next = &idle_tcb;
    }
    
    tcb_t* prev = current_thread;
    current_thread = next;
    current_thread->state = PROCESS_RUNNING;
    current_process = next->process;
    
    // 执行上下文切换
    // 首次调度时 prev 可能为 NULL，此时只加载不保存
    context_switch(prev ? &prev->context : NULL, &next->context);
}

/*
 * @brief 时钟中断触发的调度
*/
void schedule_tick(void) {
    if (!current_thread) return;
    
    current_thread->ticks_used++;
    current_thread->process->ticks_used++;
    
    // 如果时间片用完，触发调度
    if (current_thread->ticks_used >= current_thread->time_quantum) {
        current_thread->ticks_used = 0;
        
        // 如果就绪队列非空或有其他就绪线程，调度
        if (ready_queue_head) {
            schedule();
        }
    }
}

/*
 * @brief 主动让出 CPU
*/
void yield(void) {
    schedule();
}

// ==================== 线程/进程终止 ====================

/*
 * @brief 线程退出
*/
void thread_exit(int exit_code) {
    (void)exit_code;
    
    if (!current_thread) return;
    
    current_thread->state = PROCESS_TERMINATED;
    
    // 从进程线程列表中移除
    pcb_t* proc = current_thread->process;
    if (proc) {
        for (uint32_t i = 0; i < proc->num_threads; i++) {
            if (proc->threads[i] == current_thread) {
                proc->threads[i] = proc->threads[--proc->num_threads];
                break;
            }
        }
    }
    
    // 释放内核栈
    if (current_thread->kernel_stack) {
        kfree((void*)current_thread->kernel_stack);
    }
    
    // 调度下一个线程
    schedule();
}

/*
 * @brief 进程退出
*/
void process_exit(int exit_code) {
    if (!current_process) return;
    
    current_process->exit_code = exit_code;
    current_process->state = PROCESS_TERMINATED;
    
    // 终止所有线程
    for (uint32_t i = 0; i < current_process->num_threads; i++) {
        tcb_t* thread = current_process->threads[i];
        if (thread && thread != current_thread) {
            thread->state = PROCESS_TERMINATED;
            remove_from_ready(thread);
            if (thread->kernel_stack) {
                kfree((void*)thread->kernel_stack);
            }
        }
    }
    
    current_process->num_threads = 0;
    
    // 终止当前线程
    if (current_thread) {
        current_thread->state = PROCESS_TERMINATED;
        if (current_thread->kernel_stack) {
            kfree((void*)current_thread->kernel_stack);
        }
    }
    
    schedule();
}

// ==================== 获取当前线程/进程 ====================

/*
 * @brief 获取当前线程
*/
tcb_t* get_current_thread(void) {
    return current_thread;
}

/*
 * @brief 获取当前进程
*/
pcb_t* get_current_process(void) {
    return current_process;
}

/*
 * @brief 获取当前进程 ID
*/
uint32_t get_current_pid(void) {
    return current_process ? current_process->pid : 0;
}

/*
 * @brief 获取当前线程 ID
*/
uint32_t get_current_tid(void) {
    return current_thread ? current_thread->tid : 0;
}

// ==================== 等待进程 ====================

/*
 * @brief 等待进程结束
*/
int wait_for_process(uint32_t pid) {
    // 简单实现：轮询等待进程结束
    pcb_t* target = NULL;
    for (int i = 0; i < MAX_PROCESSES; i++) {
        if (process_table[i].pid == pid) {
            target = &process_table[i];
            break;
        }
    }
    
    if (!target) return -1;
    
    while (target->state != PROCESS_TERMINATED) {
        asm volatile("hlt");
    }
    
    return target->exit_code;
}

// ==================== 线程睡眠 ====================

/*
 * @brief 线程睡眠
*/
void thread_sleep(uint32_t milliseconds) {
    if (!current_thread) return;
    
    current_thread->sleep_until = milliseconds + (current_thread->ticks_used);
    current_thread->state = PROCESS_SLEEPING;
    
    schedule();
}

// ==================== 阻塞/唤醒 ====================

/*
 * @brief 阻塞线程
*/
void thread_block(tcb_t* thread) {
    if (!thread) return;
    thread->state = PROCESS_BLOCKED;
    remove_from_ready(thread);
}

/*
 * @brief 唤醒线程
*/
void thread_unblock(tcb_t* thread) {
    if (!thread) return;
    if (thread->state == PROCESS_BLOCKED) {
        enqueue_ready(thread);
    }
}

// ==================== 进程列表 ====================

/*
 * @brief 显示进程列表
*/
void process_list(void) {
    terminal_writestring("\n=== Process List ===\n");
    terminal_writestring("PID  Name                 State    Threads\n");
    terminal_writestring("----------------------------------------\n");
    
    char buf[16];
    for (int i = 0; i < MAX_PROCESSES; i++) {
        if (process_table[i].pid == 0) continue;
        
        pcb_t* p = &process_table[i];
        
        // PID
        itoa(p->pid, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("  ");
        
        // Name
        terminal_writestring(p->name);
        
        // 补齐空格
        int len = strlen(p->name);
        for (int j = len; j < 20; j++) terminal_writestring(" ");
        
        // State
        switch (p->state) {
            case PROCESS_READY:      terminal_writestring("READY    "); break;
            case PROCESS_RUNNING:    terminal_writestring("RUNNING  "); break;
            case PROCESS_BLOCKED:    terminal_writestring("BLOCKED  "); break;
            case PROCESS_SLEEPING:   terminal_writestring("SLEEPING "); break;
            case PROCESS_TERMINATED: terminal_writestring("TERM     "); break;
            case PROCESS_CREATED:    terminal_writestring("CREATED  "); break;
        }
        
        // Threads
        itoa(p->num_threads, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("\n");
    }
    terminal_writestring("==============================\n");
}

// ==================== 切换到用户模式 ====================

/*
 * @brief 切换到用户模式
*/
void switch_to_user_mode(uint32_t entry, uint32_t stack) {
    // 使用 iret 切换到 ring 3 的用户模式
    asm volatile(
        "cli\n"
        "mov $0x23, %%ax\n"     // 用户数据段选择子
        "mov %%ax, %%ds\n"
        "mov %%ax, %%es\n"
        "mov %%ax, %%fs\n"
        "mov %%ax, %%gs\n"
        
        "push $0x23\n"          // SS (用户数据段)
        "push %1\n"             // ESP (用户栈)
        "push $0x202\n"         // EFLAGS (IF=1)
        "push $0x1B\n"          // CS (用户代码段)
        "push %0\n"             // EIP (入口地址)
        "iret\n"
        :
        : "r"(entry), "r"(stack)
        : "eax"
    );
}

// ==================== 初始化 ====================

/*
 * @brief 初始化进程系统
*/
void process_init(void) {
    terminal_writestring("Initializing process system...\n");
    
    // 清空进程表和线程表
    memset(process_table, 0, sizeof(process_table));
    memset(thread_table, 0, sizeof(thread_table));
    
    // 初始化空闲线程
    memset(&idle_tcb, 0, sizeof(tcb_t));
    strncpy(idle_tcb.name, "idle", 5);
    init_context(&idle_tcb.context, (uint32_t)idle_thread_entry, 
                 (uint32_t)idle_stack + sizeof(idle_stack), false);
    idle_tcb.state = PROCESS_READY;
    idle_tcb.priority = 0;
    idle_tcb.tid = 0;
    
    // 初始化就绪队列
    ready_queue_head = NULL;
    ready_queue_tail = NULL;
    
    // 创建内核初始进程（init 进程）
    terminal_writestring("Creating init process...\n");
    pcb_t* init_pcb = find_free_pcb();
    if (init_pcb) {
        memset(init_pcb, 0, sizeof(pcb_t));
        init_pcb->pid = allocate_pid();
        strncpy(init_pcb->name, "init", 5);
        init_pcb->state = PROCESS_RUNNING;
        init_pcb->priority = MAX_PRIORITY;
        init_pcb->time_quantum = DEFAULT_TIME_QUANTUM;
        init_pcb->num_threads = 0;
        
        // 创建 init 的主线程
        tcb_t* init_tcb = find_free_tcb();
        if (init_tcb) {
            memset(init_tcb, 0, sizeof(tcb_t));
            init_tcb->tid = allocate_tid();
            strncpy(init_tcb->name, "init_main", 10);
            init_tcb->state = PROCESS_RUNNING;
            init_tcb->process = init_pcb;
            init_tcb->priority = MAX_PRIORITY;
            init_tcb->time_quantum = DEFAULT_TIME_QUANTUM;
            init_tcb->kernel_stack = (uint32_t)kmalloc(4096);
            
            init_pcb->threads[init_pcb->num_threads++] = init_tcb;
            current_thread = init_tcb;
            current_process = init_pcb;
        }
    }
    
    terminal_writestring("Process system initialized.\n");
}
