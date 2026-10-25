From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import Automation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_151_pure:rvv_goal.test_rvv_partial_solve_wit_151_pure.
Proof.
 unfold test_rvv_partial_solve_wit_151_pure;try left;intros;spmm_normalize.
 timeout 60 (solve [spmm_pure|spmm_frame|unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;spmm_frame|entailer!;try spmm_pure]).
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_151_pure.
