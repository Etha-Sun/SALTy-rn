From Coq Require Import ZArith List Lia Bool.
Local Open Scope Z_scope.
Local Open Scope bool_scope.

(* Float-cell indices. No float value or NaN restriction is part of geometry. *)
Definition row_alias (mr r:Z) : Z := Z.min r (mr-1).
Definition panel_count (nc:Z) : Z := (nc+7)/8.
Definition panel_cols (nc b:Z) : Z := Z.min 8 (nc-8*b).
Definition processed_cols (nc b:Z) : Z := Z.min nc (8*b).
Definition remaining_cols (nc b:Z) : Z := nc-8*b.
Definition panel_wbase (k b:Z) : Z := 8*(k+1)*b.
Definition packed_bias_index (k col:Z) : Z := panel_wbase k (col/8) + col mod 8.
Definition packed_weight_index (k col depth:Z) : Z := packed_bias_index k col + 8*(depth+1).
Definition a_index (k mr r depth:Z) : Z := row_alias mr r*k+depth.
Definition c_index (nc mr r b lane:Z) : Z := row_alias mr r*nc+8*b+lane.
Definition packed_cursor (k b depth:Z) : Z := panel_wbase k b+8*(depth+1).
Definition a_cursor (a k mr r depth:Z) : Z := a+4*a_index k mr r depth.
Definition c_cursor (c nc mr r b:Z) : Z := c+4*c_index nc mr r b 0.

(* Exact source row construction, including repeated inactive-row pointers. *)
Definition source_row1 (mr:Z) := if mr <? 2 then 0 else 1.
Definition source_row2 (mr:Z) := if mr <=? 2 then source_row1 mr else source_row1 mr+1.
Definition source_row3 (mr:Z) := if mr =? 4 then source_row2 mr+1 else source_row2 mr.

Lemma row_alias_active : forall mr r, 0<=r<mr -> row_alias mr r=r.
Proof. intros;unfold row_alias;apply Z.min_l;lia. Qed.
Lemma row_alias_inactive : forall mr r, 1<=mr -> mr<=r -> row_alias mr r=mr-1.
Proof. intros;unfold row_alias;apply Z.min_r;lia. Qed.
Lemma row_alias_range : forall mr r, 1<=mr<=4 -> 0<=r<4 -> 0<=row_alias mr r<mr.
Proof. intros;unfold row_alias;pose proof(Z.le_min_l r (mr-1));pose proof(Z.le_min_r r (mr-1));assert(0<=Z.min r(mr-1))by(apply Z.min_glb;lia);lia. Qed.
Lemma source_rows_match_alias : forall mr, 1<=mr<=4 ->
 source_row1 mr=row_alias mr 1 /\ source_row2 mr=row_alias mr 2 /\ source_row3 mr=row_alias mr 3.
Proof. intros;assert(mr=1\/mr=2\/mr=3\/mr=4)by lia;destruct H0 as[H0|[H0|[H0|H0]]];subst mr;vm_compute;auto. Qed.
Lemma inactive_rows_share_input_output : forall mr r s k nc b d j,
 row_alias mr r=row_alias mr s ->
 a_index k mr r d=a_index k mr s d /\ c_index nc mr r b j=c_index nc mr s b j.
Proof. intros;unfold a_index,c_index;rewrite H;auto. Qed.

Lemma panel_count_positive : forall nc, 0<nc -> 0<panel_count nc.
Proof. intros;unfold panel_count;apply Z.div_str_pos;lia. Qed.
Lemma valid_panel_start : forall nc b, 0<nc -> 0<=b<panel_count nc -> 0<=8*b<nc.
Proof.
 intros;unfold panel_count in *.
 pose proof(Z.div_mod(nc+7)8 ltac:(lia));pose proof(Z.mod_pos_bound(nc+7)8 ltac:(lia));nia.
Qed.
Lemma panel_width_range : forall nc b, 0<nc -> 0<=b<panel_count nc -> 1<=panel_cols nc b<=8.
Proof. intros;pose proof(valid_panel_start nc b H H0);unfold panel_cols;pose proof(Z.le_min_l 8(nc-8*b));assert(1<=Z.min 8(nc-8*b))by(apply Z.min_glb;lia);lia. Qed.
Lemma panel_tail_inside_nc : forall nc b j, 0<nc -> 0<=b<panel_count nc -> 0<=j<panel_cols nc b -> 0<=8*b+j<nc.
Proof. intros;pose proof(valid_panel_start nc b H H0);unfold panel_cols in *;pose proof(Z.le_min_r 8(nc-8*b));lia. Qed.
Lemma column_to_panel : forall nc col, 0<nc -> 0<=col<nc ->
 0<=col/8<panel_count nc /\ 0<=col mod 8<panel_cols nc (col/8) /\ col=8*(col/8)+col mod 8.
