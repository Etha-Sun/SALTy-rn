From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelMemoryTailSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_35:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_35.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_35;right;apb_intro.
 assert(Hcount:c=1).
 { assert(Hc:c=1\/c=2\/c=3)by lia;destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;lia. }
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH34;exact PreH56).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 destruct(app_block_base_positive F P W WI D(app_pixels D-output_pixels)PreH43 ltac:(lia))as[HbaseO HbaseI].
 assert(Hzero:app_group_cursor D k=0).
 { apply(app_block_previous_zero(app_group_cursor D k)output(channels-c));[rewrite PreH50;exact HbaseO|lia|].
   rewrite <-PreH64;exact PreH89. }
 assert(Hlane0:(r0_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_step by lia;unfold app_step.
 assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=None).
 { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
 unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
 rewrite !app_block_candidate_pair.
 rewrite <-PreH48,<-PreH49,<-PreH34.
 repeat rewrite <-PreH56.
 try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73;try rewrite <-PreH74.
 apkt_insert_reduce;apkt_update.
 rewrite !app_block_add_assoc,!app_block_index_add.
 unfold app_index_base_at;rewrite ?Z.add_0_r.
 reflexivity.
 }
 assert(HO0:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_fpack2 r0_8 r1_8)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_output_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_fpack2];first[exact(f_equal fst Hlane0)]. }
 rewrite <-PreH50 in HO0.
 rewrite <-PreH62 in HO0.
 try rewrite <-PreH34 in HO0;repeat rewrite <-PreH56 in HO0.
 assert(HI0:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_ipack2 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_index_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_ipack2];first[exact(f_equal snd Hlane0)]. }
 rewrite <-PreH51 in HI0.
 rewrite <-PreH63 in HI0.
 try rewrite <-PreH34 in HI0;repeat rewrite <-PreH56 in HI0.
 try rewrite <-PreH34;repeat rewrite <-PreH56;rewrite <-PreH35.
 rewrite HO0,HI0.
 replace(channels-c+1)with(app_channels D)by lia.
 rewrite app_tail_output_complete,app_tail_index_complete by lia.
 assert(Hnext:app_group_cursor D(k-9)=app_group_cursor D k+1).
 { pose proof(app_group_cursor_step D k ltac:(lia)Hrem)as HT;
 destruct(Z.ltb_spec 9 k);[exact HT|lia]. }
 rewrite Hnext.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)output ltac:(lia))as HprevO.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)index ltac:(lia))as HprevI.
 pose proof(app_tail_remaining_step D k ltac:(lia)Hrem)as Hremaining.
 rewrite <-PreH34 in Hremaining.
 assert(Hremaining_exact:(k-9)=app_remaining pooling_elements(app_group_cursor D k+1))by lia.
 try rewrite app_tail_index_advance.
 rewrite !app_block_add_assoc.
 assert(Hadvance:ap_add_u32(app_index_base_at(app_group_cursor D k))9=app_index_base_at(app_group_cursor D k+1))by apply app_index_cursor_step.
 apkp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_17_36:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_36.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_36;right;apb_intro.
 assert(Hcount:c=1).
 { assert(Hc:c=1\/c=2\/c=3)by lia;destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;lia. }
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH34;exact PreH56).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 destruct(app_block_base_positive F P W WI D(app_pixels D-output_pixels)PreH43 ltac:(lia))as[HbaseO HbaseI].
 assert(Hzero:app_group_cursor D k=0).
 { apply(app_block_previous_zero(app_group_cursor D k)output(channels-c));[rewrite PreH50;exact HbaseO|lia|].
   rewrite <-PreH64;exact PreH89. }
 assert(Hlane0:(r0_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_step by lia;unfold app_step.
 assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=None).
 { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
 unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
 rewrite !app_block_candidate_pair.
 rewrite <-PreH48,<-PreH49,<-PreH34.
 repeat rewrite <-PreH56.
 try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73;try rewrite <-PreH74.
 apkt_insert_reduce;apkt_update.
 rewrite !app_block_add_assoc,!app_block_index_add.
 unfold app_index_base_at;rewrite ?Z.add_0_r.
 reflexivity.
 }
 assert(HO0:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_fpack2 r0_8 r1_8)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_output_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_fpack2];first[exact(f_equal fst Hlane0)]. }
 rewrite <-PreH50 in HO0.
 rewrite <-PreH62 in HO0.
 try rewrite <-PreH34 in HO0;repeat rewrite <-PreH56 in HO0.
 assert(HI0:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_ipack2 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_index_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_ipack2];first[exact(f_equal snd Hlane0)]. }
 rewrite <-PreH51 in HI0.
 rewrite <-PreH63 in HI0.
 try rewrite <-PreH34 in HI0;repeat rewrite <-PreH56 in HI0.
 try rewrite <-PreH34;repeat rewrite <-PreH56;rewrite <-PreH35.
 rewrite HO0,HI0.
 replace(channels-c+1)with(app_channels D)by lia.
 rewrite app_tail_output_complete,app_tail_index_complete by lia.
 assert(Hnext:app_group_cursor D(0)=app_group_cursor D k+1).
 { pose proof(app_group_cursor_step D k ltac:(lia)Hrem)as HT;
 destruct(Z.ltb_spec 9 k);[lia|exact HT]. }
 rewrite Hnext.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)output ltac:(lia))as HprevO.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)index ltac:(lia))as HprevI.
 pose proof(app_tail_remaining_step D k ltac:(lia)Hrem)as Hremaining.
 rewrite <-PreH34 in Hremaining.
 assert(Hremaining_exact:(0)=app_remaining pooling_elements(app_group_cursor D k+1))by lia.
 try rewrite app_tail_index_advance.
 rewrite !app_block_add_assoc.
 assert(Hadvance:ap_add_u32(app_index_base_at(app_group_cursor D k))9=app_index_base_at(app_group_cursor D k+1))by apply app_index_cursor_step.
 apkp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_17_37:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_37.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_37;right;apb_intro.
 assert(Hcount:c=1).
 { assert(Hc:c=1\/c=2\/c=3)by lia;destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;lia. }
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH34;exact PreH56).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 destruct(app_block_base_positive F P W WI D(app_pixels D-output_pixels)PreH43 ltac:(lia))as[HbaseO HbaseI].
 assert(Hzero:app_group_cursor D k=0).
 { apply(app_block_previous_zero(app_group_cursor D k)output(channels-c));[rewrite PreH50;exact HbaseO|lia|].
   rewrite <-PreH64;exact PreH89. }
 assert(Hlane0:(r0_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_step by lia;unfold app_step.
 assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=None).
 { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
 unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
 rewrite !app_block_candidate_pair.
 rewrite <-PreH48,<-PreH49,<-PreH34.
 repeat rewrite <-PreH56.
 try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73;try rewrite <-PreH74.
 apkt_insert_reduce;apkt_update.
 rewrite !app_block_add_assoc,!app_block_index_add.
 unfold app_index_base_at;rewrite ?Z.add_0_r.
 reflexivity.
 }
 assert(HO0:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_fpack2 r0_8 r1_8)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_output_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_fpack2];first[exact(f_equal fst Hlane0)]. }
 rewrite <-PreH50 in HO0.
 rewrite <-PreH62 in HO0.
 try rewrite <-PreH34 in HO0;repeat rewrite <-PreH56 in HO0.
 assert(HI0:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_ipack2 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_index_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_ipack2];first[exact(f_equal snd Hlane0)]. }
 rewrite <-PreH51 in HI0.
 rewrite <-PreH63 in HI0.
 try rewrite <-PreH34 in HI0;repeat rewrite <-PreH56 in HI0.
 try rewrite <-PreH34;repeat rewrite <-PreH56;rewrite <-PreH35.
 rewrite HO0,HI0.
 replace(channels-c+1)with(app_channels D)by lia.
 rewrite app_tail_output_complete,app_tail_index_complete by lia.
 assert(Hnext:app_group_cursor D(k-9)=app_group_cursor D k+1).
 { pose proof(app_group_cursor_step D k ltac:(lia)Hrem)as HT;
 destruct(Z.ltb_spec 9 k);[exact HT|lia]. }
 rewrite Hnext.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)output ltac:(lia))as HprevO.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)index ltac:(lia))as HprevI.
 pose proof(app_tail_remaining_step D k ltac:(lia)Hrem)as Hremaining.
 rewrite <-PreH34 in Hremaining.
 assert(Hremaining_exact:(k-9)=app_remaining pooling_elements(app_group_cursor D k+1))by lia.
 try rewrite app_tail_index_advance.
 rewrite !app_block_add_assoc.
 assert(Hadvance:ap_add_u32(app_index_base_at(app_group_cursor D k))9=app_index_base_at(app_group_cursor D k+1))by apply app_index_cursor_step.
 apkp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_17_38:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_38.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_38;right;apb_intro.
 assert(Hcount:c=1).
 { assert(Hc:c=1\/c=2\/c=3)by lia;destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;lia. }
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH34;exact PreH56).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 destruct(app_block_base_positive F P W WI D(app_pixels D-output_pixels)PreH43 ltac:(lia))as[HbaseO HbaseI].
 assert(Hzero:app_group_cursor D k=0).
 { apply(app_block_previous_zero(app_group_cursor D k)output(channels-c));[rewrite PreH50;exact HbaseO|lia|].
   rewrite <-PreH64;exact PreH89. }
 assert(Hlane0:(r0_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_step by lia;unfold app_step.
 assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=None).
 { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
 unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
 rewrite !app_block_candidate_pair.
 rewrite <-PreH48,<-PreH49,<-PreH34.
 repeat rewrite <-PreH56.
 try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73;try rewrite <-PreH74.
 apkt_insert_reduce;apkt_update.
 rewrite !app_block_add_assoc,!app_block_index_add.
 unfold app_index_base_at;rewrite ?Z.add_0_r.
 reflexivity.
 }
 assert(HO0:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_fpack2 r0_8 r1_8)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_output_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_fpack2];first[exact(f_equal fst Hlane0)]. }
 rewrite <-PreH50 in HO0.
 rewrite <-PreH62 in HO0.
 try rewrite <-PreH34 in HO0;repeat rewrite <-PreH56 in HO0.
 assert(HI0:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))1
 (ap_ipack2 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)O I).
 { apply app_tail_index_append;[lia|lia|].
 intros lane Hl;assert(Hl0:lane=0)by lia;
subst lane;cbn[ap_ipack2];first[exact(f_equal snd Hlane0)]. }
 rewrite <-PreH51 in HI0.
 rewrite <-PreH63 in HI0.
 try rewrite <-PreH34 in HI0;repeat rewrite <-PreH56 in HI0.
 try rewrite <-PreH34;repeat rewrite <-PreH56;rewrite <-PreH35.
 rewrite HO0,HI0.
 replace(channels-c+1)with(app_channels D)by lia.
 rewrite app_tail_output_complete,app_tail_index_complete by lia.
 assert(Hnext:app_group_cursor D(0)=app_group_cursor D k+1).
 { pose proof(app_group_cursor_step D k ltac:(lia)Hrem)as HT;
 destruct(Z.ltb_spec 9 k);[lia|exact HT]. }
 rewrite Hnext.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)output ltac:(lia))as HprevO.
 pose proof(app_tail_previous_start(app_group_cursor D k+1)index ltac:(lia))as HprevI.
 pose proof(app_tail_remaining_step D k ltac:(lia)Hrem)as Hremaining.
 rewrite <-PreH34 in Hremaining.
 assert(Hremaining_exact:(0)=app_remaining pooling_elements(app_group_cursor D k+1))by lia.
 try rewrite app_tail_index_advance.
 rewrite !app_block_add_assoc.
 assert(Hadvance:ap_add_u32(app_index_base_at(app_group_cursor D k))9=app_index_base_at(app_group_cursor D k+1))by apply app_index_cursor_step.
 apkp_call_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_35.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_36.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_37.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_38.
