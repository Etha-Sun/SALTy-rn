.text
.globl nested
.type nested, @function
nested:
    li a0, 0
    li t0, 3
outer:
    li t1, 4
inner:
    addi a0, a0, 1
    addi t1, t1, -1
    bnez t1, inner
    addi t0, t0, -1
    bnez t0, outer
    ret
.size nested, .-nested
