section .text
    global _start

_start:
    mov edx, len        ; message length into edx (general purpose reg)
    mov ecx, msg        ; put message into ecx
    mov ebx, 1          ; file descriptor (std out)
    mov eax, 4          ; call number (sys write)
    int 0x80            ; call kernel

    mov eax, 1          ; sys exit
    int 0x80            ; call kernel

section .data
    msg db 'Hello, World!', 0xa         ; string to be printed
    len equ $ - msg                     ; length of the string
