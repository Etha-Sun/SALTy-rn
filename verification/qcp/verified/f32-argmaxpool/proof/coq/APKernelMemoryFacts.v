From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APKernelModel.
Local Open Scope Z_scope.

Lemma app_previous_prefix_cell:forall A(O:APState A)p count done previous current j,
 0<=done<=j -> j<count ->
 ap_state_write_n(ap_state_write_n O p(Z.to_nat count)previous)
 p(Z.to_nat done)current(p+4*j)=Some(previous j).
Proof.
 intros A O p count done previous current j Hd Hj.
 rewrite app_write_outside.
 - apply app_write_inside;rewrite Z2Nat.id by lia;lia.
 - intros t Ht;rewrite Z2Nat.id in Ht by lia;lia.
Qed.
Lemma app_partial_output_previous:forall side F P D pixel group done O I j,
 0<group -> 0<=done<=j -> j<app_channels D ->
 app_partial_output side F P D pixel group done O I
 (app_output_at D pixel+4*j)=
 Some(fst(app_lane_value side F P D pixel group j)).
Proof.
 intros;unfold app_partial_output,app_pass_partial,app_pass_complete.
 assert(E:Z.leb group 0=false)by(apply Z.leb_gt;lia);rewrite E.
 unfold app_write_pair,ap_output_write;cbn[fst snd].
 apply app_previous_prefix_cell;assumption.
Qed.
Lemma app_partial_index_previous:forall side F P D pixel group done O I j,
 0<group -> 0<=done<=j -> j<app_channels D ->
 app_partial_index side F P D pixel group done O I
 (app_index_at D pixel+4*j)=
 Some(snd(app_lane_value side F P D pixel group j)).
Proof.
 intros;unfold app_partial_index,app_pass_partial,app_pass_complete.
 assert(E:Z.leb group 0=false)by(apply Z.leb_gt;lia);rewrite E.
 unfold app_write_pair,ap_index_write;cbn[fst snd].
 apply app_previous_prefix_cell;assumption.
Qed.
Lemma app_partial_output_readable:forall side F P D pixel group done vl O I,
 0<group -> 0<=done -> 0<=vl -> done+vl<=app_channels D ->
 ap_output_readable(app_partial_output side F P D pixel group done O I)
 (app_output_cursor(app_output_at D pixel)done)vl.
Proof.
 unfold ap_output_readable,app_output_cursor;intros side F P D pixel group done vl O I Hg Hd Hv HC j Hj.
 exists(fst(app_lane_value side F P D pixel group(done+j))).
 replace(app_output_at D pixel+4*done+4*j)with(app_output_at D pixel+4*(done+j))by ring.
 apply app_partial_output_previous;lia.
Qed.
Lemma app_partial_index_readable:forall side F P D pixel group done vl O I,
 0<group -> 0<=done -> 0<=vl -> done+vl<=app_channels D ->
 ap_index_readable(app_partial_index side F P D pixel group done O I)
 (app_output_cursor(app_index_at D pixel)done)vl.
Proof.
 unfold ap_index_readable,app_output_cursor;intros side F P D pixel group done vl O I Hg Hd Hv HC j Hj.
 exists(snd(app_lane_value side F P D pixel group(done+j))).
 replace(app_index_at D pixel+4*done+4*j)with(app_index_at D pixel+4*(done+j))by ring.
 apply app_partial_index_previous;lia.
Qed.
Lemma app_geometry_row:forall F P W WI D pixel group row done vl,
 app_valid F P W WI D -> 0<=pixel<app_pixels D ->
 0<=group<app_groups(app_rows D) -> 0<=row<9 ->
 0<=done -> 0<=vl -> done+vl<=app_channels D+3 ->
 ap_window F(app_row_cursor P(app_table D pixel)(app_offset_at D pixel)
 (app_rows D)group row done)vl.
Proof.
 intros F P W WI D pixel group row done vl HV Hp Hg Hr Hd Hvl HC.
 destruct HV as[[HP[HK[HCpos Hgeom]]]Hdup].
 destruct(Hgeom pixel Hp)as[HT[Hrows Hrest]].
 assert(Hrem:0<app_remaining(app_rows D)group).
 { apply(app_remaining_active(app_rows D)group HK ltac:(lia));lia. }
 assert(Hindex:0<=app_row_index(app_rows D)group row<app_rows D).
 { unfold app_row_index,ap_pass_row,app_remaining in *.
   destruct(Z.ltb_spec row(Z.max 0(app_rows D-9*group)));lia. }
 specialize(Hrows _ Hindex).
 unfold app_row_cursor,app_row_base,app_row_pointer,ap_window in *.
 destruct Hrows as[Hbase[Hlength Hcells]].
 split;[lia|split;[assumption|]].
 intros j Hj;replace(ap_u64(ap_ptr_get P(app_table D pixel+8*app_row_index(app_rows D)group row)+app_offset_at D pixel)+4*done+4*j)
 with(ap_u64(ap_ptr_get P(app_table D pixel+8*app_row_index(app_rows D)group row)+app_offset_at D pixel)+4*(done+j))by ring.
 apply Hcells;lia.
Qed.
Print Assumptions app_previous_prefix_cell.
Print Assumptions app_partial_output_previous.
Print Assumptions app_partial_index_previous.
Print Assumptions app_partial_output_readable.
Print Assumptions app_partial_index_readable.
Print Assumptions app_geometry_row.
