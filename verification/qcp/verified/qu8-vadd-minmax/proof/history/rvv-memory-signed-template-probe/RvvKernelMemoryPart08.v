From Coq Require Import ZArith Lia List.
From Qu8Add Require Import rvv_unit_goal RvvKernelMemorySupport RvvKernelResourceFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qu_neon_lane qu_neon_mul qu_neon_mla qu_neon_shift qu_neon_add16 qu_s16 qu_sat16 qu_sat8 qu_min qu_max qu_ctrl qu_values qu_window.
Module CheckedRvvKernelMemoryPart08.
Lemma proof_of_test_rvv_entail_wit_4_4 : Qu8Add.rvv_unit_goal.test_rvv_entail_wit_4_4.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_entail_wit_4_4, Qu8Add.rvv_unit_goal_chunk11.test_rvv_entail_wit_4_4.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift vl PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
subst right_shift.
 pose proof(qu_rvv_pipeline_pack32 vl(batch_pre-batch)Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as Hpacket.
 cbn beta zeta in Hpacket;unfold qu_rvv_pipeline in Hpacket.
 destruct(Z.leb_spec(qu_ctrl RawShift)(-32));
 destruct(Z.leb_spec 32(qu_ctrl RawShift));
 destruct(Z.ltb_spec(qu_ctrl RawShift)0);try lia;
 cbn[orb]in Hpacket;
 rewrite Hpacket;
 sep_apply (UCharArray.seg_to_full output 0 vl (qu_window (batch_pre-batch) vl Az Bz Ma Mb RawShift Oz Lo Hi A B));
 rewrite ?Z.add_0_r,?Z.sub_0_r,?Z.mul_0_l;
 replace output with(output_pre+(batch_pre-batch))by lia;
 sep_apply(qu_rvv_output_append_full output_pre(batch_pre-batch)vl Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia));
 replace(batch_pre-batch+vl)with(batch_pre-(batch-vl))by lia;
 destruct(Z.eq_dec(batch-vl)0)as[Hz|Hz];
 [eapply derivable1_trans;[|apply derivable1_orp_intros2]|eapply derivable1_trans;[|apply derivable1_orp_intros1]];
 qu_rvv_kernel_frame.
Qed.
End CheckedRvvKernelMemoryPart08.
