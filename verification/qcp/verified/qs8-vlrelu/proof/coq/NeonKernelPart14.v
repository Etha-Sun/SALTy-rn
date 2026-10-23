From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart14.
Lemma proof_of_test_neon_safety_wit_15 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_15.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_15;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_31 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_31.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_31;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_47 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_47.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_47;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_63 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_63.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_63;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_5 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_5;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_7 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_7;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_2 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_2;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_6 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_17_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_17_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_27.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_27, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_27_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_37_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_37_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_48 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_48.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_48, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_48_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_58 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_58.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_58;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_68_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_68_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_68_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_80 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_80.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_80, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_80_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_91_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_91_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_91_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_101 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_101.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_101;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_112 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_112.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_112, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_112_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_123 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_123.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_123;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_133 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_133.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_133, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_133_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_144 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_144.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_144;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_156 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_156.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_156, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_156_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_168 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_168.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_168, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_168_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart14.
