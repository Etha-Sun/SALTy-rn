.text
.globl multiple_entry
.type multiple_entry, @function
multiple_entry:
    li t0, 5
    beqz a0, right
left:
    addi a1, a1, 1
    addi t0, t0, -1
    beqz t0, done
right:
    addi a1, a1, 2
    addi t0, t0, -1
    bnez t0, left
done:
    ret
.size multiple_entry, .-multiple_entry
