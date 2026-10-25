From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import ColumnFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_return_wit_1 : test_rvv_return_wit_1.
Proof.
 unfold test_rvv_return_wit_1;right;intros.
 assert(m=0)by lia;subst m;spmm_normalize2.
 spmm_frame2.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_return_wit_1.
