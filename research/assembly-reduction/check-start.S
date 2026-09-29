.text
.globl _start
_start:
    call check_assembly
    li a7, 93
    ecall
.globl write_message
write_message:
    mv a2, a1
    mv a1, a0
    li a0, 1
    li a7, 64
    ecall
    ret
.section .note.GNU-stack,"",@progbits
