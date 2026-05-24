#include "debugger.h"
#include "../terminal.h"
#include "../drivers/keyboard.h"
#include "../drivers/dma.h"
#include "../memory/memory.h"
#include "../lib/libk.h"
#include "../system/process.h"
#include "../architecture/i386/isr.h"
#include "../architecture/i386/idt.h"

// ======================================================================
//  简易调试器 - 类 DOS DEBUG 风格的调试命令
//
//  命令列表:
//    ?         - 帮助
//    r         - 显示寄存器
//    d [addr] [n]- 显示内存 (dump)
//    e addr [d1 d2..] - 修改内存 (enter)
//    u [addr] [n]- 反汇编
//    g [addr]    - 运行 (到断点/继续)
//    t           - 单步 (Trace)
//    b addr      - 设置断点 (INT3)
//    bc [n]      - 清除断点
//    bl          - 列出断点
//    a addr      - 汇编 (hex输入模式)
//    f s e d     - 填充内存
//    s s e d     - 搜索内存
//    c a1 a2 n   - 比较内存
//    m src dst n - 移动内存
//    h v1 v2     - 十六进制计算
//    q           - 退出调试器
//    map         - 内存映射
//    heap        - 堆信息
//    slab        - slab信息
//    ps          - 进程列表

// 从键盘缓冲区读一个字符（阻塞等待）
static char debug_getchar(void) {
    char c;
    while (!keyboard_buffer_read(&c)) {
        asm volatile("sti; hlt; cli");
    }
    return c;
}

// 读取一行输入（回显 + 退格处理）
int debugger_readline(char* buffer, int max_len) {
    int pos = 0;
    while (1) {
        char c = debug_getchar();
        if (c == '\n' || c == '\r') {
            terminal_putchar('\n');
            buffer[pos] = '\0';
            return pos;
        } else if (c == '\b') {
            if (pos > 0) { pos--; terminal_putchar('\b'); }
        } else if (c >= ' ' && pos < max_len - 1) {
            buffer[pos++] = c;
            terminal_putchar(c);
        }
    }
}

// 十六进制字符 -> 数值
static int hex_val(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    if (c >= 'a' && c <= 'f') return c - 'a' + 10;
    if (c >= 'A' && c <= 'F') return c - 'A' + 10;
    return -1;
}

// 十六进制字符串 -> uint32
static uint32_t hex_to_u32(const char* s) {
    uint32_t v = 0;
    while (*s) {
        int d = hex_val(*s);
        if (d < 0) break;
        v = (v << 4) | (uint32_t)d;
        s++;
    }
    return v;
}

// 简单分词
static int tokenize(char* s, char** tok, int max) {
    int n = 0;
    while (*s && n < max) {
        while (*s == ' ' || *s == '\t') *s++ = '\0';
        if (!*s) break;
        tok[n++] = s;
        while (*s && *s != ' ' && *s != '\t') s++;
    }
    return n;
}

// ======================== 命令实现 ========================

