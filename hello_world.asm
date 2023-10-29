global _start

section .data
msg:
    db "Hello, world!", 10      ; 10 for a newline character

section .text

_start:
    mov         rax, 1          ; write() syscall
    mov         rdi, 1          ; file descriptor
    mov         rsi, msg        ; pointer
    mov         rdx, 14         ; size
    syscall

    mov         rax, 60         ; exit() syscall
    mov         rdi, 0          ; exit code
    syscall
