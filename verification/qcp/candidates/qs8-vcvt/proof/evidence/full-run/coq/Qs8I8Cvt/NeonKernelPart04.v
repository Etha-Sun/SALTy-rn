From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart04.
Lemma proof_of_test_neon_safety_wit_5 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_5;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_21 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_21.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_21;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_37 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_37.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_37;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_53 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_53.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_53;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_69 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_69.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_69;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_7_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_7_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_7_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_17.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_17,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_17_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_27.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_27,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_27_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_38.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_38;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_47 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_47.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_47;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_60_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_60_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_60_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_70 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_70.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_70,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_70_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_81 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_81.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_81;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_92_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_92_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_92_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_101_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_101_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_101_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_114 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_114.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_114,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_114_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_126 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_126.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_126,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_126_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
End CheckedNeonKernelPart04.