// r - 显示寄存器
static void cmd_r(int argc, char** argv) {
    (void)argc; (void)argv;
    uint32_t eax, ebx, ecx, edx, esi, edi, ebp, esp, eflags;
    // 逐个读取寄存器，避免约束冲突
    asm volatile("mov %%eax, %0" : "=a"(eax));
    asm volatile("mov %%ebx, %0" : "=b"(ebx));
    asm volatile("mov %%ecx, %0" : "=c"(ecx));
    asm volatile("mov %%edx, %0" : "=d"(edx));
    asm volatile("mov %%esi, %0" : "=S"(esi));
    asm volatile("mov %%edi, %0" : "=D"(edi));
    asm volatile("mov %%ebp, %0" : "=m"(ebp));
    asm volatile("mov %%esp, %0" : "=m"(esp));
    asm volatile("pushf; pop %0" : "=m"(eflags));

    char b[16];
    terminal_writestring("\n");
    terminal_writestring(" EAX="); itoa((int)eax, b, 16); terminal_writestring(b);
    terminal_writestring(" EBX="); itoa((int)ebx, b, 16); terminal_writestring(b);
    terminal_writestring(" ECX="); itoa((int)ecx, b, 16); terminal_writestring(b);
    terminal_writestring(" EDX="); itoa((int)edx, b, 16); terminal_writestring(b);
    terminal_writestring("\n");
    terminal_writestring(" ESI="); itoa((int)esi, b, 16); terminal_writestring(b);
    terminal_writestring(" EDI="); itoa((int)edi, b, 16); terminal_writestring(b);
    terminal_writestring(" EBP="); itoa((int)ebp, b, 16); terminal_writestring(b);
    terminal_writestring(" ESP="); itoa((int)esp, b, 16); terminal_writestring(b);
    terminal_writestring("\n");
    terminal_writestring(" EFL="); itoa((int)eflags, b, 16); terminal_writestring(b);
    terminal_writestring("\n");

    // 显示 EFLAGS 标志位
    terminal_writestring("  "); // 缩进
    terminal_writestring((eflags & (1<<0))  ? "CF " : "cf ");
    terminal_writestring((eflags & (1<<2))  ? "PF " : "pf ");
    terminal_writestring((eflags & (1<<4))  ? "AF " : "af ");
    terminal_writestring((eflags & (1<<6))  ? "ZF " : "zf ");
    terminal_writestring((eflags & (1<<7))  ? "SF " : "sf ");
    terminal_writestring((eflags & (1<<8))  ? "TF " : "tf ");
    terminal_writestring((eflags & (1<<9))  ? "IF " : "if ");
    terminal_writestring((eflags & (1<<10)) ? "DF " : "df ");
    terminal_writestring((eflags & (1<<11)) ? "OF " : "of ");
    terminal_writestring("\n");
}

// d - 显示内存 (dump)
static void cmd_d(int argc, char** argv) {
    uint32_t addr = 0x7C00;
    uint32_t count = 128;
    if (argc >= 2) addr = hex_to_u32(argv[1]);
    if (argc >= 3) { count = hex_to_u32(argv[2]); if (count > 1024) count = 1024; }

    char b[16];
    terminal_writestring("\n");
    for (uint32_t off = 0; off < count; off += 16) {
        // 地址
        terminal_writestring("  ");
        itoa((int)(addr + off), b, 16);
        int len = strlen(b);
        for (int i = len; i < 8; i++) terminal_putchar('0');
        terminal_writestring(b);
        terminal_writestring("  ");

        // 十六进制
        for (int i = 0; i < 16; i++) {
            if (off + i < count) {
                uint8_t byte = *(volatile uint8_t*)(addr + off + i);
                itoa((int)byte, b, 16);
                if (byte < 0x10) terminal_putchar('0');
                terminal_writestring(b);
                terminal_putchar(' ');
            } else {
                terminal_writestring("   ");
            }
            if (i == 7) terminal_putchar(' ');
        }

        terminal_writestring(" |");
        for (int i = 0; i < 16 && off + i < count; i++) {
            uint8_t byte = *(volatile uint8_t*)(addr + off + i);
            terminal_putchar((byte >= ' ' && byte <= '~') ? (char)byte : '.');
        }
        terminal_writestring("|\n");
    }
}

// e - 修改内存 (enter)
static void cmd_e(int argc, char** argv) {
    if (argc < 2) { terminal_writestring("  Usage: e <addr> [byte1 byte2 ...]\n"); return; }
    uint32_t addr = hex_to_u32(argv[1]);
    char b[16];

    if (argc >= 3) {
        for (int i = 2; i < argc; i++) {
            *(volatile uint8_t*)addr++ = (uint8_t)hex_to_u32(argv[i]);
        }
        terminal_writestring("  Written.\n");
    } else {
        terminal_writestring("\n");
        while (1) {
            itoa((int)addr, b, 16);
            int len = strlen(b);
            for (int i = len; i < 8; i++) terminal_putchar('0');
            terminal_writestring(b);
            terminal_writestring("  ");
            uint8_t v = *(volatile uint8_t*)addr;
            itoa((int)v, b, 16);
            if (v < 0x10) terminal_putchar('0');
            terminal_writestring(b);
            terminal_writestring("  ");

            char input[16];
            int n = debugger_readline(input, 16);
            if (n == 0) break;
            int val = hex_to_u32(input);
            if (input[0] != '\0') {
                *(volatile uint8_t*)addr = (uint8_t)val;
                addr++;
            }
        }
    }
}

