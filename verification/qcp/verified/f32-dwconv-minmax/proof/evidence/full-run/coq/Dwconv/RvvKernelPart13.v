From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart13.
Lemma proof_of_test_rvv_partial_solve_wit_52 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_52.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_52;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_5.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_5;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_19.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_19,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_19_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_31 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_31.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_31;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_18 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_18.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_18;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_15 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_15.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_15;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_27 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_27.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_27;dw_retry_finish. Qed.
End CheckedRvvKernelPart13.
