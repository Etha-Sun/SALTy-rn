From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart09.
Lemma proof_of_test_neon_safety_wit_10 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_10.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_10;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_26 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_26.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_26;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_42 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_42.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_42;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_58 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_58.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_58;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_74 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_74.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_74;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_7_2 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_2.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_7_2;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_9_4 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_9_4;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_3.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_3, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_3_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_13.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_13, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_13_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_24.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_24;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_34, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_34_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_44.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_44;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_54_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_54_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_54_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_65 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_65, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_65_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_77 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_77.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_77;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_88_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_88_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_88_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_96 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_96.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_96, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_96_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_109 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_109.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_109;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_120_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_120_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_120_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_130 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_130.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_130, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_130_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_139 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_139.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_139;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_153 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_153.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_153;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_165 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_165.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_165;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart09.