// 辅助函数：检查操作码是否在列表中
static int is_in_list(uint8_t op, const uint8_t* list, int n) {
    for (int i = 0; i < n; i++) if (list[i] == op) return 1;
    return 0;
}

// 辅助函数：在列表中查找操作码索引
static int find_in_list(uint8_t op, const uint8_t* list, int n) {
    for (int i = 0; i < n; i++) if (list[i] == op) return i;
    return -1;
}

// u - 反汇编 (简化版)
static void cmd_u(int argc, char** argv) {
    uint32_t addr = 0x7C00;
    uint32_t count = 32;
    if (argc >= 2) addr = hex_to_u32(argv[1]);
    if (argc >= 3) { count = hex_to_u32(argv[2]); if (count > 256) count = 256; }

    // 简易指令长度表
    static const uint8_t instr_len_1[] = {
        0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57,0x58,0x59,0x5A,0x5B,0x5C,0x5D,0x5E,0x5F,
        0x60,0x61,0x90,0x9C,0x9D,0xC3,0xCB,0xCC,0xCF,0xF4,0xF5,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD
    };
    static const uint8_t instr_len_2_jcc[] = {
        0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,0x78,0x79,0x7A,0x7B,0x7C,0x7D,0x7E,0x7F,
        0xE0,0xE1,0xE2,0xE3,0xEB
    };

    static const char* mnemonics_1[] = {
        "push eax","push ecx","push edx","push ebx","push esp","push ebp","push esi","push edi",
        "pop eax","pop ecx","pop edx","pop ebx","pop esp","pop ebp","pop esi","pop edi",
        "pusha","popa","nop","pushf","popf","ret","retf","int3","iret","hlt","cmc","clc","stc","cld","std","cli","sti"
    };
    static const char* mnemonics_jcc[] = {
        "jo","jno","jb/jc","jnb/jae","je/jz","jne/jnz","jbe/jna","ja/jnbe",
        "js","jns","jp/jpe","jnp/jpo","jl/jnge","jge/jnl","jle/jng","jg/jnle",
        "loopne","loope","loop","jecxz","jmp short"
    };

    // (使用上方定义的 is_in_list / find_in_list 辅助函数)

    char b[16];
    uint32_t pos = addr;
    uint32_t end = addr + count;

    terminal_writestring("\n");
    while (pos < end) {
        uint8_t op = *(volatile uint8_t*)pos;
        itoa((int)pos, b, 16);
        int len = strlen(b);
        for (int i = len; i < 8; i++) terminal_putchar('0');
        terminal_writestring(b);
        terminal_writestring("  ");

        uint32_t ilen = 1;
        const char* mnemonic = "db";

        if (is_in_list(op, instr_len_1, sizeof(instr_len_1))) {
            ilen = 1;
            int idx = find_in_list(op, instr_len_1, sizeof(instr_len_1));
            if (idx >= 0 && idx < 33) mnemonic = mnemonics_1[idx];
        } else if (is_in_list(op, instr_len_2_jcc, sizeof(instr_len_2_jcc))) {
            ilen = 2;
            int idx = find_in_list(op, instr_len_2_jcc, sizeof(instr_len_2_jcc));
            if (idx >= 0 && idx < 21) mnemonic = mnemonics_jcc[idx];
        } else if (op == 0x68 || op == 0x6A) {
            ilen = (op == 0x68) ? 5 : 2;
            mnemonic = (op == 0x68) ? "push imm32" : "push imm8";
        } else if (op == 0xE8) { ilen = 5; mnemonic = "call rel32"; }
        else if (op == 0xE9) { ilen = 5; mnemonic = "jmp rel32"; }
        else if (op == 0xCD) { ilen = 2; mnemonic = "int"; }
        else if ((op & 0xFC) == 0x80) { ilen = (op == 0x80 || op == 0x82) ? 3 : 6; mnemonic = "alu r/m,imm"; }
        else if (op >= 0x40 && op <= 0x4F) { ilen = 1; mnemonic = (op < 0x48) ? "inc r32" : "dec r32"; }
        else if (op >= 0xB0 && op <= 0xB7) { ilen = 2; mnemonic = "mov r8,imm8"; }
        else if (op >= 0xB8 && op <= 0xBF) { ilen = 5; mnemonic = "mov r32,imm32"; }
        else if (op == 0x89 || op == 0x8B || op == 0x88 || op == 0x8A) {
            ilen = 2; // 需要 ModRM
            if (pos + 1 < end) {
                uint8_t modrm = *(volatile uint8_t*)(pos+1);
                uint8_t mod = (modrm >> 6) & 3;
                if (mod == 1) ilen = 3;
                else if (mod == 2) ilen = 4;
            }
            mnemonic = (op == 0x89) ? "mov [r/m],r" :
                       (op == 0x8B) ? "mov r,[r/m]" :
                       (op == 0x88) ? "mov [r/m8],r8" : "mov r8,[r/m8]";
        } else if (op == 0x0F) {
            ilen = 2;
            if (pos + 1 < end) {
                uint8_t op2 = *(volatile uint8_t*)(pos+1);
                if ((op2 >= 0x80 && op2 <= 0x8F) || op2 == 0xA4 || op2 == 0xA5) {
                    ilen = 3;
                    if (pos + 2 < end) {
                        uint8_t modrm = *(volatile uint8_t*)(pos+2);
                        uint8_t mod = (modrm >> 6) & 3;
                        if (mod == 1) ilen = 4;
                        else if (mod == 2) ilen = 5;
                    }
                }
            }
            mnemonic = "2byte op";
        } else if (op == 0xA0 || op == 0xA2) { ilen = 2; mnemonic = (op==0xA0)?"mov al,[moffs]":"mov [moffs],al"; }
        else if (op == 0xA1 || op == 0xA3) { ilen = 5; mnemonic = (op==0xA1)?"mov eax,[moffs]":"mov [moffs],eax"; }
        else if (op == 0xC6 || op == 0xC7) {
            ilen = 3;
            if (pos + 1 < end) {
                uint8_t modrm = *(volatile uint8_t*)(pos+1);
                uint8_t mod = (modrm >> 6) & 3;
                if (mod == 1) ilen++;
                else if (mod == 2) ilen += 2;
                if (op == 0xC7) ilen += 4; // imm32
            }
            mnemonic = (op==0xC6)?"mov [r/m8],imm8":"mov [r/m32],imm32";
        }

        if (ilen > end - pos) ilen = end - pos;

        for (uint32_t i = 0; i < ilen; i++) {
            itoa((int)*(volatile uint8_t*)(pos + i), b, 16);
            if (*(volatile uint8_t*)(pos + i) < 0x10) terminal_putchar('0');
            terminal_writestring(b);
            terminal_putchar(' ');
        }
        for (uint32_t i = ilen; i < 10; i++) terminal_writestring("   ");

        terminal_writestring(mnemonic);

        // 跳转指令显示目标地址
        if (op >= 0x70 && op <= 0x7F && ilen == 2 && pos + 1 < end) {
            int8_t disp = *(volatile int8_t*)(pos + 1);
            terminal_writestring(" 0x");
            itoa((int)(pos + 2 + disp), b, 16);
            terminal_writestring(b);
        } else if (op == 0xEB && pos + 1 < end) {
            int8_t disp = *(volatile int8_t*)(pos + 1);
            terminal_writestring(" 0x");
            itoa((int)(pos + 2 + disp), b, 16);
            terminal_writestring(b);
        } else if (op == 0xE8 && ilen == 5 && pos + 1 < end) {
            int32_t disp = *(volatile int32_t*)(pos + 1);
            terminal_writestring(" 0x");
            itoa((int)(pos + 5 + disp), b, 16);
            terminal_writestring(b);
        } else if (op == 0xE9 && ilen == 5 && pos + 1 < end) {
            int32_t disp = *(volatile int32_t*)(pos + 1);
            terminal_writestring(" 0x");
            itoa((int)(pos + 5 + disp), b, 16);
            terminal_writestring(b);
        } else if (op == 0xCD && pos + 1 < end) {
            terminal_writestring(" 0x");
            itoa((int)*(volatile uint8_t*)(pos + 1), b, 16);
            terminal_writestring(b);
        }

        terminal_writestring("\n");
        pos += ilen;
    }
}

