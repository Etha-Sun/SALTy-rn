From Coq Require Import ZArith Lia.
From Dwconv Require Import KernelRetrySupport RvvRewriteFrame rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Local Opaque Dwconv.Model.dw_rvv_add Dwconv.Model.dw_rvv_mul Dwconv.Model.dw_rvv_fma Dwconv.Model.fp32_min_number Dwconv.Model.fp32_max_number Dwconv.Model.dw_rvv_merge Dwconv.Model.dw_rvv_nanmask Dwconv.FmaModel.fma_rne fp32_add fp32_mul.
Module CheckedRvvKernelPart10.
Lemma proof_of_test_rvv_partial_solve_wit_55 : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_55.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_55,Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_55_aux;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2_pure : Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_8 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_8.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_8;dw_retry_finish. Qed.
Lemma proof_of_test_rvv_safety_wit_28 : Dwconv.rvv_unit_goal.test_rvv_safety_wit_28.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_safety_wit_28;dw_retry_finish. Qed.
End CheckedRvvKernelPart10.
