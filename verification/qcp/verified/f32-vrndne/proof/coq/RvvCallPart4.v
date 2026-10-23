From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart4.
Lemma proof_of_test_rvv_safety_wit_5 : Rndne.rvv_unit_goal.test_rvv_safety_wit_5.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_safety_wit_5;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_6_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_6_pure;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_16, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_16_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_28 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_28.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_28, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_28_aux;rndne_rvv_finish. Qed.
End CheckedRvvCallPart4.
