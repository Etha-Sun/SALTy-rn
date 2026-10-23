From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart13.
Lemma proof_of_test_rvv_partial_solve_wit_2_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_12_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_12_pure;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_23 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_23.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_23;rndne_rvv_finish. Qed.
End CheckedRvvCallPart13.
