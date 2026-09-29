Require Import isla.isla_lang.
Require Export Kernel.rvv.a800001f4.

Definition instr_map := [
  (0x800001f4%Z, a800001f4 (* sw a5,0(a2) *))
].
