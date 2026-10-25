From Coq Require Import ZArith Lia List.
From Qs8Gemm Require Import Model OutputFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma qs8_completed_tile : forall K d vl A Ps magic off lo hi r0 r1 r2 r3 r4 r5 r6 r7,
 0<=d -> d mod 8=0 -> 1<=vl<=8 ->
 qs8_active_z vl 0 r0 (qs8_quant(qs8_acc K (d/8) 0 A Ps)(qs8_scale(d/8)0 Ps)magic off lo hi) ->
 qs8_active_z vl 1 r1 (qs8_quant(qs8_acc K (d/8) 1 A Ps)(qs8_scale(d/8)1 Ps)magic off lo hi) ->
 qs8_active_z vl 2 r2 (qs8_quant(qs8_acc K (d/8) 2 A Ps)(qs8_scale(d/8)2 Ps)magic off lo hi) ->
 qs8_active_z vl 3 r3 (qs8_quant(qs8_acc K (d/8) 3 A Ps)(qs8_scale(d/8)3 Ps)magic off lo hi) ->
 qs8_active_z vl 4 r4 (qs8_quant(qs8_acc K (d/8) 4 A Ps)(qs8_scale(d/8)4 Ps)magic off lo hi) ->
 qs8_active_z vl 5 r5 (qs8_quant(qs8_acc K (d/8) 5 A Ps)(qs8_scale(d/8)5 Ps)magic off lo hi) ->
 qs8_active_z vl 6 r6 (qs8_quant(qs8_acc K (d/8) 6 A Ps)(qs8_scale(d/8)6 Ps)magic off lo hi) ->
 qs8_active_z vl 7 r7 (qs8_quant(qs8_acc K (d/8) 7 A Ps)(qs8_scale(d/8)7 Ps)magic off lo hi) ->
 completed_values K (d+vl) A Ps magic off lo hi =
 qs8_append(completed_values K d A Ps magic off lo hi)(qs8_take vl [r0;r1;r2;r3;r4;r5;r6;r7]).
