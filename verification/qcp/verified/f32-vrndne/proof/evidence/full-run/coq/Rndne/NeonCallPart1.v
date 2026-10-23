From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart1.
Lemma proof_of_test_neon_safety_wit_2 : Rndne.neon_unit_goal.test_neon_safety_wit_2.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_2;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_18 : Rndne.neon_unit_goal.test_neon_safety_wit_18.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_18;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_34 : Rndne.neon_unit_goal.test_neon_safety_wit_34.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_34;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_2, Rndne.neon_unit_goal.test_neon_partial_solve_wit_2_aux;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_16.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_16;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_32.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_32;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_48 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_48.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_48;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_64 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_64.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_64;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_80 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_80.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_80;rndne_kernel_finish. Qed.
End CheckedNeonCallPart1.
