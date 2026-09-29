/* Bare-metal entry for Sail's HTIF test platform. */
.file "sail-demo-start.S"
.section .text.init
.globl _start
_start:
  la sp, stack_top
  /* Enable floating-point/vector state before executing vector instructions. */
  li t0, 0x6600
  csrs mstatus, t0
  call check_rvv
  /* HTIF exit: (exit_code << 1) | 1. */
  slli a0, a0, 1
  ori a0, a0, 1
  la t0, tohost
  sd a0, 0(t0)
1:
  j 1b

.section .tohost,"aw",@progbits
.balign 8
.globl tohost
tohost: .dword 0
.globl fromhost
fromhost: .dword 0

.section .data.stack,"aw",@progbits
.balign 16
  .fill 4096, 1, 0
stack_top:
