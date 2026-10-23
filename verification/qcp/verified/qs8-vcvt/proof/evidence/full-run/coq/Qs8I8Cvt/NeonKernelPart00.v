From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts KernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart00.
Lemma proof_of_test_neon_safety_wit_1 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_1;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_17 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_17.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_17;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_33 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_33.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_33;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_49 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_49.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_49;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_65 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_65.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_65;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_4,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_4_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_15_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_15_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_15_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_25.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_25,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_25_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_34;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_45_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_57 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_57.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_57;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_68_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_68_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_68_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_78 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_78.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_78,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_78_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_89 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_89.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_89;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_99_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_99_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_99_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_111 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_111.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_111;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_123 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_123.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_123;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_135 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_135.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_135;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
End CheckedNeonKernelPart00.
