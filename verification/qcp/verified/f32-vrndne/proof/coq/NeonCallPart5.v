From Coq Require Import ZArith Lia List.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From Rndne Require Import KernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCallPart5.
Lemma proof_of_test_neon_safety_wit_6 : Rndne.neon_unit_goal.test_neon_safety_wit_6.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_6;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_22 : Rndne.neon_unit_goal.test_neon_safety_wit_22.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_22;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_38 : Rndne.neon_unit_goal.test_neon_safety_wit_38.
Proof. unfold Rndne.neon_unit_goal.test_neon_safety_wit_38;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_4.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_4, Rndne.neon_unit_goal.test_neon_partial_solve_wit_4_aux;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_20;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_36.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_36;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_52 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_52.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_52;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_68 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_68.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_68;rndne_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82 : Rndne.neon_unit_goal.test_neon_partial_solve_wit_82.
Proof. unfold Rndne.neon_unit_goal.test_neon_partial_solve_wit_82, Rndne.neon_unit_goal.test_neon_partial_solve_wit_82_aux;intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; sep_apply_l_atomic (float_undef_open1 output (Z.quot batch 4)); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;try replace (output+0*4) with output by lia;rndne_kernel_frame]. Qed.
End CheckedNeonCallPart5.
