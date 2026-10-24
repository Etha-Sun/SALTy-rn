From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export LaneFacts.
Local Open Scope Z_scope.
Lemma rd_group_acc16_step : forall M base stride col start r cb i vl,
 0<cb<=rd_min252 r ->
 rd_chain16 (rd_acc16 M base stride col start (rd_done r cb) i vl)
 (rd_group_row M base stride (col+i) (start+rd_done r cb) cb 0)
 (rd_group_row M base stride (col+i) (start+rd_done r cb) cb 1)
 (rd_group_row M base stride (col+i) (start+rd_done r cb) cb 2)
 (rd_group_row M base stride (col+i) (start+rd_done r cb) cb 3)
 (rd_group_row M base stride (col+i) (start+rd_done r cb) cb 4)
 (rd_group_row M base stride (col+i) (start+rd_done r cb) cb 5)
 (rd_group_row M base stride (col+i) (start+rd_done r cb) cb 6) i vl =
 rd_acc16 M base stride col start (rd_done r (cb-7)) i vl.
Proof.
 intros M base stride col start r cb i vl Hcb.
 destruct(Z_lt_ge_dec i vl)as[Hactive|Hinactive].
 - rewrite rd_chain16_active by assumption;unfold rd_acc16;
   rewrite(proj2(Z.ltb_lt i vl)Hactive).
   rewrite rd_done_step7 by assumption.
   replace
    (rs_u16 (rd_column M (base+start*stride) (rd_done r cb) stride (col+i))+
      rd_group_row M base stride (col+i) (start+rd_done r cb) cb 0+
      rd_group_row M base stride (col+i) (start+rd_done r cb) cb 1+
      rd_group_row M base stride (col+i) (start+rd_done r cb) cb 2+
      rd_group_row M base stride (col+i) (start+rd_done r cb) cb 3+
      rd_group_row M base stride (col+i) (start+rd_done r cb) cb 4+
      rd_group_row M base stride (col+i) (start+rd_done r cb) cb 5+
      rd_group_row M base stride (col+i) (start+rd_done r cb) cb 6)
    with (rs_u16 (rd_column M (base+start*stride) (rd_done r cb) stride (col+i))+
      rd_group7 M base stride (col+i) (start+rd_done r cb) cb)
    by(unfold rd_group7;ring).
   apply rd_batch16_step7;[rewrite rd_done_active by assumption;lia|lia].
 - rewrite rd_chain16_inactive by lia;unfold rd_acc16;
   rewrite(proj2(Z.ltb_ge i vl)ltac:(lia));reflexivity.
Qed.
Print Assumptions rd_group_acc16_step.

Lemma rd_selected_acc16_step : forall M base rows channels stride col r cb zero off i vl,
 (forall q,rd_present M q ->0<=q<=18446744073709551615) ->
 rd_inputs M base rows channels stride ->rd_zero_condition M zero rows channels ->
 0<=col ->0<r ->r<=rows ->0<cb<=rd_min252 r ->
 Z.rem(rd_min252 r-cb)7=0 ->rd_mod252(rows-r)=0 ->
 0<=off ->0<=i ->col+off+vl<=channels+8 ->off+vl<=rd_zero_size channels ->
 rd_chain16 (rd_acc16 M base stride (col+off) (rows-r) (rd_done r cb) i vl)
 (rd_read_lane M(rd_select_ptr cb 0(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+0)*stride))zero+off)i vl)
 (rd_read_lane M(rd_select_ptr cb 1(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+1)*stride))zero+off)i vl)
 (rd_read_lane M(rd_select_ptr cb 2(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+2)*stride))zero+off)i vl)
 (rd_read_lane M(rd_select_ptr cb 3(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+3)*stride))zero+off)i vl)
 (rd_read_lane M(rd_select_ptr cb 4(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+4)*stride))zero+off)i vl)
 (rd_read_lane M(rd_select_ptr cb 5(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+5)*stride))zero+off)i vl)
 (rd_read_lane M(rd_select_ptr cb 6(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+6)*stride))zero+off)i vl)
 i vl =rd_acc16 M base stride (col+off) (rows-r) (rd_done r(cb-7)) i vl.
