  .text
  .globl _start
_start:
  /* QEMU user mode provides the stack and enables vector state. */
  call check_assembly
  li a7, 93                    /* Linux exit(status). */
  ecall
1:
  j 1b

  .globl write_message
write_message:
  mv a2, a1                    /* count */
  mv a1, a0                    /* buffer */
  li a0, 1                     /* stdout */
  li a7, 64                    /* Linux write(fd, buffer, count). */
  ecall
  ret
