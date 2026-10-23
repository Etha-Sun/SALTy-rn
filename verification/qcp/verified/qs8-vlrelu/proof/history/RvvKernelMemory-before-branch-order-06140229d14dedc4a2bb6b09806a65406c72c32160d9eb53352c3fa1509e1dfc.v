From Coq Require Import ZArith Lia List.
From Qs8Lrelu Require Import KernelMemory LreluRvvKernelFacts rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque qcv_seed qcv_active_sext qcv_active_rsub qcv_active_shl7
 qcv_active_mul qcv_active_clip15 qcv_active_add qcv_active_clip8
 qlr_active_splat qlr_active_mask qlr_active_merge.
Module CheckedRvvKernelMemory.
Lemma proof_of_test_rvv_entail_wit_1 : Qs8Lrelu.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold Qs8Lrelu.rvv_unit_goal.test_rvv_entail_wit_1;left;intros.
 prop_apply(CharArray.full_Zlength input_pre(batch_pre+7)A);Intros_p Hlen.
 rewrite sizeof_char,Z.rem_1_r;entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_2 : Qs8Lrelu.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold Qs8Lrelu.rvv_unit_goal.test_rvv_entail_wit_2;right;intros.
 repeat rewrite Qs8Lrelu.LreluFacts.qlr_seed_cast;rewrite Z.sub_diag,qlr_values_zero.
 fold qcv_s16;entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : Qs8Lrelu.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold Qs8Lrelu.rvv_unit_goal.test_rvv_entail_wit_3;
 intros params_pre output_pre input_pre batch_pre O NM PM RawZ A
 output_zero_point negative_multiplier positive_multiplier input_zero_point output input batch retval;intros.
 rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r in *;
 subst output_zero_point;subst negative_multiplier;subst positive_multiplier;subst input_zero_point;
 try subst output;rewrite ?Z.mul_1_r,?Z.add_0_r in *.
 match goal with |-context[s8_rvv_prefix retval ?lanes]=>
 change(s8_rvv_prefix retval lanes)with(s8_rvv_prefix retval(qlr_rvv_result(batch_pre-batch)retval RawZ PM NM O A))end.
 rewrite qlr_rvv_result_prefix by lia.
 replace(batch_pre-(batch-retval))with(batch_pre-batch+retval)by lia.
 sep_apply(qcv_output_append output_pre(batch_pre-batch)retval RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 destruct(Z.eq_dec(batch-retval)0)as[He|Hne].
 - eapply derivable1_trans;[|apply derivable1_orp_intros1];qcv_frame.
 - eapply derivable1_trans;[|apply derivable1_orp_intros2];qcv_frame.
Qed.
Lemma proof_of_test_rvv_return_wit_1 : Qs8Lrelu.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold Qs8Lrelu.rvv_unit_goal.test_rvv_return_wit_1;left;intros.
 assert(batch=0)by lia;subst batch;rewrite Z.sub_0_r,CharArray.undef_full_empty.
 rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv';apply derivable1_refl.
Qed.
End CheckedRvvKernelMemory.
