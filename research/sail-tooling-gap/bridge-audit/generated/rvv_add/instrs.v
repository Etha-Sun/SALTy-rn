Require Import isla.isla_lang.
Require Export Bridge.rvv_add.a800001d6.

Definition instr_map := [
  (0x800001d6%Z, a800001d6 (* vadd.vv v8,v8,v16 *))
].
