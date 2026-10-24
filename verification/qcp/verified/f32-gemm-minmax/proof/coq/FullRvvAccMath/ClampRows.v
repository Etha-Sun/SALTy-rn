From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullState ActiveVector RowValues.
From FullRvvAccMath Require Import ClampFacts.
From GemmPanelCell Require Import PanelCell.
From Flocq.IEEE754 Require Import Binary.
Local Open Scope Z_scope.
Local Opaque fma_rne full_acc fp32_min_number fp32_max_number fp32_neon_min fp32_neon_max rvv_merge rvv_nanth.

Lemma row_result_lower_nan : forall A W K row done lo hi vl z0 z1 z2 z3 z4 z5 z6 z7,
 Binary.is_nan 24 128 lo=true ->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) ->
 row_result_values A W K row done lo hi vl z0 z1 z2 z3 z4 z5 z6 z7.
Proof.
 intros A W K row done lo hi vl z0 z1 z2 z3 z4 z5 z6 z7 Hb Hz.
 unfold row_result_values,active8 in *;destruct Hz as (H0&H1&H2&H3&H4&H5&H6&H7).
 unfold active_value in *;repeat split;intro Hlane.
 all: unfold full_cell;rewrite neon_clamp_lower_nan by assumption;auto.
Qed.

Lemma row_result_upper_nan : forall A W K row done lo hi vl z0 z1 z2 z3 z4 z5 z6 z7,
 Binary.is_nan 24 128 hi=true ->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) (canonical_qnan) ->
 row_result_values A W K row done lo hi vl z0 z1 z2 z3 z4 z5 z6 z7.
Proof.
 intros A W K row done lo hi vl z0 z1 z2 z3 z4 z5 z6 z7 Hb Hz.
 unfold row_result_values,active8 in *;destruct Hz as (H0&H1&H2&H3&H4&H5&H6&H7).
 unfold active_value in *;repeat split;intro Hlane.
 all: unfold full_cell;rewrite neon_clamp_upper_nan by assumption;auto.
Qed.

Lemma active_repaired_min_lane : forall vl lane x y m z bound,
 Binary.is_nan 24 128 bound=false ->
 active_value vl lane y (fp32_min_number x bound) ->
 active_mask vl lane m (rvv_nanth x) ->
 active_value vl lane z (rvv_merge y canonical_qnan m) ->
 active_value vl lane z (fp32_neon_min x bound).
Proof.
 unfold active_value,active_mask,bit_same;intros vl lane x y m z bound Hb Hy Hm Hz Hj.
 specialize (Hy Hj);specialize (Hm Hj);specialize (Hz Hj);subst y m z.
 apply rvv_merge_min_correct;assumption.
Qed.

Lemma active8_repaired_min : forall vl bound x0 x1 x2 x3 x4 x5 x6 x7 y0 y1 y2 y3 y4 y5 y6 y7 m0 m1 m2 m3 m4 m5 m6 m7 z0 z1 z2 z3 z4 z5 z6 z7,
 Binary.is_nan 24 128 bound=false ->
 active8 vl y0 y1 y2 y3 y4 y5 y6 y7 (fp32_min_number x0 bound) (fp32_min_number x1 bound) (fp32_min_number x2 bound) (fp32_min_number x3 bound) (fp32_min_number x4 bound) (fp32_min_number x5 bound) (fp32_min_number x6 bound) (fp32_min_number x7 bound) ->
 mask8 vl m0 m1 m2 m3 m4 m5 m6 m7 (rvv_nanth x0) (rvv_nanth x1) (rvv_nanth x2) (rvv_nanth x3) (rvv_nanth x4) (rvv_nanth x5) (rvv_nanth x6) (rvv_nanth x7) ->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (rvv_merge y0 canonical_qnan m0) (rvv_merge y1 canonical_qnan m1) (rvv_merge y2 canonical_qnan m2) (rvv_merge y3 canonical_qnan m3) (rvv_merge y4 canonical_qnan m4) (rvv_merge y5 canonical_qnan m5) (rvv_merge y6 canonical_qnan m6) (rvv_merge y7 canonical_qnan m7) ->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (fp32_neon_min x0 bound) (fp32_neon_min x1 bound) (fp32_neon_min x2 bound) (fp32_neon_min x3 bound) (fp32_neon_min x4 bound) (fp32_neon_min x5 bound) (fp32_neon_min x6 bound) (fp32_neon_min x7 bound).
Proof.
 intros vl bound x0 x1 x2 x3 x4 x5 x6 x7 y0 y1 y2 y3 y4 y5 y6 y7 m0 m1 m2 m3 m4 m5 m6 m7 z0 z1 z2 z3 z4 z5 z6 z7 Hb Hy Hm Hz.
 unfold active8 in Hy;destruct Hy as (Hy0&Hy1&Hy2&Hy3&Hy4&Hy5&Hy6&Hy7).
