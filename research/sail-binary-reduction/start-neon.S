/* Linux user-mode entry: QEMU validation only, not an Arm Sail platform. */
.section .text.init
.globl _start
_start:
  bl check_kernel
  mov x8, #93
  svc #0
