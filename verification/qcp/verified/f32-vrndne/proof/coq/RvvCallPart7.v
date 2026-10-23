From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart7.
Lemma proof_of_test_rvv_safety_wit_8 : Rndne.rvv_unit_goal.test_rvv_safety_wit_8.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_safety_wit_8;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_8_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_8_pure;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_18 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_18.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_18, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_18_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_30 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_30.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_30, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_30_aux;rndne_rvv_finish. Qed.
End CheckedRvvCallPart7.
