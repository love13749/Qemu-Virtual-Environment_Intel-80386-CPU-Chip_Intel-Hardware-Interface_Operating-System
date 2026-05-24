#ifndef DEBUGGER_H
#define DEBUGGER_H

#include <stdint.h>

// ======================================================================
//  调试器 - 提供类 DOS DEBUG 风格的调试命令
// ======================================================================

// 初始化调试器
void debugger_init(void);

// 获取一行用户输入（从键盘缓冲区读取，直到回车）
// 返回读取的字符数（不含换行符）
int debugger_readline(char* buffer, int max_len);

// 主循环 - 处理调试命令
void debugger_run(void);

#endif // DEBUGGER_H
