From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition chunk_values (A W:list fp32)(k row done width:Z)(lo hi:fp32):list fp32 :=
 map(fun j=>full_cell A W k row (Z.of_nat j) lo hi)
    (seq (Z.to_nat done)(Z.to_nat width)).
Lemma full_row_values_length : forall A W k row done lo hi,0<=done ->
 Zlength(full_row_values A W k row done lo hi)=done.
Proof.
 intros;unfold full_row_values;rewrite Zlength_correct,map_length,seq_length,Z2Nat.id by lia;reflexivity.
Qed.
Lemma full_row_values_add : forall A W k row done width lo hi,0<=done ->0<=width ->
 full_row_values A W k row(done+width)lo hi =
 full_row_values A W k row done lo hi ++ chunk_values A W k row done width lo hi.
Proof.
 intros;unfold full_row_values,chunk_values;rewrite Z2Nat.inj_add by lia.
 rewrite seq_app,map_app;reflexivity.
Qed.
Lemma full_row_values_prefix : forall A W k row done width lo hi,0<=done ->0<=width ->
 sublist 0 done(full_row_values A W k row(done+width)lo hi)=full_row_values A W k row done lo hi.
Proof.
 intros;rewrite full_row_values_add by lia.
 replace done with(Zlength(full_row_values A W k row done lo hi))at 1 by(apply full_row_values_length;lia).
 apply sublist_app_exact1.
