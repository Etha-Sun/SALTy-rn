From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart14.
Lemma proof_of_test_neon_safety_wit_15 : Rndne.neon_unit_goal.test_neon_safety_wit_15.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_15;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_31 : Rndne.neon_unit_goal.test_neon_safety_wit_31.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_31;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1_pure : Rndne.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_1_pure;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_13.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_13;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_29;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_45 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_45.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_45;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_61 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_61.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_61;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_77 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_77.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_77;rndne_kernel_finish. Qed.
End CheckedNeonCallPart14.
