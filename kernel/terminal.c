#include "terminal.h"
#include <stdint.h>

#define VGA_WIDTH   80
#define VGA_HEIGHT  25
#define VGA_MEMORY  0xB8000

// 当前光标位置
static uint8_t cursor_row = 0;
static uint8_t cursor_col = 0;

// 当前字符属性（浅灰色前景，黑色背景）
static uint8_t terminal_color = 0x0F;

// VGA 显存指针
static uint16_t* const vga_buffer = (uint16_t*) VGA_MEMORY;

// 构建一个 VGA 字符条目（低8位字符，高8位颜色）
static inline uint16_t vga_entry(unsigned char uc, uint8_t color) {
    return (uint16_t) uc | (uint16_t) (color << 8);
}

// 向上滚动屏幕一行
static void terminal_scroll(void) {
    // 将第2行到最后一行的内容向上移动一行
    for (uint8_t y = 0; y < VGA_HEIGHT - 1; y++) {
        for (uint8_t x = 0; x < VGA_WIDTH; x++) {
            vga_buffer[y * VGA_WIDTH + x] = vga_buffer[(y + 1) * VGA_WIDTH + x];
        }
    }
    // 清空最后一行
    uint16_t blank = vga_entry(' ', terminal_color);
    for (uint8_t x = 0; x < VGA_WIDTH; x++) {
        vga_buffer[(VGA_HEIGHT - 1) * VGA_WIDTH + x] = blank;
    }
}

// 将光标移动到下一行的开头，必要时滚动屏幕
static void terminal_newline(void) {
    cursor_col = 0;
    if (cursor_row + 1 == VGA_HEIGHT) {
        terminal_scroll();
        // cursor_row 保持不变（仍在最后一行）
    } else {
        cursor_row++;
    }
}

// 更新硬件光标位置（可选，这里留空，因为不使用硬件光标，
// 但如果你以后想启用硬件光标，可以在这里实现）
static void __attribute__((unused)) terminal_update_hardware_cursor(void) {
    // 使用 VGA 端口 0x3D4 和 0x3D5 来更新光标
    uint16_t pos = cursor_row * VGA_WIDTH + cursor_col;
    outb(0x3D4, 14);            // 高8位
    outb(0x3D5, (pos >> 8) & 0xFF);
    outb(0x3D4, 15);            // 低8位
    outb(0x3D5, pos & 0xFF);
}

// 将字符写入当前光标位置，自动处理换行和滚动
static void terminal_putentryat(char c, uint8_t color, uint8_t row, uint8_t col) {
    vga_buffer[row * VGA_WIDTH + col] = vga_entry(c, color);
}

// 输出一个字符
void terminal_putchar(char c) {
    // 控制字符处理
    switch (c) {
        case '\n':      // 换行
            terminal_newline();
            break;
        case '\r':      // 回车（回到行首）
            cursor_col = 0;
            break;
        case '\b':      // 退格
            if (cursor_col > 0) {
                cursor_col--;
                terminal_putentryat(' ', terminal_color, cursor_row, cursor_col);
            } else if (cursor_row > 0) {
                // 行首退格：移到上一行末尾
                cursor_row--;
                cursor_col = VGA_WIDTH - 1;
                terminal_putentryat(' ', terminal_color, cursor_row, cursor_col);
            }
            break;
        case '\t':      // 制表符（扩展为4个空格）
            for (int i = 0; i < 4; i++)
                terminal_putchar(' ');
            return;     // 避免重复处理
        default:
            // 可打印字符
            if (c >= ' ') {
                terminal_putentryat(c, terminal_color, cursor_row, cursor_col);
                cursor_col++;
            }
            break;
    }

    // 如果光标超出屏幕宽度，自动换行
    if (cursor_col == VGA_WIDTH) {
        terminal_newline();
    }

    // 更新硬件光标（如果启用）
    // terminal_update_hardware_cursor();
}

// 输出指定长度的字符串
void terminal_write(const char* data, size_t size) {
    for (size_t i = 0; i < size; i++) {
        terminal_putchar(data[i]);
    }
}

// 输出以空字符结尾的字符串
void terminal_writestring(const char* data) {
    while (*data) {
        terminal_putchar(*data++);
    }
}

// 清空整个屏幕
void terminal_clear(void) {
    uint16_t blank = vga_entry(' ', terminal_color);
    for (uint8_t y = 0; y < VGA_HEIGHT; y++) {
        for (uint8_t x = 0; x < VGA_WIDTH; x++) {
            vga_buffer[y * VGA_WIDTH + x] = blank;
        }
    }
    cursor_row = 0;
    cursor_col = 0;
    // terminal_update_hardware_cursor();
}

// 设置光标位置
void terminal_setcursor(uint8_t row, uint8_t col) {
    if (row < VGA_HEIGHT && col < VGA_WIDTH) {
        cursor_row = row;
        cursor_col = col;
        // terminal_update_hardware_cursor();
    }
}

// 初始化终端
void terminal_initialize(void) {
    terminal_clear();
    // 如果需要硬件光标，可以在这里初始化
}

// 在指定行列直接写入字符串（不移动光标，用于固定位置刷新）
void terminal_writeat(uint8_t row, uint8_t col, const char* data) {
    if (row >= VGA_HEIGHT || col >= VGA_WIDTH) return;
    
    uint16_t* pos = &vga_buffer[row * VGA_WIDTH + col];
    while (*data && col < VGA_WIDTH) {
        *pos++ = vga_entry(*data++, terminal_color);
        col++;
    }
}