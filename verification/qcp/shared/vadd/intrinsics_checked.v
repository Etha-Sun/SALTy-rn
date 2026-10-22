Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpVadd Require Import VaddBits intrinsics_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Module CheckedIntrinsics : VC_Correct.
Lemma proof_of_f32_add_return_wit_1 : f32_add_return_wit_1.
Proof. unfold f32_add_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_1 : vld1q_f32_safety_wit_1.
Proof. unfold vld1q_f32_safety_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_2 : vld1q_f32_safety_wit_2.
Proof. unfold vld1q_f32_safety_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_3 : vld1q_f32_safety_wit_3.
Proof. unfold vld1q_f32_safety_wit_3; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_safety_wit_4 : vld1q_f32_safety_wit_4.
Proof. unfold vld1q_f32_safety_wit_4; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vld1q_f32_return_wit_1 : vld1q_f32_return_wit_1.
Proof. unfold vld1q_f32_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1q_f32_safety_wit_1 : vst1q_f32_safety_wit_1.
Proof. unfold vst1q_f32_safety_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1q_f32_safety_wit_2 : vst1q_f32_safety_wit_2.
Proof. unfold vst1q_f32_safety_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1q_f32_safety_wit_3 : vst1q_f32_safety_wit_3.
Proof. unfold vst1q_f32_safety_wit_3; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1q_f32_safety_wit_4 : vst1q_f32_safety_wit_4.
Proof. unfold vst1q_f32_safety_wit_4; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1q_f32_return_wit_1 : vst1q_f32_return_wit_1.
Proof. unfold vst1q_f32_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_f32_safety_wit_1 : vst1_f32_safety_wit_1.
Proof. unfold vst1_f32_safety_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_f32_safety_wit_2 : vst1_f32_safety_wit_2.
Proof. unfold vst1_f32_safety_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_f32_return_wit_1 : vst1_f32_return_wit_1.
Proof. unfold vst1_f32_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vaddq_f32_return_wit_1 : vaddq_f32_return_wit_1.
Proof. unfold vaddq_f32_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vaddq_f32_partial_solve_wit_1 : vaddq_f32_partial_solve_wit_1.
Proof. unfold vaddq_f32_partial_solve_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vaddq_f32_partial_solve_wit_2 : vaddq_f32_partial_solve_wit_2.
Proof. unfold vaddq_f32_partial_solve_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vaddq_f32_partial_solve_wit_3 : vaddq_f32_partial_solve_wit_3.
Proof. unfold vaddq_f32_partial_solve_wit_3; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vaddq_f32_partial_solve_wit_4 : vaddq_f32_partial_solve_wit_4.
Proof. unfold vaddq_f32_partial_solve_wit_4; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vget_low_f32_return_wit_1 : vget_low_f32_return_wit_1.
Proof. unfold vget_low_f32_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Proof. unfold vget_high_f32_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_1 : vst1_lane_f32_safety_wit_1.
Proof. unfold vst1_lane_f32_safety_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_2 : vst1_lane_f32_safety_wit_2.
Proof. unfold vst1_lane_f32_safety_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_3 : vst1_lane_f32_safety_wit_3.
Proof. unfold vst1_lane_f32_safety_wit_3; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_4 : vst1_lane_f32_safety_wit_4.
Proof. unfold vst1_lane_f32_safety_wit_4; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_5 : vst1_lane_f32_safety_wit_5.
Proof. unfold vst1_lane_f32_safety_wit_5; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_6 : vst1_lane_f32_safety_wit_6.
Proof. unfold vst1_lane_f32_safety_wit_6; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_7 : vst1_lane_f32_safety_wit_7.
Proof. unfold vst1_lane_f32_safety_wit_7; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_safety_wit_8 : vst1_lane_f32_safety_wit_8.
Proof. unfold vst1_lane_f32_safety_wit_8; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_return_wit_1 : vst1_lane_f32_return_wit_1.
Proof. unfold vst1_lane_f32_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_vst1_lane_f32_return_wit_2 : vst1_lane_f32_return_wit_2.
Proof. unfold vst1_lane_f32_return_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vadd_block4_return_wit_1 : qcp_vadd_block4_return_wit_1.
Proof. unfold qcp_vadd_block4_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vadd_block4_partial_solve_wit_1 : qcp_vadd_block4_partial_solve_wit_1.
Proof. unfold qcp_vadd_block4_partial_solve_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vadd_block4_partial_solve_wit_2 : qcp_vadd_block4_partial_solve_wit_2.
Proof. unfold qcp_vadd_block4_partial_solve_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vadd_block4_partial_solve_wit_3 : qcp_vadd_block4_partial_solve_wit_3.
Proof. unfold qcp_vadd_block4_partial_solve_wit_3; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_vadd_block4_partial_solve_wit_4 : qcp_vadd_block4_partial_solve_wit_4.
Proof. unfold qcp_vadd_block4_partial_solve_wit_4; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_2; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_1; left; intros; unfold vadd_vl; rewrite Z.min_r by lia; entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_2; left; intros; unfold vadd_vl; rewrite Z.min_l by lia; entailer!. Qed.
Lemma proof_of_qcp_rvv_add_lane32_return_wit_1 : qcp_rvv_add_lane32_return_wit_1.
Proof. unfold qcp_rvv_add_lane32_return_wit_1; left; intros; unfold fp32_bits_equal, vadd_active_add in *; assert (Htest : Z.ltb i_pre vl_pre = false) by (apply Z.ltb_ge; lia); rewrite Htest; subst; entailer!. Qed.
Lemma proof_of_qcp_rvv_add_lane32_return_wit_2 : qcp_rvv_add_lane32_return_wit_2.
Proof. unfold qcp_rvv_add_lane32_return_wit_2; left; intros; unfold fp32_bits_equal, vadd_active_add in *; assert (Htest : Z.ltb i_pre vl_pre = true) by (apply Z.ltb_lt; lia); rewrite Htest; subst; entailer!. Qed.
Lemma proof_of_qcp_rvv_add_lane32_partial_solve_wit_1 : qcp_rvv_add_lane32_partial_solve_wit_1.
Proof. unfold qcp_rvv_add_lane32_partial_solve_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1; pre_process. Qed.
End CheckedIntrinsics.
Print Assumptions CheckedIntrinsics.proof_of_f32_add_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vld1q_f32_safety_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vld1q_f32_safety_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_vld1q_f32_safety_wit_3.
Print Assumptions CheckedIntrinsics.proof_of_vld1q_f32_safety_wit_4.
Print Assumptions CheckedIntrinsics.proof_of_vld1q_f32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vst1q_f32_safety_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vst1q_f32_safety_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_vst1q_f32_safety_wit_3.
Print Assumptions CheckedIntrinsics.proof_of_vst1q_f32_safety_wit_4.
Print Assumptions CheckedIntrinsics.proof_of_vst1q_f32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vst1_f32_safety_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vst1_f32_safety_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_vst1_f32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vaddq_f32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vaddq_f32_partial_solve_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vaddq_f32_partial_solve_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_vaddq_f32_partial_solve_wit_3.
Print Assumptions CheckedIntrinsics.proof_of_vaddq_f32_partial_solve_wit_4.
Print Assumptions CheckedIntrinsics.proof_of_vget_low_f32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vget_high_f32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_3.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_4.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_5.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_6.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_7.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_safety_wit_8.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_vst1_lane_f32_return_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_qcp_vadd_block4_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_qcp_vadd_block4_partial_solve_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_qcp_vadd_block4_partial_solve_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_qcp_vadd_block4_partial_solve_wit_3.
Print Assumptions CheckedIntrinsics.proof_of_qcp_vadd_block4_partial_solve_wit_4.
Print Assumptions CheckedIntrinsics.proof_of___riscv_vsetvl_e32m8_safety_wit_1.
Print Assumptions CheckedIntrinsics.proof_of___riscv_vsetvl_e32m8_safety_wit_2.
Print Assumptions CheckedIntrinsics.proof_of___riscv_vsetvl_e32m8_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of___riscv_vsetvl_e32m8_return_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_qcp_rvv_add_lane32_return_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_qcp_rvv_add_lane32_return_wit_2.
Print Assumptions CheckedIntrinsics.proof_of_qcp_rvv_add_lane32_partial_solve_wit_1.
Print Assumptions CheckedIntrinsics.proof_of_qcp_assert_return_wit_1.
