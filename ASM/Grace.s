; One Comment

%define FILENAME "Grace_kid.s"
%define CODE "; One Comment%1$c%1$c%%define FILENAME %2$cGrace_kid.s%2$c%1$c%%define CODE %2$c%3$s%2$c%1$c%1$csection .data%1$cfile_name: db FILENAME, 0%1$cfile_content: db CODE, 0%1$c%1$csection .text%1$cextern dprintf%1$c%1$c%%macro MAIN 0%1$c%1$cglobal main%1$c%1$cmain:%1$cpush rbp%1$cmov rbp, rsp%1$clea rdi, [rel file_name]%1$cmov rax, 2%1$cmov rdx, 0o644%1$cmov rsi, 0x41%1$csyscall%1$c%1$cmov rdi, rax%1$clea rsi, [rel file_content]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel file_content]%1$ccall dprintf%1$c%1$cleave%1$cmov eax, 0%1$cret%1$c%1$c%%endmacro%1$c%1$cMAIN%1$c"

section .data
file_name: db FILENAME, 0
file_content: db CODE, 0

section .text
extern dprintf

%macro MAIN 0

global main

main:
push rbp
mov rbp, rsp
lea rdi, [rel file_name]
mov rax, 2
mov rdx, 0o644
mov rsi, 0x41
syscall

mov rdi, rax
lea rsi, [rel file_content]
mov rdx, 10
mov rcx, 34
lea r8, [rel file_content]
call dprintf

leave
mov eax, 0
ret

%endmacro

MAIN
