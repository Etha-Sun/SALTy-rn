From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart13.
Lemma proof_of_test_neon_safety_wit_14 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_14;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_30 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_30.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_30;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_46 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_46.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_46;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_62 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_62.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_62;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_4 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_4;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_6 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_1 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_1;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_5, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_5_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_16.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_16;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_27_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_27_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_36.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_36, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_36_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_48_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_48_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_48_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_57 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_57.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_57;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_67 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_67.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_67, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_67_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_80_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_80_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_80_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_90 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_90.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_90, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_90_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_100 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_100.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_100;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_112_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_112_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_112_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_122 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_122.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_122, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_122_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_133_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_133_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_133_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_143 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_143.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_143;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_156_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_156_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_156_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_168_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_168_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_168_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart13.
