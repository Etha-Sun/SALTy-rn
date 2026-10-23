From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart03.
Lemma proof_of_test_neon_safety_wit_4 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_4;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_20 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_20.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_20;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_36 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_36.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_36;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_52 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_52.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_52;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_68 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_68.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_68;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_3 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_3;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_5 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_5;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_7 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_7;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_9, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_9_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_20;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_31;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_39, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_39_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_51_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_51_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_51_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_62 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_62.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_62, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_62_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_72 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_72.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_72;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_84_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_84_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_84_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_93 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_93.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_93, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_93_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_105 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_105.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_105;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_116_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_116_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_116_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_126 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_126.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_126, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_126_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_136_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_136_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_136_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_149 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_149.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_149;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_161 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_161.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_161;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_173 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_173.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_173;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart03.
