global main

extern sprintf
extern fprintf
extern fopen
extern fclose
extern system
extern strcmp
extern exit

section .rodata
code db "global main%1$c%1$cextern sprintf%1$cextern fprintf%1$cextern fopen%1$cextern fclose%1$cextern system%1$cextern strcmp%1$cextern exit%1$c%1$csection .rodata%1$ccode db %2$c%3$s%2$c, 0%1$cNEWLINE equ 10%1$cQUOTE equ 34%1$csrcTemplate db %2$cSully_%%d.s%2$c, 0%1$cobjTemplate db %2$cSully_%%d.o%2$c, 0%1$cexecTemplate db %2$cSully_%%d%2$c, 0%1$ccurrentFile db __FILE__, 0%1$copenPerm db %2$cw%2$c, 0%1$cexecCmdTemplate db %2$cnasm -f elf64 %%s && gcc -no-pie -o %%s %%s%2$c, 0%1$crunCmdTemplate db %2$c./%%s%2$c, 0%1$c%1$csection .data%1$ci dq %4$d%1$cRUN_CMD times 100 db 0%1$cCOMPILE_CMD times 100 db 0%1$cobjFilename times 100 db 0%1$csrcFilename times 100 db 0%1$cexecFilename times 100 db 0%1$ccurrentFilename times 100 db 0%1$c%1$csection .text%1$cmain:%1$cpush rbp%1$cmov rbp, rsp%1$cpush r12%1$cpush r13%1$cmov r12, qword[rel i]%1$c%1$ccmp r12, 0%1$cjle exit_zero%1$c%1$clea rdi, [rel currentFilename]%1$clea rsi, [rel srcTemplate]%1$cmov rdx, r12%1$ccall sprintf%1$c%1$clea rdi, [rel currentFilename]%1$clea rsi, [rel currentFile]%1$ccall strcmp%1$ctest rax, rax%1$cjnz createSrcName%1$cdec r12%1$c%1$ccreateSrcName:%1$clea rdi, [rel srcFilename]%1$clea rsi, [rel srcTemplate]%1$cmov rdx, r12%1$ccall sprintf%1$c%1$ccreateFile:%1$clea rdi, [rel srcFilename]%1$clea rsi, [rel openPerm]%1$ccall fopen%1$ctest rax, rax%1$cjz exit_error%1$cmov r13, rax%1$c%1$cmov rdi, r13%1$clea rsi, [rel code]%1$cmov rdx, NEWLINE%1$cmov rcx, QUOTE%1$clea r8, [rel code]%1$cmov r9, r12%1$ccall fprintf%1$c%1$cmov rdi, r13%1$ccall fclose%1$c%1$ccreateExecName:%1$clea rdi, [rel execFilename]%1$clea rsi, [rel execTemplate]%1$cmov rdx, r12%1$ccall sprintf%1$c%1$ccreateObjName:%1$clea rdi, [rel objFilename]%1$clea rsi, [rel objTemplate]%1$cmov rdx, r12%1$ccall sprintf%1$c%1$ccreateRuneCmd:%1$clea rdi, [rel RUN_CMD]%1$clea rsi, [rel runCmdTemplate]%1$clea rdx, [rel execFilename]%1$ccall sprintf%1$c%1$ccreateCompileCmd:%1$clea rdi, [rel COMPILE_CMD]%1$clea rsi, [rel execCmdTemplate]%1$clea rdx, [rel srcFilename]%1$clea rcx, [rel execFilename]%1$clea r8, [rel objFilename]%1$ccall sprintf%1$c%1$clea rdi, [rel COMPILE_CMD]%1$ccall system%1$c%1$clea rdi, [rel RUN_CMD]%1$ccall system%1$c%1$cexit_zero:%1$cpop r13%1$cpop r12%1$cleave%1$cmov edi, 0%1$ccall exit%1$c%1$cexit_error:%1$cpop r13%1$cpop r12%1$cleave%1$cmov edi, 1%1$ccall exit%1$c", 0
NEWLINE equ 10
QUOTE equ 34
srcTemplate db "Sully_%d.s", 0
objTemplate db "Sully_%d.o", 0
execTemplate db "Sully_%d", 0
currentFile db __FILE__, 0
openPerm db "w", 0
execCmdTemplate db "nasm -f elf64 %s && gcc -no-pie -o %s %s", 0
runCmdTemplate db "./%s", 0

section .data
i dq 5
RUN_CMD times 100 db 0
COMPILE_CMD times 100 db 0
objFilename times 100 db 0
srcFilename times 100 db 0
execFilename times 100 db 0
currentFilename times 100 db 0

section .text
main:
push rbp
mov rbp, rsp
push r12
push r13
mov r12, qword[rel i]

cmp r12, 0
jle exit_zero

lea rdi, [rel currentFilename]
lea rsi, [rel srcTemplate]
mov rdx, r12
call sprintf

lea rdi, [rel currentFilename]
lea rsi, [rel currentFile]
call strcmp
test rax, rax
jnz createSrcName
dec r12

createSrcName:
lea rdi, [rel srcFilename]
lea rsi, [rel srcTemplate]
mov rdx, r12
call sprintf

createFile:
lea rdi, [rel srcFilename]
lea rsi, [rel openPerm]
call fopen
test rax, rax
jz exit_error
mov r13, rax

mov rdi, r13
lea rsi, [rel code]
mov rdx, NEWLINE
mov rcx, QUOTE
lea r8, [rel code]
mov r9, r12
call fprintf

mov rdi, r13
call fclose

createExecName:
lea rdi, [rel execFilename]
lea rsi, [rel execTemplate]
mov rdx, r12
call sprintf

createObjName:
lea rdi, [rel objFilename]
lea rsi, [rel objTemplate]
mov rdx, r12
call sprintf

createRuneCmd:
lea rdi, [rel RUN_CMD]
lea rsi, [rel runCmdTemplate]
lea rdx, [rel execFilename]
call sprintf

createCompileCmd:
lea rdi, [rel COMPILE_CMD]
lea rsi, [rel execCmdTemplate]
lea rdx, [rel srcFilename]
lea rcx, [rel execFilename]
lea r8, [rel objFilename]
call sprintf

lea rdi, [rel COMPILE_CMD]
call system

lea rdi, [rel RUN_CMD]
call system

exit_zero:
pop r13
pop r12
leave
mov edi, 0
call exit

exit_error:
pop r13
pop r12
leave
mov edi, 1
call exit
