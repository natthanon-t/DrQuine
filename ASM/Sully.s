section .data
    mode_w db "w", 0

    code db ';%c%c%c%s%d', 0   ; Format string matches fprintf arguments

    fileName times 100 db 0
    execCmd times 100 db 0
    currentFile times 100 db 0
    runCmd times 100 db 0

    fmt_currentFile db "Sully_%d.s", 0
    fmt_fileName db "Sully_%d.s", 0
    fmt_execCmd db "nasm -f elf64 Sully_%d.s && ld -o Sully_%d Sully_%d.o", 0
    fmt_runCmd db "./Sully_%d", 0

    i dd 5

section .bss
    f resq 1

section .text
    global main
    extern fopen
    extern fclose
    extern fprintf
    extern sprintf
    extern strcmp
    extern system
    extern exit

main:
    ; int i = 5
    mov eax, [rel i]
    cmp eax, 0
    jle .exit0

    ; sprintf(currentFile, "Sully_%d.s", i);
    lea rdi, [rel currentFile]
    lea rsi, [rel fmt_currentFile]
    mov edx, eax
    xor eax, eax
    call sprintf

    ; if (!strcmp(__FILE__, currentFile)) i--;
    lea rdi, [rel currentFile]  ; Simulate __FILE__ as current file
    lea rsi, [rel currentFile]
    call strcmp
    test eax, eax
    jne .skip_decrement
    dec dword [rel i]

.skip_decrement:
    ; sprintf(fileName, "Sully_%d.s", i);
    mov eax, [rel i]
    lea rdi, [rel fileName]
    lea rsi, [rel fmt_fileName]
    mov edx, eax
    xor eax, eax
    call sprintf

    ; FILE *f = fopen(fileName, "w");
    lea rdi, [rel fileName]
    lea rsi, [rel mode_w]
    call fopen
    test rax, rax
    jz .exit1
    mov [rel f], rax

    ; fprintf(f, code, 10, 9, 34, code, i);
    mov rdi, rax        ; FILE *f
    lea rsi, [rel code] ; format string
    mov rdx, 10         ; newline
    mov rcx, 9          ; tab
    mov r8, 34          ; double quote
    lea r9, [rel code]  ; code string
    mov rax, [rel i]    ; i
    sub rsp, 8          ; align stack for variadic call
    mov [rsp], rax      ; push i on stack
    xor eax, eax        ; no SSE args
    call fprintf
    add rsp, 8          ; restore stack

    ; fclose(f);
    mov rdi, [rel f]
    call fclose

    ; sprintf(execCmd, "nasm -f elf64 Sully_%d.s && ld -o Sully_%d Sully_%d.o", i, i, i);
    mov eax, [rel i]
    lea rdi, [rel execCmd]
    lea rsi, [rel fmt_execCmd]
    mov edx, eax
    mov ecx, eax
    mov r8d, eax
    xor eax, eax
    call sprintf

    ; system(execCmd);
    lea rdi, [rel execCmd]
    call system

    ; sprintf(runCmd, "./Sully_%d", i);
    mov eax, [rel i]
    lea rdi, [rel runCmd]
    lea rsi, [rel fmt_runCmd]
    mov edx, eax
    xor eax, eax
    call sprintf

    ; system(runCmd);
    lea rdi, [rel runCmd]
    call system

.exit0:
    xor edi, edi
    call exit

.exit1:
    mov edi, 1
    call exit
