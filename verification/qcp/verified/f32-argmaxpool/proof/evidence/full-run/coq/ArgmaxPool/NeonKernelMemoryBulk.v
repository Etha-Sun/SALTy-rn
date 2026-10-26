From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import KernelBlockFacts NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac apkb_update :=
 repeat match goal with
 | H:ap_same_bits ?value(ap_select_f32(ap_gt_mask ?candidate ?old)?candidate ?old)
 |-context[ap_neon_update (?old,?oi)(?candidate,?ci)] =>
 rewrite(app_block_update_pair old oi candidate ci value H);rewrite ?app_block_u32_idem
 end.
Module CheckedNeonMemoryBulk.
Lemma proof_of_test_neon_entail_wit_15_1:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_1.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_1;right;apb_intro.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH45;exact PreH67).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 assert(Hpos:0<app_group_cursor D k).
 { unfold app_previous_cursor in PreH75;destruct(Z.eqb_spec(app_group_cursor D k)0);[congruence|lia]. }
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 0 r0
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH41)as HF0.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 0 r0_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH37)as HI0.
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 1 r1
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH42)as HF1.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 1 r1_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH38)as HI1.
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 2 r2
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH43)as HF2.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 2 r2_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH39)as HI2.
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 3 r3
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH44)as HF3.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 3 r3_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH40)as HI3.
 assert(HP0:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=(r0,r0_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0))as[v n]eqn:E;
   cbn[fst snd]in HF0,HI0;f_equal;congruence. }
 assert(Hlane0:(r0_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) (r0_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (0))) (r0))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r0_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP0.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HP1:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)=(r1,r1_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1))as[v n]eqn:E;
   cbn[fst snd]in HF1,HI1;f_equal;congruence. }
 assert(Hlane1:(r1_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) (r1_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (1))) (r1))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r1_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+1)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP1.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HP2:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+2)=(r2,r2_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+2))as[v n]eqn:E;
   cbn[fst snd]in HF2,HI2;f_equal;congruence. }
 assert(Hlane2:(r2_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) (r2_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (2))) (r2))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r2_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+2)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP2.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HP3:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+3)=(r3,r3_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+3))as[v n]eqn:E;
   cbn[fst snd]in HF3,HI3;f_equal;congruence. }
 assert(Hlane3:(r3_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) (r3_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (3))) (r3))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r3_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+3)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP3.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HO:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_fpack4 r0_11 r1_11 r2_11 r3_11)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_output;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_fpack4];
   first[exact(f_equal fst Hlane0)|exact(f_equal fst Hlane1)|exact(f_equal fst Hlane2)|exact(f_equal fst Hlane3)]. }
 assert(HI:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_ipack4 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) (r0_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (0))) (r0))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r0_2))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) (r1_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (1))) (r1))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r1_2))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) (r2_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (2))) (r2))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r2_2))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) (r3_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (3))) (r3))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r3_2))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_index;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_ipack4];
   first[exact(f_equal snd Hlane0)|exact(f_equal snd Hlane1)|exact(f_equal snd Hlane2)|exact(f_equal snd Hlane3)]. }
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)0(channels-c))as HC0.
 rewrite <-PreH77 in HC0.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)1(channels-c))as HC1.
 rewrite <-PreH78 in HC1.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)2(channels-c))as HC2.
 rewrite <-PreH79 in HC2.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)3(channels-c))as HC3.
 rewrite <-PreH80 in HC3.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)4(channels-c))as HC4.
 rewrite <-PreH81 in HC4.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)5(channels-c))as HC5.
 rewrite <-PreH82 in HC5.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)6(channels-c))as HC6.
 rewrite <-PreH83 in HC6.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)7(channels-c))as HC7.
 rewrite <-PreH84 in HC7.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)8(channels-c))as HC8.
 rewrite <-PreH85 in HC8.
 pose proof(app_block4_output_cursor output(channels-c))as HCO;rewrite <-PreH73 in HCO.
 pose proof(app_block4_output_cursor index(channels-c))as HCI;rewrite <-PreH74 in HCI.
 pose proof(app_block4_previous_cursor(app_group_cursor D k)output(channels-c)Hpos)as HCA;rewrite <-PreH75 in HCA.
 pose proof(app_block4_previous_cursor(app_group_cursor D k)index(channels-c)Hpos)as HCB;rewrite <-PreH76 in HCB.
 pose proof(app_block4_rem(channels-c)ltac:(lia)PreH71)as HMOD.
 replace(channels-(c-4))with(channels-c+4)by lia.
 rewrite <-PreH67,<-PreH46.
 rewrite <-PreH61 in HO;rewrite <-PreH73 in HO.
 rewrite <-PreH62 in HI;rewrite <-PreH74 in HI.
 rewrite HO,HI.
 rewrite !app_block_add_assoc,!app_block_index_add.
 change(sizeof(UINT))with 4.
 apkp_call_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_15_2:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_2.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_2;right;apb_intro.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH45;exact PreH67).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 assert(Hpos:0<app_group_cursor D k).
 { unfold app_previous_cursor in PreH75;destruct(Z.eqb_spec(app_group_cursor D k)0);[congruence|lia]. }
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 0 r0
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH41)as HF0.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 0 r0_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH37)as HI0.
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 1 r1
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH42)as HF1.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 1 r1_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH38)as HI1.
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 2 r2
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH43)as HF2.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 2 r2_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH39)as HI2.
 pose proof(app_block_previous_float F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I output ab 3 r3
 Hpos PreH61 PreH75 ltac:(lia)ltac:(lia)ltac:(lia)PreH44)as HF3.
 pose proof(app_block_previous_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c) O I index ib 3 r3_2
 Hpos PreH62 PreH76 ltac:(lia)ltac:(lia)ltac:(lia)PreH40)as HI3.
 assert(HP0:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=(r0,r0_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0))as[v n]eqn:E;
   cbn[fst snd]in HF0,HI0;f_equal;congruence. }
 assert(Hlane0:(r0_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) (r0_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (0))) (r0))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r0_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP0.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HP1:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)=(r1,r1_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1))as[v n]eqn:E;
   cbn[fst snd]in HF1,HI1;f_equal;congruence. }
 assert(Hlane1:(r1_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) (r1_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (1))) (r1))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r1_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+1)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP1.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HP2:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+2)=(r2,r2_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+2))as[v n]eqn:E;
   cbn[fst snd]in HF2,HI2;f_equal;congruence. }
 assert(Hlane2:(r2_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) (r2_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (2))) (r2))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r2_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+2)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP2.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HP3:app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+3)=(r3,r3_2)).
 { destruct(app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+3))as[v n]eqn:E;
   cbn[fst snd]in HF3,HI3;f_equal;congruence. }
 assert(Hlane3:(r3_11,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) (r3_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (3))) (r3))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r3_2))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+3)).
 { rewrite app_lane_value_previous_step by lia;unfold app_step;rewrite HP3.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH59,<-PreH60,<-PreH45.
   try rewrite <-PreH77;try rewrite <-PreH78;try rewrite <-PreH79;try rewrite <-PreH80;try rewrite <-PreH81;try rewrite <-PreH82;try rewrite <-PreH83;try rewrite <-PreH84;try rewrite <-PreH85.

   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HO:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_fpack4 r0_11 r1_11 r2_11 r3_11)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_output;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_fpack4];
   first[exact(f_equal fst Hlane0)|exact(f_equal fst Hlane1)|exact(f_equal fst Hlane2)|exact(f_equal fst Hlane3)]. }
 assert(HI:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_ipack4 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) (r0_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (0))) (r0))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r0_2))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) (r1_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (1))) (r1))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r1_2))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) (r2_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (2))) (r2))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r2_2))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_10))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_9))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_8))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) (r3_3))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i0) (3))) (r3))) ((app_index_base_at ((app_group_cursor (D) (k))))) (r3_2))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_index;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_ipack4];
   first[exact(f_equal snd Hlane0)|exact(f_equal snd Hlane1)|exact(f_equal snd Hlane2)|exact(f_equal snd Hlane3)]. }
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)0(channels-c))as HC0.
 rewrite <-PreH77 in HC0.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)1(channels-c))as HC1.
 rewrite <-PreH78 in HC1.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)2(channels-c))as HC2.
 rewrite <-PreH79 in HC2.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)3(channels-c))as HC3.
 rewrite <-PreH80 in HC3.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)4(channels-c))as HC4.
 rewrite <-PreH81 in HC4.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)5(channels-c))as HC5.
 rewrite <-PreH82 in HC5.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)6(channels-c))as HC6.
 rewrite <-PreH83 in HC6.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)7(channels-c))as HC7.
 rewrite <-PreH84 in HC7.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)8(channels-c))as HC8.
 rewrite <-PreH85 in HC8.
 pose proof(app_block4_output_cursor output(channels-c))as HCO;rewrite <-PreH73 in HCO.
 pose proof(app_block4_output_cursor index(channels-c))as HCI;rewrite <-PreH74 in HCI.
 pose proof(app_block4_previous_cursor(app_group_cursor D k)output(channels-c)Hpos)as HCA;rewrite <-PreH75 in HCA.
 pose proof(app_block4_previous_cursor(app_group_cursor D k)index(channels-c)Hpos)as HCB;rewrite <-PreH76 in HCB.
 pose proof(app_block4_rem(channels-c)ltac:(lia)PreH71)as HMOD.
 replace(channels-(c-4))with(channels-c+4)by lia.
 rewrite <-PreH67,<-PreH46.
 rewrite <-PreH61 in HO;rewrite <-PreH73 in HO.
 rewrite <-PreH62 in HI;rewrite <-PreH74 in HI.
 rewrite HO,HI.
 rewrite !app_block_add_assoc,!app_block_index_add.
 change(sizeof(UINT))with 4.
 apkp_call_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_15_3:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_3.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_3;right;apb_intro.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH33;exact PreH55).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 destruct(app_block_base_positive F P W WI D(app_pixels D-output_pixels)PreH42 ltac:(lia))as[HbaseO HbaseI].
 assert(Hzero:app_group_cursor D k=0).
 { apply(app_block_previous_zero(app_group_cursor D k)output(channels-c));[rewrite PreH49;exact HbaseO|lia|].
   rewrite <-PreH63;exact PreH87. }
 assert(Hlane0:(r0_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(Hlane1:(r1_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+1)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(Hlane2:(r2_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) ((ap_load_lane (F) (i0) (2))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+2)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+2)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(Hlane3:(r3_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) ((ap_load_lane (F) (i0) (3))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+3)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+3)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HO:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_fpack4 r0_8 r1_8 r2_8 r3_8)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_output;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_fpack4];
   first[exact(f_equal fst Hlane0)|exact(f_equal fst Hlane1)|exact(f_equal fst Hlane2)|exact(f_equal fst Hlane3)]. }
 assert(HI:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_ipack4 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) ((ap_load_lane (F) (i0) (2))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) ((ap_load_lane (F) (i0) (3))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_index;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_ipack4];
   first[exact(f_equal snd Hlane0)|exact(f_equal snd Hlane1)|exact(f_equal snd Hlane2)|exact(f_equal snd Hlane3)]. }
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)0(channels-c))as HC0.
 rewrite <-PreH65 in HC0.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)1(channels-c))as HC1.
 rewrite <-PreH66 in HC1.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)2(channels-c))as HC2.
 rewrite <-PreH67 in HC2.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)3(channels-c))as HC3.
 rewrite <-PreH68 in HC3.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)4(channels-c))as HC4.
 rewrite <-PreH69 in HC4.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)5(channels-c))as HC5.
 rewrite <-PreH70 in HC5.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)6(channels-c))as HC6.
 rewrite <-PreH71 in HC6.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)7(channels-c))as HC7.
 rewrite <-PreH72 in HC7.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)8(channels-c))as HC8.
 rewrite <-PreH73 in HC8.
 pose proof(app_block4_output_cursor output(channels-c))as HCO;rewrite <-PreH61 in HCO.
 pose proof(app_block4_output_cursor index(channels-c))as HCI;rewrite <-PreH62 in HCI.
 assert(HCA:0=app_previous_cursor(app_group_cursor D k)output(channels-c+4))by(rewrite Hzero;reflexivity).
 assert(HCB:ib=app_previous_cursor(app_group_cursor D k)index(channels-c+4)).
 { rewrite PreH64,Hzero;reflexivity. }
 pose proof(app_block4_rem(channels-c)ltac:(lia)PreH59)as HMOD.
 replace(channels-(c-4))with(channels-c+4)by lia.
 rewrite <-PreH55,<-PreH34.
 rewrite <-PreH49 in HO;rewrite <-PreH61 in HO.
 rewrite <-PreH50 in HI;rewrite <-PreH62 in HI.
 rewrite HO,HI.
 rewrite !app_block_add_assoc,!app_block_index_add.
 change(sizeof(UINT))with 4.
 apkp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_15_4:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_4.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_15_4;right;apb_intro.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH33;exact PreH55).
 pose proof(app_group_cursor_active D k ltac:(lia)Hrem)as[Hg Hcons].
 destruct(app_block_base_positive F P W WI D(app_pixels D-output_pixels)PreH42 ltac:(lia))as[HbaseO HbaseI].
 assert(Hzero:app_group_cursor D k=0).
 { apply(app_block_previous_zero(app_group_cursor D k)output(channels-c));[rewrite PreH49;exact HbaseO|lia|].
   rewrite <-PreH63;exact PreH87. }
 assert(Hlane0:(r0_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+0)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+0)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(Hlane1:(r1_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+1)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+1)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(Hlane2:(r2_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) ((ap_load_lane (F) (i0) (2))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+2)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+2)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(Hlane3:(r3_8,((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) ((ap_load_lane (F) (i0) (3))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_lane_value true F P D(app_pixels D-output_pixels)(app_group_cursor D k+1)(channels-c+3)).
 { rewrite app_lane_value_step by lia;unfold app_step.
   assert(HP:app_lane_prefix true F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+3)=None).
   { rewrite Hzero;apply app_lane_prefix_zero. } rewrite HP.
   unfold ap_neon_pass,ap_pass_tail;cbn[seq map fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair.
   rewrite <-PreH47,<-PreH48,<-PreH33.
   try rewrite <-PreH65;try rewrite <-PreH66;try rewrite <-PreH67;try rewrite <-PreH68;try rewrite <-PreH69;try rewrite <-PreH70;try rewrite <-PreH71;try rewrite <-PreH72;try rewrite <-PreH73.
   apkb_update.
   rewrite !app_block_add_assoc,!app_block_index_add.
   unfold app_index_base_at;rewrite ?Z.add_0_r.
   reflexivity.
 }
 assert(HO:ap_output_write
 (app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_output_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_fpack4 r0_8 r1_8 r2_8 r3_8)=
 app_neon_partial_output F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_output;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_fpack4];
   first[exact(f_equal fst Hlane0)|exact(f_equal fst Hlane1)|exact(f_equal fst Hlane2)|exact(f_equal fst Hlane3)]. }
 assert(HI:ap_index_write
 (app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)O I)
 (app_output_cursor(app_index_at D(app_pixels D-output_pixels))(channels-c))4
 (ap_ipack4 ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (0))) (r0_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (0))) (r0_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (0))) (r0_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (0))) (r0_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (0))) (r0_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (0))) (r0_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (0))) (r0))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (0))) ((ap_load_lane (F) (i0) (0))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (1))) (r1_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (1))) (r1_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (1))) (r1_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (1))) (r1_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (1))) (r1_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (1))) (r1_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (1))) (r1))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (1))) ((ap_load_lane (F) (i0) (1))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (2))) (r2_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (2))) (r2_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (2))) (r2_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (2))) (r2_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (2))) (r2_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (2))) (r2_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (2))) (r2))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (2))) ((ap_load_lane (F) (i0) (2))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i8) (3))) (r3_7))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i7) (3))) (r3_6))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i6) (3))) (r3_5))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i5) (3))) (r3_4))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i4) (3))) (r3_3))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i3) (3))) (r3_2))) ((ap_add_u32 ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i2) (3))) (r3))) ((ap_add_u32 ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) (1))) ((ap_select_u32 ((ap_gt_mask ((ap_load_lane (F) (i1) (3))) ((ap_load_lane (F) (i0) (3))))) ((ap_add_u32 ((app_index_base_at ((app_group_cursor (D) (k))))) (1))) ((app_index_base_at ((app_group_cursor (D) (k))))))))))))))))))))))=
 app_neon_partial_index F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c+4)O I).
 { apply app_block4_index;[lia|].
   intros lane Hl;assert(lane=0\/lane=1\/lane=2\/lane=3)by lia;
   destruct H as[H|[H|[H|H]]];subst lane;cbn[ap_ipack4];
   first[exact(f_equal snd Hlane0)|exact(f_equal snd Hlane1)|exact(f_equal snd Hlane2)|exact(f_equal snd Hlane3)]. }
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)0(channels-c))as HC0.
 rewrite <-PreH65 in HC0.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)1(channels-c))as HC1.
 rewrite <-PreH66 in HC1.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)2(channels-c))as HC2.
 rewrite <-PreH67 in HC2.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)3(channels-c))as HC3.
 rewrite <-PreH68 in HC3.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)4(channels-c))as HC4.
 rewrite <-PreH69 in HC4.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)5(channels-c))as HC5.
 rewrite <-PreH70 in HC5.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)6(channels-c))as HC6.
 rewrite <-PreH71 in HC6.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)7(channels-c))as HC7.
 rewrite <-PreH72 in HC7.
 pose proof(app_block4_row_cursor P input input_offset pooling_elements(app_group_cursor D k)8(channels-c))as HC8.
 rewrite <-PreH73 in HC8.
 pose proof(app_block4_output_cursor output(channels-c))as HCO;rewrite <-PreH61 in HCO.
 pose proof(app_block4_output_cursor index(channels-c))as HCI;rewrite <-PreH62 in HCI.
 assert(HCA:0=app_previous_cursor(app_group_cursor D k)output(channels-c+4))by(rewrite Hzero;reflexivity).
 assert(HCB:ib=app_previous_cursor(app_group_cursor D k)index(channels-c+4)).
 { rewrite PreH64,Hzero;reflexivity. }
 pose proof(app_block4_rem(channels-c)ltac:(lia)PreH59)as HMOD.
 replace(channels-(c-4))with(channels-c+4)by lia.
 rewrite <-PreH55,<-PreH34.
 rewrite <-PreH49 in HO;rewrite <-PreH61 in HO.
 rewrite <-PreH50 in HI;rewrite <-PreH62 in HI.
 rewrite HO,HI.
 rewrite !app_block_add_assoc,!app_block_index_add.
 change(sizeof(UINT))with 4.
 apkp_call_frame.
Qed.
End CheckedNeonMemoryBulk.
Print Assumptions CheckedNeonMemoryBulk.proof_of_test_neon_entail_wit_15_1.
Print Assumptions CheckedNeonMemoryBulk.proof_of_test_neon_entail_wit_15_2.
Print Assumptions CheckedNeonMemoryBulk.proof_of_test_neon_entail_wit_15_3.
Print Assumptions CheckedNeonMemoryBulk.proof_of_test_neon_entail_wit_15_4.
