From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart05.
Lemma proof_of_test_neon_safety_wit_6 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_22 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_22.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_22;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_38 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_38.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_38;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_54 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_54.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_54;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_70 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_70.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_70;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_7 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_7,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_7_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_18.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_18;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_28_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_28_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_39;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_48 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_48.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_48;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_60 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_60.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_60,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_60_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_71 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_71.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_71;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_82_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_82_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_92 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_92.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_92,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_92_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_101 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_101.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_101,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_101_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_115 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_115.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_115;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_127 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_127.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_127;try left;intros;subst;qcv_neon_bit_close. Qed.
End CheckedNeonKernelPart05.
