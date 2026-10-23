From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart15.
Lemma proof_of_test_neon_safety_wit_16 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_16.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_16;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_32 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_32.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_32;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_48 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_48.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_48;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_64 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_64.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_64;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_5_6 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_5_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_1 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_1;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_10_3 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_10_3;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_7_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_7_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_7_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_17.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_17, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_17_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_28 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_28.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_28;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_37.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_37, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_37_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_49_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_49_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_49_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_59 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_59.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_59;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_68 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_68.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_68, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_68_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_81 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_81.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_81;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_91 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_91.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_91, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_91_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_102 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_102.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_102;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_113 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_113.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_113;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_124_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_124_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_124_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_134_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_134_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_134_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_145 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_145.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_145;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_157 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_157.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_157;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_169 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_169.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_169;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart15.
