.global _start

.section .data
msg:
    .ascii "Hello, world!\n"

.section .text

_start:
    mov     $1, %rax           # write() syscall
    mov     $1, %rdi           # file descriptor
    lea     msg(%rip), %rsi    # pointer
    mov     $14, %rdx          # size
    syscall

    mov     $60, %rax          # exit() syscall
    mov     $0, %rdi           # exit code
    syscall
