#include "gdt.h"
#include "../../terminal.h"
#include "../../lib/libk.h"

// GDT 条目数
#define GDT_ENTRIES 6

static gdt_entry_t gdt_entries[GDT_ENTRIES];
static gdt_ptr_t   gdt_ptr;
static tss_entry_t tss_entry;

// 设置 GDT 描述符
static void gdt_set_gate(int num, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran) {
    gdt_entries[num].base_low     = base & 0xFFFF;
    gdt_entries[num].base_mid     = (base >> 16) & 0xFF;
    gdt_entries[num].base_high    = (base >> 24) & 0xFF;
    gdt_entries[num].limit_low    = limit & 0xFFFF;
    gdt_entries[num].granularity  = (limit >> 16) & 0x0F;
    gdt_entries[num].granularity |= gran & 0xF0;
    gdt_entries[num].access       = access;
}

// 写入 TSS
static void write_tss(uint32_t num, uint16_t ss0, uint32_t esp0) {
    uint32_t base = (uint32_t)&tss_entry;
    uint32_t limit = base + sizeof(tss_entry_t);
    
    memset(&tss_entry, 0, sizeof(tss_entry_t));
    tss_entry.ss0 = ss0;
    tss_entry.esp0 = esp0;
    tss_entry.iomap_base = sizeof(tss_entry_t);
    
    // TSS 描述符的 access = 0x89 (present, ring 3, TSS 32-bit available)
    gdt_set_gate(num, base, limit, 0x89, 0x00);
}

// 刷新 GDT 的汇编函数
extern void gdt_flush(uint32_t gdt_ptr);
extern void tss_flush(void);

void gdt_init(void) {
    terminal_writestring("Initializing GDT...\n");
    
    gdt_ptr.limit = sizeof(gdt_entry_t) * GDT_ENTRIES - 1;
    gdt_ptr.base  = (uint32_t)&gdt_entries;
    
    // NULL 描述符
    gdt_set_gate(0, 0, 0, 0, 0);
    
    // 内核代码段: base=0, limit=4GB, ring 0, code, executable, readable
    // access = 0x9A: present=1, ring=00, code=1, executable=1, conforming=0, readable=1, accessed=0
    // granularity = 0xCF: 4KB page, 32-bit, limit high
    gdt_set_gate(1, 0, 0xFFFFFFFF, 0x9A, 0xCF);
    
    // 内核数据段: base=0, limit=4GB, ring 0, data, writable
    // access = 0x92: present=1, ring=00, code=0, expand-down=0, writable=1, accessed=0
    gdt_set_gate(2, 0, 0xFFFFFFFF, 0x92, 0xCF);
    
    // 用户代码段: base=0, limit=4GB, ring 3, code, executable, readable
    // access = 0xFA: present=1, ring=11, code=1, executable=1, conforming=0, readable=1, accessed=0
    gdt_set_gate(3, 0, 0xFFFFFFFF, 0xFA, 0xCF);
    
    // 用户数据段: base=0, limit=4GB, ring 3, data, writable
    // access = 0xF2: present=1, ring=11, code=0, expand-down=0, writable=1, accessed=0
    gdt_set_gate(4, 0, 0xFFFFFFFF, 0xF2, 0xCF);
    
    // TSS 段
    write_tss(5, 0x10, 0x10000);  // ss0 = 内核数据段, esp0 将在进程切换时更新
    
    // 加载 GDT
    gdt_flush((uint32_t)&gdt_ptr);
    tss_flush();
    
    terminal_writestring("GDT initialized.\n");
}

void tss_set_esp0(uint32_t esp0) {
    tss_entry.esp0 = esp0;
}
