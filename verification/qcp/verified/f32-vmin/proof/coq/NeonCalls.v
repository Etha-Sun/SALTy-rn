From Coq Require Import ZArith Lia List.
From FMin Require Import Bits Types ProgramModel VectorFastFrame NeonSupport neon_unit_goal.
From QcpVadd Require Import VaddBits.
From QcpNeon Require Import NeonBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_copy_checked.
From QcpNeonLoop Require Import LoopMemory TailMemory InvariantFacts NeonLoopBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac neon_frame :=
 unfold FMin.Types.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 FMin.Types.UndefStructPredfloat32x2_t, QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;
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
Lemma proof_of_test_neon_partial_solve_wit_1 : FMin.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_1, FMin.neon_unit_goal.test_neon_partial_solve_wit_1_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : FMin.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_2, FMin.neon_unit_goal.test_neon_partial_solve_wit_2_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3 : FMin.neon_unit_goal.test_neon_partial_solve_wit_3.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_3, FMin.neon_unit_goal.test_neon_partial_solve_wit_3_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : FMin.neon_unit_goal.test_neon_partial_solve_wit_4.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_4, FMin.neon_unit_goal.test_neon_partial_solve_wit_4_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : FMin.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_5, FMin.neon_unit_goal.test_neon_partial_solve_wit_5_aux; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_6 : FMin.neon_unit_goal.test_neon_partial_solve_wit_6.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_6; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_7 : FMin.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_7; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : FMin.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_8; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : FMin.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_9; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : FMin.neon_unit_goal.test_neon_partial_solve_wit_10.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_10; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : FMin.neon_unit_goal.test_neon_partial_solve_wit_11.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_11; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12 : FMin.neon_unit_goal.test_neon_partial_solve_wit_12.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_12; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open4 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13 : FMin.neon_unit_goal.test_neon_partial_solve_wit_13.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_13; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : FMin.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_14; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : FMin.neon_unit_goal.test_neon_partial_solve_wit_15.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_15; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : FMin.neon_unit_goal.test_neon_partial_solve_wit_16.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_16; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : FMin.neon_unit_goal.test_neon_partial_solve_wit_17.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_17; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : FMin.neon_unit_goal.test_neon_partial_solve_wit_18.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_18; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19 : FMin.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_19; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : FMin.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_20; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : FMin.neon_unit_goal.test_neon_partial_solve_wit_21.
Proof.
 unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_21; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : FMin.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_22; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : FMin.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_23; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24 : FMin.neon_unit_goal.test_neon_partial_solve_wit_24.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_24; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : FMin.neon_unit_goal.test_neon_partial_solve_wit_25.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_25; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : FMin.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_26; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : FMin.neon_unit_goal.test_neon_partial_solve_wit_27.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_27; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28 : FMin.neon_unit_goal.test_neon_partial_solve_wit_28.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_28; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : FMin.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_29; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : FMin.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_30; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : FMin.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_31; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32 : FMin.neon_unit_goal.test_neon_partial_solve_wit_32.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_32; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : FMin.neon_unit_goal.test_neon_partial_solve_wit_33.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_33; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : FMin.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_34; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : FMin.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_35; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : FMin.neon_unit_goal.test_neon_partial_solve_wit_36.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_36; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : FMin.neon_unit_goal.test_neon_partial_solve_wit_37.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_37; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : FMin.neon_unit_goal.test_neon_partial_solve_wit_38.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_38; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia | replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : FMin.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_39; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40 : FMin.neon_unit_goal.test_neon_partial_solve_wit_40.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_40; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41 : FMin.neon_unit_goal.test_neon_partial_solve_wit_41.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_41; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : FMin.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_42; neon_simple. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : FMin.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_43; intros _; unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_43_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (FloatArray.undef_seg_unfold output 2 (Z.quot batch 4)); [dump_pre_spatial; lia | unfold StoreFloatAsElement.undefstoreA; replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44 : FMin.neon_unit_goal.test_neon_partial_solve_wit_44.
Proof. unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_44; intros _; unfold FMin.neon_unit_goal.test_neon_partial_solve_wit_44_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open1 output (Z.quot batch 4)); [dump_pre_spatial; lia | unfold StoreFloatAsElement.undefstoreA; replace (output+0*sizeof(FLOAT)) with output by lia; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame]. Qed.
End CheckedNeonCalls.