// ======================== 断点管理 ========================
#define MAX_BREAKPOINTS 16

typedef struct {
    bool    active;
    uint32_t addr;
    uint8_t  original_byte;
} breakpoint_t;

static breakpoint_t breakpoints[MAX_BREAKPOINTS];

// 注册 INT1 和 INT3 中断处理
extern void register_interrupt_handler(uint8_t n, isr_t handler);

// 命中断点时的处理
static void debugger_int3_handler(registers_t* regs) {
    terminal_writestring("\n  >>> Breakpoint hit! EIP=");
    char b[16];
    itoa((int)(regs->eip - 1), b, 16);
    terminal_writestring(b);
    terminal_writestring(" <<<\n");
    
    // 临时恢复原字节，让 EIP 回退
    for (int i = 0; i < MAX_BREAKPOINTS; i++) {
        if (breakpoints[i].active && breakpoints[i].addr == (regs->eip - 1)) {
            *(volatile uint8_t*)breakpoints[i].addr = breakpoints[i].original_byte;
            regs->eip = breakpoints[i].addr;
            break;
        }
    }
}

// INT1 调试单步异常处理
static void debugger_int1_handler(registers_t* regs) {
    terminal_writestring("\n  [Single step] EIP=");
    char b[16];
    itoa((int)regs->eip, b, 16);
    terminal_writestring(b);
    terminal_writestring("\n");
}

