From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart17.
Lemma proof_of_test_rvv_partial_solve_wit_46 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_46.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_46,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_46_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_30 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_30.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_30;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_65_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_65_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_65_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_41_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_41_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_41_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_9.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_9;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_22 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_22.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_22;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_17.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_17;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_10 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_10.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_10;dw_retry_finish. Qed.
End CheckedRvvKernelPart17.
