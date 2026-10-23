From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart3.
Lemma proof_of_test_rvv_safety_wit_4 : Rndne.rvv_unit_goal.test_rvv_safety_wit_4.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_safety_wit_4;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_5.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_5;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_16_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_16_pure;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_28_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_28_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_28_pure;rndne_rvv_finish. Qed.
End CheckedRvvCallPart3.
