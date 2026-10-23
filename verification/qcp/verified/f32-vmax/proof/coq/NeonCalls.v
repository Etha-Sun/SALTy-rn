From Coq Require Import ZArith Lia List.
From FMax Require Import Bits Types ProgramModel VectorFastFrame NeonSupport neon_unit_goal.
From QcpVadd Require Import VaddBits.
From QcpNeon Require Import NeonBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_copy_checked.
From QcpNeonLoop Require Import LoopMemory TailMemory InvariantFacts NeonLoopBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac neon_frame :=
 unfold FMax.Types.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 FMax.Types.UndefStructPredfloat32x2_t, QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac neon_simple :=
 first [solve[intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold same_bits,fp32_bits_equal in *;subst;
 unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]
 |solve[pre_process;subst;try csimpl;entailer!]
 |solve[intros;unfold same_bits,fp32_bits_equal in *;subst;neon_frame]
 |solve[intros;try csimpl;entailer!]].
Module CheckedNeonCalls.
Lemma proof_of_test_neon_partial_solve_wit_1 : FMax.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_1, FMax.neon_unit_goal.test_neon_partial_solve_wit_1_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : FMax.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_2, FMax.neon_unit_goal.test_neon_partial_solve_wit_2_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3 : FMax.neon_unit_goal.test_neon_partial_solve_wit_3.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_3, FMax.neon_unit_goal.test_neon_partial_solve_wit_3_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : FMax.neon_unit_goal.test_neon_partial_solve_wit_4.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_4, FMax.neon_unit_goal.test_neon_partial_solve_wit_4_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : FMax.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_5, FMax.neon_unit_goal.test_neon_partial_solve_wit_5_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_6 : FMax.neon_unit_goal.test_neon_partial_solve_wit_6.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_6; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_7 : FMax.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_7; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : FMax.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_8; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : FMax.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_9; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : FMax.neon_unit_goal.test_neon_partial_solve_wit_10.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_10; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : FMax.neon_unit_goal.test_neon_partial_solve_wit_11.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_11; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12 : FMax.neon_unit_goal.test_neon_partial_solve_wit_12.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_12; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open4 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13 : FMax.neon_unit_goal.test_neon_partial_solve_wit_13.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_13; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : FMax.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_14; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : FMax.neon_unit_goal.test_neon_partial_solve_wit_15.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_15; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : FMax.neon_unit_goal.test_neon_partial_solve_wit_16.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_16; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : FMax.neon_unit_goal.test_neon_partial_solve_wit_17.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_17; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : FMax.neon_unit_goal.test_neon_partial_solve_wit_18.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_18; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19 : FMax.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_19; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : FMax.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_20; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : FMax.neon_unit_goal.test_neon_partial_solve_wit_21.
Proof.
 unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_21; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : FMax.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_22; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : FMax.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_23; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24 : FMax.neon_unit_goal.test_neon_partial_solve_wit_24.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_24; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : FMax.neon_unit_goal.test_neon_partial_solve_wit_25.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_25; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : FMax.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_26; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : FMax.neon_unit_goal.test_neon_partial_solve_wit_27.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_27; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28 : FMax.neon_unit_goal.test_neon_partial_solve_wit_28.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_28; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : FMax.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_29; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : FMax.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_30; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : FMax.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_31; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32 : FMax.neon_unit_goal.test_neon_partial_solve_wit_32.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_32; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : FMax.neon_unit_goal.test_neon_partial_solve_wit_33.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_33; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : FMax.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_34; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : FMax.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_35; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : FMax.neon_unit_goal.test_neon_partial_solve_wit_36.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_36; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : FMax.neon_unit_goal.test_neon_partial_solve_wit_37.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_37; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : FMax.neon_unit_goal.test_neon_partial_solve_wit_38.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_38; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : FMax.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_39; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40 : FMax.neon_unit_goal.test_neon_partial_solve_wit_40.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_40; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41 : FMax.neon_unit_goal.test_neon_partial_solve_wit_41.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_41; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : FMax.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_42; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : FMax.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_43; intros _; unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_43_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (FloatArray.undef_seg_unfold output 2 (Z.quot batch 4)); [dump_pre_spatial; lia | unfold StoreFloatAsElement.undefstoreA; replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44 : FMax.neon_unit_goal.test_neon_partial_solve_wit_44.
Proof. unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_44; intros _; unfold FMax.neon_unit_goal.test_neon_partial_solve_wit_44_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open1 output (Z.quot batch 4)); [dump_pre_spatial; lia | unfold StoreFloatAsElement.undefstoreA; replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
End CheckedNeonCalls.
