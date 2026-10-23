From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart3.
Lemma proof_of_test_neon_safety_wit_4 : Rndne.neon_unit_goal.test_neon_safety_wit_4.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_4;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_20 : Rndne.neon_unit_goal.test_neon_safety_wit_20.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_20;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_36 : Rndne.neon_unit_goal.test_neon_safety_wit_36.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_36;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_3.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_3, Rndne.neon_unit_goal.test_neon_partial_solve_wit_3_aux;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_18.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_18;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_34;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_50 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_50.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_50;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_66 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_66.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_66;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_81 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_81.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_81, Rndne.neon_unit_goal.test_neon_partial_solve_wit_81_aux;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; rewrite (FloatArray.undef_seg_unfold output 2 (Z.quot batch 4) ltac:(lia));unfold StoreFloatAsElement.undefstoreA;rndne_kernel_frame. Qed.
End CheckedNeonCallPart3.
