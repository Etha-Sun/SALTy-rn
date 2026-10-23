From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import NeonLoopBridge.
From QcpRvv32 Require Import RvvLayout.
From ByValue Require Import neon_unit_goal neon_copy_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module NeonStoreCalls.
Lemma proof_of_test_neon_partial_solve_wit_12 : test_neon_partial_solve_wit_12.
Proof. unfold test_neon_partial_solve_wit_12; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open4 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : test_neon_partial_solve_wit_37.
Proof. unfold test_neon_partial_solve_wit_37; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : test_neon_partial_solve_wit_38.
Proof. unfold test_neon_partial_solve_wit_38; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : test_neon_partial_solve_wit_43.
Proof. unfold test_neon_partial_solve_wit_43; intros _; unfold test_neon_partial_solve_wit_43_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (FloatArray.undef_seg_unfold output 2 (Z.quot batch 4)); [dump_pre_spatial; lia | unfold StoreFloatAsElement.undefstoreA; replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44 : test_neon_partial_solve_wit_44.
Proof. unfold test_neon_partial_solve_wit_44; intros _; unfold test_neon_partial_solve_wit_44_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open1 output (Z.quot batch 4)); [dump_pre_spatial; lia | unfold StoreFloatAsElement.undefstoreA; replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
End NeonStoreCalls.
