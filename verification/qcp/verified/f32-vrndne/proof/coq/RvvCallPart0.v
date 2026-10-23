From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart0.
Lemma proof_of_test_rvv_safety_wit_1 : Rndne.rvv_unit_goal.test_rvv_safety_wit_1.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_safety_wit_1;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_3.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_3, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_3_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_14_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_14_pure;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_25 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_25.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_25;rndne_rvv_finish. Qed.
End CheckedRvvCallPart0.
