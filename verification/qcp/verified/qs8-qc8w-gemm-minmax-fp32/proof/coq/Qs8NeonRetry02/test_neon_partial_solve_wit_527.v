From Coq Require Import ZArith List Lia Strings.String.
From Qs8NeonGoals Require Import G1105.
From Qs8Gemm Require Import KernelFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked:test_neon_partial_solve_wit_527.
Proof.
 unfold test_neon_partial_solve_wit_527;intros;qs8_normalize2;qs8_domain_facts.
 qs8_layout;repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - qs8_pure2.
 - qs8_forget_cells;opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions checked.
