From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart2.
Lemma proof_of_test_neon_safety_wit_3 : Rndne.neon_unit_goal.test_neon_safety_wit_3.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_3;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_19 : Rndne.neon_unit_goal.test_neon_safety_wit_19.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_19;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_35 : Rndne.neon_unit_goal.test_neon_safety_wit_35.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_35;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3_pure : Rndne.neon_unit_goal.test_neon_partial_solve_wit_3_pure.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_3_pure;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_17.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_17;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_33.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_33;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_49 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_49.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_49;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_65 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_65;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_81_pure : Rndne.neon_unit_goal.test_neon_partial_solve_wit_81_pure.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_81_pure;rndne_kernel_finish. Qed.
End CheckedNeonCallPart2.