Qed.
Lemma output_row_prepare_fresh : forall c mr nc k row done width A W lo hi,
 row<mr ->0<=done ->0<=width ->done+width<=nc ->
 output_row c mr nc k done row A W lo hi |--
 FloatArray.seg c(row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.undef_seg c(row*nc+done)(row*nc+done+width) **
 FloatArray.undef_seg c(row*nc+done+width)((row+1)*nc).
Proof.
 intros;unfold output_row;assert(Hb:row <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hb.
 sep_apply(FloatArray.undef_seg_split_to_undef_seg c(row*nc+done)(row*nc+done+width)((row+1)*nc)ltac:(lia)).
 entailer!.
Qed.
Lemma output_row_prepare_repeat : forall c mr nc k row done width A W lo hi,
 row<mr ->0<=done ->0<=width ->done+width<=nc ->
 output_row c mr nc k(done+width)row A W lo hi |--
 FloatArray.seg c(row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.undef_seg c(row*nc+done)(row*nc+done+width) **
 FloatArray.undef_seg c(row*nc+done+width)((row+1)*nc).
Proof.
 intros;unfold output_row;assert(Hb:row <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hb.
 sep_apply(FloatArray.seg_split_to_seg c(row*nc)(row*nc+done)(row*nc+(done+width))
 (full_row_values A W k row(done+width)lo hi)ltac:(lia)).
 replace(row*nc+done-row*nc)with done by ring.
 rewrite full_row_values_prefix by lia.
 sep_apply(FloatArray.seg_to_undef_seg c(row*nc+done)(row*nc+(done+width))
 (sublist done(row*nc+(done+width)-row*nc)(full_row_values A W k row(done+width)lo hi))).
 replace(row*nc+(done+width))with(row*nc+done+width)by ring.
 entailer!.
Qed.
Lemma output_row_finish : forall c mr nc k row done width A W lo hi,
 row<mr ->0<=done ->0<=width ->done+width<=nc ->
 FloatArray.seg c(row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.seg c(row*nc+done)(row*nc+done+width)(chunk_values A W k row done width lo hi) **
 FloatArray.undef_seg c(row*nc+done+width)((row+1)*nc) |--
 output_row c mr nc k(done+width)row A W lo hi.
Proof.
 intros;unfold output_row;assert(Hb:row <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hb.
 sep_apply(FloatArray.seg_merge_to_seg c(row*nc)(row*nc+done)(row*nc+done+width)
 (full_row_values A W k row done lo hi)(chunk_values A W k row done width lo hi)ltac:(lia)).
 rewrite <-full_row_values_add by lia.
 replace(row*nc+(done+width))with(row*nc+done+width)by ring.
 entailer!.
Qed.
Print Assumptions full_row_values_length.
Print Assumptions full_row_values_add.
Print Assumptions full_row_values_prefix.
Print Assumptions output_row_prepare_fresh.
Print Assumptions output_row_prepare_repeat.
Print Assumptions output_row_finish.

Lemma undef_chunk_to_full : forall c start width,0<=width ->
 FloatArray.undef_seg c start(start+width) |--
 FloatArray.undef_full(c+start*sizeof(FLOAT))width.
Proof.
 intros;sep_apply(FloatArray.undef_seg_to_undef_full c start(start+width)).
 replace(start+width-start)with width by ring;entailer!.
Qed.
Lemma full_chunk_to_seg : forall c start width values,
 FloatArray.full(c+start*sizeof(FLOAT))width values |--
 FloatArray.seg c start(start+width)values.
Proof.
 intros;rewrite FloatArray.seg_0_shift.
 replace(start+width-start)with width by ring.
 apply FloatArray.full_to_seg.
Qed.
Lemma panel_done_add_width : forall nc b,0<nc ->0<=b<panel_count nc ->
 processed_cols nc(b+1)=8*b+panel_cols nc b.
Proof.
 intros;rewrite panel_progress by lia;rewrite processed_before_valid_panel by lia;reflexivity.
Qed.
Lemma output_row_prepare_panel : forall c mr nc k b step row A W lo hi,
 0<nc ->0<=b<panel_count nc ->row<mr ->
 output_row c mr nc k(row_progress nc b step row)row A W lo hi |--
 frame_row c mr nc k b step row row A W lo hi **
 FloatArray.undef_seg c(row*nc+8*b)(row*nc+8*b+panel_cols nc b).
Proof.
 intros c mr nc k b step row A W lo hi Hnc Hb Hr.
 pose proof(valid_panel_start nc b Hnc Hb)as Hstart.
 pose proof(panel_width_range nc b Hnc Hb)as Hwidth.
 pose proof(panel_done_add_width nc b Hnc Hb)as Hend.
 assert(Hbound:8*b+panel_cols nc b<=nc).
 { rewrite <-Hend;unfold processed_cols;apply Z.le_min_l. }
 unfold frame_row;rewrite Z.eqb_refl.
 replace(processed_cols nc(b+1))with(8*b+panel_cols nc b)by lia.
 unfold row_progress;destruct(row <? step).
 - rewrite Hend.
   sep_apply(output_row_prepare_repeat c mr nc k row(8*b)(panel_cols nc b)A W lo hi Hr ltac:(lia)ltac:(lia)Hbound).
   replace(row*nc+(8*b+panel_cols nc b))with(row*nc+8*b+panel_cols nc b)by ring;entailer!.
 - rewrite processed_before_valid_panel by lia.
   sep_apply(output_row_prepare_fresh c mr nc k row(8*b)(panel_cols nc b)A W lo hi Hr ltac:(lia)ltac:(lia)Hbound).
   replace(row*nc+(8*b+panel_cols nc b))with(row*nc+8*b+panel_cols nc b)by ring;entailer!.
Qed.
Lemma output_panel_prepare_seg : forall c mr nc k b step A W lo hi,
 1<=mr<=4 ->0<nc ->0<=b<panel_count nc ->0<=step<4 ->
 output_panel c mr nc k b step A W lo hi |--
 output_frame c mr nc k b step(row_alias mr step)A W lo hi **
 FloatArray.undef_seg c(row_alias mr step*nc+8*b)(row_alias mr step*nc+8*b+panel_cols nc b).
Proof.
 intros c mr nc k b step A W lo hi Hmr Hnc Hb Hstep.
 pose proof(row_alias_range mr step Hmr Hstep)as Hrange.
 remember(row_alias mr step)as target.
 assert(target=0\/target=1\/target=2\/target=3)by lia.
 destruct H as[H|[H|[H|H]]];rewrite H in *;clear H;
 unfold output_panel,output_frame;
 match goal with Heqtarget:?target=row_alias mr step |- _ =>
 sep_apply(output_row_prepare_panel c mr nc k b step target A W lo hi Hnc Hb ltac:(lia))end;
 unfold frame_row;cbn [Z.eqb];entailer!.
Qed.
Lemma output_panel_prepare : forall c mr nc k b step A W lo hi,
 1<=mr<=4 ->0<nc ->0<=b<panel_count nc ->0<=step<4 ->
 output_panel c mr nc k b step A W lo hi |--
 output_frame c mr nc k b step(row_alias mr step)A W lo hi **
 FloatArray.undef_full(c+(row_alias mr step*nc+8*b)*sizeof(FLOAT))(panel_cols nc b).
Proof.
 intros;sep_apply(output_panel_prepare_seg c mr nc k b step A W lo hi H H0 H1 H2).
 sep_apply(undef_chunk_to_full c(row_alias mr step*nc+8*b)(panel_cols nc b)ltac:(pose proof(panel_width_range nc b H0 H1);lia)).
 entailer!.
Qed.
Print Assumptions undef_chunk_to_full.
Print Assumptions full_chunk_to_seg.
Print Assumptions panel_done_add_width.
Print Assumptions output_row_prepare_panel.
Print Assumptions output_panel_prepare_seg.
Print Assumptions output_panel_prepare.

Lemma row_progress_step_other : forall nc b step row,row<>step ->
 row_progress nc b(step+1)row=row_progress nc b step row.
Proof.
 intros;unfold row_progress;destruct(row <? step)eqn:Hlt.
 - apply Z.ltb_lt in Hlt;assert(Hnext:row <? step+1=true)by(apply Z.ltb_lt;lia);rewrite Hnext;reflexivity.
 - apply Z.ltb_ge in Hlt;assert(Hnext:row <? step+1=false)by(apply Z.ltb_ge;lia);rewrite Hnext;reflexivity.
Qed.
Lemma output_row_step_other : forall c mr nc k b step row A W lo hi,
 0<=row ->row<>row_alias mr step ->
 output_row c mr nc k(row_progress nc b(step+1)row)row A W lo hi =
 output_row c mr nc k(row_progress nc b step row)row A W lo hi.
Proof.
 intros c mr nc k b step row A W lo hi Hr Hneq;unfold output_row.
 destruct(row <? mr)eqn:Hactive;[|reflexivity].
 apply Z.ltb_lt in Hactive;assert(Hother:row<>step).
 { intros Hsame;subst step;rewrite row_alias_active in Hneq by lia;contradiction. }
 rewrite row_progress_step_other by assumption;reflexivity.
Qed.
Lemma row_progress_alias_next : forall mr nc b step,
 row_progress nc b(step+1)(row_alias mr step)=processed_cols nc(b+1).
Proof.
 intros;unfold row_progress;assert(Hlt:row_alias mr step <? step+1=true).
 { apply Z.ltb_lt;unfold row_alias;pose proof(Z.le_min_l step(mr-1));lia. }
 rewrite Hlt;reflexivity.
Qed.
Lemma output_row_active_eq : forall c mr nc k done row A W lo hi,row<mr ->
 output_row c mr nc k done row A W lo hi =
 FloatArray.seg c(row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.undef_seg c(row*nc+done)((row+1)*nc).
Proof. intros;unfold output_row;assert(Hb:row <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hb;reflexivity. Qed.
Lemma output_panel_finish_seg : forall c mr nc k b step A W lo hi,
 1<=mr<=4 ->0<nc ->0<=b<panel_count nc ->0<=step<4 ->
 output_frame c mr nc k b step(row_alias mr step)A W lo hi **
 FloatArray.seg c(row_alias mr step*nc+8*b)(row_alias mr step*nc+8*b+panel_cols nc b)
 (chunk_values A W k(row_alias mr step)(8*b)(panel_cols nc b)lo hi) |--
 output_panel c mr nc k b(step+1)A W lo hi.
Proof.
 intros c mr nc k b step A W lo hi Hmr Hnc Hb Hstep.
 pose proof(row_alias_range mr step Hmr Hstep)as Hrange.
 pose proof(valid_panel_start nc b Hnc Hb)as Hstart.
 pose proof(panel_width_range nc b Hnc Hb)as Hwidth.
 pose proof(panel_done_add_width nc b Hnc Hb)as Hend.
 assert(Hbound:8*b+panel_cols nc b<=nc).
 { rewrite <-Hend;unfold processed_cols;apply Z.le_min_l. }
 pose proof(row_progress_alias_next mr nc b step)as Hnext.
 remember(row_alias mr step)as target eqn:Ht.
 assert(target=0\/target=1\/target=2\/target=3)by lia.
 destruct H as[H|[H|[H|H]]];rewrite H in *;clear H;
 unfold output_frame,output_panel;
 try(rewrite(output_row_step_other c mr nc k b step 0 A W lo hi ltac:(lia)ltac:(lia)));
 try(rewrite(output_row_step_other c mr nc k b step 1 A W lo hi ltac:(lia)ltac:(lia)));
 try(rewrite(output_row_step_other c mr nc k b step 2 A W lo hi ltac:(lia)ltac:(lia)));
 try(rewrite(output_row_step_other c mr nc k b step 3 A W lo hi ltac:(lia)ltac:(lia)));
 rewrite Hnext;unfold frame_row;cbn [Z.eqb Pos.eqb];rewrite Hend;rewrite ?Z.add_assoc.
 all:sepcon_assoc_change.
 all: match goal with |- ?P |-- ?Q=>
 multimatch Q with context[output_row ?c ?mr ?nc ?k(8*?b+panel_cols ?nc ?b)?target ?A ?W ?lo ?hi]=>
 sep_apply(FloatArray.seg_merge_to_seg c(target*nc)(target*nc+8*b)(target*nc+8*b+panel_cols nc b)
 (full_row_values A W k target(8*b)lo hi)(chunk_values A W k target(8*b)(panel_cols nc b)lo hi)ltac:(lia));
 rewrite <-full_row_values_add by lia;
 rewrite(output_row_active_eq c mr nc k(8*b+panel_cols nc b)target A W lo hi ltac:(lia))
 end end.
 all:rewrite ?Z.add_assoc;entailer!.
Qed.
Lemma output_panel_finish : forall c mr nc k b step A W lo hi,
 1<=mr<=4 ->0<nc ->0<=b<panel_count nc ->0<=step<4 ->
 output_frame c mr nc k b step(row_alias mr step)A W lo hi **
 FloatArray.full(c+(row_alias mr step*nc+8*b)*sizeof(FLOAT))(panel_cols nc b)
 (chunk_values A W k(row_alias mr step)(8*b)(panel_cols nc b)lo hi) |--
 output_panel c mr nc k b(step+1)A W lo hi.
Proof.
 intros;sep_apply(full_chunk_to_seg c(row_alias mr step*nc+8*b)(panel_cols nc b)
 (chunk_values A W k(row_alias mr step)(8*b)(panel_cols nc b)lo hi)).
 rewrite logic_equiv_sepcon_comm;apply output_panel_finish_seg;assumption.
Qed.
Print Assumptions row_progress_step_other.
Print Assumptions output_row_step_other.
Print Assumptions row_progress_alias_next.
Print Assumptions output_panel_finish_seg.
Print Assumptions output_panel_finish.

Print Assumptions output_row_active_eq.
