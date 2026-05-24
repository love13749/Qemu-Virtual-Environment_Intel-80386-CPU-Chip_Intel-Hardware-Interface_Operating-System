#ifndef TERMINAL_H
#define TERMINAL_H

#include <stddef.h>
#include <stdint.h>
#include "architecture/i386/ports.h"

// 初始化终端（清屏并重置光标）
void terminal_initialize(void);

// 输出一个字符到终端，支持 \n, \b, \t 等控制字符
void terminal_putchar(char c);

// 输出字符串
void terminal_write(const char* data, size_t size);

// 输出以空字符结尾的字符串
void terminal_writestring(const char* data);

// 清除整个屏幕
void terminal_clear(void);

// 设置光标位置（行、列，从0开始）
void terminal_setcursor(uint8_t row, uint8_t col);

// 在指定行列直接写入字符串（不移动光标，用于固定位置刷新）
void terminal_writeat(uint8_t row, uint8_t col, const char* data);

#endif // TERMINAL_H