unfold active8 in Hz;destruct Hz as (Hz0&Hz1&Hz2&Hz3&Hz4&Hz5&Hz6&Hz7).

 unfold mask8 in Hm;destruct Hm as (Hm0&Hm1&Hm2&Hm3&Hm4&Hm5&Hm6&Hm7).
 unfold active8;repeat split.
 - eapply active_repaired_min_lane;[exact Hb|exact Hy0|exact Hm0|exact Hz0].
 - eapply active_repaired_min_lane;[exact Hb|exact Hy1|exact Hm1|exact Hz1].
 - eapply active_repaired_min_lane;[exact Hb|exact Hy2|exact Hm2|exact Hz2].
 - eapply active_repaired_min_lane;[exact Hb|exact Hy3|exact Hm3|exact Hz3].
 - eapply active_repaired_min_lane;[exact Hb|exact Hy4|exact Hm4|exact Hz4].
 - eapply active_repaired_min_lane;[exact Hb|exact Hy5|exact Hm5|exact Hz5].
 - eapply active_repaired_min_lane;[exact Hb|exact Hy6|exact Hm6|exact Hz6].
 - eapply active_repaired_min_lane;[exact Hb|exact Hy7|exact Hm7|exact Hz7].
Qed.

Lemma active_repaired_max_lane : forall vl lane x y m z bound,
 Binary.is_nan 24 128 bound=false ->
 active_value vl lane y (fp32_max_number x bound) ->
 active_mask vl lane m (rvv_nanth x) ->
 active_value vl lane z (rvv_merge y canonical_qnan m) ->
 active_value vl lane z (fp32_neon_max x bound).
Proof.
 unfold active_value,active_mask,bit_same;intros vl lane x y m z bound Hb Hy Hm Hz Hj.
 specialize (Hy Hj);specialize (Hm Hj);specialize (Hz Hj);subst y m z.
 apply rvv_merge_max_correct;assumption.
Qed.

Lemma active8_repaired_max : forall vl bound x0 x1 x2 x3 x4 x5 x6 x7 y0 y1 y2 y3 y4 y5 y6 y7 m0 m1 m2 m3 m4 m5 m6 m7 z0 z1 z2 z3 z4 z5 z6 z7,
 Binary.is_nan 24 128 bound=false ->
 active8 vl y0 y1 y2 y3 y4 y5 y6 y7 (fp32_max_number x0 bound) (fp32_max_number x1 bound) (fp32_max_number x2 bound) (fp32_max_number x3 bound) (fp32_max_number x4 bound) (fp32_max_number x5 bound) (fp32_max_number x6 bound) (fp32_max_number x7 bound) ->
 mask8 vl m0 m1 m2 m3 m4 m5 m6 m7 (rvv_nanth x0) (rvv_nanth x1) (rvv_nanth x2) (rvv_nanth x3) (rvv_nanth x4) (rvv_nanth x5) (rvv_nanth x6) (rvv_nanth x7) ->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (rvv_merge y0 canonical_qnan m0) (rvv_merge y1 canonical_qnan m1) (rvv_merge y2 canonical_qnan m2) (rvv_merge y3 canonical_qnan m3) (rvv_merge y4 canonical_qnan m4) (rvv_merge y5 canonical_qnan m5) (rvv_merge y6 canonical_qnan m6) (rvv_merge y7 canonical_qnan m7) ->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (fp32_neon_max x0 bound) (fp32_neon_max x1 bound) (fp32_neon_max x2 bound) (fp32_neon_max x3 bound) (fp32_neon_max x4 bound) (fp32_neon_max x5 bound) (fp32_neon_max x6 bound) (fp32_neon_max x7 bound).
Proof.
 intros vl bound x0 x1 x2 x3 x4 x5 x6 x7 y0 y1 y2 y3 y4 y5 y6 y7 m0 m1 m2 m3 m4 m5 m6 m7 z0 z1 z2 z3 z4 z5 z6 z7 Hb Hy Hm Hz.
 unfold active8 in Hy;destruct Hy as (Hy0&Hy1&Hy2&Hy3&Hy4&Hy5&Hy6&Hy7).
