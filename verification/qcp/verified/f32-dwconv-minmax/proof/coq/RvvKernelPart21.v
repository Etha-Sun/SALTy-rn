From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart21.
Lemma proof_of_test_rvv_partial_solve_wit_41 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_41.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_41,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_41_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_39 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_39.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_39,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_39_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_26 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_26.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_26;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_22 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_22.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_22;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_20.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_20;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_49_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_49_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_49_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_37_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_37_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_37_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_19 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_19.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_19;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_25 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_25.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_25;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure;dw_retry_finish. Qed.
End CheckedRvvKernelPart21.
