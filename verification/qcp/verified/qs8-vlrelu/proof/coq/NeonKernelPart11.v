From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart11.
Lemma proof_of_test_neon_safety_wit_12 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_12.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_12;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_28 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_28.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_28;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_44 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_44.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_44;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_60 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_60.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_60;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_2 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_2;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_4 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_4;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_6 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_4, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_4_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_15_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_15_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_15_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_25.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_25, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_25_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_35, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_35_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_46 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_46.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_46;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_55 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_55.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_55;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_66 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_66.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_66, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_66_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_78 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_78.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_78, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_78_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_89 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_89.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_89;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_98 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_98.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_98;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_110 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_110.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_110, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_110_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_121 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_121.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_121;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_132_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_132_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_132_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_141 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_141.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_141;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_154 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_154.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_154, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_154_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_166 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_166.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_166, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_166_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart11.
