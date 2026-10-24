From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export LaneStep.
Local Open Scope Z_scope.
Definition rd_plain_chain16(a x0 x1 x2 x3 x4 x5 x6:Z):Z := rd_wadd16(rd_wadd16(rd_wadd16(rd_wadd16(rd_wadd16(rd_wadd16(rd_wadd16(a)x0)x1)x2)x3)x4)x5)x6.
Lemma rd_plain_chain16_active : forall a x0 x1 x2 x3 x4 x5 x6 i vl,i<vl ->
 rd_plain_chain16 a x0 x1 x2 x3 x4 x5 x6 =rd_chain16 a x0 x1 x2 x3 x4 x5 x6 i vl.
Proof. intros;unfold rd_plain_chain16,rd_chain16,rd_active_wadd16;rewrite(proj2(Z.ltb_lt i vl)H);reflexivity. Qed.
Lemma rd_selected_plain16_step : forall M base rows channels stride col r cb zero off i,
 (forall q,rd_present M q ->0<=q<=18446744073709551615) ->
 rd_inputs M base rows channels stride ->rd_zero_condition M zero rows channels ->
 0<=col ->0<r ->r<=rows ->0<cb<=rd_min252 r ->
 Z.rem(rd_min252 r-cb)7=0 ->rd_mod252(rows-r)=0 ->
 0<=off ->0<=i<8 ->col+off+8<=channels+8 ->off+8<=rd_zero_size channels ->
 rd_plain_chain16(rd_acc16 M base stride(col+off)(rows-r)(rd_done r cb)i 8)
 (rd_read_lane M((rd_u64(base+col+(rows-r+(rd_min252 r-cb))*stride))+off)i 8)
 (rd_read_lane M((rd_select_ptr cb 1(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+1)*stride))zero)+off)i 8)
 (rd_read_lane M((rd_select_ptr cb 2(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+2)*stride))zero)+off)i 8)
 (rd_read_lane M((rd_select_ptr cb 3(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+3)*stride))zero)+off)i 8)
 (rd_read_lane M((rd_select_ptr cb 4(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+4)*stride))zero)+off)i 8)
 (rd_read_lane M((rd_select_ptr cb 5(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+5)*stride))zero)+off)i 8)
 (rd_read_lane M((rd_select_ptr cb 6(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+6)*stride))zero)+off)i 8)
 =rd_acc16 M base stride(col+off)(rows-r)(rd_done r(cb-7))i 8.
Proof.
 intros M base rows channels stride col r cb zero off i HA Hin Hz Hcol Hr Hrows Hcb Hstep Hprogress Hoff Hi Hspan Hzero.
 rewrite(rd_plain_chain16_active _ _ _ _ _ _ _ _ i 8)by lia.
 pose proof(rd_selected_acc16_step M base rows channels stride col r cb zero off i 8
 HA Hin Hz Hcol Hr Hrows Hcb Hstep Hprogress Hoff ltac:(lia)Hspan Hzero)as HS.
 rewrite ?Z.add_0_r in HS;rewrite rd_select_live in HS by lia;exact HS.
Qed.
Print Assumptions rd_plain_chain16_active.
Print Assumptions rd_selected_plain16_step.

Lemma rd_read_lane_low8 : forall Map p i,0<=i<8 ->
 rd_read_lane Map p i 16=rd_read_lane Map p i 8.
Proof.
 intros Map p i Hi;unfold rd_read_lane.
 assert(H16:Z.ltb i 16=true)by(apply Z.ltb_lt;lia).
 assert(H8:Z.ltb i 8=true)by(apply Z.ltb_lt;lia).
 rewrite H16,H8;reflexivity.
Qed.
Print Assumptions rd_read_lane_low8.
