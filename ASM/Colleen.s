section .text
    global _start

_start:
    ; Register conventions for syscall:
    ; rax = syscall number
    ; rdi = arg1
    ; rsi = arg2
    ; rdx = arg3

    ; 1. Print the text/code segment
    ; write(STDOUT_FILENO, _start, len_code)
    mov  rax, 1             ; syscall number for 'write'
    mov  rdi, 1             ; file descriptor 1 (STDOUT)
    mov  rsi, _start        ; address of code to write
    mov  rdx, len_code      ; length of code segment
    syscall                 ; Execute the system call

    ; 2. Print the data segment
    ; write(STDOUT_FILENO, msg, len_data)
    mov  rax, 1             ; syscall number for 'write'
    mov  rdi, 1             ; file descriptor 1 (STDOUT)
    mov  rsi, msg           ; address of data to write
    mov  rdx, len_data      ; length of data segment
    syscall                 ; Execute the system call

    ; 3. Exit the program
    ; exit(0)
    mov  rax, 60            ; syscall number for 'exit'
    xor  rdi, rdi           ; exit code 0
    syscall                 ; Execute the system call

; The code length needs to be manually calculated.
; This is the length of the instructions from _start to here (len_code).
len_code equ $ - _start 

section .data
msg db 'section .text', 10, '    global _start', 10, 10
msg db '_start:', 10, '    mov  rax, 1', 10, '    mov  rdi, 1', 10
msg db '    mov  rsi, _start', 10, '    mov  rdx, len_code', 10, '    syscall', 10, 10
msg db '    mov  rax, 1', 10, '    mov  rdi, 1', 10, '    mov  rsi, msg', 10
msg db '    mov  rdx, len_data', 10, '    syscall', 10, 10
msg db '    mov  rax, 60', 10, '    xor  rdi, rdi', 10, '    syscall', 10, 10
msg db 'len_code equ $ - _start', 10, 10, 'section .data', 10
msg db 'msg db ', 39, 'section .text', 39, ', 10, ', 39, '    global _start', 39, ', 10, 10', 10
msg db 'msg db ', 39, '_start:', 39, ', 10, ', 39, '    mov  rax, 1', 39, ', 10, ', 39, '    mov  rdi, 1', 39, ', 10', 10
msg db 'msg db ', 39, '    mov  rsi, _start', 39, ', 10, ', 39, '    mov  rdx, len_code', 39, ', 10, ', 39, '    syscall', 39, ', 10, 10', 10
msg db 'msg db ', 39, '    mov  rax, 1', 39, ', 10, ', 39, '    mov  rdi, 1', 39, ', 10, ', 39, '    mov  rsi, msg', 39, ', 10', 10
msg db 'msg db ', 39, '    mov  rdx, len_data', 39, ', 10, ', 39, '    syscall', 39, ', 10, 10', 10
msg db 'msg db ', 39, '    mov  rax, 60', 39, ', 10, ', 39, '    xor  rdi, rdi', 39, ', 10, ', 39, '    syscall', 39, ', 10, 10', 10
msg db 'msg db ', 39, 'len_code equ $ - _start', 39, ', 10, 10, ', 39, 'section .data', 39, ', 10', 10
msg db 'msg db ', 39
len_data equ $ - msg