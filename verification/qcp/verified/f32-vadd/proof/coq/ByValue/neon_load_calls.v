From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_unit_goal.
From ByValue Require Import neon_copy_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonLoads.
Lemma proof_of_test_neon_partial_solve_wit_6 : test_neon_partial_solve_wit_6.
Proof.
 unfold test_neon_partial_solve_wit_6; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_8 : test_neon_partial_solve_wit_8.
Proof.
 unfold test_neon_partial_solve_wit_8; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_13 : test_neon_partial_solve_wit_13.
Proof.
 unfold test_neon_partial_solve_wit_13; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_14 : test_neon_partial_solve_wit_14.
Proof.
 unfold test_neon_partial_solve_wit_14; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_15 : test_neon_partial_solve_wit_15.
Proof.
 unfold test_neon_partial_solve_wit_15; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_19 : test_neon_partial_solve_wit_19.
Proof.
 unfold test_neon_partial_solve_wit_19; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_20 : test_neon_partial_solve_wit_20.
Proof.
 unfold test_neon_partial_solve_wit_20; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.

Lemma proof_of_test_neon_partial_solve_wit_21 : test_neon_partial_solve_wit_21.
Proof.
 unfold test_neon_partial_solve_wit_21; intros;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; csimpl.
 sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3)
  (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32).
 - dump_pre_spatial; rewrite sizeof_float in *; lia.
 - unfold fp32_slice; repeat progress rewrite <- logic_equiv_andp_assoc; copy_frame.
Qed.
End CheckedNeonLoads.
