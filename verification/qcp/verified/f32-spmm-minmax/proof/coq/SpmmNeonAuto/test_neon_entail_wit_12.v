From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonClosure.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_12 : test_neon_entail_wit_12.
Proof.
 unfold test_neon_entail_wit_12;left;intros.
 spmm_shape_facts.
 pose proof(spmm_input_remaining_step rows nc_pre start NN D A W(nc_pre-n)(Znth(nc_pre-n)NN 0)(rows-Z.quot mc 4)a ltac:(assumption) ltac:(lia) ltac:(unfold z_at,Znth in *;lia) ltac:(lia) ltac:(lia) ltac:(lia))as Hstep.
 spmm_extra_normalize;rewrite ?spmm_z_get in *.
 rewrite !spmm_neon_remaining_step by lia.
 rewrite ?spmm_input_row_add.
 unfold spmm_get;spmm_normalize;rewrite ?spmm_acc_zero.
 spmm_layout;repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];try lia.
   rewrite !(Z.mul_comm 4) in Hstep.
   exact Hstep.
 - spmm_cancel2.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_12.
