#ifndef KEYBOARD_H
#define KEYBOARD_H

#include <stdint.h>

#define KEYBOARD_BUFFER_SIZE    256

void keyboard_init(void);

// 键盘缓冲区操作
void keyboard_buffer_put(char c);
int  keyboard_buffer_read(char* c);
int  keyboard_buffer_available(void);

// 调试器入口检测 - 当 F1 或 F12 按下时设为 1，主循环消费后清零
extern volatile int debugger_requested;

#endif // KEYBOARD_H
