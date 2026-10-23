From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelMemoryAuto.
Lemma proof_of_test_neon_entail_wit_5_1 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_1;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_2 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_2;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_3 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_3.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_3;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_4 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_4;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_5 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_5;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_6 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_7 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_5_7;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_1 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_1;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_2 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_2;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_3 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_3.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_3;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_4 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_4;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_5 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_5;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_6 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_7 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_6_7;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_1 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_1;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_2 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_2;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_3 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_3.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_3;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_4 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_4;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_5 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_5;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_6 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_7 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_7_7;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_1 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_1;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_2 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_2;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_3 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_3.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_3;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_4 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_4;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_5 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_5;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_6 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_7 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_8_7;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_1 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_1;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_2 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_2;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_3 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_3.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_3;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_4 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_4;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_5 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_5;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_6 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_7 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_9_7;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_1 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_1.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_1;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_2 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_2.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_2;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_3 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_3.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_3;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_4 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_4;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_5 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_5.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_5;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_6 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_7 : Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_7.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_entail_wit_10_7;try left;intros;subst;qcv_neon_bit_close. Qed.
End CheckedNeonKernelMemoryAuto.
