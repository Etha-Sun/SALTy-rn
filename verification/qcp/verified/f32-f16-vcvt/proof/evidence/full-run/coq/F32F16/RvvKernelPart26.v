From Coq Require Import ZArith Lia.
From F32F16 Require Import RvvKernelCallsSupport rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvKernelPart26.
Lemma proof_of_test_rvv_partial_solve_wit_29:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_29.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_29,F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_29_aux.
f16_rvv_intro_binders;f16_rvv_prepare.
repeat progress rewrite Z.sub_sub_distr in *.
rewrite ?Z.sub_diag,?Z.add_0_l in *.
unfold f16_rvv_named_core.
f16_rvv_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_9.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_9.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_37:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_37.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_37,F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_37_aux.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_58_pure:F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_58_pure.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_partial_solve_wit_58_pure.
f16_rvv_call_finish.
Qed.
Lemma proof_of_test_rvv_safety_wit_8:F32F16.rvv_unit_goal.test_rvv_safety_wit_8.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_safety_wit_8.
f16_rvv_call_finish.
Qed.
End CheckedRvvKernelPart26.