// 断点管理函数 - 前置声明 / 定义
static void breakpoint_restore_all(void) {
    for (int i = 0; i < MAX_BREAKPOINTS; i++) {
        if (breakpoints[i].active) {
            *(volatile uint8_t*)breakpoints[i].addr = 0xCC;
        }
    }
}

// g - 继续运行（退出调试器，让内核继续执行，断点会通过 INT3 再回来）
static void cmd_g(int argc, char** argv) {
    (void)argc; (void)argv;
    breakpoint_restore_all();
    terminal_writestring("\n  Continuing execution... (INT3 breakpoints active)\n");
    // 不需要退出调试器，直接返回主循环，主循环会继续
    // 但为了能让 INT3 中断回来，需要退出调试器循环
    // 用 longjmp 方式：设置一个标志，在 debugger_run 中检测
    // 简单方案：退出到主循环，主循环检测到 INT3 会重新进入
    terminal_writestring("  (use 'q' to quit debugger and run)\n");
}

// t - 单步追踪（设置 EFLAGS.TF，执行一条指令后 INT1 触发）
static void cmd_t(int argc, char** argv) {
    (void)argc;
    terminal_writestring("\n  Single step...\n");
    
    // 设置 EFLAGS 的 TF 位，执行一条指令后会触发 INT1
    asm volatile(
        "pushf\n"
        "orl $0x100, 0(%esp)\n"   // 设置 TF (bit 8)
        "popf\n"
    );
    // 注意：执行下一条指令时会触发 INT1，但这里无法直接捕获
    // 实际调试器需要借助 INT1 处理函数
    terminal_writestring("  TF set, next instruction will trap.\n");
}

// 设置 INT3 断点
static int breakpoint_set(uint32_t addr) {
    int idx = -1;
    for (int i = 0; i < MAX_BREAKPOINTS; i++) {
        if (!breakpoints[i].active) { idx = i; break; }
    }
    if (idx < 0) { terminal_writestring("  Max breakpoints reached.\n"); return -1; }
    
    breakpoints[idx].original_byte = *(volatile uint8_t*)addr;
    breakpoints[idx].addr = addr;
    *(volatile uint8_t*)addr = 0xCC;  // INT3
    breakpoints[idx].active = true;
    
    char b[16];
    terminal_writestring("  Breakpoint ");
    itoa(idx, b, 10);
    terminal_writestring(b);
    terminal_writestring(" at 0x");
    itoa((int)addr, b, 16);
    terminal_writestring(b);
    terminal_writestring("\n");
    return idx;
}

static void breakpoint_clear(int idx) {
    if (idx < 0 || idx >= MAX_BREAKPOINTS || !breakpoints[idx].active) {
        terminal_writestring("  Invalid breakpoint.\n"); return;
    }
    *(volatile uint8_t*)breakpoints[idx].addr = breakpoints[idx].original_byte;
    breakpoints[idx].active = false;
    char b[16];
    terminal_writestring("  Breakpoint ");
    itoa(idx, b, 10);
    terminal_writestring(b);
    terminal_writestring(" cleared.\n");
}

