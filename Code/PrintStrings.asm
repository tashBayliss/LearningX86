section .data
    text db "shalom jackie, you look nice today", 10, 0     ; end with 0 - count until it hits 0
    text2 db "another text", 10, 0

section .text 
    global _start


_start:
    mov rax, text
    call _print

    mov rax, text2
    call _print

    mov rax, 60
    mov rdi, 0
    syscall




; input to rax - pointer to string 
; output print string at rax

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

