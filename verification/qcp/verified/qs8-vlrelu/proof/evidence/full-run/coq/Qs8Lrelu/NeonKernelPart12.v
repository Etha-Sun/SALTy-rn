From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart12.
Lemma proof_of_test_neon_safety_wit_13 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_13.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_13;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_29 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_29.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_29;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_45 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_45.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_45;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_61 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_61.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_61;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_3 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_3;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_5 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_5;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_7 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_7;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_5_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_5_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_15.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_15, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_15_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_26;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_36_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_36_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_36_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_47 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_47.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_47;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_56 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_56.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_56;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_67_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_67_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_67_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_79 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_79.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_79;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_90_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_90_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_90_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_99 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_99.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_99;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_111 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_111.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_111;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_122_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_122_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_122_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_132 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_132.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_132, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_132_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_142 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_142.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_142;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_155 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_155.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_155;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_167 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_167.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_167;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart12.
