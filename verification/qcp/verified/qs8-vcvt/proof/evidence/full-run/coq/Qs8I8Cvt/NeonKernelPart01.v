From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts KernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart01.
Lemma proof_of_test_neon_safety_wit_2 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_2;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_18 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_18.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_18;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_34 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_34.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_34;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_50 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_50.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_50;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_safety_wit_66 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_66.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_66;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_15.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_15,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_15_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_26_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_26_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_35;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_45 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_58_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_58_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_58_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_68 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_68.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_68,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_68_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_79 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_79.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_79;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_90_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_90_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_90_pure;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_99 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_99.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_99,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_99_aux;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_112 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_112.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_112;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_124 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_124.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_124;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_136 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_136.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_136;try left;intros;subst;first[solve[qcv_neon_bit_close]|qcv_neon_split_output]. Qed.
End CheckedNeonKernelPart01.
