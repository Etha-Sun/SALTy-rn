From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import rvv_unit_goal ProgramFacts KernelCallsSupport RvvResult.
From QcpRvv32 Require Import RvvLoopMemory RvvLoopResult RvvResultBridge RvvLogic RvvStoreModel RvvLoopModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvMemory.
Lemma proof_of_test_rvv_entail_wit_1 : Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_1;right;intros.
 rewrite sizeof_char,Z.rem_1_r. entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_2 : Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_2;left;intros.
 prop_apply(CharArray.full_Zlength input_pre(batch_pre+7)A). Intros_p Hlen.
 rewrite Z.sub_diag. cbn[cvt_values Z.to_nat seq map].
 rewrite FloatArray.seg_empty.
 sep_apply(FloatArray.undef_full_to_undef_seg output_pre batch_pre).
 unfold cvt_s16,cvt_same. entailer!;lia.
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_3;right;intros.
 subst output. rewrite sizeof_float in *.
 sep_apply(FloatArray.undef_seg_split_to_undef_seg output_pre(batch_pre-batch)(batch_pre-batch+retval)batch_pre ltac:(lia)).
 sep_apply(FloatArray.undef_seg_to_undef_full output_pre(batch_pre-batch)(batch_pre-batch+retval)).
 replace(batch_pre-batch+retval-(batch_pre-batch))with retval by lia.
 entailer!;lia.
Qed.
Lemma proof_of_test_rvv_return_wit_1 : Qs8Cvt.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold Qs8Cvt.rvv_unit_goal.test_rvv_return_wit_1;right;intros.
 assert(batch=0)by lia;subst batch. rewrite Z.sub_0_r.
 sep_apply(FloatArray.seg_to_full output_pre 0 batch_pre(cvt_values batch_pre A RawZ Scale)).
 replace(output_pre+0*sizeof(FLOAT))with output_pre by lia.
 rewrite Z.sub_0_r. rewrite FloatArray.undef_seg_empty. entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_4 : Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_4.
Proof.
 unfold Qs8Cvt.rvv_unit_goal.test_rvv_entail_wit_4;left;intros.
 unfold cvt_same in *;subst input output zero_point scale.
 match goal with |-context[rvv_take vl ?lanes]=>
 change(rvv_take vl lanes)with(rvv_take vl(cvt_result_packed(batch_pre-batch)vl A RawZ Scale))end.
 rewrite cvt_result_packed_prefix by lia.
 replace(batch_pre-(batch-vl))with(batch_pre-batch+vl)by lia.
 sep_apply(rvv_output_append output_pre(batch_pre-batch)vl
 (cvt_values(batch_pre-batch)A RawZ Scale)(cvt_chunk(batch_pre-batch)vl A RawZ Scale)ltac:(lia)ltac:(lia)).
 rewrite <-cvt_values_append by lia.
 rewrite ?sizeof_char,?sizeof_float in *;rewrite ?Z.rem_1_r.
 entailer!;lia.
Qed.
End CheckedRvvMemory.
Print Assumptions CheckedRvvMemory.proof_of_test_rvv_entail_wit_1.
Print Assumptions CheckedRvvMemory.proof_of_test_rvv_entail_wit_2.
Print Assumptions CheckedRvvMemory.proof_of_test_rvv_entail_wit_3.
Print Assumptions CheckedRvvMemory.proof_of_test_rvv_return_wit_1.
Print Assumptions CheckedRvvMemory.proof_of_test_rvv_entail_wit_4.
