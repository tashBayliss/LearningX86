; to finish

section .data                   ; defines variables
    text1 db "Please enter your IP address: ", 10, 0
    text2 db "You entered the IP address: ", 10, 0

section .bss                    ; section to reserve data
    ipA resb 4                 ; reseves 4 bytes of space called ipA

section .text 
    global _start

_start:
    mov rax, text1
    call _print

    call _getIPa
    call _printIPa

    mov rax, text2
    call _print

    mov rax, 60
    mov rdi, 0
    syscall

_getIPa:
    mov rax, 0                  ; get user input
    mov rdi, 0                  ; std in
    mov rsi, ipA
    mov rdx, 4
    syscall
    ret

_printIPa:
    mov rax, 1
    mov rdi, 1
    mov rsi, ipA
    mov rdx, 4
    syscall
    ret

_print:
    push rax
    mov rbx, 0

_printLoop:
    inc rax                                                 ; increment 
    inc rbx
    mov cl, [rax]                                           ; cl is 8 bit version of rcx - address of next letter

    cmp cl, 0                                               ; compare to 0
    jne _printLoop                                          ; loop when not equal to

    mov rax,1
    mov rdi, 1
    pop rsi 

    mov rdx, rbx                                            ; move count
    syscall

    ret

