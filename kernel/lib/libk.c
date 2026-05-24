#include "libk.h"

// 光标位置（行、列）
uint8_t cursor_row = 0;
uint8_t cursor_col = 0;

// VGA 文本模式常量
#define VGA_ADDRESS 0xB8000
#define VGA_WIDTH   80
#define VGA_HEIGHT  25

// ================== 内存操作 ==================
void* memcpy(void* restrict dest, const void* restrict src, size_t n) 
{
    uint8_t* d = (uint8_t*)dest;
    const uint8_t* s = (const uint8_t*)src;
    for (size_t i = 0; i < n; i++)
        d[i] = s[i];
    return dest;
}

void* memset(void* s, int c, size_t n) 
{
    uint8_t* p = (uint8_t*)s;
    for (size_t i = 0; i < n; i++)
        p[i] = (uint8_t)c;
    return s;
}

void* memmove(void* dest, const void* src, size_t n) 
{
    uint8_t* d = (uint8_t*)dest;
    const uint8_t* s = (const uint8_t*)src;
    if (d < s) 
    {
        for (size_t i = 0; i < n; i++)
            d[i] = s[i];
    } 
    else if (d > s) 
    {
        for (size_t i = n; i > 0; i--)
            d[i-1] = s[i-1];
    }
    return dest;
}

int memcmp(const void* s1, const void* s2, size_t n) 
{
    const uint8_t* p1 = (const uint8_t*)s1;
    const uint8_t* p2 = (const uint8_t*)s2;
    for (size_t i = 0; i < n; i++) 
    {
        if (p1[i] != p2[i])
            return p1[i] - p2[i];
    }
    return 0;
}

// ================== 字符串操作 ==================
size_t strlen(const char* s) 
{
    size_t len = 0;
    while (s[len] != '\0')
        len++;
    return len;
}

char* strcpy(char* restrict dest, const char* restrict src) 
{
    char* p = dest;
    while ((*p++ = *src++) != '\0');
    return dest;
}

char* strncpy(char* restrict dest, const char* restrict src, size_t n) 
{
    size_t i;
    for (i = 0; i < n && src[i] != '\0'; i++)
        dest[i] = src[i];
    for (; i < n; i++)
        dest[i] = '\0';
    return dest;
}

int strcmp(const char* s1, const char* s2) 
{
    while (*s1 && (*s1 == *s2)) 
    {
        s1++;
        s2++;
    }
    return (unsigned char)*s1 - (unsigned char)*s2;
}

int strncmp(const char* s1, const char* s2, size_t n) 
{
    for (size_t i = 0; i < n; i++) 
    {
        if (s1[i] != s2[i] || s1[i] == '\0')
            return (unsigned char)s1[i] - (unsigned char)s2[i];
    }
    return 0;
}

char* strcat(char* restrict dest, const char* restrict src) 
{
    char* p = dest;
    while (*p) p++;
    while ((*p++ = *src++) != '\0');
    return dest;
}

char* strchr(const char* s, int c) 
{
    while (*s != (char)c) 
    {
        if (*s == '\0') return NULL;
        s++;
    }
    return (char*)s;
}

char* strrchr(const char* s, int c) 
{
    const char* found = NULL;
    while (*s) 
    {
        if (*s == (char)c) found = s;
        s++;
    }
    return (char*)found;
}

// 写入单个字符到显存
void putchar(char c) 
{
    uint16_t *vga = (uint16_t *)VGA_ADDRESS;
    switch (c) {
    case '\n':
        cursor_col = 0;
        cursor_row++;
        break;
    case '\r':
        cursor_col = 0;
        break;
    default:
        // 计算偏移：row * 80 + col，每个字符占 2 字节
        vga[cursor_row * VGA_WIDTH + cursor_col] = (uint16_t)c | (0x07 << 8); // 灰底黑字
        cursor_col++;
        if (cursor_col >= VGA_WIDTH) 
        {
            cursor_col = 0;
            cursor_row++;
        }
        break;
    }
    // 极其简单的屏幕滚动：超出最后一行就回到第一行
    if (cursor_row >= VGA_HEIGHT) 
    {
        cursor_row = 0;
    }
}

// 打印字符串
void printf(const char *str) 
{
    while (*str) 
    {
        putchar(*str++);
    }
}

// ================== 整型转字符串 ==================
static void swap(char* a, char* b) {
    char t = *a;
    *a = *b;
    *b = t;
}

static void reverse(char* str, int length) 
{
    int start = 0;
    int end = length - 1;
    while (start < end) {
        swap(&str[start], &str[end]);
        start++;
        end--;
    }
}

void itoa(int n, char* str, int base) 
{
    int i = 0;
    int isNegative = 0;

    // 仅处理十进制负数情况
    if (n == 0) 
    {
        str[i++] = '0';
        str[i] = '\0';
        return;
    }

    if (n < 0 && base == 10) 
    {
        isNegative = 1;
        n = -n;
    }

    while (n != 0) 
    {
        int rem = n % base;
        str[i++] = (rem > 9) ? (rem - 10) + 'a' : rem + '0';
        n = n / base;
    }

    if (isNegative)
        str[i++] = '-';

    str[i] = '\0';
    reverse(str, i);
}