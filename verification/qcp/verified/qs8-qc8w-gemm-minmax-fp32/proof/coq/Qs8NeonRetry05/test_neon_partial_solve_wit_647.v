From Coq Require Import ZArith List Lia Strings.String.
From Qs8NeonGoals Require Import G1341.
From Qs8Gemm Require Import NeonMemory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked:test_neon_partial_solve_wit_647.
Proof.
 unfold test_neon_partial_solve_wit_647,test_neon_partial_solve_wit_647_aux;try right;intros;qs8_normalize2;qs8_domain_facts.
 try(qs8_neon_tail_facts nc).
 repeat match goal with H:Z.land _ _ = _ |- _ => progress rewrite H end.
 rewrite ?Z.add_0_r,?Z.add_0_l.
 unfold qs8_output_prefix.
 qs8_neon_frame.
Qed.
Print Assumptions checked.
