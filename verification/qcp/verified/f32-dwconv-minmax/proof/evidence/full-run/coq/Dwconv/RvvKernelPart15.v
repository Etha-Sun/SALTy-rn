From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart15.
Lemma proof_of_test_rvv_partial_solve_wit_51 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_51.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_51,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_51_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_27 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_27.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_27,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_27_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_6.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_6;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_12.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_12;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_31_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_31_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_31_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_17 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_17.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_17;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_30 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_30.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_30;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_13 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_13.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_13;dw_retry_finish. Qed.
End CheckedRvvKernelPart15.
