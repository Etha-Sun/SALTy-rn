From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Import annotated_goal BorrowedConsumerSupport KernelCursorFacts APBlockMainProgressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_15_4:annotated_goal.test_rvv_entail_wit_15_4.
Proof.
 unfold annotated_goal.test_rvv_entail_wit_15_4;apb_intro.
 assert(Hrange:0<k<=app_rows D)by lia.
 assert(Hremain:k=app_remaining(app_rows D)(app_group_cursor D k))by congruence.
 pose proof(app_group_cursor_active D k Hrange Hremain)as[Hg Hgroups].
 pose proof(app_block_base_positive F P W WI D (app_pixels D-output_pixels) PreH12 ltac:(lia))as[Hout Hindex].
 pose proof PreH1 as HW;pose proof PreH2 as HF.
 rewrite <-PreH26,<-PreH4 in HW,HF.
 rewrite PreH36,PreH37,PreH38,PreH39,PreH40,PreH41,PreH42,PreH43,PreH44,PreH45,PreH46,PreH27,PreH34,PreH35 in HW.
 rewrite PreH34,PreH35 in HF.
 rewrite PreH17,PreH18,PreH19,PreH20,PreH3,PreH4 in HW.
 rewrite PreH19,PreH20,PreH4 in HF.
 pose proof(apbm_progress_after_block F P D (app_pixels D-output_pixels) (app_group_cursor D k) (app_channels D-c) O I vl O2 I2 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) Hout Hindex HW HF)as[EO EI].
 rewrite <-PreH4 in EO,EI.
 replace(channels-c+vl)with(channels-(c-vl))in EO,EI by lia.
 rewrite EO,EI.
 change(sizeof(UINT))with 4 in *.
 assert(Ho:o+vl*sizeof(FLOAT)=app_output_cursor output(channels-(c-vl))).
 { rewrite PreH34,PreH13;unfold app_output_cursor;ring. }
 assert(Hi:i+vl*4=app_output_cursor index(channels-(c-vl))).
 { rewrite PreH35;unfold app_output_cursor;ring. }
 assert(Hrow0:i0+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)0(channels-(c-vl))).
 { rewrite PreH38,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow1:i1+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)1(channels-(c-vl))).
 { rewrite PreH39,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow2:i2+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)2(channels-(c-vl))).
 { rewrite PreH40,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow3:i3+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)3(channels-(c-vl))).
 { rewrite PreH41,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow4:i4+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)4(channels-(c-vl))).
 { rewrite PreH42,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow5:i5+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)5(channels-(c-vl))).
 { rewrite PreH43,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow6:i6+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)6(channels-(c-vl))).
 { rewrite PreH44,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow7:i7+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)7(channels-(c-vl))).
 { rewrite PreH45,PreH13;unfold app_row_cursor;ring. }
 assert(Hrow8:i8+vl*sizeof(FLOAT)=app_row_cursor P input input_offset pooling_elements(app_group_cursor D k)8(channels-(c-vl))).
 { rewrite PreH46,PreH13;unfold app_row_cursor;ring. }
 assert(Hgz:app_group_cursor D k=0).
 { apply(app_block_previous_zero(app_group_cursor D k)output(channels-c));[rewrite PreH19;exact Hout|lia|rewrite <-PreH36;exact PreH67]. }
 assert(Hab:current_ab=app_previous_cursor(app_group_cursor D k)output(channels-(c-vl))).
 { rewrite Hgz;unfold app_previous_cursor;cbn;exact PreH67. }
 assert(Hib:current_ib=app_previous_cursor(app_group_cursor D k)index(channels-(c-vl))).
 { rewrite PreH37,Hgz;reflexivity. }
 Right;apb_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_15_4.
