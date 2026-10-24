From Coq Require Import ZArith Lia.
From F32F16 Require Import RvvKernelCallsSupport rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvKernelPart24.
Lemma proof_of_test_rvv_partial_solve_wit_41:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_41.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_41.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_16.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_31:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_31.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_31.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_27_pure:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_27_pure.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_27_pure.
f16_rvv_call_finish.
Qed.
End CheckedRvvKernelPart24.
