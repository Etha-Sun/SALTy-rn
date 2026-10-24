From Qs8Add Require Import RvvKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_1;left;intros.
 prop_apply(CharArray.full_Zlength input_a_pre(batch_pre+7)A);Intros_p HA.
 prop_apply(CharArray.full_Zlength input_b_pre(batch_pre+7)B);Intros_p HB.
 rewrite sizeof_char;qa_rvv_kernel_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_2_1 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_2_1.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_2_1;right;intros.
 rewrite Z.sub_diag,qa_values_zero.
 rewrite <-qa_control_decode_correct;unfold qa_control_decode.
 repeat match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y)end;
 qa_rvv_kernel_pure.
Qed.
Lemma proof_of_test_rvv_entail_wit_2_2 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_2_2.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_2_2;right;intros.
 rewrite Z.sub_diag,qa_values_zero.
 rewrite <-qa_control_decode_correct;unfold qa_control_decode.
 repeat match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y)end;
 qa_rvv_kernel_pure.
Qed.
Lemma proof_of_test_rvv_entail_wit_2_3 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_2_3.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_2_3;right;intros.
 rewrite Z.sub_diag,qa_values_zero.
 rewrite <-qa_control_decode_correct;unfold qa_control_decode.
 repeat match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y)end;
 qa_rvv_kernel_pure.
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_3.
Proof. unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_3;intros;qa_rvv_kernel_frame. Qed.
Lemma proof_of_test_rvv_return_wit_1 : Qs8Add.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_return_wit_1;right;intros;subst batch.
 rewrite Z.sub_0_r,CharArray.undef_full_empty,logic_equiv_sepcon_emp;apply derivable1_refl.
Qed.
