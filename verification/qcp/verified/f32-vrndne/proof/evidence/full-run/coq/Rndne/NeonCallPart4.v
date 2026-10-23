From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart4.
Lemma proof_of_test_neon_safety_wit_5 : Rndne.neon_unit_goal.test_neon_safety_wit_5.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_5;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_21 : Rndne.neon_unit_goal.test_neon_safety_wit_21.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_21;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_37 : Rndne.neon_unit_goal.test_neon_safety_wit_37.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_37;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4_pure : Rndne.neon_unit_goal.test_neon_partial_solve_wit_4_pure.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_4_pure;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_19;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_35;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_51 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_51.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_51;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_67 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_67.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_67;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82_pure : Rndne.neon_unit_goal.test_neon_partial_solve_wit_82_pure.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_82_pure;rndne_kernel_finish. Qed.
End CheckedNeonCallPart4.
