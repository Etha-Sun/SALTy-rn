From Qs8Add Require Import RvvKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_4_1 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_1.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_1;intros;subst right_shift.
 pose proof(qa_rvv_pipeline_pack32 vl(batch_pre-batch)Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hpacket.
 cbn beta zeta in Hpacket;unfold qa_rvv_pipeline in Hpacket.
 destruct(Z.leb_spec(qa_ctrl RawShift)(-32));
 destruct(Z.leb_spec 32(qa_ctrl RawShift));
 destruct(Z.ltb_spec(qa_ctrl RawShift)0);try lia;
 cbn[orb]in Hpacket;
 rewrite Hpacket;
 replace output with(output_pre+(batch_pre-batch))by lia;
 sep_apply(qa_rvv_output_append_full output_pre(batch_pre-batch)vl Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia));
 replace(batch_pre-batch+vl)with(batch_pre-(batch-vl))by lia;
 destruct(Z.eq_dec(batch-vl)0)as[Hz|Hz];
 [eapply derivable1_trans;[|apply derivable1_orp_intros2]|eapply derivable1_trans;[|apply derivable1_orp_intros1]];
 qa_rvv_kernel_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_4_2 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_2.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_2;intros;subst right_shift.
 pose proof(qa_rvv_pipeline_pack32 vl(batch_pre-batch)Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hpacket.
 cbn beta zeta in Hpacket;unfold qa_rvv_pipeline in Hpacket.
 destruct(Z.leb_spec(qa_ctrl RawShift)(-32));
 destruct(Z.leb_spec 32(qa_ctrl RawShift));
 destruct(Z.ltb_spec(qa_ctrl RawShift)0);try lia;
 cbn[orb]in Hpacket;
 rewrite Hpacket;
 replace output with(output_pre+(batch_pre-batch))by lia;
 sep_apply(qa_rvv_output_append_full output_pre(batch_pre-batch)vl Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia));
 replace(batch_pre-batch+vl)with(batch_pre-(batch-vl))by lia;
 destruct(Z.eq_dec(batch-vl)0)as[Hz|Hz];
 [eapply derivable1_trans;[|apply derivable1_orp_intros2]|eapply derivable1_trans;[|apply derivable1_orp_intros1]];
 qa_rvv_kernel_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_4_3 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_3.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_3;intros;subst right_shift.
 pose proof(qa_rvv_pipeline_pack32 vl(batch_pre-batch)Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hpacket.
 cbn beta zeta in Hpacket;unfold qa_rvv_pipeline in Hpacket.
 destruct(Z.leb_spec(qa_ctrl RawShift)(-32));
 destruct(Z.leb_spec 32(qa_ctrl RawShift));
 destruct(Z.ltb_spec(qa_ctrl RawShift)0);try lia;
 cbn[orb]in Hpacket;
 rewrite Hpacket;
 replace output with(output_pre+(batch_pre-batch))by lia;
 sep_apply(qa_rvv_output_append_full output_pre(batch_pre-batch)vl Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia));
 replace(batch_pre-batch+vl)with(batch_pre-(batch-vl))by lia;
 destruct(Z.eq_dec(batch-vl)0)as[Hz|Hz];
 [eapply derivable1_trans;[|apply derivable1_orp_intros2]|eapply derivable1_trans;[|apply derivable1_orp_intros1]];
 qa_rvv_kernel_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_4_4 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_4.
Proof.
 unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_4_4;intros;subst right_shift.
 pose proof(qa_rvv_pipeline_pack32 vl(batch_pre-batch)Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hpacket.
 cbn beta zeta in Hpacket;unfold qa_rvv_pipeline in Hpacket.
 destruct(Z.leb_spec(qa_ctrl RawShift)(-32));
 destruct(Z.leb_spec 32(qa_ctrl RawShift));
 destruct(Z.ltb_spec(qa_ctrl RawShift)0);try lia;
 cbn[orb]in Hpacket;
 rewrite Hpacket;
 replace output with(output_pre+(batch_pre-batch))by lia;
 sep_apply(qa_rvv_output_append_full output_pre(batch_pre-batch)vl Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia));
 replace(batch_pre-batch+vl)with(batch_pre-(batch-vl))by lia;
 destruct(Z.eq_dec(batch-vl)0)as[Hz|Hz];
 [eapply derivable1_trans;[|apply derivable1_orp_intros2]|eapply derivable1_trans;[|apply derivable1_orp_intros1]];
 qa_rvv_kernel_frame.
Qed.
