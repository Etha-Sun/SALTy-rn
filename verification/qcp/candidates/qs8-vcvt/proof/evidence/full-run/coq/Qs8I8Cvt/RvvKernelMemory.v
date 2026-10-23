From Coq Require Import ZArith Lia List.
From Qs8I8Cvt Require Import KernelMemory rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvKernelMemory.
Lemma proof_of_test_rvv_entail_wit_1 : Qs8I8Cvt.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold Qs8I8Cvt.rvv_unit_goal.test_rvv_entail_wit_1;left;intros.
 prop_apply(CharArray.full_Zlength input_pre(batch_pre+7)A);Intros_p Hlen.
 rewrite sizeof_char,Z.rem_1_r;entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_2 : Qs8I8Cvt.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold Qs8I8Cvt.rvv_unit_goal.test_rvv_entail_wit_2;right;intros.
 rewrite qcv_seed_cast,Z.sub_diag,qcv_values_zero;entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : Qs8I8Cvt.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold Qs8I8Cvt.rvv_unit_goal.test_rvv_entail_wit_3;intros params_pre output_pre input_pre batch_pre RawO RawM RawZ A multiplier output input batch retval;intros.
 rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r in *;subst multiplier;try subst output;rewrite ?Z.mul_1_r,?Z.add_0_r in *.
 match goal with |-context[s8_rvv_prefix retval ?lanes]=>
 change(s8_rvv_prefix retval lanes)with(s8_rvv_prefix retval(qcv_rvv_result(batch_pre-batch)retval RawZ RawM RawO A))end.
 rewrite qcv_rvv_result_prefix by lia.
 replace(batch_pre-(batch-retval))with(batch_pre-batch+retval)by lia.
 sep_apply(qcv_output_append output_pre(batch_pre-batch)retval RawZ RawM RawO A ltac:(lia)ltac:(lia)ltac:(lia)).
 destruct(Z.eq_dec(batch-retval)0)as[He|Hne].
 - eapply derivable1_trans;[|apply derivable1_orp_intros1];qcv_frame.
 - eapply derivable1_trans;[|apply derivable1_orp_intros2];qcv_frame.
Qed.
Lemma proof_of_test_rvv_return_wit_1 : Qs8I8Cvt.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold Qs8I8Cvt.rvv_unit_goal.test_rvv_return_wit_1;left;intros.
 assert(batch=0)by lia;subst batch;rewrite Z.sub_0_r,CharArray.undef_full_empty.
 rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv';apply derivable1_refl.
Qed.
End CheckedRvvKernelMemory.
