From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart08.
Lemma proof_of_test_neon_safety_wit_9 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_9.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_9;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_25 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_25.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_25;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_41 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_41.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_41;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_57 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_57.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_57;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_73 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_73.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_73;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_9,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_9_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_20;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_29,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_29_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_41_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_41_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_51 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_51.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_51;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_62 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_62.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_62,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_62_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_73 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_73.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_73;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_84_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_84_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_84_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_94 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_94.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_94,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_94_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_103 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_103.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_103;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_117 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_117.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_117;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_129 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_129.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_129;try left;intros;subst;qcv_neon_bit_close. Qed.
End CheckedNeonKernelPart08.
