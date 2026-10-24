From Coq Require Import ZArith.
From Dwconv Require Import KernelRetrySupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_arm_add Dwconv.Model.dw_arm_mul Dwconv.Model.dw_arm_fma Dwconv.Model.dw_arm_min Dwconv.Model.dw_arm_max Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedNeonKernelPart13.
Lemma proof_of_test_neon_safety_wit_14 : Dwconv.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold Dwconv.neon_unit_goal.test_neon_safety_wit_14;dw_call_finish. Qed.
Lemma proof_of_test_neon_safety_wit_30 : Dwconv.neon_unit_goal.test_neon_safety_wit_30.
Proof. unfold Dwconv.neon_unit_goal.test_neon_safety_wit_30;dw_call_finish. Qed.
Lemma proof_of_test_neon_safety_wit_46 : Dwconv.neon_unit_goal.test_neon_safety_wit_46.
Proof. unfold Dwconv.neon_unit_goal.test_neon_safety_wit_46;dw_call_finish. Qed.
Lemma proof_of_test_neon_safety_wit_62 : Dwconv.neon_unit_goal.test_neon_safety_wit_62.
Proof. unfold Dwconv.neon_unit_goal.test_neon_safety_wit_62;dw_retry_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_9;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_20,Dwconv.neon_unit_goal.test_neon_partial_solve_wit_20_aux;dw_retry_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31_pure : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_31_pure.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_31_pure;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_43;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_55 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_55.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_55;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_65 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_65;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_78 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_78.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_78;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_91 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_91.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_91;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_101 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_101.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_101;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_117 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_117.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_117;dw_call_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_133 : Dwconv.neon_unit_goal.test_neon_partial_solve_wit_133.
Proof. unfold Dwconv.neon_unit_goal.test_neon_partial_solve_wit_133;dw_call_finish. Qed.
End CheckedNeonKernelPart13.
