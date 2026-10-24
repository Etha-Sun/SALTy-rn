From Coq Require Import ZArith Lia.
From F32F16 Require Import RvvKernelCallsSupport rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvKernelPart13.
Lemma proof_of_test_rvv_which_implies_wit_9:F32F16.rvv_unit_goal.test_rvv_which_implies_wit_9.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_which_implies_wit_9.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_57:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_57.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_57.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_12.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_12,F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_12_aux.
f16_rvv_call_finish.
Qed.
End CheckedRvvKernelPart13.
