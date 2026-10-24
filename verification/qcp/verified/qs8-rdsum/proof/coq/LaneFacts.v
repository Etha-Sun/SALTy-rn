From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RowGroupFacts ProgressFacts LoadModel.
Local Open Scope Z_scope.
Lemma rd_selected_lane_value : forall M base rows channels stride col r cb j zero off i vl,
 (forall q,rd_present M q ->0<=q<=18446744073709551615) ->
 rd_inputs M base rows channels stride -> rd_zero_condition M zero rows channels ->
 0<=col -> 0<r -> r<=rows -> 0<cb<=rd_min252 r ->
 Z.rem(rd_min252 r-cb)7=0 ->rd_mod252(rows-r)=0 ->0<=j<7 ->
 0<=off ->0<=i ->col+off+vl<=channels+7 ->off+vl<=rd_zero_size channels ->
 rd_read_lane M
 (rd_select_ptr cb j(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+j)*stride))zero+off)i vl=
 if Z.ltb i vl then rd_group_row M base stride(col+off+i)(rows-r+(rd_min252 r-cb))cb j else 0.
Proof.
 intros M base rows channels stride col r cb j zero off i vl HA Hin Hz Hcol Hr Hrows Hcb Hstep Hprogress Hj Hoff Hi Hspan Hzero.
 unfold rd_read_lane;destruct(Z.ltb_spec i vl);[|reflexivity].
 unfold rd_select_ptr,rd_group_row;destruct(Z.ltb_spec j cb).
 - assert(Hrow:0<=rows-r+(rd_min252 r-cb)+j<rows)by(pose proof(rd_min252_range r ltac:(lia));lia).
   assert(HP:rd_present M(base+col+(rows-r+(rd_min252 r-cb)+j)*stride)).
   { replace(base+col+(rows-r+(rd_min252 r-cb)+j)*stride)with(rd_row_address base stride(rows-r+(rd_min252 r-cb)+j)col)by(unfold rd_row_address;ring);apply Hin;lia. }
   pose proof(HA _ HP)as Haddr;rewrite rd_u64_in_range by exact Haddr.
   unfold rd_row_address;f_equal;ring.
 - assert(Hmod:rows mod 7<>0).
   { apply(rd_small_batch_needs_zero rows r cb);try lia;try assumption.
     rewrite <-Z.rem_mod_nonneg by lia;exact Hstep. }
   destruct Hz as[Hbad|[Hpositive[Hwindow Hvalues]]];[contradiction|].
   replace(zero+off+i)with(zero+(off+i))by ring;apply Hvalues;lia.
Qed.
Definition rd_chain16(a x0 x1 x2 x3 x4 x5 x6 i vl:Z):Z :=
 rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16
 (rd_active_wadd16(rd_active_wadd16(rd_active_wadd16 a x0 i vl)x1 i vl)x2 i vl)x3 i vl)x4 i vl)x5 i vl)x6 i vl.
Lemma rd_chain16_active : forall a x0 x1 x2 x3 x4 x5 x6 i vl,i<vl ->
 rd_chain16 a x0 x1 x2 x3 x4 x5 x6 i vl=rs_s16(a+x0+x1+x2+x3+x4+x5+x6).
Proof.
 intros;unfold rd_chain16,rd_active_wadd16,rd_wadd16.
 rewrite (proj2(Z.ltb_lt i vl)H);repeat first[rewrite <-Z.add_assoc|rewrite rd_s16_add_l];reflexivity.
Qed.
Lemma rd_chain16_inactive : forall a x0 x1 x2 x3 x4 x5 x6 i vl,vl<=i ->rd_chain16 a x0 x1 x2 x3 x4 x5 x6 i vl=0.
Proof. intros;unfold rd_chain16,rd_active_wadd16;rewrite (proj2(Z.ltb_ge i vl)H);reflexivity. Qed.
Lemma rd_done_active : forall r cb,0<cb<=rd_min252 r ->rd_done r cb=rd_min252 r-cb.
Proof. intros;unfold rd_done;apply Z.min_r;lia. Qed.
Print Assumptions rd_selected_lane_value.
Print Assumptions rd_chain16_active.
Print Assumptions rd_chain16_inactive.
Print Assumptions rd_done_active.
