From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart09.
Lemma proof_of_test_neon_safety_wit_10 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_10.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_10;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_26 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_26.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_26;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_42 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_42.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_42;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_58 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_58.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_58;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_1_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_10.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_10;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_21_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_21_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_21_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_30_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_30_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_41.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_41,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_41_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_52 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_52.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_52;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_63 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_63.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_63;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_74_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_74_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_74_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_84 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_84.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_84,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_84_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_95 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_95.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_95;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_104 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_104.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_104;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_118_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_118_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_118_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_130_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_130_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_130_pure;try left;intros;subst;qcv_neon_close. Qed.
End CheckedNeonKernelPart09.
