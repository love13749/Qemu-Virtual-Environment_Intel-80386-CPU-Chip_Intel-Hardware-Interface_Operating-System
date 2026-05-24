#include "syscall.h"
#include "process.h"
#include "../terminal.h"
#include "../lib/libk.h"
#include "../architecture/i386/idt.h"
#include "../architecture/i386/isr.h"

// ==================== 系统调用处理函数表 ====================

// 声明外部汇编的 syscall_handler
extern void syscall_handler(void);

// 系统调用实现
static uint32_t sys_exit(uint32_t code, uint32_t arg2, uint32_t arg3) {
    (void)arg2; (void)arg3;
    process_exit((int)code);
    return 0;
}

static uint32_t sys_fork(uint32_t arg1, uint32_t arg2, uint32_t arg3) {
    (void)arg1; (void)arg2; (void)arg3;
    // 简化版：暂不支持 fork
    terminal_writestring("sys_fork: not implemented\n");
    return -1;
}

static uint32_t sys_exec(uint32_t entry, uint32_t arg2, uint32_t arg3) {
    (void)arg2; (void)arg3;
    // 执行一个新的程序入口
    // 在实际系统中这会替换当前进程的地址空间
    terminal_writestring("sys_exec: jumping to entry 0x");
    char buf[16];
    for (int j = 0; j < 8; j++) {
        uint8_t nibble = (entry >> (28 - j*4)) & 0xF;
        buf[j] = nibble < 10 ? '0' + nibble : 'a' + nibble - 10;
    }
    buf[8] = '\0';
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    // 这里应该切换到用户模式执行
    return 0;
}

static uint32_t sys_waitpid(uint32_t pid, uint32_t arg2, uint32_t arg3) {
    (void)arg2; (void)arg3;
    return (uint32_t)wait_for_process(pid);
}

static uint32_t sys_getpid(uint32_t arg1, uint32_t arg2, uint32_t arg3) {
    (void)arg1; (void)arg2; (void)arg3;
    return get_current_pid();
}

static uint32_t sys_gettid(uint32_t arg1, uint32_t arg2, uint32_t arg3) {
    (void)arg1; (void)arg2; (void)arg3;
    return get_current_tid();
}

static uint32_t sys_sleep(uint32_t ms, uint32_t arg2, uint32_t arg3) {
    (void)arg2; (void)arg3;
    thread_sleep(ms);
    return 0;
}

static uint32_t sys_yield(uint32_t arg1, uint32_t arg2, uint32_t arg3) {
    (void)arg1; (void)arg2; (void)arg3;
    yield();
    return 0;
}

static uint32_t sys_print(uint32_t str_ptr, uint32_t arg2, uint32_t arg3) {
    (void)arg2; (void)arg3;
    // 从用户空间打印字符串
    const char* str = (const char*)str_ptr;
    if (str) {
        terminal_writestring(str);
    }
    return 0;
}

static uint32_t sys_open(uint32_t path_ptr, uint32_t flags, uint32_t arg3) {
    (void)path_ptr; (void)flags; (void)arg3;
    // 简化版：暂不支持文件系统
    terminal_writestring("sys_open: filesystem not implemented\n");
    return -1;
}

static uint32_t sys_read(uint32_t fd, uint32_t buf_ptr, uint32_t count) {
    (void)fd; (void)buf_ptr; (void)count;
    // 简化版
    return 0;
}

static uint32_t sys_write(uint32_t fd, uint32_t buf_ptr, uint32_t count) {
    (void)fd;
    // 写文件描述符 (简化版：只支持 stdout/stderr)
    const char* buf = (const char*)buf_ptr;
    for (uint32_t i = 0; i < count; i++) {
        terminal_putchar(buf[i]);
    }
    return count;
}

static uint32_t sys_close(uint32_t fd, uint32_t arg2, uint32_t arg3) {
    (void)fd; (void)arg2; (void)arg3;
    return 0;
}

static uint32_t sys_brk(uint32_t addr, uint32_t arg2, uint32_t arg3) {
    (void)arg2; (void)arg3;
    // 调整堆（简化版）
    terminal_writestring("sys_brk: not fully implemented\n");
    return addr;
}

static uint32_t sys_getppid(uint32_t arg1, uint32_t arg2, uint32_t arg3) {
    (void)arg1; (void)arg2; (void)arg3;
    pcb_t* proc = get_current_process();
    if (proc && proc->parent) {
        return proc->parent->pid;
    }
    return 0;
}

static uint32_t sys_kill(uint32_t pid, uint32_t sig, uint32_t arg3) {
    (void)arg3;
    // 简化版：只支持 SIGKILL (9)
    terminal_writestring("sys_kill: not implemented\n");
    (void)pid; (void)sig;
    return 0;
}

// 系统调用函数指针表
typedef uint32_t (*syscall_fn_t)(uint32_t, uint32_t, uint32_t);

static syscall_fn_t syscall_table[] = {
    [SYS_EXIT]    = sys_exit,
    [SYS_FORK]    = sys_fork,
    [SYS_EXEC]    = sys_exec,
    [SYS_WAITPID] = sys_waitpid,
    [SYS_GETPID]  = sys_getpid,
    [SYS_GETTID]  = sys_gettid,
    [SYS_SLEEP]   = sys_sleep,
    [SYS_YIELD]   = sys_yield,
    [SYS_PRINT]   = sys_print,
    [SYS_OPEN]    = sys_open,
    [SYS_READ]    = sys_read,
    [SYS_WRITE]   = sys_write,
    [SYS_CLOSE]   = sys_close,
    [SYS_BRK]     = sys_brk,
    [SYS_GETPPID] = sys_getppid,
    [SYS_KILL]    = sys_kill,
};

#define SYSCALL_COUNT (sizeof(syscall_table) / sizeof(syscall_fn_t))

// ==================== 系统调用 C 处理函数 ====================

uint32_t system_call_handler(uint32_t syscall_num, uint32_t arg1, uint32_t arg2, uint32_t arg3) {
    if (syscall_num >= SYSCALL_COUNT || !syscall_table[syscall_num]) {
        terminal_writestring("Unknown syscall: ");
        char buf[16];
        itoa(syscall_num, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("\n");
        return -1;
    }
    
    return syscall_table[syscall_num](arg1, arg2, arg3);
}

// ==================== 初始化 ====================

void syscall_init(void) {
    terminal_writestring("Initializing system calls...\n");
    
    // 注册 int 0x80 为系统调用中断
    // 0x8E = present, ring 0, interrupt gate (DPL=0)
    // 为了让用户程序也能调用 int 0x80，需要 DPL=3 => 0xEE
    idt_set_gate(0x80, (uint32_t)syscall_handler, 0x08, 0xEE);
    
    terminal_writestring("System calls initialized (int 0x80).\n");
}
