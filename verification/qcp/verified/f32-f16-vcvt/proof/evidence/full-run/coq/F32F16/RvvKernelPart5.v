From Coq Require Import ZArith Lia.
From F32F16 Require Import RvvKernelCallsSupport rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvKernelPart5.
Lemma proof_of_test_rvv_partial_solve_wit_21:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_21.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_21.
f16_rvv_call_finish.
Qed.
End CheckedRvvKernelPart5.
