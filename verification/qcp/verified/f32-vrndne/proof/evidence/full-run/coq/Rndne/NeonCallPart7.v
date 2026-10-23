From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart7.
Lemma proof_of_test_neon_safety_wit_8 : Rndne.neon_unit_goal.test_neon_safety_wit_8.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_8;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_24 : Rndne.neon_unit_goal.test_neon_safety_wit_24.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_24;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_40 : Rndne.neon_unit_goal.test_neon_safety_wit_40.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_40;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_6 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_6.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_6;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_22;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_38.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_38;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_54 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_54.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_54;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_70 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_70.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_70;rndne_kernel_finish. Qed.
End CheckedNeonCallPart7.
