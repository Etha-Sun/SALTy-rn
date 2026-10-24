From F32F16 Require Import ScalarSupport scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart7.
Lemma proof_of_qcp_f16_select_return_wit_1 : F32F16.scalar_goal.qcp_f16_select_return_wit_1.
Proof. unfold F32F16.scalar_goal.qcp_f16_select_return_wit_1; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_snan_bits_safety_wit_4 : F32F16.scalar_goal.qcp_f16_snan_bits_safety_wit_4.
Proof. unfold F32F16.scalar_goal.qcp_f16_snan_bits_safety_wit_4; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_gt_bits_safety_wit_8 : F32F16.scalar_goal.qcp_f16_gt_bits_safety_wit_8.
Proof. unfold F32F16.scalar_goal.qcp_f16_gt_bits_safety_wit_8; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_gt_bits_partial_solve_wit_6 : F32F16.scalar_goal.qcp_f16_gt_bits_partial_solve_wit_6.
Proof. unfold F32F16.scalar_goal.qcp_f16_gt_bits_partial_solve_wit_6; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_abs_lt_bits_partial_solve_wit_4 : F32F16.scalar_goal.qcp_f16_abs_lt_bits_partial_solve_wit_4.
Proof. unfold F32F16.scalar_goal.qcp_f16_abs_lt_bits_partial_solve_wit_4; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_ne_bits_return_wit_1 : F32F16.scalar_goal.qcp_f16_ne_bits_return_wit_1.
Proof. unfold F32F16.scalar_goal.qcp_f16_ne_bits_return_wit_1; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_nan_safety_wit_3 : F32F16.scalar_goal.qcp_f16_arm_nan_safety_wit_3.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_nan_safety_wit_3; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_add_return_wit_4 : F32F16.scalar_goal.qcp_f16_arm_add_return_wit_4.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_add_return_wit_4; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_sub_return_wit_2 : F32F16.scalar_goal.qcp_f16_arm_sub_return_wit_2.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_sub_return_wit_2; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_rvv_add_return_wit_2 : F32F16.scalar_goal.qcp_f16_rvv_add_return_wit_2.
Proof. unfold F32F16.scalar_goal.qcp_f16_rvv_add_return_wit_2; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_mul_return_wit_4 : F32F16.scalar_goal.qcp_f16_arm_mul_return_wit_4.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_mul_return_wit_4; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_rvv_mul_partial_solve_wit_2 : F32F16.scalar_goal.qcp_f16_rvv_mul_partial_solve_wit_2.
Proof. unfold F32F16.scalar_goal.qcp_f16_rvv_mul_partial_solve_wit_2; f16_scalar_finish. Qed.
End CheckedScalarPart7.
