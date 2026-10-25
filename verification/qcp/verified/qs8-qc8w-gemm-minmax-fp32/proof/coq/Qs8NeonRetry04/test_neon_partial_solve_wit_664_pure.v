From Coq Require Import ZArith List Lia Strings.String.
From Qs8NeonGoals Require Import G1454.
From Qs8Gemm Require Import NeonMemory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked:test_neon_partial_solve_wit_664_pure.
Proof.
 unfold test_neon_partial_solve_wit_664_pure;try right;intros;qs8_normalize2;qs8_domain_facts.
 try(qs8_neon_tail_facts nc).
 qs8_neon_pure.
Qed.
Print Assumptions checked.
