From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart12.
Lemma proof_of_test_rvv_partial_solve_wit_50 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_50.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_50;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_15 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_15.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_15,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_15_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_14.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_14,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_14_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_5 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_5.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_5;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_1.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_1,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_1_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_12 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_12.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_12;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_2.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_2,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_2_aux;dw_retry_finish. Qed.
End CheckedRvvKernelPart12.
