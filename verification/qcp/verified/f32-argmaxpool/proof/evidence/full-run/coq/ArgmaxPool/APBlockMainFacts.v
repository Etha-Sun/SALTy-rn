From Coq Require Import ZArith List Lia Ring FunctionalExtensionality Classical_Prop.
From ArgmaxPool Require Export APBlock32Facts KernelBlockFacts.
From ArgmaxPool Require Import APKernelMemoryFacts KernelLaneFacts.
Local Open Scope Z_scope.
Lemma apbm_step_base_wrap:forall old candidate base offset,
 ap_step old(candidate,ap_u32 base+offset)=ap_step old(candidate,base+offset).
Proof.
 intros;unfold ap_step;cbn[fst snd].
 destruct(Z.eqb(ap_gt_mask candidate(fst old))4294967295);[|reflexivity].
 unfold ap_u32;rewrite unsigned_unsigned_add_l by lia;reflexivity.
Qed.
Lemma apbm_current_value:forall F P D pixel group done O I lane,
 0<=group->0<=app_rows D->0<=done->0<=lane->done+lane<app_channels D->
 0<app_output_at D pixel->0<app_index_at D pixel->
 ap_block32_value F
 (app_rvv_partial_output F P D pixel group done O I)
 (app_rvv_partial_index F P D pixel group done O I)
 (app_previous_cursor group(app_output_at D pixel)done)
 (app_previous_cursor group(app_index_at D pixel)done)
 (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 0 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 1 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 2 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 3 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 4 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 5 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 6 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 7 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 8 done) (app_index_base_at group)lane=
 app_lane_value false F P D pixel(group+1)(done+lane).
Proof.
 intros F P D pixel group done O I lane HG HR HD HL HC HO HI.
 rewrite app_lane_value_step by lia;unfold app_step.
 destruct(Z.eqb_spec group 0)as[HZ|HZ].
 - subst group;rewrite app_lane_prefix_zero;rewrite ap_rvv_pass_correct.
   unfold ap_block32_value,ap_block32_initial,app_previous_cursor.
   rewrite Z.eqb_refl;unfold ap_pass,ap_pass_start,ap_pass_tail.
   cbn[seq map ap_scan fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair;cbn[fst snd].
   unfold app_index_base_at;cbn[Z.mul Z.add].
   rewrite !apbc_step_index_wrap.
   reflexivity.
 - assert(HGpos:0<group)by lia;rewrite app_lane_prefix_some by exact HGpos.
   rewrite ap_rvv_pass_correct.
   assert(Hout:(app_previous_cursor group(app_output_at D pixel)done=?0)=false).
   { unfold app_previous_cursor;destruct(Z.eqb_spec group 0);[lia|]. apply Z.eqb_neq;lia. }
   assert(HOc:app_rvv_partial_output F P D pixel group done O I
     (app_previous_cursor group(app_output_at D pixel)done+4*lane)=
     Some(fst(app_lane_value false F P D pixel group(done+lane)))).
   { unfold app_previous_cursor;destruct(Z.eqb_spec group 0);[lia|].
     replace(app_output_at D pixel+4*done+4*lane)with(app_output_at D pixel+4*(done+lane))by ring.
     apply app_partial_output_previous;lia. }
   assert(HIc:app_rvv_partial_index F P D pixel group done O I
     (app_previous_cursor group(app_index_at D pixel)done+4*lane)=
     Some(snd(app_lane_value false F P D pixel group(done+lane)))).
   { unfold app_previous_cursor;destruct(Z.eqb_spec group 0);[lia|].
     replace(app_index_at D pixel+4*done+4*lane)with(app_index_at D pixel+4*(done+lane))by ring.
     apply app_partial_index_previous;lia. }
   unfold ap_block32_value,ap_block32_initial;rewrite Hout,HOc,HIc.
   rewrite <-surjective_pairing.
   unfold ap_pass,ap_pass_start,ap_pass_tail.
   cbn[seq map ap_scan fold_left Z.of_nat Pos.of_succ_nat Pos.succ].
   rewrite !app_block_candidate_pair;cbn[fst snd].
   unfold app_index_base_at.
   rewrite !apbc_step_index_wrap,?apbm_step_base_wrap,?Z.add_0_r.
   reflexivity.
Qed.
Print Assumptions apbm_step_base_wrap.
Print Assumptions apbm_current_value.
