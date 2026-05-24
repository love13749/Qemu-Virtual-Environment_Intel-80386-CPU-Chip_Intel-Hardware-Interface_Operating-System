#ifndef PORTS_H
#define PORTS_H

#include <stdint.h>

// 写字节到端口
static inline void outb(uint16_t port, uint8_t val) {
    asm volatile ("outb %0, %1" : : "a"(val), "Nd"(port));
}

// 从端口读字节
static inline uint8_t inb(uint16_t port) {
    uint8_t ret;
    asm volatile ("inb %1, %0" : "=a"(ret) : "Nd"(port));
    return ret;
}

// 写字到端口
static inline void outw(uint16_t port, uint16_t val) {
    asm volatile ("outw %0, %1" : : "a"(val), "Nd"(port));
}

// 从端口读字
static inline uint16_t inw(uint16_t port) {
    uint16_t ret;
    asm volatile ("inw %1, %0" : "=a"(ret) : "Nd"(port));
    return ret;
}

// 写双字到端口
static inline void outl(uint16_t port, uint32_t val) {
    asm volatile ("outl %0, %1" : : "a"(val), "Nd"(port));
}

// 从端口读双字
static inline uint32_t inl(uint16_t port) {
    uint32_t ret;
    asm volatile ("inl %1, %0" : "=a"(ret) : "Nd"(port));
    return ret;
}

// 一个微小的延迟，常用于等待 I/O 操作完成（向未使用的端口 0x80 写一个字节）
static inline void io_wait(void) {
    outb(0x80, 0);
}

#endif // PORTS_H
