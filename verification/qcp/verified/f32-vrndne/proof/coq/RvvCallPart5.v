From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart5.
Lemma proof_of_test_rvv_safety_wit_6 : Rndne.rvv_unit_goal.test_rvv_safety_wit_6.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_safety_wit_6;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_6.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_6, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_6_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_17.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_17;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_29 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_29.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_29;rndne_rvv_finish. Qed.
End CheckedRvvCallPart5.
