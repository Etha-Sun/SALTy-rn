From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart01.
Lemma proof_of_test_neon_safety_wit_2 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_2;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_18 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_18.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_18;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_34 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_34.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_34;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_50 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_50.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_50;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_66 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_66.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_66;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_1 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_1;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_3 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_3;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_5 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_5;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_8;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_19_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_19_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_29, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_29_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_38.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_38, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_38_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_50_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_50_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_50_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_61 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_61.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_61;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_70 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_70.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_70;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_82.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_82, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_82_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_92 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_92.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_92, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_92_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_104_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_104_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_104_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_114 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_114.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_114, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_114_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_125 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_125.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_125;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_135_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_135_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_135_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_147 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_147.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_147;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_159 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_159.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_159;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_171 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_171.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_171;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart01.
