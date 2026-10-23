From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart12.
Lemma proof_of_test_rvv_partial_solve_wit_1 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_1.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_1, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_1_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_11.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_11;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_22 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_22.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_22;rndne_rvv_finish. Qed.
End CheckedRvvCallPart12.
