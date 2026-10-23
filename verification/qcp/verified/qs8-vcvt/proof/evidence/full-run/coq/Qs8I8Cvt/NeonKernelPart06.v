From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart06.
Lemma proof_of_test_neon_safety_wit_7 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_7;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_23 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_23.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_23;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_39 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_39.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_39;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_55 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_55.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_55;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_71 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_71.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_71;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_8;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_19_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_19_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_28.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_28,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_28_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_40_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_40_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_49 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_49.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_49;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_61 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_61.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_61;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_72_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_72_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_72_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_82.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_82,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_82_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_93 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_93.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_93;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_102_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_102_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_102_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_116_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_116_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_116_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_128_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_128_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_128_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
End CheckedNeonKernelPart06.
