#ifndef EXE_LOADER_H
#define EXE_LOADER_H

#include <stdint.h>
#include <stdbool.h>

// ==================== PE (Portable Executable) 结构定义 ====================

// DOS 头部（每个 PE 文件以 MZ 开头）
typedef struct {
    uint16_t e_magic;         // "MZ" (0x5A4D)
    uint16_t e_cblp;          // Bytes on last page of file
    uint16_t e_cp;            // Pages in file
    uint16_t e_crlc;          // Relocations
    uint16_t e_cparhdr;       // Size of header in paragraphs
    uint16_t e_minalloc;      // Minimum extra paragraphs needed
    uint16_t e_maxalloc;      // Maximum extra paragraphs needed
    uint16_t e_ss;            // Initial (relative) SS value
    uint16_t e_sp;            // Initial SP value
    uint16_t e_csum;          // Checksum
    uint16_t e_ip;            // Initial IP value
    uint16_t e_cs;            // Initial (relative) CS value
    uint16_t e_lfarlc;        // File address of relocation table
    uint16_t e_ovno;          // Overlay number
    uint16_t e_res[4];        // Reserved words
    uint16_t e_oemid;         // OEM identifier (for e_oeminfo)
    uint16_t e_oeminfo;       // OEM information
    uint16_t e_res2[10];      // Reserved words
    uint32_t e_lfanew;        // File address of new exe header (PE signature)
} __attribute__((packed)) dos_header_t;

#define DOS_MAGIC 0x5A4D  // "MZ"

// PE 签名
#define PE_SIGNATURE 0x00004550  // "PE\0\0"

// 文件头
typedef struct {
    uint32_t Signature;
    uint16_t Machine;
    uint16_t NumberOfSections;
    uint32_t TimeDateStamp;
    uint32_t PointerToSymbolTable;
    uint32_t NumberOfSymbols;
    uint16_t SizeOfOptionalHeader;
    uint16_t Characteristics;
} __attribute__((packed)) pe_file_header_t;

// 数据目录项
typedef struct {
    uint32_t VirtualAddress;
    uint32_t Size;
} __attribute__((packed)) pe_data_directory_t;

#define PE_IMAGE_DLLCHARACTERISTICS_NX_COMPAT 0x0100

// 可选头（标准字段 + NT 特定字段）
typedef struct {
    // 标准字段
    uint16_t Magic;                    // 0x10B (PE32), 0x20B (PE32+)
    uint8_t  MajorLinkerVersion;
    uint8_t  MinorLinkerVersion;
    uint32_t SizeOfCode;
    uint32_t SizeOfInitializedData;
    uint32_t SizeOfUninitializedData;
    uint32_t AddressOfEntryPoint;      // 入口点 RVA
    uint32_t BaseOfCode;
    uint32_t BaseOfData;
    
    // NT 特定字段
    uint32_t ImageBase;                // 首选加载地址
    uint32_t SectionAlignment;
    uint32_t FileAlignment;
    uint16_t MajorOperatingSystemVersion;
    uint16_t MinorOperatingSystemVersion;
    uint16_t MajorImageVersion;
    uint16_t MinorImageVersion;
    uint16_t MajorSubsystemVersion;
    uint16_t MinorSubsystemVersion;
    uint32_t Win32VersionValue;
    uint32_t SizeOfImage;              // 映像总大小（含所有头部）
    uint32_t SizeOfHeaders;            // 所有头部合计大小
    uint32_t CheckSum;
    uint16_t Subsystem;
    uint16_t DllCharacteristics;
    uint32_t SizeOfStackReserve;
    uint32_t SizeOfStackCommit;
    uint32_t SizeOfHeapReserve;
    uint32_t SizeOfHeapCommit;
    uint32_t LoaderFlags;
    uint32_t NumberOfRvaAndSizes;
    pe_data_directory_t DataDirectory[16];
} __attribute__((packed)) pe_optional_header_t;

// 节表项
typedef struct {
    char     Name[8];               // 节名（以 null 结尾或截断）
    uint32_t VirtualSize;           // 在内存中的大小
    uint32_t VirtualAddress;        // 在内存中的 RVA
    uint32_t SizeOfRawData;         // 在文件中的大小
    uint32_t PointerToRawData;      // 在文件中的偏移
    uint32_t PointerToRelocations;  // 重定位偏移
    uint32_t PointerToLinenumbers;
    uint16_t NumberOfRelocations;
    uint16_t NumberOfLinenumbers;
    uint32_t Characteristics;       // 节属性
} __attribute__((packed)) pe_section_header_t;

// 节属性标志
#define SECTION_CODE      0x00000020
#define SECTION_INIT_DATA 0x00000040
#define SECTION_UNINIT    0x00000080
#define SECTION_EXECUTE   0x20000000
#define SECTION_READ      0x40000000
#define SECTION_WRITE     0x80000000

// 子系统
#define SUBSYSTEM_CONSOLE  3
#define SUBSYSTEM_WINDOWS  2

// ==================== ELF (Executable and Linkable Format) 结构定义 ====================
// 用于加载 ELF 文件（i686-elf-gcc 生成的是 ELF）

#define ELF_MAGIC       "\x7fELF"
#define ELF_CLASS_32    1
#define ELF_DATA_2LSB   1
#define ELF_TYPE_EXEC   2
#define ELF_MACHINE_386 3

typedef struct {
    unsigned char e_ident[16];
    uint16_t      e_type;
    uint16_t      e_machine;
    uint32_t      e_version;
    uint32_t      e_entry;
    uint32_t      e_phoff;        // Program header offset
    uint32_t      e_shoff;        // Section header offset
    uint32_t      e_flags;
    uint16_t      e_ehsize;
    uint16_t      e_phentsize;
    uint16_t      e_phnum;
    uint16_t      e_shentsize;
    uint16_t      e_shnum;
    uint16_t      e_shstrndx;
} __attribute__((packed)) elf32_header_t;

typedef struct {
    uint32_t p_type;
    uint32_t p_offset;      // 在文件中的偏移
    uint32_t p_vaddr;       // 在内存中的虚拟地址
    uint32_t p_paddr;       // 物理地址（通常忽略）
    uint32_t p_filesz;      // 在文件中的大小
    uint32_t p_memsz;       // 在内存中的大小
    uint32_t p_flags;       // 权限标志
    uint32_t p_align;       // 对齐
} __attribute__((packed)) elf32_phdr_t;

#define PT_NULL     0
#define PT_LOAD     1
#define PT_DYNAMIC  2
#define PT_INTERP   3
#define PT_NOTE     4
#define PT_PHDR     6

#define PF_X        1
#define PF_W        2
#define PF_R        4

// ==================== 加载结果结构 ====================
typedef struct {
    int      success;           // 是否成功
    uint32_t entry_point;       // 入口点
    uint32_t image_base;        // 加载基址
    uint32_t stack_size;        // 建议栈大小
    uint32_t heap_size;         // 建议堆大小
    char     error_msg[128];    // 错误信息
} exe_load_result_t;

// ==================== API 函数 ====================

// 检查文件是否是有效的可执行文件
bool exe_check_format(const void* data, uint32_t size);

// 加载可执行文件到内存
exe_load_result_t exe_load(const void* data, uint32_t size);

// 从内存地址加载并执行 ELF 文件
int exe_run_elf(const char* path, const void* elf_data, uint32_t size);

// 从内存地址加载并执行 PE 文件
int exe_run_pe(const char* path, const void* pe_data, uint32_t size);

// 自动检测格式并执行
int exe_run(const char* path, const void* data, uint32_t size);

#endif // EXE_LOADER_H
