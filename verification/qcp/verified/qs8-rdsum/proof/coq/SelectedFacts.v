From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RvvBounds JoinModel.
Local Open Scope Z_scope.
Lemma rd_window_shift : forall M p n off width,
 rd_window M p n -> 0<=off -> 0<=width -> off+width<=n ->
 rd_window M(p+off)width.
Proof. intros M p n off width H Ho Hw Hn i Hi;replace(p+off+i)with(p+(off+i))by ring;apply H;lia. Qed.
Lemma rd_selected_read_window : forall M base rows channels stride col r cb j zero off width,
 (forall q,rd_present M q ->0<=q<=18446744073709551615) ->
 rd_inputs M base rows channels stride -> rd_zero_condition M zero rows channels ->
 0<base -> 0<=stride -> 0<=col -> 0<r -> r<=rows ->
 0<cb<=rd_min252 r -> (rd_min252 r-cb)mod 7=0 -> rd_mod252(rows-r)=0 ->
 0<=j<7 -> 0<=off -> 0<width -> col+off+width<=channels+7 ->
 off+width<=rd_zero_size channels ->
 let p:=rd_select_ptr cb j (rd_u64(base+col+(rows-r+(rd_min252 r-cb)+j)*stride)) zero in
 0<p /\ rd_window M(p+off)width /\ p+off+width<=18446744073709551616.
Proof.
 intros M base rows channels stride col r cb j zero off width Ha Hin Hz Hb Hst Hcol Hr Hrows Hcb Hstep Hprogress Hj Hoff Hw Hcap Hzcap.
 unfold rd_select_ptr;destruct(Z.ltb_spec j cb).
 - assert(Hrow:0<=rows-r+(rd_min252 r-cb)+j<rows)by(pose proof(rd_min252_range r ltac:(lia));lia).
   assert(Hpresent:rd_present M(base+col+(rows-r+(rd_min252 r-cb)+j)*stride)).
   { replace(base+col+(rows-r+(rd_min252 r-cb)+j)*stride)with(rd_row_address base stride(rows-r+(rd_min252 r-cb)+j)col)by(unfold rd_row_address;ring);apply Hin;lia. }
   pose proof(Ha _ Hpresent)as Haddr;rewrite rd_u64_in_range by exact Haddr.
   assert(Hwitness:rd_window M(base+col+(rows-r+(rd_min252 r-cb)+j)*stride+off)width).
   { replace(base+col+(rows-r+(rd_min252 r-cb)+j)*stride+off)with(base+(rows-r+(rd_min252 r-cb)+j)*stride+(col+off))by ring;apply rd_inputs_window with(rows:=rows)(channels:=channels);try assumption;lia. }
   split;[pose proof(Z.mul_nonneg_nonneg (rows-r+(rd_min252 r-cb)+j) stride ltac:(lia) Hst);lia|split;[exact Hwitness|]].
   pose proof(rd_window_capacity M _ width ltac:(intros;pose proof(Ha q H0);lia) Hw Hwitness);lia.
 - assert(Hmod:rows mod 7<>0)by(apply(rd_small_batch_needs_zero rows r cb);try lia;assumption).
   destruct Hz as[Hz|[Hpos[Hwindow Hvalues]]];[contradiction|].
   assert(Hwitness:rd_window M(zero+off)width)by(eapply rd_window_shift;[exact Hwindow|lia|lia|assumption]).
   split;[exact Hpos|split;[exact Hwitness|]].
   pose proof(rd_window_capacity M _ width ltac:(intros;pose proof(Ha q H0);lia) Hw Hwitness);lia.
Qed.
Print Assumptions rd_window_shift.
Print Assumptions rd_selected_read_window.
