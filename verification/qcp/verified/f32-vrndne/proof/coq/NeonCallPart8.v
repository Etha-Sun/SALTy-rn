From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart8.
Lemma proof_of_test_neon_safety_wit_9 : Rndne.neon_unit_goal.test_neon_safety_wit_9.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_9;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_25 : Rndne.neon_unit_goal.test_neon_safety_wit_25.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_25;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_41 : Rndne.neon_unit_goal.test_neon_safety_wit_41.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_41;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_7 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_7;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_23;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; sep_apply_l_atomic (float_undef_open4 output (Z.quot batch 4)); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;try replace (output+0*4) with output by lia;rndne_kernel_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_39;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_55 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_55.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_55;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_71 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_71.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_71;rndne_kernel_finish. Qed.
End CheckedNeonCallPart8.
