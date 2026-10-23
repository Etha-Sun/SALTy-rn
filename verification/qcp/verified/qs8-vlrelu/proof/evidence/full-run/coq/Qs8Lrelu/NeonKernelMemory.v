From Coq Require Import ZArith Lia List.
From Qs8Lrelu Require Import LreluChunkExpressionFacts NeonKernelMemorySupport ComposedModel neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque qcv_seed qcv_neon_qrdmulh qcv_shl7 qcv_subw qcv_neon_add qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module CheckedNeonKernelMemory.
Lemma proof_of_test_neon_entail_wit_1 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_1.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_1;left;intros.
 prop_apply(CharArray.full_Zlength input_pre(batch_pre+7)A);Intros_p Hlen.
 rewrite sizeof_char,Z.rem_1_r;entailer!.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1.
Lemma proof_of_test_neon_entail_wit_2 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_2;right;intros.
 repeat rewrite Qs8Lrelu.LreluFacts.qlr_seed_cast;rewrite Z.sub_diag,qlr_values_zero.
 fold qcv_s16;rewrite CharArray.undef_full_empty;entailer!.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
Lemma proof_of_test_neon_entail_wit_3 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_3;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A output input batch;intros.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 pose proof(qlr_chunk_expression_8(batch_pre-batch)RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk.
 unfold qlr_neon_expression,s8_pack8 in Hchunk.
 unfold s8_pack8;rewrite <-Hchunk.
 replace(batch_pre-(batch-8))with(batch_pre-batch+8)by lia.
 sep_apply(qcv_output_append_full output_pre(batch_pre-batch)8 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 destruct(Z.eq_dec(batch-8)0)as[He|Hne].
 - eapply derivable1_trans;[|apply derivable1_orp_intros2];qcv_frame.
 - eapply derivable1_trans;[|apply derivable1_orp_intros1];qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3.
Lemma proof_of_test_neon_return_wit_8 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_8.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_8;left;intros;subst batch.
 rewrite Z.sub_0_r,CharArray.undef_full_empty.
 rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv';apply derivable1_refl.
Qed.
Print Assumptions proof_of_test_neon_return_wit_8.

Lemma proof_of_test_neon_return_wit_1 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_1;left;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A batch input output;intros;subst batch.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 rewrite CharArray.undef_full_empty;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
 replace(4+2)with(6:Z)by lia.
 unfold qcv_pack1,qcv_pack2,qcv_pack4.
 pose proof(qlr_chunk_expression_2 (batch_pre-3) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk0.
 unfold qlr_neon_expression in Hchunk0.
 rewrite <-Hchunk0.
 replace(output_pre+(batch_pre-3)+2)with(output_pre+((batch_pre-3)+2))by lia.
 pose proof(qlr_chunk_expression_1 ((batch_pre-3)+2) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk2.
 unfold qlr_neon_expression in Hchunk2.
 replace(((batch_pre-3)+2)+0)with((batch_pre-3)+2)in Hchunk2 by lia.
 rewrite <-Hchunk2.
 sep_apply(qcv_output_append_full output_pre (batch_pre-3) 2 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace((batch_pre-3)+2) with ((batch_pre-3)+2) by lia.
 sep_apply(qcv_output_append_full output_pre ((batch_pre-3)+2) 1 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(((batch_pre-3)+2)+1) with batch_pre by lia.
 qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.

Lemma proof_of_test_neon_return_wit_2 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_2.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_2;left;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A batch input output;intros;subst batch.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 rewrite CharArray.undef_full_empty;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
 replace(4+2)with(6:Z)by lia.
 unfold qcv_pack1,qcv_pack2,qcv_pack4.
 pose proof(qlr_chunk_expression_4 (batch_pre-7) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk0.
 unfold qlr_neon_expression in Hchunk0.
 rewrite <-Hchunk0.
 replace(output_pre+(batch_pre-7)+4)with(output_pre+((batch_pre-7)+4))by lia.
 pose proof(qlr_chunk_expression_2 ((batch_pre-7)+4) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk4.
 unfold qlr_neon_expression in Hchunk4.
 replace(((batch_pre-7)+4)+0)with((batch_pre-7)+4)in Hchunk4 by lia.
 replace(((batch_pre-7)+4)+1)with((batch_pre-7)+5)in Hchunk4 by lia.
 rewrite <-Hchunk4.
 replace(output_pre+(batch_pre-7)+6)with(output_pre+((batch_pre-7)+6))by lia.
 pose proof(qlr_chunk_expression_1 ((batch_pre-7)+6) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk6.
 unfold qlr_neon_expression in Hchunk6.
 replace(((batch_pre-7)+6)+0)with((batch_pre-7)+6)in Hchunk6 by lia.
 rewrite <-Hchunk6.
 sep_apply(qcv_output_append_full output_pre (batch_pre-7) 4 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace((batch_pre-7)+4) with ((batch_pre-7)+4) by lia.
 sep_apply(qcv_output_append_full output_pre ((batch_pre-7)+4) 2 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(((batch_pre-7)+4)+2) with ((batch_pre-7)+6) by lia.
 sep_apply(qcv_output_append_full output_pre ((batch_pre-7)+6) 1 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(((batch_pre-7)+6)+1) with batch_pre by lia.
 qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_2.

Lemma proof_of_test_neon_return_wit_3 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_3.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_3;left;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A batch input output;intros;subst batch.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 rewrite CharArray.undef_full_empty;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
 replace(4+2)with(6:Z)by lia.
 unfold qcv_pack1,qcv_pack2,qcv_pack4.
 pose proof(qlr_chunk_expression_4 (batch_pre-5) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk0.
 unfold qlr_neon_expression in Hchunk0.
 rewrite <-Hchunk0.
 replace(output_pre+(batch_pre-5)+4)with(output_pre+((batch_pre-5)+4))by lia.
 pose proof(qlr_chunk_expression_1 ((batch_pre-5)+4) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk4.
 unfold qlr_neon_expression in Hchunk4.
 replace(((batch_pre-5)+4)+0)with((batch_pre-5)+4)in Hchunk4 by lia.
 rewrite <-Hchunk4.
 sep_apply(qcv_output_append_full output_pre (batch_pre-5) 4 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace((batch_pre-5)+4) with ((batch_pre-5)+4) by lia.
 sep_apply(qcv_output_append_full output_pre ((batch_pre-5)+4) 1 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(((batch_pre-5)+4)+1) with batch_pre by lia.
 qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_3.

Lemma proof_of_test_neon_return_wit_4 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_4.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_4;left;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A batch input output;intros;subst batch.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 rewrite CharArray.undef_full_empty;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
 replace(4+2)with(6:Z)by lia.
 unfold qcv_pack1,qcv_pack2,qcv_pack4.
 pose proof(qlr_chunk_expression_1 (batch_pre-1) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk0.
 unfold qlr_neon_expression in Hchunk0.
 rewrite <-Hchunk0.
 sep_apply(qcv_output_append_full output_pre (batch_pre-1) 1 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace((batch_pre-1)+1) with batch_pre by lia.
 qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_4.

Lemma proof_of_test_neon_return_wit_5 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_5.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_5;left;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A batch input output;intros;subst batch.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 rewrite CharArray.undef_full_empty;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
 replace(4+2)with(6:Z)by lia.
 unfold qcv_pack1,qcv_pack2,qcv_pack4.
 pose proof(qlr_chunk_expression_2 (batch_pre-2) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk0.
 unfold qlr_neon_expression in Hchunk0.
 rewrite <-Hchunk0.
 sep_apply(qcv_output_append_full output_pre (batch_pre-2) 2 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace((batch_pre-2)+2) with batch_pre by lia.
 qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_5.

Lemma proof_of_test_neon_return_wit_6 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_6.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_6;left;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A batch input output;intros;subst batch.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 rewrite CharArray.undef_full_empty;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
 replace(4+2)with(6:Z)by lia.
 unfold qcv_pack1,qcv_pack2,qcv_pack4.
 pose proof(qlr_chunk_expression_4 (batch_pre-6) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk0.
 unfold qlr_neon_expression in Hchunk0.
 rewrite <-Hchunk0.
 replace(output_pre+(batch_pre-6)+4)with(output_pre+((batch_pre-6)+4))by lia.
 pose proof(qlr_chunk_expression_2 ((batch_pre-6)+4) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk4.
 unfold qlr_neon_expression in Hchunk4.
 replace(((batch_pre-6)+4)+0)with((batch_pre-6)+4)in Hchunk4 by lia.
 replace(((batch_pre-6)+4)+1)with((batch_pre-6)+5)in Hchunk4 by lia.
 rewrite <-Hchunk4.
 sep_apply(qcv_output_append_full output_pre (batch_pre-6) 4 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace((batch_pre-6)+4) with ((batch_pre-6)+4) by lia.
 sep_apply(qcv_output_append_full output_pre ((batch_pre-6)+4) 2 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace(((batch_pre-6)+4)+2) with batch_pre by lia.
 qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_6.

Lemma proof_of_test_neon_return_wit_7 : Qs8Lrelu.neon_unit_goal.test_neon_return_wit_7.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_return_wit_7;left;intros params_pre output_pre input_pre batch_pre O NM PM RawZ A batch input output;intros;subst batch.
 rewrite ?sizeof_char,?Z.mul_1_r in *;subst output;try subst input.
 rewrite CharArray.undef_full_empty;rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
 replace(4+2)with(6:Z)by lia.
 unfold qcv_pack1,qcv_pack2,qcv_pack4.
 pose proof(qlr_chunk_expression_4 (batch_pre-4) RawZ PM NM O A ltac:(lia)ltac:(lia))as Hchunk0.
 unfold qlr_neon_expression in Hchunk0.
 rewrite <-Hchunk0.
 sep_apply(qcv_output_append_full output_pre (batch_pre-4) 4 RawZ PM NM O A ltac:(lia)ltac:(lia)ltac:(lia)).
 replace((batch_pre-4)+4) with batch_pre by lia.
 qcv_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_7.
Ltac root_all_pure q := lazymatch q with
 | coq_prop _=>idtac
 | andp ?a ?b=>root_all_pure a;root_all_pure b
 end.
Ltac root_same_frame :=
 lazymatch goal with |-?P|--?Q=>
 lazymatch Q with
 | coq_prop _=>qcv_pure
 | andp ?a ?b=>apply _derivable1_andp_intros;[root_same_frame|root_same_frame]
 | _=>first[exact(derivable1_refl P)|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]
 end end.
Ltac root_select_or :=
 lazymatch goal with |-?P|--?Q=>
 lazymatch Q with
 | orp ?a ?b=>first[
 solve[eapply derivable1_trans;[|apply derivable1_orp_intros1];root_select_or]
 |solve[eapply derivable1_trans;[|apply derivable1_orp_intros2];root_select_or]]
 | _=>root_same_frame
 end end.
Lemma proof_of_test_neon_entail_wit_4 : Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_4.
Proof.
 unfold Qs8Lrelu.neon_unit_goal.test_neon_entail_wit_4;intros.
 rewrite ?sizeof_char,?Z.mul_1_r in *.
 assert(Hcases:batch=7 \/ batch=6 \/ batch=5 \/ batch=4 \/ batch=3 \/ batch=2 \/ batch=1)by lia.
 destruct Hcases as[H7|[H6|[H5|[H4|[H3|[H2|H1]]]]]];subst batch;root_select_or.

Qed.
Print Assumptions proof_of_test_neon_entail_wit_4.
End CheckedNeonKernelMemory.
