# GDB 初始化脚本，用于调试 i686 内核
# 连接到 QEMU 的 GDB stub
target remote localhost:1234

# 设置架构为 i386
set architecture i386

# 加载内核符号表
symbol-file kernel.elf

# 在 _start 入口处设置断点
break _start

# 断点：内核主函数
break kernel_main

# 断点：中断处理相关
break isr_handler
break irq_handler

# 一些有用的 GDB 显示设置
set print pretty on
set print static-members on
set print vtbl on

# 定义辅助宏：打印寄存器状态
define dump_regs
  info registers
end
document dump_regs
  打印所有寄存器的值
end

# 定义辅助宏：打印栈回溯
define bt_full
  backtrace full
end
document bt_full
  打印完整的栈回溯（含局部变量）
end

# 定义辅助宏：显示 GDT 信息
define show_gdt
  x/64gx 0x800
end
document show_gdt
  显示 GDT 表内容（假设 GDT 在地址 0x800）
end

# 定义辅助宏：显示 IDT 信息
define show_idt
  printf "IDT at 0x%x, 256 entries\n", $idtr
  info idt
end
document show_idt
  显示 IDT 表信息
end

# 定义辅助宏：显示内存页目录（假设页目录在 0x1000）
define show_page_dir
  x/1024wx 0x1000
end
document show_page_dir
  显示页目录（假设页目录基址为 0x1000）
end

# 断点：page fault 时自动停止
# 取消注释以启用：
# break *0xE

echo ============================================\n
echo   QEMU GDB 调试会话已启动\n
echo   可用命令:\n
echo     dump_regs    - 打印寄存器\n
echo     bt_full      - 完整栈回溯\n
echo     show_gdt     - 显示 GDT\n
echo     show_idt     - 显示 IDT\n
echo     show_page_dir - 显示页目录\n
echo ============================================\n