Proof.
 intros K d vl A Ps magic off lo hi r0 r1 r2 r3 r4 r5 r6 r7 Hd Hmod Hvl H0 H1 H2 H3 H4 H5 H6 H7.
 assert(Hcases:vl=1 \/ vl=2 \/ vl=3 \/ vl=4 \/ vl=5 \/ vl=6 \/ vl=7 \/ vl=8) by lia.
 destruct Hcases as [Hcases|[Hcases|[Hcases|[Hcases|[Hcases|[Hcases|[Hcases|Hcases]]]]]]];subst vl.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   rewrite qs8_completed_succ by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   specialize(H1 ltac:(lia));subst r1.
   replace(d+2) with ((d+1)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+1)) by lia.
   rewrite qs8_completed_succ by lia.
   rewrite (qs8_final_tile K d 1) by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   specialize(H1 ltac:(lia));subst r1.
   specialize(H2 ltac:(lia));subst r2.
   replace(d+3) with ((d+2)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+2)) by lia.
   replace(d+2) with ((d+1)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+1)) by lia.
   rewrite qs8_completed_succ by lia.
   rewrite (qs8_final_tile K d 1) by lia.
   rewrite (qs8_final_tile K d 2) by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   specialize(H1 ltac:(lia));subst r1.
   specialize(H2 ltac:(lia));subst r2.
   specialize(H3 ltac:(lia));subst r3.
   replace(d+4) with ((d+3)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+3)) by lia.
   replace(d+3) with ((d+2)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+2)) by lia.
   replace(d+2) with ((d+1)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+1)) by lia.
   rewrite qs8_completed_succ by lia.
   rewrite (qs8_final_tile K d 1) by lia.
   rewrite (qs8_final_tile K d 2) by lia.
   rewrite (qs8_final_tile K d 3) by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   specialize(H1 ltac:(lia));subst r1.
   specialize(H2 ltac:(lia));subst r2.
   specialize(H3 ltac:(lia));subst r3.
   specialize(H4 ltac:(lia));subst r4.
   replace(d+5) with ((d+4)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+4)) by lia.
   replace(d+4) with ((d+3)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+3)) by lia.
   replace(d+3) with ((d+2)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+2)) by lia.
   replace(d+2) with ((d+1)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+1)) by lia.
   rewrite qs8_completed_succ by lia.
   rewrite (qs8_final_tile K d 1) by lia.
   rewrite (qs8_final_tile K d 2) by lia.
   rewrite (qs8_final_tile K d 3) by lia.
   rewrite (qs8_final_tile K d 4) by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   specialize(H1 ltac:(lia));subst r1.
   specialize(H2 ltac:(lia));subst r2.
   specialize(H3 ltac:(lia));subst r3.
   specialize(H4 ltac:(lia));subst r4.
   specialize(H5 ltac:(lia));subst r5.
   replace(d+6) with ((d+5)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+5)) by lia.
   replace(d+5) with ((d+4)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+4)) by lia.
   replace(d+4) with ((d+3)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+3)) by lia.
   replace(d+3) with ((d+2)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+2)) by lia.
   replace(d+2) with ((d+1)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+1)) by lia.
   rewrite qs8_completed_succ by lia.
   rewrite (qs8_final_tile K d 1) by lia.
   rewrite (qs8_final_tile K d 2) by lia.
   rewrite (qs8_final_tile K d 3) by lia.
   rewrite (qs8_final_tile K d 4) by lia.
   rewrite (qs8_final_tile K d 5) by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   specialize(H1 ltac:(lia));subst r1.
   specialize(H2 ltac:(lia));subst r2.
   specialize(H3 ltac:(lia));subst r3.
   specialize(H4 ltac:(lia));subst r4.
   specialize(H5 ltac:(lia));subst r5.
   specialize(H6 ltac:(lia));subst r6.
   replace(d+7) with ((d+6)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+6)) by lia.
   replace(d+6) with ((d+5)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+5)) by lia.
   replace(d+5) with ((d+4)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+4)) by lia.
   replace(d+4) with ((d+3)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+3)) by lia.
   replace(d+3) with ((d+2)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+2)) by lia.
   replace(d+2) with ((d+1)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+1)) by lia.
   rewrite qs8_completed_succ by lia.
   rewrite (qs8_final_tile K d 1) by lia.
   rewrite (qs8_final_tile K d 2) by lia.
   rewrite (qs8_final_tile K d 3) by lia.
   rewrite (qs8_final_tile K d 4) by lia.
   rewrite (qs8_final_tile K d 5) by lia.
   rewrite (qs8_final_tile K d 6) by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
 - unfold qs8_append,qs8_take;cbn [Z.to_nat firstn].
   specialize(H0 ltac:(lia));subst r0.
   specialize(H1 ltac:(lia));subst r1.
   specialize(H2 ltac:(lia));subst r2.
   specialize(H3 ltac:(lia));subst r3.
   specialize(H4 ltac:(lia));subst r4.
   specialize(H5 ltac:(lia));subst r5.
   specialize(H6 ltac:(lia));subst r6.
   specialize(H7 ltac:(lia));subst r7.
   replace(d+8) with ((d+7)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+7)) by lia.
   replace(d+7) with ((d+6)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+6)) by lia.
   replace(d+6) with ((d+5)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+5)) by lia.
   replace(d+5) with ((d+4)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+4)) by lia.
   replace(d+4) with ((d+3)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+3)) by lia.
   replace(d+3) with ((d+2)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+2)) by lia.
   replace(d+2) with ((d+1)+1) at 1 by lia;rewrite (qs8_completed_succ K (d+1)) by lia.
   rewrite qs8_completed_succ by lia.
   rewrite (qs8_final_tile K d 1) by lia.
   rewrite (qs8_final_tile K d 2) by lia.
   rewrite (qs8_final_tile K d 3) by lia.
   rewrite (qs8_final_tile K d 4) by lia.
   rewrite (qs8_final_tile K d 5) by lia.
   rewrite (qs8_final_tile K d 6) by lia.
   rewrite (qs8_final_tile K d 7) by lia.
   pose proof(qs8_final_tile K d 0 A Ps magic off lo hi Hd Hmod ltac:(lia)) as Hfirst.
   rewrite Z.add_0_r in Hfirst;rewrite Hfirst.
   rewrite <-?app_assoc;reflexivity.
Qed.
Print Assumptions qs8_completed_tile.
