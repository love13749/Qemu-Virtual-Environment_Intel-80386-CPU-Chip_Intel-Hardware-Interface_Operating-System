#include "timer.h"
#include "../architecture/i386/isr.h"
#include "../architecture/i386/ports.h"
#include "../system/process.h"
#include "../terminal.h"

// 外部函数：声音模块的 tick 回调
// 在 sound.c 中定义，由 timer_callback 每 tick 调用一次
extern void sound_tick(void);

static volatile uint32_t tick = 0;

// 时间跟踪（从开机开始）
static volatile uint32_t seconds = 0;
static volatile uint32_t minutes = 0;
static volatile uint32_t hours   = 0;

// 上次更新时间显示时的 tick，避免每秒刷新太多次
static uint32_t last_display_second = 0;

// 在屏幕右下角显示时间的函数
static void display_time(void) {
    // 只在秒数变化时才刷新
    if (seconds == last_display_second) return;
    last_display_second = seconds;

    // 格式化时间字符串 "HH:MM:SS"
    char time_str[12];
    time_str[0] = '0' + (hours   / 10);
    time_str[1] = '0' + (hours   % 10);
    time_str[2] = ':';
    time_str[3] = '0' + (minutes / 10);
    time_str[4] = '0' + (minutes % 10);
    time_str[5] = ':';
    time_str[6] = '0' + (seconds / 10);
    time_str[7] = '0' + (seconds % 10);
    time_str[8] = '\0';

    // 在屏幕右下角（第24行，第70列）显示时间
    // 使用 VGA 文本模式直接写显存，不影响终端光标位置
    uint16_t* vga = (uint16_t*)0xB8000;
    uint8_t color = 0x0F;  // 白色
    int col = 70;

    // 清空右上角区域（先清除之前显示的内容）
    for (int i = 0; i < 9; i++) {
        vga[80 + (col + i)] = ' ' | (color << 8);
    }

    // 写入时间字符串
    for (int i = 0; time_str[i] != '\0'; i++) {
        vga[80 + (col + i)] = time_str[i] | (color << 8);
    }
}

static void timer_callback(registers_t *regs) {
    (void)regs;
    tick++;

    // 触发调度器时间片检测
    schedule_tick();

    // 每 100 tick = 1 秒（假设 timer_init(100) 即 100Hz）
    if (tick % 100 == 0) {
        seconds++;
        if (seconds >= 60) {
            seconds = 0;
            minutes++;
            if (minutes >= 60) {
                minutes = 0;
                hours++;
                if (hours >= 24) {
                    hours = 0;
                }
            }
        }
    }

    // 驱动声音模块的旋律播放进度
    sound_tick();

    display_time();
}

void timer_init(uint32_t frequency) {
    register_interrupt_handler(IRQ0, timer_callback);      // 注册中断向量表

    uint32_t divisor = 1193182 / frequency;                // 计算分频系数

    outb(0x43, 0x36);                                      // 初始化8253/8254定时器
    outb(0x40, (uint8_t)(divisor & 0xFF));                 // 计数值的低8位
    outb(0x40, (uint8_t)((divisor >> 8) & 0xFF));          // 计数值的高8位
}
