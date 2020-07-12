section .data                   ; defines variables
    text1 db "what is your name? "
    text2 db "Hello, "

section .bss                    ; section to reserve data
    name resb 16                ; reseves 16 bytes of space called name

section .text 
    global _start

_start:
    call _printText1
    call _getName
    call _printText2
    call _printName

    mov rax, 60
    mov rdi, 0
    syscall

_getName:
    mov rax, 0                  ; get user input
    mov rdi, 0                  ; std in
    mov rsi, name
    mov rdx, 16
    syscall
    ret


_printText1:
    mov rax, 1                  ; output
    mov rdi, 1                  ; to std out
    mov rsi, text1
    mov rdx, 19                 ; length of text 1
    syscall
    ret                         ; always end in ret

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 7                  ; length of text 2
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret

