#include "exe_loader.h"
#include "process.h"
#include "../terminal.h"
#include "../lib/libk.h"

// 注意：在真正的操作系统中，这需要文件系统和内存管理配合。
// 这里我们使用简单的内存分配（需要先实现 kmalloc/kfree 的声明）

// 外部声明内存管理函数
extern void* kmalloc(uint32_t size);
extern void* kcalloc(uint32_t num, uint32_t size);
extern void  kfree(void* ptr);

// 简单内存分配器（如果内核还没有 mm，就用这个临时的）
static uint32_t heap_cur = 0x01000000;

void* simple_alloc(uint32_t size) {
    // 对齐到 4KB
    size = (size + 0xFFF) & ~0xFFF;
    void* ptr = (void*)heap_cur;
    heap_cur += size;
    // 简单的 memset 清零
    memset(ptr, 0, size);
    return ptr;
}

// ==================== 格式检测 ====================

bool exe_check_format(const void* data, uint32_t size) {
    if (!data || size < 4) return false;
    
    const uint8_t* bytes = (const uint8_t*)data;
    
    // 检查 ELF 魔数
    if (bytes[0] == 0x7F && bytes[1] == 'E' && bytes[2] == 'L' && bytes[3] == 'F') {
        return true;
    }
    
    // 检查 PE 魔数 (MZ)
    uint16_t* mz = (uint16_t*)data;
    if (mz[0] == DOS_MAGIC) {
        dos_header_t* dos = (dos_header_t*)data;
        if (dos->e_lfanew + 4 <= size) {
            uint32_t* pe_sig = (uint32_t*)((uint8_t*)data + dos->e_lfanew);
            if (*pe_sig == PE_SIGNATURE) {
                return true;
            }
        }
    }
    
    return false;
}

// ==================== ELF 文件加载 ====================

