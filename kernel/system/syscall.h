#ifndef SYSCALL_H
#define SYSCALL_H

#include <stdint.h>

// 初始化系统调用（注册 int 0x80 处理函数）
void syscall_init(void);

// 系统调用 C 处理函数（由汇编调用）
uint32_t system_call_handler(uint32_t syscall_num, uint32_t arg1, uint32_t arg2, uint32_t arg3);

#endif // SYSCALL_H


