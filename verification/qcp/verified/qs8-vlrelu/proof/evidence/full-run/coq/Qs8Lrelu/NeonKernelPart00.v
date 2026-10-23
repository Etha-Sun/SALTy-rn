From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart00.
Lemma proof_of_test_neon_safety_wit_1 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_1;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_17 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_17.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_17;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_33 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_33.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_33;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_49 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_49.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_49;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_65 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_65.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_65;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_7 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_7;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_2 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_2;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_4 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_4;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_7 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_7, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_7_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_18.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_18;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_29_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_29_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_38_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_38_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_49 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_49.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_49, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_49_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_60 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_60.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_60;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_69 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_69.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_69;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_82_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_82_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_92_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_92_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_92_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_103 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_103.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_103;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_114_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_114_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_114_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_124 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_124.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_124, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_124_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_134 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_134.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_134, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_134_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_146 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_146.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_146;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_158 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_158.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_158;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_170 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_170.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_170;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart00.