static exe_load_result_t load_elf(const void* data, uint32_t size) {
    exe_load_result_t result;
    memset(&result, 0, sizeof(result));
    result.success = 0;
    
    if (!data || size < sizeof(elf32_header_t)) {
        strncpy(result.error_msg, "File too small for ELF header", sizeof(result.error_msg));
        return result;
    }
    
    elf32_header_t* header = (elf32_header_t*)data;
    
    // 验证 ELF 格式
    if (header->e_ident[0] != 0x7F || header->e_ident[1] != 'E' ||
        header->e_ident[2] != 'L' || header->e_ident[3] != 'F') {
        strncpy(result.error_msg, "Invalid ELF magic", sizeof(result.error_msg));
        return result;
    }
    
    if (header->e_ident[4] != ELF_CLASS_32) {
        strncpy(result.error_msg, "Not a 32-bit ELF", sizeof(result.error_msg));
        return result;
    }
    
    if (header->e_machine != ELF_MACHINE_386) {
        strncpy(result.error_msg, "Not i386 ELF", sizeof(result.error_msg));
        return result;
    }
    
    if (header->e_type != ELF_TYPE_EXEC) {
        strncpy(result.error_msg, "Not an executable ELF", sizeof(result.error_msg));
        return result;
    }
    
    terminal_writestring("Loading ELF executable...\n");
    
    // 计算所需内存总量（遍历所有 PT_LOAD 段）
    uint32_t min_addr = 0xFFFFFFFF;
    uint32_t max_addr = 0;
    
    elf32_phdr_t* phdrs = (elf32_phdr_t*)((uint8_t*)data + header->e_phoff);
    
    for (uint16_t i = 0; i < header->e_phnum; i++) {
        elf32_phdr_t* phdr = &phdrs[i];
        
        if (phdr->p_type == PT_LOAD) {
            uint32_t end = phdr->p_vaddr + phdr->p_memsz;
            if (phdr->p_vaddr < min_addr) min_addr = phdr->p_vaddr;
            if (end > max_addr) max_addr = end;
        }
    }
    
    // 分配连续内存区域
    uint32_t total_size = max_addr - min_addr;
    if (total_size == 0) {
        strncpy(result.error_msg, "No loadable segments", sizeof(result.error_msg));
        return result;
    }
    
    // 对齐到 4KB
    total_size = (total_size + 0xFFF) & ~0xFFF;
    uint32_t base_addr = (uint32_t)simple_alloc(total_size);
    
    terminal_writestring("  Image base: 0x");
    char hex[16];
    // 简单的十六进制输出
    hex[0] = '0' + ((base_addr >> 28) & 0xF);
    hex[1] = '0' + ((base_addr >> 24) & 0xF);
    hex[2] = '0' + ((base_addr >> 20) & 0xF);
    hex[3] = '0' + ((base_addr >> 16) & 0xF);
    hex[4] = '0' + ((base_addr >> 12) & 0xF);
    hex[5] = '0' + ((base_addr >> 8) & 0xF);
    hex[6] = '0' + ((base_addr >> 4) & 0xF);
    hex[7] = '0' + (base_addr & 0xF);
    hex[8] = '\0';
    terminal_writestring(hex);
    terminal_writestring("\n");
    terminal_writestring("  Total size: ");
    char num[16];
    itoa(total_size, num, 10);
    terminal_writestring(num);
    terminal_writestring(" bytes\n");
    
    // 加载每个段
    for (uint16_t i = 0; i < header->e_phnum; i++) {
        elf32_phdr_t* phdr = &phdrs[i];
        
        if (phdr->p_type == PT_LOAD) {
            uint32_t dest = base_addr + (phdr->p_vaddr - min_addr);
            uint32_t file_size = phdr->p_filesz;
            uint32_t mem_size = phdr->p_memsz;
            
            terminal_writestring("  Segment: vaddr=0x");
            // 输出虚拟地址
            char addr[16];
            for (int j = 0; j < 8; j++) {
                uint8_t nibble = (phdr->p_vaddr >> (28 - j*4)) & 0xF;
                addr[j] = nibble < 10 ? '0' + nibble : 'a' + nibble - 10;
            }
            addr[8] = '\0';
            terminal_writestring(addr);
            terminal_writestring(" filesz=");
            itoa(file_size, num, 10);
            terminal_writestring(num);
            terminal_writestring(" memsz=");
            itoa(mem_size, num, 10);
            terminal_writestring(num);
            terminal_writestring("\n");
            
            // 从文件中拷贝数据
            if (file_size > 0 && phdr->p_offset + file_size <= size) {
                memcpy((void*)dest, (uint8_t*)data + phdr->p_offset, file_size);
            }
            
            // 将 .bss 部分清零 (file_size 到 mem_size 之间)
            if (mem_size > file_size) {
                memset((void*)(dest + file_size), 0, mem_size - file_size);
            }
        }
    }
    
    // 设置结果
    result.success = 1;
    result.entry_point = base_addr + (header->e_entry - min_addr);
    result.image_base = base_addr;
    result.stack_size = 0x8000;   // 32 KB 栈
    result.heap_size = 0x100000;  // 1 MB 堆
    
    terminal_writestring("  Entry point: 0x");
    for (int j = 0; j < 8; j++) {
        uint8_t nibble = (result.entry_point >> (28 - j*4)) & 0xF;
        hex[j] = nibble < 10 ? '0' + nibble : 'a' + nibble - 10;
    }
    hex[8] = '\0';
    terminal_writestring(hex);
    terminal_writestring("\n");
    terminal_writestring("ELF loaded successfully.\n");
    
    return result;
}

// ==================== PE (EXE) 文件加载 ====================

