From Coq Require Import ZArith Lia.
From FMax Require Import Types VectorFastFrame memory_neon_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMemoryHelpers : FMax.memory_neon_goal.VC_Correct.
Lemma proof_of_vld1q_f32_safety_wit_1 : vld1q_f32_safety_wit_1.
Proof. unfold vld1q_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_2 : vld1q_f32_safety_wit_2.
Proof. unfold vld1q_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_3 : vld1q_f32_safety_wit_3.
Proof. unfold vld1q_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_4 : vld1q_f32_safety_wit_4.
Proof. unfold vld1q_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vld1q_f32_return_wit_1 : vld1q_f32_return_wit_1.
Proof. unfold vld1q_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vld1q_f32_partial_solve_wit_1 : vld1q_f32_partial_solve_wit_1.
Proof. unfold vld1q_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_1 : qcp_vst1q_f32_safety_wit_1.
Proof. unfold qcp_vst1q_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_2 : qcp_vst1q_f32_safety_wit_2.
Proof. unfold qcp_vst1q_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_3 : qcp_vst1q_f32_safety_wit_3.
Proof. unfold qcp_vst1q_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_4 : qcp_vst1q_f32_safety_wit_4.
Proof. unfold qcp_vst1q_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_return_wit_1 : qcp_vst1q_f32_return_wit_1.
Proof. unfold qcp_vst1q_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_safety_wit_1 : qcp_vst1_f32_safety_wit_1.
Proof. unfold qcp_vst1_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_safety_wit_2 : qcp_vst1_f32_safety_wit_2.
Proof. unfold qcp_vst1_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_return_wit_1 : qcp_vst1_f32_return_wit_1.
Proof. unfold qcp_vst1_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vget_low_f32_return_wit_1 : vget_low_f32_return_wit_1.
Proof. unfold vget_low_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vget_low_f32_partial_solve_wit_1 : vget_low_f32_partial_solve_wit_1.
Proof. unfold vget_low_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Proof. unfold vget_high_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_vget_high_f32_partial_solve_wit_1 : vget_high_f32_partial_solve_wit_1.
Proof. unfold vget_high_f32_partial_solve_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_1 : qcp_vst1_lane_f32_safety_wit_1.
Proof. unfold qcp_vst1_lane_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_2 : qcp_vst1_lane_f32_safety_wit_2.
Proof. unfold qcp_vst1_lane_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_3 : qcp_vst1_lane_f32_safety_wit_3.
Proof. unfold qcp_vst1_lane_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_4 : qcp_vst1_lane_f32_safety_wit_4.
Proof. unfold qcp_vst1_lane_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_return_wit_1 : qcp_vst1_lane_f32_return_wit_1.
Proof. unfold qcp_vst1_lane_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
End CheckedNeonMemoryHelpers.
