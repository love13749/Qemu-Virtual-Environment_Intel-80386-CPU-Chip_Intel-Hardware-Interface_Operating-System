#include "keyboard.h"
#include "../architecture/i386/isr.h"      // 提供 register_interrupt_handler, IRQ1
#include "../architecture/i386/ports.h"    // 提供 inb
#include "../terminal.h"           // 提供 terminal_putchar（或其他输出函数）
#include "../lib/libk.h"           // 可选，如果你需要 printf 等

// ==================== 键盘环形缓冲区 ====================
// 中断处理程序写入，主循环读取
#define KEYBOARD_RING_SIZE  256
static char key_ring[KEYBOARD_RING_SIZE];
static volatile int ring_head = 0;  // 写入位置
static volatile int ring_tail = 0;  // 读取位置

// 调试器入口请求标志 - 由键盘中断设置，主循环消费
volatile int debugger_requested = 0;

void keyboard_buffer_put(char c) {
    int next = (ring_head + 1) % KEYBOARD_RING_SIZE;
    if (next != ring_tail) {
        key_ring[ring_head] = c;
        ring_head = next;
    }
}

int keyboard_buffer_read(char* c) {
    if (ring_head == ring_tail) return 0;
    *c = key_ring[ring_tail];
    ring_tail = (ring_tail + 1) % KEYBOARD_RING_SIZE;
    return 1;
}

int keyboard_buffer_available(void) {
    return (ring_head - ring_tail + KEYBOARD_RING_SIZE) % KEYBOARD_RING_SIZE;
}

// ==================== 键盘状态 ====================
static int shift_pressed = 0;
static int ctrl_pressed  = 0;
static int alt_pressed   = 0;
static int caps_lock     = 0;

// -------------------- 扫描码对照表（美式键盘） --------------------
// 普通按键（未按 Shift）
static const char scancode_to_ascii[] = {
    0,   0,  '1', '2', '3', '4', '5', '6', '7', '8', '9',  '0', '-', '=', '\b', // 0x00-0x0E
    '\t','q','w','e','r','t','y','u','i','o','p','[',']','\n', 0,   // 0x0F-0x1C
    'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`', 0, '\\',       // 0x1D-0x2B
    'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', 0, '*', 0, ' ', 0         // 0x2C-0x39
};

// Shift 按下时的字符对照表
static const char shift_scancode_to_ascii[] = {
    0,   0,  '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '\b', // 0x00-0x0E
    '\t','Q','W','E','R','T','Y','U','I','O','P','{','}','\n', 0,   // 0x0F-0x1C
    'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':', '\"', '~', 0,  '|',      // 0x1D-0x2B
    'Z', 'X', 'C', 'V', 'B', 'N', 'M', '<', '>', '?', 0,  '*', 0,  ' ', 0      // 0x2C-0x39
};

// -------------------- 内部辅助：检查当前是否应输出大写字母 --------------------
static int is_uppercase(void) {
    return (shift_pressed && !caps_lock) || (!shift_pressed && caps_lock);
}

// -------------------- 中断处理函数 --------------------
static void keyboard_callback(registers_t *regs) {
    (void)regs; // 未使用的参数
    // 从键盘数据端口读取扫描码
    uint8_t scancode = inb(0x60);

    // 处理释放码（最高位为 1 时表示按键释放）
    if (scancode & 0x80) {
        // 按键释放
        scancode &= 0x7F;   // 去掉释放标志位
                switch (scancode) {
            case 0x1D:      // 左 Ctrl
                ctrl_pressed = 0;
                break;
            case 0x38:      // 左 Alt
                alt_pressed = 0;
                break;
            case 0x2A:      // 左 Shift
            case 0x36:      // 右 Shift
                shift_pressed = 0;
                break;
            // 可以处理 Ctrl, Alt 等其他修饰键
        }
        return; // 释放事件只更新修饰键状态，不产生字符
    }

    // 按下的扫描码
    switch (scancode) {
        case 0x2A:          // 左 Shift
        case 0x36:          // 右 Shift
            shift_pressed = 1;
            break;

                case 0x3A:          // Caps Lock 切换
            caps_lock = !caps_lock;
            break;

                case 0x3B:          // F1 - 请求进入调试器
            debugger_requested = 1;
            break;

        case 0x58:          // F12 - 备选进入调试器（QEMU 可能拦截）
            debugger_requested = 1;
            break;

        default:
            // 普通按键：从对照表中取出 ASCII 字符
            if (scancode < sizeof(scancode_to_ascii)) {
                char c;
                if (is_uppercase()) {
                    c = shift_scancode_to_ascii[scancode];
                } else {
                    c = scancode_to_ascii[scancode];
                }

                if (c != 0) {
                    // 放入环形缓冲区，由主循环处理
                    keyboard_buffer_put(c);
                }
            }
            break;
    }
}

// -------------------- 初始化函数 --------------------
void keyboard_init(void) {
    // 清空环形缓冲区
    ring_head = 0;
    ring_tail = 0;
    
    // 注册键盘中断处理函数（IRQ1 映射到 33，需与 PIC 重映射偏移一致）
    register_interrupt_handler(IRQ1, keyboard_callback);
}