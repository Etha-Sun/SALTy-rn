Require Import isla.isla_lang.
Require Export Kernel.neon.a8000104c.

Definition instr_map := [
  (0x8000104c%Z, a8000104c (* ret *))
].