Proof.
 intros M base rows channels stride col r cb zero off i vl HA Hin Hz Hcol Hr Hrows Hcb Hstep Hprogress Hoff Hi Hspan Hzero.
 destruct(Z_lt_ge_dec i vl)as[Hactive|Hinactive].
 - rewrite (rd_selected_lane_value M base rows channels stride col r cb 0 zero off i vl) by(try assumption;lia).
   rewrite (rd_selected_lane_value M base rows channels stride col r cb 1 zero off i vl) by(try assumption;lia).
   rewrite (rd_selected_lane_value M base rows channels stride col r cb 2 zero off i vl) by(try assumption;lia).
   rewrite (rd_selected_lane_value M base rows channels stride col r cb 3 zero off i vl) by(try assumption;lia).
   rewrite (rd_selected_lane_value M base rows channels stride col r cb 4 zero off i vl) by(try assumption;lia).
   rewrite (rd_selected_lane_value M base rows channels stride col r cb 5 zero off i vl) by(try assumption;lia).
   rewrite (rd_selected_lane_value M base rows channels stride col r cb 6 zero off i vl) by(try assumption;lia).
   rewrite(proj2(Z.ltb_lt i vl)Hactive).
   replace (rd_min252 r-cb) with (rd_done r cb) by(apply rd_done_active;assumption).
   apply rd_group_acc16_step;assumption.
 - rewrite rd_chain16_inactive by lia;unfold rd_acc16;
   rewrite(proj2(Z.ltb_ge i vl)ltac:(lia));reflexivity.
Qed.
Print Assumptions rd_selected_acc16_step.

Lemma rd_selected_acc16_step_zero_offset : forall M base rows channels stride col r cb zero i vl,
 (forall q,rd_present M q ->0<=q<=18446744073709551615) ->
 rd_inputs M base rows channels stride ->rd_zero_condition M zero rows channels ->
 0<=col ->0<r ->r<=rows ->0<cb<=rd_min252 r ->
 Z.rem(rd_min252 r-cb)7=0 ->rd_mod252(rows-r)=0 ->
 0<=i ->col+vl<=channels+8 ->vl<=rd_zero_size channels ->
 rd_chain16 (rd_acc16 M base stride col (rows-r) (rd_done r cb) i vl)
 (rd_read_lane M(rd_u64(base+col+(rows-r+(rd_min252 r-cb))*stride))i vl)
 (rd_read_lane M(rd_select_ptr cb 1(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+1)*stride))zero)i vl)
 (rd_read_lane M(rd_select_ptr cb 2(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+2)*stride))zero)i vl)
 (rd_read_lane M(rd_select_ptr cb 3(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+3)*stride))zero)i vl)
 (rd_read_lane M(rd_select_ptr cb 4(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+4)*stride))zero)i vl)
 (rd_read_lane M(rd_select_ptr cb 5(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+5)*stride))zero)i vl)
 (rd_read_lane M(rd_select_ptr cb 6(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+6)*stride))zero)i vl)
 i vl =rd_acc16 M base stride col (rows-r) (rd_done r(cb-7)) i vl.
Proof.
 intros M base rows channels stride col r cb zero i vl HA Hin Hz Hcol Hr Hrows Hcb Hstep Hprogress Hi Hspan Hzero.
 pose proof(rd_selected_acc16_step M base rows channels stride col r cb zero 0 i vl
 HA Hin Hz Hcol Hr Hrows Hcb Hstep Hprogress ltac:(lia)Hi ltac:(lia)ltac:(lia))as HS.
 rewrite ?Z.add_0_r in HS;rewrite rd_select_live in HS by lia;exact HS.
Qed.
Print Assumptions rd_selected_acc16_step_zero_offset.
