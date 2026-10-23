From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From ByValue Require Import shim_unit_goal.
Import Snaive_C_Rules64.
Module CheckedShim : VC_Correct.
Include neon_bridge_strategy_proof.CheckedNeonBridge.
Include neon_tail_strategy_proof.CheckedNeonTail.
Include float_array_strategy_proof.CheckedFloatArray.
Lemma proof_of_vld1q_f32_safety_wit_1 : vld1q_f32_safety_wit_1.
Proof. unfold vld1q_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_2 : vld1q_f32_safety_wit_2.
Proof. unfold vld1q_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_3 : vld1q_f32_safety_wit_3.
Proof. unfold vld1q_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_4 : vld1q_f32_safety_wit_4.
Proof. unfold vld1q_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_return_wit_1 : vld1q_f32_return_wit_1.
Proof. unfold vld1q_f32_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_partial_solve_wit_1 : vld1q_f32_partial_solve_wit_1.
Proof. unfold vld1q_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vdivq_f32_return_wit_1 : vdivq_f32_return_wit_1.
Proof. unfold vdivq_f32_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vdivq_f32_partial_solve_wit_1 : vdivq_f32_partial_solve_wit_1.
Proof. unfold vdivq_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_1 : qcp_vst1q_f32_safety_wit_1.
Proof. unfold qcp_vst1q_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_2 : qcp_vst1q_f32_safety_wit_2.
Proof. unfold qcp_vst1q_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_3 : qcp_vst1q_f32_safety_wit_3.
Proof. unfold qcp_vst1q_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_4 : qcp_vst1q_f32_safety_wit_4.
Proof. unfold qcp_vst1q_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_return_wit_1 : qcp_vst1q_f32_return_wit_1.
Proof. unfold qcp_vst1q_f32_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_safety_wit_1 : qcp_vst1_f32_safety_wit_1.
Proof. unfold qcp_vst1_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_safety_wit_2 : qcp_vst1_f32_safety_wit_2.
Proof. unfold qcp_vst1_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_return_wit_1 : qcp_vst1_f32_return_wit_1.
Proof. unfold qcp_vst1_f32_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vget_low_f32_return_wit_1 : vget_low_f32_return_wit_1.
Proof. unfold vget_low_f32_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vget_low_f32_partial_solve_wit_1 : vget_low_f32_partial_solve_wit_1.
Proof. unfold vget_low_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Proof. unfold vget_high_f32_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_vget_high_f32_partial_solve_wit_1 : vget_high_f32_partial_solve_wit_1.
Proof. unfold vget_high_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_1 : qcp_vst1_lane_f32_safety_wit_1.
Proof. unfold qcp_vst1_lane_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_2 : qcp_vst1_lane_f32_safety_wit_2.
Proof. unfold qcp_vst1_lane_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_3 : qcp_vst1_lane_f32_safety_wit_3.
Proof. unfold qcp_vst1_lane_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_4 : qcp_vst1_lane_f32_safety_wit_4.
Proof. unfold qcp_vst1_lane_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_return_wit_1 : qcp_vst1_lane_f32_return_wit_1.
Proof. unfold qcp_vst1_lane_f32_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; pre_process; subst; entailer!. Qed.
End CheckedShim.
