global _start

; section .data
section .text
_start:
    mov     rax, 60
    mov     rdi, 1
    syscall
