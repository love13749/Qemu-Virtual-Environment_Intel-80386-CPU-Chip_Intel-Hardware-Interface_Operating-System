#ifndef FRAMEBUFFER_H
#define FRAMEBUFFER_H

#include <stdint.h>
#include <stdbool.h>

// 帧缓冲信息
typedef struct {
    uint32_t  addr;          // 帧缓冲物理地址
    uint32_t  width;         // 宽度（像素）
    uint32_t  height;        // 高度（像素）
    uint32_t  bpp;           // 每像素位数（32）
    uint32_t  pitch;         // 每行字节数
    uint8_t   red_mask;
    uint8_t   green_mask;
    uint8_t   blue_mask;
} framebuffer_t;

// 获取帧缓冲信息（从 multiboot 信息结构中解析）
void framebuffer_init(void);

// 在 (x, y) 位置画一个像素
void fb_putpixel(uint32_t x, uint32_t y, uint8_t r, uint8_t g, uint8_t b);

// 填充矩形区域
void fb_fill_rect(uint32_t x, uint32_t y, uint32_t w, uint32_t h, uint8_t r, uint8_t g, uint8_t b);

// 获取帧缓冲信息
framebuffer_t* fb_get_info(void);

// 检查是否成功切换到图形模式
bool fb_is_graphical(void);

// 清屏（填充黑色）
void fb_clear(uint8_t r, uint8_t g, uint8_t b);

#endif // FRAMEBUFFER_H
