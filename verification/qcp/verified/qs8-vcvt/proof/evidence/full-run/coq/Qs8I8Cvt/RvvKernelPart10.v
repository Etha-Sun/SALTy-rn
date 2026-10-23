From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import KernelSemanticBounds KernelRangeFacts rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_active_sext qcv_active_rsub qcv_active_shl7 qcv_active_mul qcv_active_clip15 qcv_active_add qcv_active_clip8 qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_rvv_mul qcv_rvv_clip15 qcv_rvv_add qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedRvvKernelPart10.
Lemma proof_of_test_rvv_safety_wit_11 : Qs8I8Cvt.rvv_unit_goal.test_rvv_safety_wit_11.
Proof. unfold Qs8I8Cvt.rvv_unit_goal.test_rvv_safety_wit_11;try left;intros;subst;qcv_semantic_close. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : Qs8I8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_4.
Proof. unfold Qs8I8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_4,Qs8I8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_4_aux;try left;intros;subst;qcv_semantic_close. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14 : Qs8I8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_14.
Proof. unfold Qs8I8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_14,Qs8I8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_14_aux;try left;intros;subst;match goal with |-context[qcv_seed ?m]=>pose proof(qcv_seed_bounds m)end;qcv_semantic_close. Qed.
End CheckedRvvKernelPart10.
