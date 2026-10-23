From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart02.
Lemma proof_of_test_neon_safety_wit_3 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_3;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_19 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_19.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_19;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_35 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_35.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_35;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_51 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_51.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_51;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_67 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_67.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_67;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_2 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_2;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_4 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_4;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_6 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_9_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_9_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_9_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_19, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_19_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_30;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_39_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_39_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_50 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_50.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_50, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_50_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_62_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_62_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_62_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_71 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_71.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_71;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_83 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_83.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_83;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_93_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_93_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_93_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_104 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_104.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_104, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_104_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_115 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_115.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_115;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_126_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_126_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_126_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_135 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_135.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_135, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_135_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_148 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_148.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_148;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_160 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_160.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_160;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_172 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_172.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_172;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart02.
