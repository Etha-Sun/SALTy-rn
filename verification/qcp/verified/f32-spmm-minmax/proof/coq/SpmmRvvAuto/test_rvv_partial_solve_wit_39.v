From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import ColumnFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_39 : test_rvv_partial_solve_wit_39.
Proof.
 unfold test_rvv_partial_solve_wit_39;intros.
 spmm_entry_normalize.
 (timeout 300 spmm_fast_frame).
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_39.