static exe_load_result_t load_pe(const void* data, uint32_t size) {
    exe_load_result_t result;
    memset(&result, 0, sizeof(result));
    result.success = 0;
    
    if (!data || size < sizeof(dos_header_t)) {
        strncpy(result.error_msg, "File too small", sizeof(result.error_msg));
        return result;
    }
    
    // 验证 DOS 头
    dos_header_t* dos = (dos_header_t*)data;
    if (dos->e_magic != DOS_MAGIC) {
        strncpy(result.error_msg, "Not a DOS executable (MZ)", sizeof(result.error_msg));
        return result;
    }
    
    // 定位 PE 头
    uint32_t pe_offset = dos->e_lfanew;
    if (pe_offset + sizeof(pe_file_header_t) > size) {
        strncpy(result.error_msg, "PE header out of bounds", sizeof(result.error_msg));
        return result;
    }
    
    pe_file_header_t* pe_hdr = (pe_file_header_t*)((uint8_t*)data + pe_offset);
    if (pe_hdr->Signature != PE_SIGNATURE) {
        strncpy(result.error_msg, "Invalid PE signature", sizeof(result.error_msg));
        return result;
    }
    
    // 获取可选头
    pe_optional_header_t* opt = (pe_optional_header_t*)((uint8_t*)pe_hdr + sizeof(pe_file_header_t));
    
    if (opt->Magic != 0x10B) {
        strncpy(result.error_msg, "Not a PE32 executable (Magic != 0x10B)", sizeof(result.error_msg));
        return result;
    }
    
    terminal_writestring("Loading PE executable...\n");
    
    // 获取节表
    pe_section_header_t* sections = (pe_section_header_t*)((uint8_t*)opt + pe_hdr->SizeOfOptionalHeader);
    
    // 计算需要的总内存
    uint32_t size_of_image = opt->SizeOfImage;
    
    // 分配内存
    size_of_image = (size_of_image + 0xFFF) & ~0xFFF;
    void* image_mem = simple_alloc(size_of_image);
    
    if (!image_mem) {
        strncpy(result.error_msg, "Failed to allocate memory for image", sizeof(result.error_msg));
        return result;
    }
    
    // 清零
    memset(image_mem, 0, size_of_image);
    
    terminal_writestring("  Image base: 0x");
    char buf[16];
    for (int j = 0; j < 8; j++) {
        uint8_t nibble = ((uint32_t)image_mem >> (28 - j*4)) & 0xF;
        buf[j] = nibble < 10 ? '0' + nibble : 'a' + nibble - 10;
    }
    buf[8] = '\0';
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    // 先拷贝头部
    uint32_t headers_size = opt->SizeOfHeaders;
    if (headers_size > size) headers_size = size;
    memcpy(image_mem, data, headers_size);
    
    // 加载每个节
    for (uint16_t i = 0; i < pe_hdr->NumberOfSections; i++) {
        pe_section_header_t* sec = &sections[i];
        
        // 计算在内存中的地址
        uint32_t dest = (uint32_t)image_mem + sec->VirtualAddress;
        uint32_t file_offset = sec->PointerToRawData;
        uint32_t file_size = sec->SizeOfRawData;
        uint32_t mem_size = sec->VirtualSize;
        
        if (file_size > 0 && file_offset + file_size <= size) {
            memcpy((void*)dest, (uint8_t*)data + file_offset, file_size);
        }
        
        // 清零剩余部分 (bss)
        if (mem_size > file_size) {
            memset((void*)(dest + file_size), 0, mem_size - file_size);
        }
        
        // 显示节信息
        char sec_name[9];
        memcpy(sec_name, sec->Name, 8);
        sec_name[8] = '\0';
        terminal_writestring("  Section: ");
        terminal_writestring(sec_name);
        terminal_writestring(" vaddr=0x");
        for (int j = 0; j < 8; j++) {
            uint8_t nibble = (sec->VirtualAddress >> (28 - j*4)) & 0xF;
            buf[j] = nibble < 10 ? '0' + nibble : 'a' + nibble - 10;
        }
        buf[8] = '\0';
        terminal_writestring(buf);
        terminal_writestring(" size=");
        itoa(mem_size, buf, 10);
        terminal_writestring(buf);
        terminal_writestring("\n");
    }
    
    // 处理重定位（简化：如果加载地址不是首选地址，需要修正）
    uint32_t delta = (uint32_t)image_mem - opt->ImageBase;
    if (delta != 0) {
        terminal_writestring("  Applying relocations (delta=0x");
        for (int j = 0; j < 8; j++) {
            uint8_t nibble = (delta >> (28 - j*4)) & 0xF;
            buf[j] = nibble < 10 ? '0' + nibble : 'a' + nibble - 10;
        }
        buf[8] = '\0';
        terminal_writestring(buf);
        terminal_writestring(")...\n");
        
        // 查找 .reloc 节或基址重定位数据目录
        pe_data_directory_t* reloc_dir = &opt->DataDirectory[5]; // 基址重定位表
        
        if (reloc_dir->VirtualAddress != 0 && reloc_dir->Size > 0) {
            uint32_t reloc_base = (uint32_t)image_mem + reloc_dir->VirtualAddress;
            uint32_t reloc_end = reloc_base + reloc_dir->Size;
            uint32_t pos = reloc_base;
            
            while (pos + 8 <= reloc_end) {
                uint32_t* block = (uint32_t*)pos;
                uint32_t page_rva = block[0];
                uint32_t block_size = block[1];
                
                if (block_size == 0) break;
                
                uint32_t entries_end = pos + block_size;
                pos += 8;
                
                while (pos < entries_end) {
                    uint16_t entry = *(uint16_t*)pos;
                    uint16_t type = (entry >> 12) & 0xF;
                    uint16_t offset = entry & 0xFFF;
                    
                    if (type == 0) {
                        pos += 2;
                        continue;  // 对齐填充
                    }
                    
                    if (type == 3) {  // IMAGE_REL_BASED_HIGHLOW (32-bit)
                        uint32_t addr = (uint32_t)image_mem + page_rva + offset;
                        *(uint32_t*)addr += delta;
                    }
                    
                    pos += 2;
                }
            }
        }
    }
    
    // 设置结果
    result.success = 1;
    result.entry_point = (uint32_t)image_mem + opt->AddressOfEntryPoint;
    result.image_base = (uint32_t)image_mem;
    result.stack_size = opt->SizeOfStackReserve;
    result.heap_size = opt->SizeOfHeapReserve;
    
    terminal_writestring("  Entry point: 0x");
    for (int j = 0; j < 8; j++) {
        uint8_t nibble = (result.entry_point >> (28 - j*4)) & 0xF;
        buf[j] = nibble < 10 ? '0' + nibble : 'a' + nibble - 10;
    }
    buf[8] = '\0';
    terminal_writestring(buf);
    terminal_writestring("\n");
    terminal_writestring("PE loaded successfully.\n");
    
    return result;
}

