OUTPUT_ARCH(riscv)
ENTRY(_start)
PHDRS { text PT_LOAD FLAGS(5); data PT_LOAD FLAGS(6); }
SECTIONS {
  . = 0x80000000;
  .text : { *(.text.init) *(.text .text.*) } :text
  . = ALIGN(0x1000);
  .rodata : { *(.rodata .rodata.*) } :data
  .data : { *(.data .data.*) *(.sdata .sdata.*) } :data
  .tohost : { *(.tohost) } :data
  .bss : { *(.bss .bss.*) *(.sbss .sbss.*) *(COMMON) } :data
}
