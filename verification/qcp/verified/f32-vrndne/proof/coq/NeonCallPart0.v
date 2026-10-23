From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart0.
Lemma proof_of_test_neon_safety_wit_1 : Rndne.neon_unit_goal.test_neon_safety_wit_1.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_1;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_17 : Rndne.neon_unit_goal.test_neon_safety_wit_17.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_17;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_33 : Rndne.neon_unit_goal.test_neon_safety_wit_33.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_33;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2_pure : Rndne.neon_unit_goal.test_neon_partial_solve_wit_2_pure.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_2_pure;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_15.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_15;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_31;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_47 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_47.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_47;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_63 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_63.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_63;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_79 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_79.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_79;rndne_kernel_finish. Qed.
End CheckedNeonCallPart0.
