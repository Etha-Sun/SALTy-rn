From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelPart04.
Lemma proof_of_test_neon_safety_wit_5 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_5.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_5;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_21 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_21.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_21;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_37 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_37.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_37;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_53 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_53.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_53;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_safety_wit_69 : Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_69.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_safety_wit_69;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_6_4 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_4.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_6_4;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_entail_wit_8_6 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_6.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_8_6;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_1_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_10.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_10;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_21_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_21_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_21_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_32_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_32_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_40_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_40_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_40_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_51 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_51.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_51, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_51_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_63_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_63_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_63_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_73 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_73.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_73;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_84 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_84.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_84, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_84_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_94_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_94_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_94_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_106_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_106_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_106_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_116 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_116.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_116, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_116_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_127 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_127.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_127;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_136 : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_136.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_136, Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_136_aux;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_150_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_150_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_150_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
Lemma proof_of_test_neon_partial_solve_wit_162_pure : Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_162_pure.
Proof. unfold Qs8Lrelu.neon_unit_goal.test_neon_partial_solve_wit_162_pure;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_kernel_close. Qed.
End CheckedNeonKernelPart04.
