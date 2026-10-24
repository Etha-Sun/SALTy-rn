From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart22.
Lemma proof_of_test_rvv_partial_solve_wit_40 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_40.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_40;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_34 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_34.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_34;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_28 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_28.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_28;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_60_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_60_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_60_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_13.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_13,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_13_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_16,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_16_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_25_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_25_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_25_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_11 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_11.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_11;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_21 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_21.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_21;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure;dw_retry_finish. Qed.
End CheckedRvvKernelPart22.
