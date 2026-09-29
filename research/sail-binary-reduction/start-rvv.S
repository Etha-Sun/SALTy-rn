.section .text.init
.globl _start
_start:
  la sp, stack_top
  li t0, 0x6600
  csrs mstatus, t0
  call check_kernel
  slli a0, a0, 1
  ori a0, a0, 1
  la t0, tohost
  sd a0, 0(t0)
1: j 1b
.section .tohost,"aw",@progbits
.balign 8
.globl tohost
tohost: .dword 0
.globl fromhost
fromhost: .dword 0
.section .bss.stack,"aw",@nobits
.balign 16
.skip 16384
stack_top:
