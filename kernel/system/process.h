#ifndef PROCESS_H
#define PROCESS_H

#include <stdint.h>
#include <stdbool.h>

// ==================== 进程状态 ====================

/*
 * @brief 进程状态枚举
*/
typedef enum {
    PROCESS_READY      = 0,
    PROCESS_RUNNING    = 1,
    PROCESS_BLOCKED    = 2,
    PROCESS_SLEEPING   = 3,
    PROCESS_TERMINATED = 4,
    PROCESS_CREATED    = 5
} process_state_t;

// ==================== 线程上下文（保存的寄存器） ====================

/*
 * @brief 线程上下文结构体
*/
typedef struct {
    uint32_t eax, ebx, ecx, edx;
    uint32_t esi, edi, ebp, esp;
    uint32_t eip, eflags;
    uint32_t cs, ss, ds, es, fs, gs;
} __attribute__((packed)) context_t;

// ==================== 内存区域描述 ====================

/*
 * @brief 内存区域描述结构体
*/
typedef struct {
    uint32_t start;          // 起始虚拟地址
    uint32_t end;            // 结束虚拟地址
    uint32_t flags;          // 权限标志 (RWX)
    uint32_t phys_addr;      // 物理地址 (0 表示未分配)
} memory_region_t;

// ==================== 进程控制块 (PCB) ====================

/*
 * @brief 进程控制块结构体
*/
#define MAX_MEMORY_REGIONS 16
#define MAX_THREADS_PER_PROC 8
#define PROCESS_NAME_LEN   32
#define MAX_PROCESSES      64

typedef struct pcb {
    uint32_t pid;                         // 进程 ID
    char     name[PROCESS_NAME_LEN];      // 进程名
    process_state_t state;                // 进程状态
    
    // 进程内存空间（页目录等）
    uint32_t page_directory;              // 页目录物理地址（0 表示使用内核页表）
    memory_region_t regions[MAX_MEMORY_REGIONS];
    uint32_t num_regions;
    
    // 进程内的线程列表
    struct tcb* threads[MAX_THREADS_PER_PROC];
    uint32_t num_threads;
    
    // 进程资源
    uint32_t priority;                    // 优先级 (0-255)
    uint32_t time_quantum;                // 时间片 (tick 数)
    uint32_t ticks_used;                  // 已用 tick
    
    // 文件相关（后续扩展）
    int      stdin_fd;
    int      stdout_fd;
    int      stderr_fd;
    
    // 链表指针（用于调度队列）
    struct pcb* next;
    
    // 父子进程关系
    struct pcb* parent;
    uint32_t    exit_code;
    
    // 内核栈
    uint32_t kernel_stack;
    uint32_t kernel_stack_size;
} pcb_t;

// ==================== 线程控制块 (TCB) ====================

/*
 * @brief 线程控制块结构体
*/
#define THREAD_NAME_LEN 32
#define MAX_THREADS     128

typedef struct tcb {
    uint32_t    tid;                      // 线程 ID
    char        name[THREAD_NAME_LEN];    // 线程名
    process_state_t state;                // 线程状态
    
    pcb_t*      process;                  // 所属进程
    
    context_t   context;                  // 保存的寄存器上下文
    uint32_t    kernel_stack;             // 内核栈地址
    
    uint32_t    sleep_until;              // 唤醒时间（用于 SLEEPING 状态）
    uint32_t    priority;                 // 线程优先级
    uint32_t    time_quantum;             // 时间片
    uint32_t    ticks_used;               // 已用 tick
    
    // 链表指针
    struct tcb* next;
    struct tcb* prev;
} tcb_t;

// ==================== 调度器配置 ====================
#define DEFAULT_TIME_QUANTUM    5       // 默认时间片 (tick)
#define MAX_PRIORITY            255
#define MIN_PRIORITY            0

// ==================== 系统调用号 ====================
#define SYS_EXIT        0
#define SYS_FORK        1
#define SYS_EXEC        2
#define SYS_WAITPID     3
#define SYS_GETPID      4
#define SYS_GETTID      5
#define SYS_SLEEP       6
#define SYS_YIELD       7
#define SYS_PRINT       8
#define SYS_OPEN        9
#define SYS_READ        10
#define SYS_WRITE       11
#define SYS_CLOSE       12
#define SYS_BRK         13
#define SYS_GETPPID     14
#define SYS_KILL        15
#define SYS_SEM_WAIT    16      // P 操作
#define SYS_SEM_SIGNAL  17      // V 操作
#define SYS_MTX_LOCK    18      // 互斥锁加锁
#define SYS_MTX_UNLOCK  19      // 互斥锁解锁
#define SYS_MSG_SEND    20      // 发送消息
#define SYS_MSG_RECV    21      // 接收消息

// ==================== API 函数 ====================

/*
 * @brief 初始化进程系统
*/
void process_init(void);

/*
 * @brief 创建进程（返回 PID）
*/
int  process_create(const char* name, uint32_t entry_point, uint32_t priority);

/*
 * @brief 创建进程（扩展版：可指定用户/内核模式）
*/
int  process_create_ex(const char* name, uint32_t entry_point, uint32_t priority, bool user_mode);

/*
 * @brief 创建线程（返回 TID）
*/
int  thread_create(pcb_t* proc, const char* name, uint32_t entry_point, uint32_t priority);

/*
 * @brief 创建线程（扩展版：可指定用户/内核模式）
*/
int  thread_create_ex(pcb_t* proc, const char* name, uint32_t entry_point, uint32_t priority, bool user_mode);

/*
 * @brief 调度器
*/
void schedule(void);
void schedule_tick(void);           // 时钟中断触发的调度
void yield(void);                   // 主动让出 CPU

/*
 * @brief 终止当前线程/进程
*/
void thread_exit(int exit_code);
void process_exit(int exit_code);

/*
 * @brief 获取当前线程/进程
*/
tcb_t* get_current_thread(void);
pcb_t* get_current_process(void);
uint32_t get_current_pid(void);
uint32_t get_current_tid(void);

/*
 * @brief 等待进程结束
*/
int wait_for_process(uint32_t pid);

/*
 * @brief 线程睡眠
*/
void thread_sleep(uint32_t milliseconds);

/*
 * @brief 阻塞/唤醒线程
*/
void thread_block(tcb_t* thread);
void thread_unblock(tcb_t* thread);

/*
 * @brief 打印进程列表
*/
void process_list(void);

/*
 * @brief 切换到用户模式
*/
void switch_to_user_mode(uint32_t entry, uint32_t stack);

/*
 * @brief 获取空闲 PID
*/
uint32_t allocate_pid(void);

#endif // PROCESS_H