Proof.
 intros;pose proof(Z.div_mod col 8 ltac:(lia));pose proof(Z.mod_pos_bound col 8 ltac:(lia));pose proof(Z.div_pos col 8 ltac:(lia)ltac:(lia)).
 pose proof(Z.div_mod(nc+7)8 ltac:(lia));pose proof(Z.mod_pos_bound(nc+7)8 ltac:(lia)).
 unfold panel_count,panel_cols;repeat split;lia.
Qed.
Lemma panel_count_covers : forall nc, 0<nc -> 8*(panel_count nc-1)<nc<=8*panel_count nc.
Proof. intros;unfold panel_count;pose proof(Z.div_mod(nc+7)8 ltac:(lia));pose proof(Z.mod_pos_bound(nc+7)8 ltac:(lia));nia. Qed.
Lemma processed_before_valid_panel : forall nc b, 0<nc -> 0<=b<panel_count nc -> processed_cols nc b=8*b.
Proof. intros;pose proof(valid_panel_start nc b H H0);unfold processed_cols;apply Z.min_r;lia. Qed.
Lemma panel_progress : forall nc b, 0<nc -> 0<=b<panel_count nc ->
 processed_cols nc (b+1)=processed_cols nc b+panel_cols nc b.
Proof.
 intros;rewrite (processed_before_valid_panel nc b H H0);unfold processed_cols,panel_cols.
 destruct(Z_le_dec nc (8*(b+1))).
 - rewrite Z.min_l by lia;rewrite Z.min_r by lia;lia.
 - rewrite Z.min_r by lia;rewrite Z.min_l by lia;lia.
Qed.
Lemma last_panel_finishes : forall nc, 0<nc -> processed_cols nc (panel_count nc)=nc.
Proof. intros;pose proof(panel_count_covers nc H);unfold processed_cols;apply Z.min_l;lia. Qed.
Lemma full_panel_or_final_tail : forall nc b, 0<nc -> 0<=b<panel_count nc ->
 (8<=remaining_cols nc b /\ panel_cols nc b=8) \/
 (0<remaining_cols nc b<8 /\ panel_cols nc b=remaining_cols nc b /\ b+1=panel_count nc).
Proof.
 intros;pose proof(valid_panel_start nc b H H0);pose proof(panel_count_covers nc H).
 unfold remaining_cols,panel_cols;destruct(Z_le_dec 8 (nc-8*b)).
 - left;split;[lia|apply Z.min_l;lia].
 - right;rewrite Z.min_r by lia;repeat split;lia.
Qed.
Lemma remaining_decreases : forall nc b, 0<nc -> 0<=b<panel_count nc ->
 0<=remaining_cols nc b-panel_cols nc b<remaining_cols nc b.
Proof. intros;pose proof(panel_width_range nc b H H0);pose proof(Z.le_min_r 8(nc-8*b));unfold remaining_cols,panel_cols in *;lia. Qed.

Lemma a_read_in_bounds : forall mr k r d, 1<=mr<=4 -> 0<k -> 0<=r<4 -> 0<=d<k -> 0<=a_index k mr r d<4*k.
Proof. intros;pose proof(row_alias_range mr r H H1);unfold a_index;nia. Qed.
Lemma c_store_in_bounds : forall mr nc r b j, 1<=mr<=4 -> 0<nc -> 0<=r<4 -> 0<=b<panel_count nc -> 0<=j<panel_cols nc b -> 0<=c_index nc mr r b j<4*nc.
Proof. intros;pose proof(row_alias_range mr r H H1);pose proof(panel_tail_inside_nc nc b j H0 H2 H3);unfold c_index;nia. Qed.
Lemma active_output_rows_disjoint : forall mr nc r s x y,
 1<=mr<=4 -> 0<nc -> 0<=r<mr -> 0<=s<mr -> 0<=x<nc -> 0<=y<nc -> r<>s ->
 row_alias mr r*nc+x<>row_alias mr s*nc+y.
