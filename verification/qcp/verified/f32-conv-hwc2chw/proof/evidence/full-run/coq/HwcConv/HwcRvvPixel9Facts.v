From Coq Require Import ZArith Lia List.
From HwcConv Require Export HwcRvvPixel9Model.
Import ListNotations. Local Open Scope Z_scope.
Lemma hc_pixel9_row_shift : forall a F p0 p1 p2 w width x dx ci lane i,
 hc_rvv_row_group_value a F p0 p1 p2 w width x dx ci lane i =
 hc_rvv_row_group_value a F p0 p1 p2 w width (x+i) dx ci lane 0.
Proof. intros;unfold hc_rvv_row_group_value;rewrite Z.add_0_r;reflexivity. Qed.
Local Opaque hc_rvv_row_group_value dw_rvv_fma.
Lemma hc_pixel9_prefix0 : forall A F p0 p1 p2 w width x lane vl,
 hc_rvv_splat A (hc_rvv_pixel9_bias F w lane)vl ->
 hc_rvv_pixel9_prefix A F p0 p1 p2 w width x lane 0 vl.
Proof.
 intros A F p0 p1 p2 w width x lane vl HS;unfold hc_rvv_pixel9_prefix.
 intros i HI;change(hc_vget A i=hc_rvv_pixel9_bias F w lane);exact(HS i HI).
Qed.
Lemma hc_pixel9_fold_next : forall F p0 p1 p2 w width x lane k dx ci i,
 0<=k<9 -> nth_error hc_rvv_pixel9_groups(Z.to_nat k)=Some(dx,ci) ->
 hc_rvv_pixel9_fold F p0 p1 p2 w width x lane(k+1)i =
 hc_rvv_row_group_value (hc_rvv_pixel9_fold F p0 p1 p2 w width x lane k i)
 F p0 p1 p2 w width x dx ci lane i.
Proof.
 intros F p0 p1 p2 w width x lane k dx ci i HK Hnth.
 assert(Hcases:k=0\/k=1\/k=2\/k=3\/k=4\/k=5\/k=6\/k=7\/k=8)by lia.
 decompose[or]Hcases;clear Hcases;subst k;
 cbn[hc_rvv_pixel9_groups Z.to_nat Pos.to_nat nth_error]in Hnth;
 inversion Hnth;subst dx ci;
 cbn[hc_rvv_pixel9_fold hc_rvv_pixel9_groups Z.to_nat Pos.to_nat firstn fold_left fst snd];reflexivity.
Qed.
Lemma hc_pixel9_prefix_next : forall R A F p0 p1 p2 w width x lane k dx ci vl,
 0<=k<9 -> nth_error hc_rvv_pixel9_groups(Z.to_nat k)=Some(dx,ci) ->
 hc_rvv_pixel9_prefix A F p0 p1 p2 w width x lane k vl ->
 hc_rvv_rows_group R A F p0 p1 p2 w width x dx ci lane vl ->
 hc_rvv_pixel9_prefix R F p0 p1 p2 w width x lane(k+1)vl.
Proof.
 intros R A F p0 p1 p2 w width x lane k dx ci vl HK Hnth HA HG.
 unfold hc_rvv_pixel9_prefix;intros i HI.
 rewrite(hc_pixel9_fold_next F p0 p1 p2 w width x lane k dx ci i HK Hnth).
 rewrite<-(HA i HI);exact(HG i HI).
Qed.
Lemma hc_pixel9_bias_present : forall F w lane,
 hc_window F w 112 -> 0<=lane<4 -> hc_present F(w+lane*4).
Proof.
 intros F w lane HW HL;replace(w+lane*4)with(w+4*lane)by ring.
 apply HW;lia.
Qed.
Print Assumptions hc_pixel9_row_shift.
Print Assumptions hc_pixel9_prefix0.
Print Assumptions hc_pixel9_fold_next.
Print Assumptions hc_pixel9_prefix_next.
Print Assumptions hc_pixel9_bias_present.
