From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart19.
Lemma proof_of_test_rvv_partial_solve_wit_42 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_42.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_42;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_32 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_32.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_32;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_24 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_24.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_24;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_67_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_67_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_67_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_21.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_21,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_21_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_7.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_7,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_7_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_32 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_32.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_32;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_20 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_20.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_20;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_14 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_14.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_14;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_16 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_16.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_16;dw_retry_finish. Qed.
End CheckedRvvKernelPart19.
