; Comment Outside main function

global main
extern printf

section .data
code_str db "; Comment Outside main function%1$c%1$cglobal main%1$cextern printf%1$c%1$csection .data%1$ccode_str db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cmain:%1$cpush rbp%1$cmov rbp, rsp%1$clea rdi, [rel code_str]%1$c; Comment Inside main function%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel code_str]%1$ccall printf%1$cpop rbp%1$cret%1$c", 0

section .text
main:
push rbp
mov rbp, rsp
lea rdi, [rel code_str]
; Comment Inside main function
mov rsi, 10
mov rdx, 34
lea rcx, [rel code_str]
call printf
pop rbp
ret
