#include "mouse.h"
#include "framebuffer.h"
#include "../architecture/i386/isr.h"      // IRQ12, register_interrupt_handler
#include "../architecture/i386/ports.h"    // inb, outb
#include "../terminal.h"

// ==================== PS/2 鼠标常量 ====================
#define PS2_CMD_PORT    0x64
#define PS2_DATA_PORT   0x60

#define PS2_CMD_READ_CONFIG     0x20
#define PS2_CMD_WRITE_CONFIG    0x60
#define PS2_CMD_ENABLE_AUX      0xA8
#define PS2_CMD_SEND_TO_AUX     0xD4

#define MOUSE_CMD_ENABLE        0xF4
#define MOUSE_CMD_SET_DEFAULTS  0xF6

// ==================== 文本模式常量 ====================
#define TEXT_WIDTH  80
#define TEXT_HEIGHT 25

// ==================== 鼠标光标位图（16x16 标准箭头） ====================
// 1 = 前景色（白色），0 = 透明
#define CURSOR_W 16
#define CURSOR_H 16

static const int8_t cursor_bitmap[CURSOR_H][CURSOR_W] = {
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0 },
};

// ==================== 鼠标状态 ====================
static int mouse_x = 0;
static int mouse_y = 0;
static bool mouse_visible = false;  // 隐藏鼠标光标
static bool is_graphical = false;   // 当前是图形模式还是文本模式

// 图形模式下的背景保存
static uint32_t cursor_background[CURSOR_H][CURSOR_W];
static int      cursor_prev_x = -1;
static int      cursor_prev_y = -1;
static bool     cursor_drawn = false;

// 文本模式下的背景保存
static uint16_t text_background = 0;
static int      text_prev_x = -1;
static int      text_prev_y = -1;
static bool     text_cursor_drawn = false;

static uint8_t mouse_cycle = 0;
static uint8_t mouse_packet[3];

#define CURSOR_FG_R   255
#define CURSOR_FG_G   255
#define CURSOR_FG_B   255

// ==================== 低层操作 ====================
static void ps2_wait_write(void) {
    while (inb(PS2_CMD_PORT) & 0x02);
}

static void ps2_wait_read(void) {
    while (!(inb(PS2_CMD_PORT) & 0x01));
}

static void mouse_send_cmd(uint8_t cmd) {
    ps2_wait_write();
    outb(PS2_CMD_PORT, PS2_CMD_SEND_TO_AUX);
    ps2_wait_write();
    outb(PS2_DATA_PORT, cmd);
    ps2_wait_read();
    (void)inb(PS2_DATA_PORT);
}

// ==================== 图形模式光标绘制 ====================

static void cursor_save_background(void) {
    framebuffer_t* fb = fb_get_info();
    for (int y = 0; y < CURSOR_H; y++) {
        for (int x = 0; x < CURSOR_W; x++) {
            if (cursor_bitmap[y][x] != 0) {
                int fx = mouse_x + x;
                int fy = mouse_y + y;
                if (fx >= 0 && fx < (int)fb->width && fy >= 0 && fy < (int)fb->height) {
                    uint32_t* pixel = (uint32_t*)((uintptr_t)fb->addr + fy * fb->pitch + fx * 4);
                    cursor_background[y][x] = *pixel;
                }
            }
        }
    }
}

static void cursor_restore_background(void) {
    if (!cursor_drawn) return;
    framebuffer_t* fb = fb_get_info();
    for (int y = 0; y < CURSOR_H; y++) {
        for (int x = 0; x < CURSOR_W; x++) {
            if (cursor_bitmap[y][x] != 0) {
                int fx = cursor_prev_x + x;
                int fy = cursor_prev_y + y;
                if (fx >= 0 && fx < (int)fb->width && fy >= 0 && fy < (int)fb->height) {
                    uint32_t* pixel = (uint32_t*)((uintptr_t)fb->addr + fy * fb->pitch + fx * 4);
                    *pixel = cursor_background[y][x];
                }
            }
        }
    }
    cursor_drawn = false;
}

static void cursor_draw_graphical(void) {
    if (!mouse_visible) return;
    framebuffer_t* fb = fb_get_info();

    cursor_save_background();

    for (int y = 0; y < CURSOR_H; y++) {
        for (int x = 0; x < CURSOR_W; x++) {
            if (cursor_bitmap[y][x] == 0) continue;
            int fx = mouse_x + x;
            int fy = mouse_y + y;
            if (fx < 0 || fx >= (int)fb->width || fy < 0 || fy >= (int)fb->height)
                continue;
            fb_putpixel(fx, fy, CURSOR_FG_R, CURSOR_FG_G, CURSOR_FG_B);
        }
    }

    cursor_prev_x = mouse_x;
    cursor_prev_y = mouse_y;
    cursor_drawn = true;
}

// ==================== 文本模式光标绘制 ====================

static void text_cursor_restore(void) {
    if (!text_cursor_drawn) return;
    if (text_prev_x >= 0 && text_prev_x < TEXT_WIDTH &&
        text_prev_y >= 0 && text_prev_y < TEXT_HEIGHT) {
        uint16_t* vga = (uint16_t*)0xB8000;
        vga[text_prev_y * TEXT_WIDTH + text_prev_x] = text_background;
    }
    text_cursor_drawn = false;
}

