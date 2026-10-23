From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame memory_float_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedFloatMemory : Qu8Cvt.memory_float_goal.VC_Correct.
Lemma proof_of_qcp_vst1q_f32_safety_wit_1 : Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_1.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_2 : Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_2.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_3 : Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_3.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_safety_wit_4 : Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_4.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1q_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1q_f32_return_wit_1 : Qu8Cvt.memory_float_goal.qcp_vst1q_f32_return_wit_1.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1q_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_safety_wit_1 : Qu8Cvt.memory_float_goal.qcp_vst1_f32_safety_wit_1.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_safety_wit_2 : Qu8Cvt.memory_float_goal.qcp_vst1_f32_safety_wit_2.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_f32_return_wit_1 : Qu8Cvt.memory_float_goal.qcp_vst1_f32_return_wit_1.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_1 : Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_1.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_2 : Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_2.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_2; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_3 : Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_3.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_3; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_safety_wit_4 : Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_4.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_safety_wit_4; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_vst1_lane_f32_return_wit_1 : Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_return_wit_1.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_vst1_lane_f32_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
Lemma proof_of_qcp_assert_return_wit_1 : Qu8Cvt.memory_float_goal.qcp_assert_return_wit_1.
Proof. unfold Qu8Cvt.memory_float_goal.qcp_assert_return_wit_1; unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t; pre_process;subst;entailer!. Qed.
End CheckedFloatMemory.
