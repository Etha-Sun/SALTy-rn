Require Import isla.riscv64.riscv64.
Lemma instr_pre_consume `{!islaG Σ} `{!threadG} l a (P : iProp Σ) :
  (P -∗ instr_body a emp) ⊢ instr_pre' l a P.
Proof.
  rewrite instr_pre'_eq. iIntros "H !> HP".
  iApply ("H" with "HP []"). done.
Qed.
Print Assumptions instr_pre_consume.
