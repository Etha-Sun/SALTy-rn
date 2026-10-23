From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart13.
Lemma proof_of_test_neon_safety_wit_14 : Rndne.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_14;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_30 : Rndne.neon_unit_goal.test_neon_safety_wit_30.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_30;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_46 : Rndne.neon_unit_goal.test_neon_safety_wit_46.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_46;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_12.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_12;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_28.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_28;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_44.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_44;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_60 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_60.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_60;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_76 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_76.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_76;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;try replace (output+0*4) with output by lia;rndne_kernel_frame]. Qed.
End CheckedNeonCallPart13.
