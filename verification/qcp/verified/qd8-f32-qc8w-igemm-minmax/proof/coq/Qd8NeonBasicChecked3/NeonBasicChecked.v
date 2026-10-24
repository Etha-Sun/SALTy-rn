From Coq Require Import ZArith List Lia Strings.String.
From Qd8Primitive Require Import primitive_goal.
From Qd8RvvMath Require Import RvvMath.
From Qd8API Require Import copy_strategy_proof.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: primitive_goal.VC_Correct.
Include copy_strategy_proof.Checked.
Lemma proof_of_vld1q_dup_s32_return_wit_1:primitive_goal.vld1q_dup_s32_return_wit_1.
Proof. unfold primitive_goal.vld1q_dup_s32_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vld1q_dup_s32_partial_solve_wit_1:primitive_goal.vld1q_dup_s32_partial_solve_wit_1.
Proof. unfold primitive_goal.vld1q_dup_s32_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vld1q_dup_f32_return_wit_1:primitive_goal.vld1q_dup_f32_return_wit_1.
Proof. unfold primitive_goal.vld1q_dup_f32_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vld1q_dup_f32_partial_solve_wit_1:primitive_goal.vld1q_dup_f32_partial_solve_wit_1.
Proof. unfold primitive_goal.vld1q_dup_f32_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vdupq_n_f32_return_wit_1:primitive_goal.vdupq_n_f32_return_wit_1.
Proof. unfold primitive_goal.vdupq_n_f32_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vdupq_n_f32_partial_solve_wit_1:primitive_goal.vdupq_n_f32_partial_solve_wit_1.
Proof. unfold primitive_goal.vdupq_n_f32_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_low_s16_return_wit_1:primitive_goal.vget_low_s16_return_wit_1.
Proof. unfold primitive_goal.vget_low_s16_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_low_s16_partial_solve_wit_1:primitive_goal.vget_low_s16_partial_solve_wit_1.
Proof. unfold primitive_goal.vget_low_s16_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_high_s16_return_wit_1:primitive_goal.vget_high_s16_return_wit_1.
Proof. unfold primitive_goal.vget_high_s16_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_high_s16_partial_solve_wit_1:primitive_goal.vget_high_s16_partial_solve_wit_1.
Proof. unfold primitive_goal.vget_high_s16_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_low_f32_return_wit_1:primitive_goal.vget_low_f32_return_wit_1.
Proof. unfold primitive_goal.vget_low_f32_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_low_f32_partial_solve_wit_1:primitive_goal.vget_low_f32_partial_solve_wit_1.
Proof. unfold primitive_goal.vget_low_f32_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_high_f32_return_wit_1:primitive_goal.vget_high_f32_return_wit_1.
Proof. unfold primitive_goal.vget_high_f32_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vget_high_f32_partial_solve_wit_1:primitive_goal.vget_high_f32_partial_solve_wit_1.
Proof. unfold primitive_goal.vget_high_f32_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vmovl_s8_return_wit_1:primitive_goal.vmovl_s8_return_wit_1.
Proof. unfold primitive_goal.vmovl_s8_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vmovl_s8_partial_solve_wit_1:primitive_goal.vmovl_s8_partial_solve_wit_1.
Proof. unfold primitive_goal.vmovl_s8_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vcvtq_f32_s32_return_wit_1:primitive_goal.vcvtq_f32_s32_return_wit_1.
Proof. unfold primitive_goal.vcvtq_f32_s32_return_wit_1;left;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vcvtq_f32_s32_partial_solve_wit_1:primitive_goal.vcvtq_f32_s32_partial_solve_wit_1.
Proof. unfold primitive_goal.vcvtq_f32_s32_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vmulq_f32_return_wit_1:primitive_goal.vmulq_f32_return_wit_1.
Proof. unfold primitive_goal.vmulq_f32_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_vmulq_f32_partial_solve_wit_1:primitive_goal.vmulq_f32_partial_solve_wit_1.
Proof. unfold primitive_goal.vmulq_f32_partial_solve_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_qcp_assert_return_wit_1:primitive_goal.qcp_assert_return_wit_1.
Proof. unfold primitive_goal.qcp_assert_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
Lemma proof_of_xnn_prefetch_to_l1_return_wit_1:primitive_goal.xnn_prefetch_to_l1_return_wit_1.
Proof. unfold primitive_goal.xnn_prefetch_to_l1_return_wit_1;intros;unfold Z_to_fp32;first[solve[rvv_frame]|solve[entailer!]].
Qed.
End Checked.
Print Assumptions Checked.proof_of_vld1q_dup_s32_return_wit_1.
Print Assumptions Checked.proof_of_vld1q_dup_s32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vld1q_dup_f32_return_wit_1.
Print Assumptions Checked.proof_of_vld1q_dup_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vdupq_n_f32_return_wit_1.
Print Assumptions Checked.proof_of_vdupq_n_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vget_low_s16_return_wit_1.
Print Assumptions Checked.proof_of_vget_low_s16_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vget_high_s16_return_wit_1.
Print Assumptions Checked.proof_of_vget_high_s16_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vget_low_f32_return_wit_1.
Print Assumptions Checked.proof_of_vget_low_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vget_high_f32_return_wit_1.
Print Assumptions Checked.proof_of_vget_high_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vmovl_s8_return_wit_1.
Print Assumptions Checked.proof_of_vmovl_s8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vcvtq_f32_s32_return_wit_1.
Print Assumptions Checked.proof_of_vcvtq_f32_s32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vmulq_f32_return_wit_1.
Print Assumptions Checked.proof_of_vmulq_f32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_assert_return_wit_1.
Print Assumptions Checked.proof_of_xnn_prefetch_to_l1_return_wit_1.
