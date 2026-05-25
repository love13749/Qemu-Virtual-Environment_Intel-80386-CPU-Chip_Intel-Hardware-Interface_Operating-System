#ifndef LIBK_H
#define LIBK_H
#include <stddef.h>
#include <stdint.h>

void* memcpy(void* restrict dest, const void* restrict src, size_t n); // 复制内存区域 n 字节
void* memset(void* s, int c, size_t n); // 填充内存区域 n 字节为 c
void* memmove(void* dest, const void* src, size_t n); // 重叠内存复制
int   memcmp(const void* s1, const void* s2, size_t n); // 比较内存区域 n 字节

size_t strlen(const char* s); // 返回字符串长度
char*  strcpy(char* restrict dest, const char* restrict src); // 复制字符串
char*  strncpy(char* restrict dest, const char* restrict src, size_t n); // 复制字符串，最多 n 字节
int    strcmp(const char* s1, const char* s2); // 比较字符串
int    strncmp(const char* s1, const char* s2, size_t n); // 比较字符串，最多 n 字节
char*  strcat(char* restrict dest, const char* restrict src); // 追加字符串
char*  strchr(const char* s, int c); // 查找字符 c 第一次出现的位置
char*  strrchr(const char* s, int c); // 查找字符 c 最后一次出现的位置

void  itoa(int n, char* str, int base); // 将整数 n 转换为字符串，存储在 str 中，base 可以是 10 或 16

void  printf(const char *str); // 打印字符串
void  putchar(char c); // 打印字符

#endif // LIBK_H
