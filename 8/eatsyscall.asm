; 可执行文件名： SYSCALL
; 版本： 1.0
; 创建日期： 2016/11/29
; 最后修改： 2016/11/29
; 作者： zuliang
; 描述： Linux 下的一个简单的汇编应用程序，使用NASM(NASM version 2.11.08)
;       演示类如何使用 Linux INT 80H 系统调用来显示文本。
;
;
;使用以下命令生成：
;       nasm -f elf64 -g -F stabs syscall.asm
;       ld -o eatsyscall syscall.o
;

SECTION .data                   ; 包含已初始化数据的部分

Msg: db "wanzuliang",10
Len: equ $-Msg

SECTION .bss                    ; 包含未初始化的数据

SECTION .text                   ; 包含代码的部分

global _start                   ; 连接程序需要根据它找到入口点

_start:
        Nop                     ;
        mov eax,4               ; 指定 sys_write 系统调用
        mov ebx,1               ; 指定文件描述 1：标准输出
        mov ecx,Msg             ; 传递显示信息的偏移地址
        mov edx,Len             ; 传递显示信息的长度
        int 80H                 ; 进行系统调用用以将文本输出到标准输出

        mov eax,1               ; 指定 Exit 系统调用
        mov ebx,0               ; 返回一个零编码
        int 80H                 ; 进行系统调用来终止程序