Proof. intros;rewrite !row_alias_active by assumption;intro E;nia. Qed.
Lemma packed_bias_and_weight_bounds : forall nc k col d,
 0<nc -> 0<k -> 0<=col<nc -> 0<=d<k ->
 0<=packed_bias_index k col<panel_count nc*8*(k+1) /\
 0<=packed_weight_index k col d<panel_count nc*8*(k+1).
Proof.
 intros;pose proof(column_to_panel nc col H H1)as[C[R E]].
 pose proof(Z.mod_pos_bound col 8 ltac:(lia));unfold packed_weight_index,packed_bias_index,panel_wbase;repeat split;nia.
Qed.
Lemma packed_full8_padding : forall nc k b d j,
 0<nc -> 0<k -> 0<=b<panel_count nc -> 0<=d<=k -> 0<=j<8 ->
 0<=panel_wbase k b+8*d+j<panel_count nc*8*(k+1).
Proof. intros;unfold panel_wbase;nia. Qed.
Lemma packed_cursor_next_depth : forall k b d, packed_cursor k b (d+1)=packed_cursor k b d+8.
Proof. intros;unfold packed_cursor;ring. Qed.
Lemma packed_cursor_next_panel : forall k b, packed_cursor k b k=panel_wbase k (b+1).
Proof. intros;unfold packed_cursor,panel_wbase;ring. Qed.
Lemma input_cursor_reset : forall a k mr r, a_cursor a k mr r k-4*k=a_cursor a k mr r 0.
Proof. intros;unfold a_cursor,a_index;ring. Qed.
Lemma output_cursor_next_panel : forall c nc mr r b, c_cursor c nc mr r (b+1)=c_cursor c nc mr r b+32.
Proof. intros;unfold c_cursor,c_index;ring. Qed.
Lemma panel_lane_global_index : forall k b j, 0<=b -> 0<=j<8 ->
 packed_bias_index k (8*b+j)=panel_wbase k b+j.
Proof.
 intros;unfold packed_bias_index.
 replace (8*b+j) with (j+b*8)by ring.
 rewrite Z.div_add by lia;rewrite Z.mod_add by lia.
 rewrite Z.div_small by lia;rewrite Z.mod_small by lia;f_equal;lia.
Qed.

(* An extensional outer-loop candidate. A/C row pointers are not independently
   owned: a single 4K input buffer and a single 4nc output buffer are retained. *)
Definition prefix_frame {X:Type} (mr nc b:Z) (old now:Z->X) (result:Z->Z->X):Prop :=
 forall r col, 0<=r<4 -> 0<=col<nc ->
 now(r*nc+col)=if (r <? mr) && (col <? processed_cols nc b)
 then result r col else old(r*nc+col).
Lemma prefix_frame_initial : forall X mr nc (old:Z->X) result, 0<nc ->
 prefix_frame mr nc 0 old old result.
Proof.
 intros;unfold prefix_frame,processed_cols;rewrite Z.min_r by lia;intros;replace(8*0)with 0 by ring.
 assert(col <? 0=false)by(apply Z.ltb_ge;lia);rewrite H2;rewrite Bool.andb_false_r;reflexivity.
Qed.
Lemma prefix_frame_complete : forall X mr nc (old now:Z->X) result,
 1<=mr<=4 -> 0<nc -> prefix_frame mr nc (panel_count nc) old now result ->
 (forall r col, 0<=r<mr -> 0<=col<nc -> now(r*nc+col)=result r col) /\
 (forall r col, mr<=r<4 -> 0<=col<nc -> now(r*nc+col)=old(r*nc+col)).
Proof.
 intros;split;intros;unfold prefix_frame in H1;rewrite last_panel_finishes in H1 by assumption.
 - specialize(H1 r col ltac:(lia) H3);assert(r <? mr=true)by(apply Z.ltb_lt;lia);assert(col <? nc=true)by(apply Z.ltb_lt;lia);rewrite H4,H5 in H1;exact H1.
 - specialize(H1 r col ltac:(lia) H3);assert(r <? mr=false)by(apply Z.ltb_ge;lia);rewrite H4 in H1;exact H1.
Qed.

Definition panel_effect {X:Type} (mr nc b:Z) (before after:Z->X) (result:Z->Z->X):Prop :=
 forall r col, 0<=r<4 -> 0<=col<nc ->
 after(r*nc+col)=if (r <? mr) && (8*b <=? col) && (col <? 8*b+panel_cols nc b)
 then result r col else before(r*nc+col).
