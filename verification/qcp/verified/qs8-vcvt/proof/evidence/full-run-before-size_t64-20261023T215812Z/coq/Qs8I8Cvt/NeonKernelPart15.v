From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts KernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart15.
Lemma proof_of_test_neon_safety_wit_16 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_16.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_16;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_32 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_32.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_32;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_48 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_48.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_48;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_64 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_64.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_64;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_4_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_4_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_14;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_25_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_25_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_33.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_33;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_44.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_44,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_44_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_56 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_56.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_56,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_56_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_67 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_67.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_67;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_78_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_78_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_78_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_88 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_88.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_88,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_88_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_98 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_98.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_98,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_98_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_110 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_110.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_110;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_122 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_122.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_122;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_134 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_134.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_134;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
End CheckedNeonKernelPart15.
