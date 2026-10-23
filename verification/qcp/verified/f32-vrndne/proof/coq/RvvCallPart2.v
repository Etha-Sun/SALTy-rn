From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart2.
Lemma proof_of_test_rvv_safety_wit_3 : Rndne.rvv_unit_goal.test_rvv_safety_wit_3.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_safety_wit_3;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_4.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_4, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_4_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_15 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_15.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_15;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_27 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_27.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_27;rndne_rvv_finish. Qed.
End CheckedRvvCallPart2.
