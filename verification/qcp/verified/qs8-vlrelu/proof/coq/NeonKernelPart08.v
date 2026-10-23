From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart08.
Lemma proof_of_test_neon_safety_wit_9 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_9.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_9;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_25 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_25.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_25;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_41 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_41.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_41;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_57 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_57.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_57;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_73 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_73.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_73;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_1 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_1;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_3 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_3;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_3_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_3_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_13_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_13_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_23, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_23_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_34_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_34_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_43;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_53 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_53.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_53, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_53_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_65_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_65_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_65_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_76 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_76.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_76, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_76_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_87 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_87.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_87;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_96_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_96_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_96_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_108 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_108.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_108, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_108_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_119 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_119.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_119;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_130_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_130_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_130_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_138 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_138.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_138, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_138_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_152 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_152.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_152, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_152_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_164 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_164.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_164, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_164_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart08.
