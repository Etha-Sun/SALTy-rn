From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart12.
Lemma proof_of_test_neon_safety_wit_13 : Rndne.neon_unit_goal.test_neon_safety_wit_13.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_13;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_29 : Rndne.neon_unit_goal.test_neon_safety_wit_29.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_29;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_45 : Rndne.neon_unit_goal.test_neon_safety_wit_45.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_45;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_11.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_11;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_27.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_27;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_43;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_59 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_59.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_59;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_75 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_75.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_75;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;try replace (output+0*4) with output by lia;rndne_kernel_frame]. Qed.
End CheckedNeonCallPart12.
