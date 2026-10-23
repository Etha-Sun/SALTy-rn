From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart13.
Lemma proof_of_test_neon_safety_wit_14 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_14;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_30 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_30.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_30;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_46 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_46.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_46;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_safety_wit_62 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_62.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_62;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_3_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_3_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_13_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_13_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_24_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_24_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_32_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_32_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_43,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_43_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_55 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_55.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_55;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_66_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_66_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_66_pure;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_76 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_76.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_76,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_76_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_87 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_87.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_87;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_97 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_97.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_97,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_97_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_108 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_108.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_108;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_120 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_120.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_120,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_120_aux;try left;intros;subst;qcv_neon_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_132 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_132.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_132,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_132_aux;try left;intros;subst;qcv_neon_close. Qed.
End CheckedNeonKernelPart13.
