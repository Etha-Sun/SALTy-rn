From F32F16 Require Import ScalarSupport scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart12.
Lemma proof_of_qcp_f16_quiet_partial_solve_wit_1 : F32F16.scalar_goal.qcp_f16_quiet_partial_solve_wit_1.
Proof. unfold F32F16.scalar_goal.qcp_f16_quiet_partial_solve_wit_1; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_snan_bits_partial_solve_wit_1 : F32F16.scalar_goal.qcp_f16_snan_bits_partial_solve_wit_1.
Proof. unfold F32F16.scalar_goal.qcp_f16_snan_bits_partial_solve_wit_1; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_gt_bits_return_wit_2 : F32F16.scalar_goal.qcp_f16_gt_bits_return_wit_2.
Proof. unfold F32F16.scalar_goal.qcp_f16_gt_bits_return_wit_2; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_gt_partial_solve_wit_2 : F32F16.scalar_goal.qcp_f16_gt_partial_solve_wit_2.
Proof. unfold F32F16.scalar_goal.qcp_f16_gt_partial_solve_wit_2; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_ne_bits_safety_wit_1 : F32F16.scalar_goal.qcp_f16_ne_bits_safety_wit_1.
Proof. unfold F32F16.scalar_goal.qcp_f16_ne_bits_safety_wit_1; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_ne_bits_return_wit_6 : F32F16.scalar_goal.qcp_f16_ne_bits_return_wit_6.
Proof. unfold F32F16.scalar_goal.qcp_f16_ne_bits_return_wit_6; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_nan_partial_solve_wit_1 : F32F16.scalar_goal.qcp_f16_arm_nan_partial_solve_wit_1.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_nan_partial_solve_wit_1; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_add_partial_solve_wit_5 : F32F16.scalar_goal.qcp_f16_arm_add_partial_solve_wit_5.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_add_partial_solve_wit_5; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_sub_partial_solve_wit_3 : F32F16.scalar_goal.qcp_f16_arm_sub_partial_solve_wit_3.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_sub_partial_solve_wit_3; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_rvv_sub_return_wit_1 : F32F16.scalar_goal.qcp_f16_rvv_sub_return_wit_1.
Proof. unfold F32F16.scalar_goal.qcp_f16_rvv_sub_return_wit_1; f16_scalar_finish. Qed.
Lemma proof_of_qcp_f16_arm_mul_partial_solve_wit_5 : F32F16.scalar_goal.qcp_f16_arm_mul_partial_solve_wit_5.
Proof. unfold F32F16.scalar_goal.qcp_f16_arm_mul_partial_solve_wit_5; f16_scalar_finish. Qed.
End CheckedScalarPart12.