static void breakpoint_list(void) {
    terminal_writestring("\n  Breakpoints:\n");
    char b[16];
    int count = 0;
    for (int i = 0; i < MAX_BREAKPOINTS; i++) {
        if (breakpoints[i].active) {
            terminal_writestring("  [");
            itoa(i, b, 10);
            terminal_writestring(b);
            terminal_writestring("] 0x");
            itoa((int)breakpoints[i].addr, b, 16);
            terminal_writestring(b);
            terminal_writestring("\n");
            count++;
        }
    }
    if (count == 0) terminal_writestring("  (none)\n");
}

// b - 设置断点
static void cmd_b(int argc, char** argv) {
    if (argc < 2) { terminal_writestring("  Usage: b <addr>\n"); return; }
    uint32_t addr = hex_to_u32(argv[1]);
    breakpoint_set(addr);
}

// bc - 清除断点
static void cmd_bc(int argc, char** argv) {
    if (argc < 2) { terminal_writestring("  Usage: bc <index>\n"); return; }
    int idx = (int)hex_to_u32(argv[1]);
    breakpoint_clear(idx);
}

// bl - 列出断点
static void cmd_bl(void) {
    breakpoint_list();
}

// a - 汇编 (hex输入模式)
static void cmd_a(int argc, char** argv) {
    if (argc < 2) { terminal_writestring("  Usage: a <addr>\n"); return; }
    uint32_t addr = hex_to_u32(argv[1]);
    char b[16];
    char line[64];

    terminal_writestring("\n  Type hex bytes, empty line to end:\n");
    while (1) {
        itoa((int)addr, b, 16);
        int len = strlen(b);
        for (int i = len; i < 8; i++) terminal_putchar('0');
        terminal_writestring(b);
        terminal_writestring("  ");

        int n = debugger_readline(line, 64);
        if (n == 0) break;

        char* p = line;
        while (*p) {
            while (*p == ' ') p++;
            if (!*p) break;
            int d1 = hex_val(*p); if (d1 < 0) break; p++;
            int d2 = hex_val(*p);
            uint8_t byte;
            if (d2 >= 0) { byte = (uint8_t)((d1 << 4) | d2); p++; }
            else { byte = (uint8_t)(d1 & 0xF); }
            *(volatile uint8_t*)addr++ = byte;
        }
    }
}

// f - 填充内存
static void cmd_f(int argc, char** argv) {
    if (argc < 4) { terminal_writestring("  Usage: f <start> <end> <byte>\n"); return; }
    uint32_t s = hex_to_u32(argv[1]);
    uint32_t e = hex_to_u32(argv[2]);
    uint8_t  d = (uint8_t)hex_to_u32(argv[3]);
    if (e <= s) { terminal_writestring("  Error: end <= start\n"); return; }
    terminal_writestring("\n  Filling ");
    char b[16];
    itoa((int)(e - s), b, 10);
    terminal_writestring(b);
    terminal_writestring(" bytes\n");
    memset((void*)s, (int)d, e - s);
}

// s - 搜索内存
static void cmd_s(int argc, char** argv) {
    if (argc < 4) { terminal_writestring("  Usage: s <start> <end> <byte>\n"); return; }
    uint32_t s = hex_to_u32(argv[1]);
    uint32_t e = hex_to_u32(argv[2]);
    uint8_t  d = (uint8_t)hex_to_u32(argv[3]);
    char b[16];
    terminal_writestring("\n  Searching for 0x");
    itoa((int)d, b, 16); if (d < 0x10) terminal_putchar('0');
    terminal_writestring(b);
    terminal_writestring(":\n");
    uint32_t found = 0;
    for (uint32_t a = s; a < e; a++) {
        if (*(volatile uint8_t*)a == d) {
            if (found < 20) {
                terminal_writestring("  0x");
                itoa((int)a, b, 16);
                terminal_writestring(b);
                terminal_writestring("\n");
            }
            found++;
        }
    }
    itoa((int)found, b, 10);
    terminal_writestring("  Found ");
    terminal_writestring(b);
    terminal_writestring(" match(es)\n");
}

