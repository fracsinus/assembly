global _start

section .data
    buf     db  '*', 10

section .text
_start:
    mov         r12, 0          ; loop counter

loop:
    inc         r12             ; increase counter by 1

    mov         rax, 1          ; write() syscall
    mov         rdi, 1          ; STDOUT
    mov         rsi, buf        ; pointer
    mov         rdx, 14         ; length
    syscall

    cmp         r12, 5          ; check loop counter
    jl          loop            ; jump if count is less than 5

end:

    mov         rax, 60         ; exit() syscall
    mov         rdi, 0          ; exit code 0
    syscall
