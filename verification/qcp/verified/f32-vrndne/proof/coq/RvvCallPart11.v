From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart11.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_10, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_10_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_21.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_21;rndne_rvv_finish. Qed.
End CheckedRvvCallPart11.