// c - 比较内存
static void cmd_c(int argc, char** argv) {
    if (argc < 4) { terminal_writestring("  Usage: c <addr1> <addr2> <count>\n"); return; }
    uint32_t a1 = hex_to_u32(argv[1]);
    uint32_t a2 = hex_to_u32(argv[2]);
    uint32_t n  = hex_to_u32(argv[3]);
    if (n > 4096) n = 4096;
    char b[16];
    terminal_writestring("\n");
    uint32_t diffs = 0;
    for (uint32_t i = 0; i < n; i++) {
        uint8_t v1 = *(volatile uint8_t*)(a1 + i);
        uint8_t v2 = *(volatile uint8_t*)(a2 + i);
        if (v1 != v2 && diffs < 16) {
            terminal_writestring("  0x");
            itoa((int)(a1 + i), b, 16);
            terminal_writestring(b);
            terminal_writestring(": ");
            itoa((int)v1, b, 16); if (v1 < 0x10) terminal_putchar('0');
            terminal_writestring(b);
            terminal_writestring(" != ");
            itoa((int)v2, b, 16); if (v2 < 0x10) terminal_putchar('0');
            terminal_writestring(b);
            terminal_writestring("\n");
            diffs++;
        }
    }
    if (diffs == 0) terminal_writestring("  Identical.\n");
}

// m - 移动内存
static void cmd_m(int argc, char** argv) {
    if (argc < 4) { terminal_writestring("  Usage: m <src> <dst> <count>\n"); return; }
    void* src = (void*)hex_to_u32(argv[1]);
    void* dst = (void*)hex_to_u32(argv[2]);
    uint32_t n = hex_to_u32(argv[3]);
    if (n > 65536) n = 65536;
    char b[16];
    terminal_writestring("\n  Moved ");
    itoa((int)n, b, 10);
    terminal_writestring(b);
    terminal_writestring(" bytes\n");
    memmove(dst, src, n);
}

// h - 十六进制计算
static void cmd_h(int argc, char** argv) {
    if (argc < 3) { terminal_writestring("  Usage: h <val1> <val2>\n"); return; }
    uint32_t v1 = hex_to_u32(argv[1]);
    uint32_t v2 = hex_to_u32(argv[2]);
    char b[16];
    terminal_writestring("\n");

    itoa((int)v1, b, 16); terminal_writestring(b);
    terminal_writestring(" + "); itoa((int)v2, b, 16); terminal_writestring(b);
    terminal_writestring(" = "); itoa((int)(v1+v2), b, 16); terminal_writestring(b);
    terminal_writestring("  ("); itoa((int)(v1+v2), b, 10); terminal_writestring(b);
    terminal_writestring(")\n");

    itoa((int)v1, b, 16); terminal_writestring(b);
    terminal_writestring(" - "); itoa((int)v2, b, 16); terminal_writestring(b);
    terminal_writestring(" = "); itoa((int)(v1-v2), b, 16); terminal_writestring(b);
    terminal_writestring("  ("); itoa((int)(v1-v2), b, 10); terminal_writestring(b);
    terminal_writestring(")\n");

    if (v2 != 0) {
        itoa((int)v1, b, 16); terminal_writestring(b);
        terminal_writestring(" * "); itoa((int)v2, b, 16); terminal_writestring(b);
        terminal_writestring(" = "); itoa((int)(v1*v2), b, 16); terminal_writestring(b);
        terminal_writestring("  ("); itoa((int)(v1*v2), b, 10); terminal_writestring(b);
        terminal_writestring(")\n");

        itoa((int)v1, b, 16); terminal_writestring(b);
        terminal_writestring(" / "); itoa((int)v2, b, 16); terminal_writestring(b);
        terminal_writestring(" = "); itoa((int)(v1/v2), b, 16); terminal_writestring(b);
        terminal_writestring("  ("); itoa((int)(v1/v2), b, 10); terminal_writestring(b);
        terminal_writestring(")\n");
    }
}

