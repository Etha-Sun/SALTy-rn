From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import ColumnFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_9_4 : test_rvv_entail_wit_9_4.
Proof.
 unfold test_rvv_entail_wit_9_4;right;intros.
 timeout 120 (spmm_column_finish output_pre rows nc_pre output_stride_pre m n vl start NN D A W lo hi).
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_9_4.
