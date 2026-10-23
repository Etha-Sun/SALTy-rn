From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts KernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart02.
Lemma proof_of_test_neon_safety_wit_3 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_3.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_3;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_19 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_19.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_19;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_35 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_35.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_35;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_51 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_51.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_51;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_67 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_67.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_67;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_16.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_16;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_26,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_26_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_36.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_36;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_46_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_46_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_46_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_58 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_58.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_58,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_58_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_69 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_69.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_69;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_80_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_80_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_80_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_90 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_90.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_90,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_90_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_100_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_100_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_100_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_113 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_113.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_113;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_125 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_125.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_125;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_137 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_137.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_137;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
End CheckedNeonKernelPart02.
