; One Comment

%define FILENAME "Grace_kid.s"
%define CODE "; Test"

section .data
file_name: db FILENAME, 0
file_content: db CODE, 0

section .text
	extern dprintf

%macro MAIN 0

extern main

main:
push rbp
mov rbp, rsp
lea rdi, [rel file_name]
mov rax, 0x2000005
mov rdx, 0o644
mov rsi, 0x0202
syscall

mov rdi, rax
lea rsi, [rel file_content]
lea rdx, [rel file_content]
mov rcx, 9
mov r8, 10
call dprintf

mov rsp, rbp
pop rbp
ret

%endmacro

MAIN
