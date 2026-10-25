From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonClosure.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_13 : test_neon_entail_wit_13.
Proof.
 unfold test_neon_entail_wit_13;right;intros.
 spmm_normalize2;rewrite ?spmm_z_get in *;spmm_normalize2;spmm_shape_facts.
 block_close.
 replace(nc_pre-(n-1))with((nc_pre-n)+1)by lia.
 rewrite spmm_output_cursor_next,spmm_next_nnz_index,next_bias_index by lia.
 rewrite ?spmm_z_get;
 try match goal with H:z_at ?NN ?c=0 |- _ => rewrite H end;
 spmm_normalize2;spmm_fast_frame_neon.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_13.
