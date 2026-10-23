From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart15.
Lemma proof_of_test_neon_safety_wit_16 : Rndne.neon_unit_goal.test_neon_safety_wit_16.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_16;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_32 : Rndne.neon_unit_goal.test_neon_safety_wit_32.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_32;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_1, Rndne.neon_unit_goal.test_neon_partial_solve_wit_1_aux;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_14;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_30;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_46 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_46.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_46;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_62 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_62.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_62;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_78 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_78.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_78;rndne_kernel_finish. Qed.
End CheckedNeonCallPart15.
