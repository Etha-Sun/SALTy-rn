Require Import isla.riscv64.riscv64 RvvTaggedCache.
Goal True.
Proof.
assert_fails (match goal with _ : vector_value_eq _ _ |- _ => idtac end).
idtac "assert-fails passed".
exact I.
Qed.
