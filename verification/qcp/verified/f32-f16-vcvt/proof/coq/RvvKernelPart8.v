From Coq Require Import ZArith Lia.
From F32F16 Require Import RvvKernelCallsSupport rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvKernelPart8.
Lemma proof_of_test_rvv_partial_solve_wit_13:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_13.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_13.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_29_pure:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_29_pure.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_29_pure.
f16_rvv_intro_binders;f16_rvv_prepare.
repeat progress rewrite Z.sub_sub_distr in *.
rewrite ?Z.sub_diag,?Z.add_0_l in *.
unfold f16_rvv_named_core.
f16_rvv_finish.
Qed.
Lemma proof_of_test_rvv_safety_wit_4:F32F16.rvv_unit_goal.test_rvv_safety_wit_4.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_safety_wit_4.
f16_rvv_call_finish.
Qed.
End CheckedRvvKernelPart8.
