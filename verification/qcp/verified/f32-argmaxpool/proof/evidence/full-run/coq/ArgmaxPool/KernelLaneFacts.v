From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APKernelMemoryFacts KernelCursorFacts.
Local Open Scope Z_scope.
Lemma app_lane_prefix_zero:forall side F P D pixel channel,
 app_lane_prefix side F P D pixel 0 channel=None.
Proof. reflexivity. Qed.
Lemma app_lane_prefix_some:forall side F P D pixel group channel,0<group->
 app_lane_prefix side F P D pixel group channel=
 Some(app_lane_value side F P D pixel group channel).
Proof.
 intros;destruct(app_lane_prefix_initialized side F P D pixel group channel H)as[v Hv].
 unfold app_lane_value;rewrite Hv;reflexivity.
Qed.
Lemma app_lane_value_step:forall side F P D pixel group channel,
 0<=group -> 0<=app_rows D ->
 app_lane_value side F P D pixel(group+1)channel=
 app_step side F P(app_table D pixel)(app_offset_at D pixel)channel
 (9*group)(app_remaining(app_rows D)group)
 (app_lane_prefix side F P D pixel group channel).
Proof.
 intros;unfold app_lane_value at 1.
 rewrite app_lane_prefix_step by assumption;reflexivity.
Qed.
Lemma app_lane_value_previous_step:forall side F P D pixel group channel,
 0<group -> 0<=app_rows D ->
 app_lane_value side F P D pixel(group+1)channel=
 app_step side F P(app_table D pixel)(app_offset_at D pixel)channel
 (9*group)(app_remaining(app_rows D)group)
 (Some(app_lane_value side F P D pixel group channel)).
Proof. intros;rewrite app_lane_value_step by lia;rewrite app_lane_prefix_some by assumption;reflexivity. Qed.
Lemma app_row_load_value:forall F P D pixel group row done lane,
 ap_load_lane F(app_row_cursor P(app_table D pixel)(app_offset_at D pixel)
 (app_rows D)group row done)lane=
 fst(ap_candidate F P(app_table D pixel)(app_offset_at D pixel)
 (done+lane)(9*group)(app_remaining(app_rows D)group)row).
Proof.
 intros;unfold ap_load_lane,app_row_cursor,app_row_base,app_row_pointer,
 app_row_index,ap_candidate,ap_input_value;cbn[fst].
 f_equal;ring.
Qed.
Lemma app_candidate_index_value:forall F P D pixel group row channel,
 snd(ap_candidate F P(app_table D pixel)(app_offset_at D pixel)channel
 (9*group)(app_remaining(app_rows D)group)row)=
 ap_u32(app_index_base_at group+row).
Proof.
 intros;unfold ap_candidate,app_index_base_at;cbn[snd];unfold ap_u32.
 rewrite unsigned_unsigned_add_l by lia;reflexivity.
Qed.
Lemma app_output_write_active_ext:forall O p count f g,
 0<=count -> (forall j,0<=j<count->f j=g j)->
 ap_output_write O p count f=ap_output_write O p count g.
Proof. intros;unfold ap_output_write;apply app_write_ext;intros;apply H0;rewrite Z2Nat.id in H1 by assumption;assumption. Qed.
Lemma app_index_write_active_ext:forall O p count f g,
 0<=count -> (forall j,0<=j<count->f j=g j)->
 ap_index_write O p count f=ap_index_write O p count g.
Proof. intros;unfold ap_index_write;apply app_write_ext;intros;apply H0;rewrite Z2Nat.id in H1 by assumption;assumption. Qed.
Print Assumptions app_lane_prefix_zero.
Print Assumptions app_lane_prefix_some.
Print Assumptions app_lane_value_step.
Print Assumptions app_lane_value_previous_step.
Print Assumptions app_row_load_value.
Print Assumptions app_candidate_index_value.
Print Assumptions app_output_write_active_ext.
Print Assumptions app_index_write_active_ext.
