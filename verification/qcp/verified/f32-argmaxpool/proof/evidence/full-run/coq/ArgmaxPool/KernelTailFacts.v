From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export KernelBlockFacts KernelOuterFacts.
Local Open Scope Z_scope.
Lemma app_tail_output_append:forall F P D pixel group done count O I value,
 0<=done ->0<=count ->
 (forall lane,0<=lane<count ->
 value lane=fst(app_lane_value true F P D pixel(group+1)(done+lane))) ->
 ap_output_write(app_neon_partial_output F P D pixel group done O I)
 (app_output_cursor(app_output_at D pixel)done)count value=
 app_neon_partial_output F P D pixel group(done+count)O I.
Proof.
 intros F P D pixel group done count O I value Hd Hc Hv.
 rewrite(app_output_write_active_ext _ _ count value
 (fun lane=>fst(app_lane_value true F P D pixel(group+1)(done+lane)))Hc Hv).
 exact(f_equal fst(app_pass_partial_append true F P D pixel group done count
 (app_pixel_before true F P D pixel(O,I))Hd Hc)).
Qed.
Lemma app_tail_index_append:forall F P D pixel group done count O I value,
 0<=done ->0<=count ->
 (forall lane,0<=lane<count ->
 value lane=snd(app_lane_value true F P D pixel(group+1)(done+lane))) ->
 ap_index_write(app_neon_partial_index F P D pixel group done O I)
 (app_output_cursor(app_index_at D pixel)done)count value=
 app_neon_partial_index F P D pixel group(done+count)O I.
Proof.
 intros F P D pixel group done count O I value Hd Hc Hv.
 rewrite(app_index_write_active_ext _ _ count value
 (fun lane=>snd(app_lane_value true F P D pixel(group+1)(done+lane)))Hc Hv).
 exact(f_equal snd(app_pass_partial_append true F P D pixel group done count
 (app_pixel_before true F P D pixel(O,I))Hd Hc)).
Qed.
Lemma app_tail_output_complete:forall F P D pixel group O I,
 0<=group->0<=app_channels D->
 app_neon_partial_output F P D pixel group(app_channels D)O I=
 app_neon_partial_output F P D pixel(group+1)0 O I.
Proof.
 intros;unfold app_neon_partial_output,app_partial_output;
 rewrite app_pass_partial_full,app_pass_partial_zero by assumption;reflexivity.
Qed.
Lemma app_tail_index_complete:forall F P D pixel group O I,
 0<=group->0<=app_channels D->
 app_neon_partial_index F P D pixel group(app_channels D)O I=
 app_neon_partial_index F P D pixel(group+1)0 O I.
Proof.
 intros;unfold app_neon_partial_index,app_partial_index;
 rewrite app_pass_partial_full,app_pass_partial_zero by assumption;reflexivity.
Qed.
Lemma app_tail_remaining_step:forall D k,
 0<k<=app_rows D->k=app_remaining(app_rows D)(app_group_cursor D k)->
 Z.max 0(k-9)=app_remaining(app_rows D)(app_group_cursor D k+1).
Proof.
 intros;pose proof(app_group_cursor_active D k H H0)as[Hg HC].
 rewrite app_remaining_step by lia;rewrite <-H0;destruct(Z.ltb_spec 9 k);lia.
Qed.
Lemma app_tail_previous_start:forall group base,0<group->
 base=app_previous_cursor group base 0.
Proof. intros;unfold app_previous_cursor;destruct(Z.eqb_spec group 0);[lia|ring]. Qed.
Lemma app_tail_index_advance:forall group,
 ap_add_u32(ap_u32(9*group+8))1=app_index_base_at(group+1).
Proof. intros;unfold ap_add_u32,app_index_base_at,ap_u32;
 rewrite unsigned_unsigned_add_l by lia;f_equal;ring. Qed.
Print Assumptions app_tail_output_append.
Print Assumptions app_tail_index_append.
Print Assumptions app_tail_output_complete.
Print Assumptions app_tail_index_complete.
Print Assumptions app_tail_remaining_step.
Print Assumptions app_tail_previous_start.
Print Assumptions app_tail_index_advance.
