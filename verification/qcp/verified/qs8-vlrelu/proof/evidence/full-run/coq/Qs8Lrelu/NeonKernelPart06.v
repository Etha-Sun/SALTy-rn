From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart06.
Lemma proof_of_test_neon_safety_wit_7 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_7;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_23 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_23.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_23;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_39 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_39.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_39;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_55 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_55.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_55;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_71 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_71.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_71;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_6 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_1 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_1;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_2_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_2_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_11.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_11, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_11_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_22;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_33_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_33_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_41.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_41;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_52 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_52.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_52, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_52_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_64_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_64_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_64_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_75 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_75.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_75;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_86_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_86_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_86_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_95_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_95_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_95_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_107 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_107.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_107;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_118_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_118_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_118_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_128 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_128.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_128, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_128_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_137 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_137.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_137, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_137_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_151 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_151.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_151;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_163 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_163.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_163;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart06.
