Require Import isla.isla_lang.
Require Export isla.examples.vset.a800001c6.

Definition instr_map := [
  (0x800001c6%Z, a800001c6 (* vsetvli a5,a0,e32,m8,tu,ma *))
].
