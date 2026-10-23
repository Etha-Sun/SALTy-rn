From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart9.
Lemma proof_of_test_neon_safety_wit_10 : Rndne.neon_unit_goal.test_neon_safety_wit_10.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_10;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_26 : Rndne.neon_unit_goal.test_neon_safety_wit_26.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_26;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_42 : Rndne.neon_unit_goal.test_neon_safety_wit_42.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_42;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_8;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; sep_apply_l_atomic (float_full_open4 input (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold fp32_slice;rndne_kernel_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_24.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_24;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; sep_apply_l_atomic (float_full_open4 input (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold fp32_slice;rndne_kernel_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_40.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_40;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_56 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_56.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_56;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_72 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_72.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_72;rndne_kernel_finish. Qed.
End CheckedNeonCallPart9.
