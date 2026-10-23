From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Import NeonKernelBitFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16.
Module CheckedNeonKernelPart03.
Lemma proof_of_test_neon_safety_wit_4 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_4.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_4;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_20 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_20.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_20;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_36 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_36.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_36;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_52 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_52.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_52;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_safety_wit_68 : Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_68.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_safety_wit_68;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_6 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_6.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_6;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_17_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_17_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_27_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_27_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_37.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_37;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_46 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_46.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_46,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_46_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_59 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_59.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_59;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_70_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_70_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_70_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_80 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_80.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_80,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_80_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_91 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_91.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_91;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_100 : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_100.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_100,Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_100_aux;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_114_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_114_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_114_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_126_pure : Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_126_pure.
Proof. unfold Qs8I8Cvt.neon_unit_goal.test_neon_partial_solve_wit_126_pure;try left;intros;subst;qcv_neon_bit_close. Qed.
End CheckedNeonKernelPart03.
