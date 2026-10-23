From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart07.
Lemma proof_of_test_neon_safety_wit_8 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_8.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_8;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_24 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_24.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_24;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_40 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_40.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_40;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_56 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_56.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_56;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_72 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_72.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_72;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_7 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_7;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_2 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_2;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_2, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_2_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_12.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_12;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_23_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_23_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_33.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_33, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_33_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_42;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_53_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_53_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_53_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_64 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_64.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_64, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_64_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_76_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_76_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_76_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_86 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_86.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_86, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_86_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_95 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_95.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_95, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_95_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_108_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_108_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_108_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_118 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_118.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_118, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_118_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_129 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_129.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_129;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_138_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_138_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_138_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_152_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_152_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_152_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_164_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_164_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_164_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart07.