unfold active8 in Hz;destruct Hz as (Hz0&Hz1&Hz2&Hz3&Hz4&Hz5&Hz6&Hz7).

 unfold mask8 in Hm;destruct Hm as (Hm0&Hm1&Hm2&Hm3&Hm4&Hm5&Hm6&Hm7).
 unfold active8;repeat split.
 - eapply active_repaired_max_lane;[exact Hb|exact Hy0|exact Hm0|exact Hz0].
 - eapply active_repaired_max_lane;[exact Hb|exact Hy1|exact Hm1|exact Hz1].
 - eapply active_repaired_max_lane;[exact Hb|exact Hy2|exact Hm2|exact Hz2].
 - eapply active_repaired_max_lane;[exact Hb|exact Hy3|exact Hm3|exact Hz3].
 - eapply active_repaired_max_lane;[exact Hb|exact Hy4|exact Hm4|exact Hz4].
 - eapply active_repaired_max_lane;[exact Hb|exact Hy5|exact Hm5|exact Hz5].
 - eapply active_repaired_max_lane;[exact Hb|exact Hy6|exact Hm6|exact Hz6].
 - eapply active_repaired_max_lane;[exact Hb|exact Hy7|exact Hm7|exact Hz7].
Qed.

Lemma row_clamp_lane : forall A W K row done lo hi vl lane x mid out,
 0<=done -> done mod 8=0 -> 0<=lane<8 ->
 active_value vl lane x (full_acc A W K row (done÷8) lane K) ->
 active_value vl lane mid (fp32_neon_min x hi) ->
 active_value vl lane out (fp32_neon_max mid lo) ->
 active_value vl lane out (full_cell A W K row (done+lane) lo hi).
Proof.
 intros A W K row done lo hi vl lane x mid out Hd Hmod Hj Hx Hmid Hout.
 assert(Hq:done÷8=done/8)by(apply Z.quot_div_nonneg;lia).
 unfold active_value,bit_same in *;intro Hlane.
 specialize(Hx Hlane);specialize(Hmid Hlane);specialize(Hout Hlane);subst x mid out.
 rewrite full_cell_at_aligned_offset by assumption.
 rewrite <-Hq;reflexivity.
Qed.

Lemma row_result_from_clamp_stages : forall A W K row done lo hi vl x0 x1 x2 x3 x4 x5 x6 x7 mid0 mid1 mid2 mid3 mid4 mid5 mid6 mid7 out0 out1 out2 out3 out4 out5 out6 out7,
 0<=done -> done mod 8=0 ->
 row_acc_values A W K row (done÷8) K vl x0 x1 x2 x3 x4 x5 x6 x7 ->
 active8 vl mid0 mid1 mid2 mid3 mid4 mid5 mid6 mid7 (fp32_neon_min x0 hi) (fp32_neon_min x1 hi) (fp32_neon_min x2 hi) (fp32_neon_min x3 hi) (fp32_neon_min x4 hi) (fp32_neon_min x5 hi) (fp32_neon_min x6 hi) (fp32_neon_min x7 hi) ->
 active8 vl out0 out1 out2 out3 out4 out5 out6 out7 (fp32_neon_max mid0 lo) (fp32_neon_max mid1 lo) (fp32_neon_max mid2 lo) (fp32_neon_max mid3 lo) (fp32_neon_max mid4 lo) (fp32_neon_max mid5 lo) (fp32_neon_max mid6 lo) (fp32_neon_max mid7 lo) ->
 row_result_values A W K row done lo hi vl out0 out1 out2 out3 out4 out5 out6 out7.
Proof.
 intros A W K row done lo hi vl x0 x1 x2 x3 x4 x5 x6 x7 mid0 mid1 mid2 mid3 mid4 mid5 mid6 mid7 out0 out1 out2 out3 out4 out5 out6 out7 Hd Hmod Hx Hmid Hout.
 unfold row_acc_values in Hx;unfold active8 in Hx;destruct Hx as (Hx0&Hx1&Hx2&Hx3&Hx4&Hx5&Hx6&Hx7).
unfold active8 in Hmid;destruct Hmid as (Hmid0&Hmid1&Hmid2&Hmid3&Hmid4&Hmid5&Hmid6&Hmid7).
unfold active8 in Hout;destruct Hout as (Hout0&Hout1&Hout2&Hout3&Hout4&Hout5&Hout6&Hout7).

 unfold row_result_values,active8;repeat split.
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx0|exact Hmid0|exact Hout0].
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx1|exact Hmid1|exact Hout1].
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx2|exact Hmid2|exact Hout2].
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx3|exact Hmid3|exact Hout3].
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx4|exact Hmid4|exact Hout4].
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx5|exact Hmid5|exact Hout5].
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx6|exact Hmid6|exact Hout6].
 - eapply row_clamp_lane;[exact Hd|exact Hmod|lia|exact Hx7|exact Hmid7|exact Hout7].
Qed.
Print Assumptions row_result_lower_nan.
Print Assumptions row_result_upper_nan.
Print Assumptions active_repaired_min_lane.
Print Assumptions active8_repaired_min.
Print Assumptions active_repaired_max_lane.
Print Assumptions active8_repaired_max.
Print Assumptions row_clamp_lane.
Print Assumptions row_result_from_clamp_stages.
