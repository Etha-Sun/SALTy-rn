From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts KernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart12.
Lemma proof_of_test_neon_safety_wit_13 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_13.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_13;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_29 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_29.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_29;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_45 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_45.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_45;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_61 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_61.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_61;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_2,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_2_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_12.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_12;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_23;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_31,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_31_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_43_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_43_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_54 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_54.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_54,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_54_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_65 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_65;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_76_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_76_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_76_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_86 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_86.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_86,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_86_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_97_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_97_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_97_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_107 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_107.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_107;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_120_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_120_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_120_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_132_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_132_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_132_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
End CheckedNeonKernelPart12.