// ? - 帮助
static void cmd_help(void) {
    terminal_writestring(
        "\n"
        "  X86 DEBUG Commands:\n"
        "  ================================================\n"
                "  ?           - Show this help\n"
        "  r           - Display CPU registers\n"
        "  d [addr] [n]- Dump memory (hex + ASCII view)\n"
        "  e addr [d1.]- Enter bytes into memory\n"
        "  u [addr] [n]- Disassemble machine code\n"
        "  g           - Go (continue execution with brekpoints)\n"
        "  t           - Trace (single-step via EFLAGS.TF)\n"
        "  b addr      - Set breakpoint (INT3)\n"
        "  bc idx      - Clear breakpoint\n"
        "  bl          - List breakpoints\n"
        "  a addr      - Assemble (type hex bytes)\n"
        "  f s e d     - Fill memory region\n"
        "  s s e d     - Search memory for value\n"
        "  c a1 a2 n   - Compare two memory regions\n"
        "  m s d n     - Move (copy) memory\n"
        "  h v1 v2     - Hex arithmetic\n"
        "  q           - Quit debugger\n"
        "  map         - System memory map\n"
        "  heap        - Kernel heap info\n"
        "  slab        - Slab allocator info\n"
        "  ps          - List processes\n"
                "  cls         - Clear screen\n"
        "  dma         - DMA controller status\n"
        "  dmach       - DMA channel info\n"
        "  dmademo     - Run DMA memory copy demo\n"
        "  ================================================\n"
        "  All addresses/values are hexadecimal.\n"
    );
}

// ======================== 主循环 ========================

void debugger_run(void) {
    terminal_writestring("\n=== X86 DEBUG - Type ? for help, q to quit ===\n");

    char line[128];
    char* args[16];

    // 清空缓冲区残留
    char tmp;
    while (keyboard_buffer_read(&tmp));

    while (1) {
        terminal_writestring("-");
        int n = debugger_readline(line, 128);
        if (n == 0) continue;

        int argc = tokenize(line, args, 16);
        if (argc == 0) continue;

        char cmd = args[0][0];

        switch (cmd) {
            case '?': cmd_help(); break;
            case 'q': case 'Q':
                terminal_writestring("\n  Returning to OS.\n");
                return;
            case 'r': case 'R': cmd_r(argc, args); break;
            case 'd': case 'D': cmd_d(argc, args); break;
            case 'e': case 'E': cmd_e(argc, args); break;
            case 'u': case 'U': cmd_u(argc, args); break;
            case 'g': case 'G': cmd_g(argc, args); break;
            case 't': case 'T': cmd_t(argc, args); break;
            case 'b': case 'B':
                if (strcmp(args[0], "bc") == 0 || strcmp(args[0], "BC") == 0) cmd_bc(argc, args);
                else if (strcmp(args[0], "bl") == 0 || strcmp(args[0], "BL") == 0) cmd_bl();
                else cmd_b(argc, args);
                break;
            case 'a': case 'A': cmd_a(argc, args); break;
            case 'f': case 'F': cmd_f(argc, args); break;
            case 's': case 'S': cmd_s(argc, args); break;
            case 'c': case 'C': cmd_c(argc, args); break;
            case 'm': case 'M': cmd_m(argc, args); break;
            case 'h': case 'H': cmd_h(argc, args); break;
            default:
                if (strcmp(args[0], "map") == 0) {
                    memory_map_dump();
                } else if (strcmp(args[0], "heap") == 0) {
                    memory_heap_dump();
                } else if (strcmp(args[0], "slab") == 0) {
                    memory_slab_dump();
                } else if (strcmp(args[0], "ps") == 0) {
                    process_list();
                } else if (strcmp(args[0], "cls") == 0) {
                    terminal_clear();
                } else if (strcmp(args[0], "dma") == 0) {
                    dma_dump_status();
                } else if (strcmp(args[0], "dmach") == 0) {
                    dma_dump_channels();
                } else if (strcmp(args[0], "dmademo") == 0) {
                    dma_demo();
                } else {
                    terminal_writestring("  Unknown command. Type ? for help.\n");
                }
                break;
        }
    }
}

// ======================== 初始化 ========================

void debugger_init(void) {
    // 注册 INT1 (调试异常) 处理
    register_interrupt_handler(1, debugger_int1_handler);
    // 注册 INT3 (断点) 处理
    register_interrupt_handler(3, debugger_int3_handler);
    
    // 清空断点表
    for (int i = 0; i < MAX_BREAKPOINTS; i++) {
        breakpoints[i].active = false;
    }
    
    terminal_writestring("  Debugger initialized (INT1/INT3 handlers registered).\n");
    terminal_writestring("  Press F12 in main loop to enter debugger.\n");
}