// ==================== 执行可执行文件 ====================

int exe_run_elf(const char* path, const void* elf_data, uint32_t size) {
    (void)path;
    
    terminal_writestring("Preparing to execute ELF: ");
    terminal_writestring(path ? path : "(memory)");
    terminal_writestring("\n");
    
    exe_load_result_t result = load_elf(elf_data, size);
    
    if (!result.success) {
        terminal_writestring("Failed to load ELF: ");
        terminal_writestring(result.error_msg);
        terminal_writestring("\n");
        return -1;
    }
    
    // 创建进程来运行 ELF
    int pid = process_create("elf_prog", result.entry_point, 128);
    if (pid < 0) {
        terminal_writestring("Failed to create process\n");
        return -1;
    }
    
    terminal_writestring("Process created with PID: ");
    char buf[16];
    itoa(pid, buf, 10);
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    return pid;
}

int exe_run_pe(const char* path, const void* pe_data, uint32_t size) {
    (void)path;
    
    terminal_writestring("Preparing to execute PE: ");
    terminal_writestring(path ? path : "(memory)");
    terminal_writestring("\n");
    
    exe_load_result_t result = load_pe(pe_data, size);
    
    if (!result.success) {
        terminal_writestring("Failed to load PE: ");
        terminal_writestring(result.error_msg);
        terminal_writestring("\n");
        return -1;
    }
    
    // 创建进程来运行 PE 文件
    int pid = process_create("pe_prog", result.entry_point, 128);
    if (pid < 0) {
        terminal_writestring("Failed to create process\n");
        return -1;
    }
    
    terminal_writestring("Process created with PID: ");
    char buf[16];
    itoa(pid, buf, 10);
    terminal_writestring(buf);
    terminal_writestring("\n");
    
    return pid;
}

// ==================== 自动检测并执行 ====================

int exe_run(const char* path, const void* data, uint32_t size) {
    if (!data || size == 0) {
        terminal_writestring("Invalid executable data\n");
        return -1;
    }
    
    const uint8_t* magic = (const uint8_t*)data;
    
    // 检测 ELF
    if (magic[0] == 0x7F && magic[1] == 'E' && magic[2] == 'L' && magic[3] == 'F') {
        terminal_writestring("Detected ELF format\n");
        return exe_run_elf(path, data, size);
    }
    
    // 检测 PE (MZ)
    if (magic[0] == 'M' && magic[1] == 'Z') {
        terminal_writestring("Detected PE (EXE) format\n");
        return exe_run_pe(path, data, size);
    }
    
    terminal_writestring("Unknown executable format (magic: ");
    char buf[8];
    buf[0] = "0123456789ABCDEF"[(magic[0] >> 4) & 0xF];
    buf[1] = "0123456789ABCDEF"[magic[0] & 0xF];
    buf[2] = ' ';
    buf[3] = "0123456789ABCDEF"[(magic[1] >> 4) & 0xF];
    buf[4] = "0123456789ABCDEF"[magic[1] & 0xF];
    buf[5] = '\0';
    terminal_writestring(buf);
    terminal_writestring(")\n");
    
    return -1;
}
