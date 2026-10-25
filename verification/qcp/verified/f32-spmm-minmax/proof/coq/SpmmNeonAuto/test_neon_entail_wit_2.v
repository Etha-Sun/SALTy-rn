From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonExtras.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_2 : test_neon_entail_wit_2.
Proof.

 unfold test_neon_entail_wit_2;left;intros.
 spmm_entry_normalize.
 match goal with H:spmm_capacity ?rows ?cols ?stride ?a ?w ?d ?n ?out ?NN ?D ?A ?W |- _ =>
 pose proof(spmm_capacity_out_bound rows cols stride a w d n out NN D A W H)as Hout end.
 rewrite spmm_output_cursor_start by lia.
 spmm_tuple_expand;spmm_layout;Intros;
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros;[spmm_pure2|].
 opaque_leaves;sepcon_assoc_change;fast_cancel.

Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_2.
