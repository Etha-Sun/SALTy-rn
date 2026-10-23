From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart05.
Lemma proof_of_test_neon_safety_wit_6 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_22 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_22.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_22;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_38 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_38.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_38;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_54 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_54.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_54;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_70 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_70.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_70;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_5 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_5;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_7 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_7.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_7;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_1, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_1_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_11_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_11_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_21.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_21, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_21_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_32.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_32, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_32_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_40.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_40, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_40_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_52_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_52_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_52_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_63 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_63.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_63, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_63_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_74 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_74.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_74;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_85 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_85.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_85;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_94 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_94.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_94, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_94_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_106 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_106.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_106, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_106_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_117 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_117.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_117;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_128_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_128_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_128_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_137_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_137_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_137_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_150 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_150.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_150, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_150_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_162 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_162.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_162, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_162_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart05.
