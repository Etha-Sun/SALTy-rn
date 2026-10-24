From Coq Require Import ZArith Lia.
From F32F16 Require Import RvvKernelCallsSupport rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvKernelPart14.
Lemma proof_of_test_rvv_which_implies_wit_5:F32F16.rvv_unit_goal.test_rvv_which_implies_wit_5.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_which_implies_wit_5.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_26:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_26.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_26.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_10.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20_pure:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_20_pure.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_20_pure.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_safety_wit_3:F32F16.rvv_unit_goal.test_rvv_safety_wit_3.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_safety_wit_3.
f16_rvv_call_finish.
Qed.
End CheckedRvvKernelPart14.
