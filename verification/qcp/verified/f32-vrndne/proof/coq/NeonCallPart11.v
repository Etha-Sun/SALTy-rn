From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart11.
Lemma proof_of_test_neon_safety_wit_12 : Rndne.neon_unit_goal.test_neon_safety_wit_12.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_12;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_28 : Rndne.neon_unit_goal.test_neon_safety_wit_28.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_28;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_44 : Rndne.neon_unit_goal.test_neon_safety_wit_44.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_44;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_10.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_10;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_26;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; sep_apply_l_atomic (float_full_open4 input (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold fp32_slice;rndne_kernel_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_42;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_58 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_58.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_58;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_74 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_74.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_74;rndne_kernel_finish. Qed.
End CheckedNeonCallPart11.
