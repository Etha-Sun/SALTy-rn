From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart9.
Lemma proof_of_test_rvv_safety_wit_10 : Rndne.rvv_unit_goal.test_rvv_safety_wit_10.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_safety_wit_10;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_9.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_9;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_20_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_20_pure;rndne_rvv_finish. Qed.
End CheckedRvvCallPart9.
