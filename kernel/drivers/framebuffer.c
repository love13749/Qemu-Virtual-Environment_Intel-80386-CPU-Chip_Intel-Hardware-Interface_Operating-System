#include "framebuffer.h"
#include "../terminal.h"

extern uint32_t multiboot_info;

static framebuffer_t fb;
static bool graphical_mode = false;

#define MULTIBOOT_INFO_FRAMEBUFFER_ADDR    88
#define MULTIBOOT_INFO_FRAMEBUFFER_PITCH   96
#define MULTIBOOT_INFO_FRAMEBUFFER_WIDTH   100
#define MULTIBOOT_INFO_FRAMEBUFFER_HEIGHT  104
#define MULTIBOOT_INFO_FRAMEBUFFER_BPP     108
#define MULTIBOOT_INFO_FRAMEBUFFER_TYPE    110

void framebuffer_init(void) {
    uint32_t* info = (uint32_t*)(uintptr_t)multiboot_info;

    fb.addr   = info[MULTIBOOT_INFO_FRAMEBUFFER_ADDR / 4];
    fb.width  = info[MULTIBOOT_INFO_FRAMEBUFFER_WIDTH / 4];
    fb.height = info[MULTIBOOT_INFO_FRAMEBUFFER_HEIGHT / 4];
    fb.bpp    = info[MULTIBOOT_INFO_FRAMEBUFFER_BPP / 4] & 0xFF;
    fb.pitch  = info[MULTIBOOT_INFO_FRAMEBUFFER_PITCH / 4];

    uint8_t fb_type = (info[MULTIBOOT_INFO_FRAMEBUFFER_TYPE / 4] >> 0) & 0xFF;

    if (fb.addr == 0 || fb_type != 0) {
        graphical_mode = false;
        terminal_writestring("Warning: VBE graphics mode not available, using text mode.\n");
        return;
    }

    graphical_mode = true;
    fb.red_mask   = 8;
    fb.green_mask = 8;
    fb.blue_mask  = 8;

    fb_clear(0, 0, 0);
    terminal_writestring("Graphics mode initialized (1024x768x32bpp).\n");
}

bool fb_is_graphical(void) {
    return graphical_mode;
}

void fb_putpixel(uint32_t x, uint32_t y, uint8_t r, uint8_t g, uint8_t b) {
    if (!graphical_mode) return;
    if (x >= fb.width || y >= fb.height) return;

    uint32_t* pixel = (uint32_t*)((uintptr_t)fb.addr + y * fb.pitch + x * 4);
    *pixel = (0xFF << 24) | (b << 16) | (g << 8) | r;
}

void fb_fill_rect(uint32_t x, uint32_t y, uint32_t w, uint32_t h, uint8_t r, uint8_t g, uint8_t b) {
    if (!graphical_mode) return;
    for (uint32_t py = y; py < y + h && py < fb.height; py++) {
        for (uint32_t px = x; px < x + w && px < fb.width; px++) {
            fb_putpixel(px, py, r, g, b);
        }
    }
}

framebuffer_t* fb_get_info(void) {
    return &fb;
}

void fb_clear(uint8_t r, uint8_t g, uint8_t b) {
    fb_fill_rect(0, 0, fb.width, fb.height, r, g, b);
}
