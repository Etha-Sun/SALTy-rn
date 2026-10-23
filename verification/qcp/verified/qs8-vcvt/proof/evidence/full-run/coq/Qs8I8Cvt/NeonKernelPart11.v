From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart11.
Lemma proof_of_test_neon_safety_wit_12 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_12.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_12;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_28 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_28.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_28;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_44 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_44.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_44;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_60 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_60.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_60;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_2_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_2_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_11.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_11,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_11_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_22;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_31_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_31_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_42,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_42_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_54_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_54_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_54_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_64 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_64.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_64,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_64_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_75 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_75.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_75;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_86_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_86_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_86_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_96 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_96.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_96,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_96_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_106 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_106.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_106;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_119 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_119.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_119;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_131 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_131.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_131;try left;intros;subst;qcv_neon_close. Qed.
End CheckedNeonKernelPart11.
