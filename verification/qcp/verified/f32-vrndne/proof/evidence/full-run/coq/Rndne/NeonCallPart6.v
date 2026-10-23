From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart6.
Lemma proof_of_test_neon_safety_wit_7 : Rndne.neon_unit_goal.test_neon_safety_wit_7.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_7;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_23 : Rndne.neon_unit_goal.test_neon_safety_wit_23.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_23;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_39 : Rndne.neon_unit_goal.test_neon_safety_wit_39.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_39;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_5;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_21.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_21;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_37.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_37;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_53 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_53.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_53;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_69 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_69.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_69;rndne_kernel_finish. Qed.
End CheckedNeonCallPart6.
