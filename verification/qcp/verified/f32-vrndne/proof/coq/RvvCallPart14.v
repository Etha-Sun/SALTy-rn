From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import RvvSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallPart14.
Lemma proof_of_test_rvv_partial_solve_wit_2 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_2.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_2, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_2_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12 : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_12.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_12, Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_12_aux;rndne_rvv_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_24_pure : Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_24_pure.
Proof. unfold Rndne.rvv_unit_goal.test_rvv_partial_solve_wit_24_pure;rndne_rvv_finish. Qed.
End CheckedRvvCallPart14.
