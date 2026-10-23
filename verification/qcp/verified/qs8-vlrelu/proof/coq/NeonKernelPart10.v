From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart10.
Lemma proof_of_test_neon_safety_wit_11 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_11.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_11;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_27 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_27.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_27;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_43 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_43.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_43;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_59 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_59.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_59;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_1 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_1;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_3 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_3;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_5 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_5;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_4_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_4_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_14;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_25_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_25_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_35_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_35_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_45 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_45.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_45;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_54 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_54.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_54, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_54_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_66_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_66_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_66_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_78_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_78_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_78_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_88 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_88.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_88, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_88_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_97 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_97.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_97;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_110_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_110_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_110_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_120 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_120.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_120, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_120_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_131 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_131.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_131;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_140 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_140.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_140;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_154_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_154_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_154_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_166_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_166_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_166_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart10.