static void text_cursor_draw(void) {
    if (!mouse_visible) return;
    if (mouse_x < 0) mouse_x = 0;
    if (mouse_x >= TEXT_WIDTH) mouse_x = TEXT_WIDTH - 1;
    if (mouse_y < 0) mouse_y = 0;
    if (mouse_y >= TEXT_HEIGHT) mouse_y = TEXT_HEIGHT - 1;

    uint16_t* vga = (uint16_t*)0xB8000;
    text_background = vga[mouse_y * TEXT_WIDTH + mouse_x];
    text_prev_x = mouse_x;
    text_prev_y = mouse_y;

    // 用 █ (0xDB) 作为文本模式下的鼠标光标
    vga[mouse_y * TEXT_WIDTH + mouse_x] = 0xDB | (0x0F << 8);  // 白色方块
    text_cursor_drawn = true;
}

// ==================== 统一移动接口（仅图形模式使用） ====================

static void cursor_move_to(int new_x, int new_y) {
    framebuffer_t* fb = fb_get_info();
    if (new_x < 0) new_x = 0;
    if (new_x >= (int)fb->width - 1) new_x = (int)fb->width - 2;
    if (new_y < 0) new_y = 0;
    if (new_y >= (int)fb->height - 1) new_y = (int)fb->height - 2;
    if (new_x == mouse_x && new_y == mouse_y) return;

    cursor_restore_background();
    mouse_x = new_x;
    mouse_y = new_y;
    cursor_draw_graphical();
}

// ==================== 中断处理 ====================
static void mouse_callback(registers_t *regs) {
    (void)regs;
    uint8_t data = inb(PS2_DATA_PORT);
    mouse_packet[mouse_cycle] = data;
    mouse_cycle++;

    if (mouse_cycle == 3) {
        mouse_cycle = 0;

        uint8_t flags = mouse_packet[0];
        uint8_t dx_raw = mouse_packet[1];
        uint8_t dy_raw = mouse_packet[2];

        // 正确处理 PS/2 鼠标的符号位（在 flags 的 bit4 和 bit5 中）
        int16_t dx = dx_raw;
        int16_t dy = dy_raw;
        if (flags & 0x10) dx |= 0xFF00;  // X 符号位：bit4=1 表示负数
        if (flags & 0x20) dy |= 0xFF00;  // Y 符号位：bit5=1 表示负数

        // Y 轴翻转（屏幕坐标系 Y 向下为正）
        dy = -dy;

        if (dx == 0 && dy == 0) return;

        if (is_graphical) {
            // 图形模式：直接像素级移动
            cursor_move_to(mouse_x + dx, mouse_y + dy);
        } else {
            // 文本模式：把像素偏移累加，达到阈值才移动一个字符格
            static int accum_x = 0, accum_y = 0;
            accum_x += dx;
            accum_y += dy;

            int move_x = 0, move_y = 0;
            if (accum_x >= 4) { move_x = 1;  accum_x -= 4; }
            if (accum_x <= -4){ move_x = -1; accum_x += 4; }
            if (accum_y >= 8) { move_y = 1;  accum_y -= 8; }
            if (accum_y <= -8){ move_y = -1; accum_y += 8; }

            if (move_x == 0 && move_y == 0) return;

            text_cursor_restore();
            mouse_x += move_x;
            mouse_y += move_y;

            if (mouse_x < 0) mouse_x = 0;
            if (mouse_x >= TEXT_WIDTH) mouse_x = TEXT_WIDTH - 1;
            if (mouse_y < 0) mouse_y = 0;
            if (mouse_y >= TEXT_HEIGHT) mouse_y = TEXT_HEIGHT - 1;

            text_cursor_draw();
        }
    }
}

// ==================== 初始化 ====================
void mouse_init(void) {
    // 检测当前是图形模式还是文本模式
    is_graphical = fb_is_graphical();

    ps2_wait_write();
    outb(PS2_CMD_PORT, PS2_CMD_ENABLE_AUX);

    ps2_wait_write();
    outb(PS2_CMD_PORT, PS2_CMD_READ_CONFIG);
    ps2_wait_read();
    uint8_t config = inb(PS2_DATA_PORT);
    config |= 0x02;
    ps2_wait_write();
    outb(PS2_CMD_PORT, PS2_CMD_WRITE_CONFIG);
    ps2_wait_write();
    outb(PS2_DATA_PORT, config);

    mouse_send_cmd(MOUSE_CMD_SET_DEFAULTS);
    mouse_send_cmd(MOUSE_CMD_ENABLE);

    if (is_graphical) {
        framebuffer_t* fb = fb_get_info();
        mouse_x = fb->width / 2;
        mouse_y = fb->height / 2;
        cursor_drawn = false;
    } else {
        mouse_x = TEXT_WIDTH / 2;
        mouse_y = TEXT_HEIGHT / 2;
        text_cursor_drawn = false;
    }

    mouse_cycle = 0;
    register_interrupt_handler(IRQ12, mouse_callback);

    // 不绘制鼠标光标（已隐藏）
}
