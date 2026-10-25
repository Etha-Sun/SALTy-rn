From X32Transpose Require Export NeonTileFacts.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Definition xt_neon_bulk_state(F:XTMap)(G:XTLayout)(R:XTOutput)(k row w:Z):XTOutput:=
 xt_write_pair(xt_write_pair R(xt_current_output G(xt_neon_second k w)row)
 (xt_load_lane F(xt_current_input G k row)1)(xt_load_lane F(xt_current_input G k(row+1))1))
 (xt_current_output G k row)
 (xt_load_lane F(xt_current_input G k row)0)(xt_load_lane F(xt_current_input G k(row+1))0).
Definition xt_neon_tail_state(F:XTMap)(G:XTLayout)(R:XTOutput)(k row w:Z):XTOutput:=
 xt_output_put(xt_output_put R(xt_current_output G(xt_neon_second k w)row)
 (xt_load_lane F(xt_current_input G k row)1))
 (xt_current_output G k row)(xt_load_lane F(xt_current_input G k row)0).
Lemma xt_load_current_lane:forall F W G k row j,
 xt_valid F W G->0<=row<xt_height G->0<=k<=xt_cols G->
 xt_load_lane F(xt_current_input G k row)j=xt_get F(xt_input_address G row(k+j)).
Proof.
 intros;rewrite(xt_current_input_exact F W G k row H H0 H1).
 unfold xt_load_lane;f_equal;unfold xt_input_address;ring.
Qed.
Lemma xt_neon_bulk_progress:forall F W G O R k row w,
 xt_valid F W G->0<=k<xt_cols G->w=xt_doz(xt_cols G)k->
 0<=row->row+2<=xt_height G->
 xt_progress F G O R k(xt_neon_batch w)row->
 xt_progress F G O(xt_neon_bulk_state F G R k row w)k(xt_neon_batch w)(row+2).
Proof.
 intros F W G O R k row w Hv Hk Hw Hr Hend Hprog.
 assert(Hhi:xt_injective G)by(eapply xt_valid_injective;[exact Hv|lia]).
 assert(Hremaining:w=xt_cols G-k).
 { unfold xt_doz in Hw;destruct(Z.ltb_spec k(xt_cols G));lia. }
 assert(Hsecond:0<=xt_neon_second k w<xt_cols G)by(eapply xt_neon_second_bounds;eassumption).
 unfold xt_neon_bulk_state.
 rewrite(xt_current_output_exact F W G k row Hv ltac:(lia)Hk).
 rewrite(xt_current_output_exact F W G(xt_neon_second k w)row Hv ltac:(lia)Hsecond).
 rewrite !(xt_load_current_lane F W G k row)by(assumption||lia).
 rewrite !(xt_load_current_lane F W G k(row+1))by(assumption||lia).
 rewrite !Z.add_0_r.
 destruct(Z.lt_ge_cases w 2)as[Hsmall|Hlarge].
 - assert(Ew:w=1)by lia;rewrite Ew in *.
   unfold xt_neon_second,xt_neon_batch in *;cbn[Z.ltb Z.min]in *.
   apply xt_neon_bulk_one_column;assumption||lia.
 - assert(Esecond:xt_neon_second k w=k+1).
   { unfold xt_neon_second;destruct(Z.ltb_spec w 2);lia. }
   assert(Ebatch:xt_neon_batch w=2)by(unfold xt_neon_batch;apply Z.min_l;lia).
   rewrite Esecond,Ebatch in *.
   apply xt_neon_bulk_two_columns;assumption||lia.
Qed.
Lemma xt_neon_tail_progress:forall F W G O R k row w,
 xt_valid F W G->0<=k<xt_cols G->w=xt_doz(xt_cols G)k->
 0<=row<xt_height G->
 xt_progress F G O R k(xt_neon_batch w)row->
 xt_progress F G O(xt_neon_tail_state F G R k row w)k(xt_neon_batch w)(row+1).
Proof.
 intros F W G O R k row w Hv Hk Hw Hr Hprog.
 assert(Hhi:xt_injective G)by(eapply xt_valid_injective;[exact Hv|lia]).
 assert(Hremaining:w=xt_cols G-k).
 { unfold xt_doz in Hw;destruct(Z.ltb_spec k(xt_cols G));lia. }
 assert(Hsecond:0<=xt_neon_second k w<xt_cols G)by(eapply xt_neon_second_bounds;eassumption).
 unfold xt_neon_tail_state.
 rewrite(xt_current_output_exact F W G k row Hv Hr Hk).
 rewrite(xt_current_output_exact F W G(xt_neon_second k w)row Hv Hr Hsecond).
 rewrite !(xt_load_current_lane F W G k row)by(assumption||lia).
 rewrite !Z.add_0_r.
 destruct(Z.lt_ge_cases w 2)as[Hsmall|Hlarge].
 - assert(Ew:w=1)by lia;rewrite Ew in *.
   unfold xt_neon_second,xt_neon_batch in *;cbn[Z.ltb Z.min]in *.
   rewrite xt_output_put_override;apply xt_progress_single_step;assumption||lia.
 - assert(Esecond:xt_neon_second k w=k+1).
   { unfold xt_neon_second;destruct(Z.ltb_spec w 2);lia. }
   assert(Ebatch:xt_neon_batch w=2)by(unfold xt_neon_batch;apply Z.min_l;lia).
   rewrite Esecond,Ebatch in *.
   apply xt_progress_two_columns_step;assumption||lia.
Qed.
Print Assumptions xt_load_current_lane.
Print Assumptions xt_neon_bulk_progress.
Print Assumptions xt_neon_tail_progress.
