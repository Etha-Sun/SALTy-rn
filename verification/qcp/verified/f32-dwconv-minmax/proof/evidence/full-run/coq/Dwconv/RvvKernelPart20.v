From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart20.
Lemma proof_of_test_rvv_partial_solve_wit_36 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_36.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_36;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_35 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_35.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_35,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_35_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_31 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_31.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_31,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_31_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_23 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_23.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_23,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_23_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_39_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_39_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_39_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_4.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_4,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_4_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_1 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_1.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_1;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_7 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_7.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_7;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_29 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_29.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_29;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_3 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_3.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_3;dw_retry_finish. Qed.
End CheckedRvvKernelPart20.