Lemma prefix_frame_step : forall X mr nc b (old before after:Z->X) result,
 0<nc -> 0<=b<panel_count nc ->
 prefix_frame mr nc b old before result -> panel_effect mr nc b before after result ->
 prefix_frame mr nc (b+1) old after result.
Proof.
 intros X mr nc b old before after result Hnc Hb Hprefix Heffect r col Hr Hcol.
 unfold prefix_frame in Hprefix;unfold panel_effect in Heffect.
 rewrite (Heffect r col Hr Hcol),(Hprefix r col Hr Hcol).
 rewrite(panel_progress nc b Hnc Hb),(processed_before_valid_panel nc b Hnc Hb).
 destruct(r <? mr)eqn:R;[|reflexivity].
 destruct(8*b <=? col)eqn:L;destruct(col <? 8*b+panel_cols nc b)eqn:U;destruct(col <? 8*b)eqn:P;try reflexivity;
 apply Z.leb_le in L || apply Z.leb_gt in L;
 apply Z.ltb_lt in U || apply Z.ltb_ge in U;
 apply Z.ltb_lt in P || apply Z.ltb_ge in P;
 pose proof(panel_width_range nc b Hnc Hb);lia.
Qed.
Definition write_cell {X:Type} (mem:Z->X)(address:Z)(value:X):Z->X :=
 fun i=>if Z.eq_dec i address then value else mem i.
Lemma repeated_alias_store_idempotent : forall X (mem:Z->X)address value i,
 write_cell(write_cell mem address value)address value i=write_cell mem address value i.
Proof. intros;unfold write_cell;destruct(Z.eq_dec i address);reflexivity. Qed.

(* The NEON tail's finite masks are widths within the final panel, not bounds
   on the arbitrary number of columns, rows, K iterations, or float values. *)
Definition tail_piece (n mask width:Z):Z := if Z.eqb(Z.land n mask)0 then 0 else width.
Definition tail_four (n:Z):Z := tail_piece n 4 4.
Definition tail_two (n:Z):Z := tail_piece n 2 2.
Definition tail_one (n:Z):Z := tail_piece n 1 1.
Lemma neon_tail_decomposition : forall n, 1<=n<8 ->
 tail_four n+tail_two n+tail_one n=n /\
 (tail_four n=0\/tail_four n=4) /\ (tail_two n=0\/tail_two n=2) /\ (tail_one n=0\/tail_one n=1).
Proof.
 intros;assert(n=1\/n=2\/n=3\/n=4\/n=5\/n=6\/n=7)by lia.
 destruct H0 as[H0|[H0|[H0|[H0|[H0|[H0|H0]]]]]];subst n;vm_compute;auto.
Qed.
Lemma neon_tail_store_ranges : forall n j, 1<=n<8 -> 0<=j<n ->
 (0<=j<tail_four n) \/
 (tail_four n<=j<tail_four n+tail_two n) \/
 (tail_four n+tail_two n<=j<tail_four n+tail_two n+tail_one n).
Proof. intros;pose proof(neon_tail_decomposition n H);lia. Qed.

Print Assumptions row_alias_active.
Print Assumptions row_alias_inactive.
Print Assumptions row_alias_range.
Print Assumptions source_rows_match_alias.
Print Assumptions inactive_rows_share_input_output.
Print Assumptions panel_count_positive.
Print Assumptions valid_panel_start.
Print Assumptions panel_width_range.
Print Assumptions panel_tail_inside_nc.
Print Assumptions column_to_panel.
Print Assumptions panel_count_covers.
Print Assumptions processed_before_valid_panel.
Print Assumptions panel_progress.
Print Assumptions last_panel_finishes.
Print Assumptions full_panel_or_final_tail.
Print Assumptions remaining_decreases.
Print Assumptions a_read_in_bounds.
Print Assumptions c_store_in_bounds.
Print Assumptions active_output_rows_disjoint.
Print Assumptions packed_bias_and_weight_bounds.
Print Assumptions packed_full8_padding.
Print Assumptions packed_cursor_next_depth.
Print Assumptions packed_cursor_next_panel.
Print Assumptions input_cursor_reset.
Print Assumptions output_cursor_next_panel.
Print Assumptions panel_lane_global_index.
Print Assumptions prefix_frame_initial.
Print Assumptions prefix_frame_complete.
Print Assumptions prefix_frame_step.
Print Assumptions repeated_alias_store_idempotent.
Print Assumptions neon_tail_decomposition.
Print Assumptions neon_tail_store_ranges.
