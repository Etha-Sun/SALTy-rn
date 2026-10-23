From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart10.
Lemma proof_of_test_neon_safety_wit_11 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_11.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_11;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_27 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_27.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_27;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_43 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_43.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_43;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_59 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_59.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_59;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_1,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_1_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_11_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_11_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_21.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_21,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_21_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_30,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_30_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_42_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_42_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_53 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_53.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_53;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_64_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_64_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_64_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_74 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_74.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_74,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_74_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_85 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_85.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_85;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_96_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_96_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_96_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_105 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_105.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_105;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_118 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_118.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_118,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_118_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_130 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_130.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_130,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_130_aux;try left;intros;subst;qcv_neon_close. Qed.
End CheckedNeonKernelPart10.
