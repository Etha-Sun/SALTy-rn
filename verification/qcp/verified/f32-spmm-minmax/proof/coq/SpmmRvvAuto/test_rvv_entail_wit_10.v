From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import ColumnFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_10 : test_rvv_entail_wit_10.
Proof.
 unfold test_rvv_entail_wit_10;right;intros;spmm_normalize2.
 rewrite spmm_output_advance by lia.
 replace(rows-m+vl)with(rows-(m-vl))by lia.
 spmm_frame2.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_10.
