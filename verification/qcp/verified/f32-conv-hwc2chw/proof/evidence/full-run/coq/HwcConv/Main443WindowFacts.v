(* Private mathematical bridge. Public C, domain and ownership are unchanged. *)
From Coq Require Import ZArith List Lia Ring.
From HwcConv Require Import RvvKernelModel.
Local Open Scope Z_scope.

Lemma hcm_store_channel_bounds : forall channels c lane,
  0 <= c < channels -> 0 <= lane < 4 ->
  0 <= hc_store_channel channels c lane < channels.
Proof.
  intros channels c lane HC HL.
  unfold hc_store_channel.
  assert (Hnonneg : 0 <= Z.min lane (channels-c-1)).
  { apply Z.min_glb; lia. }
  pose proof (Z.le_min_r lane (channels-c-1)); lia.
Qed.

Lemma hcm_store_row_bounds : forall start finish y dy,
  0 <= start -> start <= y < finish -> 0 <= dy <= 1 ->
  start <= hc_store_row finish y dy < finish.
Proof.
  intros start finish y dy HS HY HD.
  unfold hc_store_row.
  assert (Hlower : start <= Z.min (y+dy) (finish-1)).
  { apply Z.min_glb; lia. }
  pose proof (Z.le_min_r (y+dy) (finish-1)); lia.
Qed.

Lemma hcm_output_address_range : forall output hs cs channels finish ow c y x,
  0 < output -> 0 < ow -> 0 < finish ->
  4*ow <= hs -> finish*hs <= cs ->
  output+(channels-1)*cs+(finish-1)*hs+4*ow <= hc_u64_limit ->
  0 <= c < channels -> 0 <= y < finish -> 0 <= x < ow ->
  0 < hc_output_address output hs cs c y x < hc_u64_limit.
Proof.
  intros output hs cs channels finish ow c y x HO HW HF HH HC HB Hc Hy Hx.
  assert (Hhs : 0 < hs) by lia.
  assert (Hcs : 0 < cs) by nia.
  assert (Hchannel : c*cs <= (channels-1)*cs) by nia.
  assert (Hrow : y*hs <= (finish-1)*hs) by nia.
  unfold hc_output_address; nia.
Qed.

Lemma hcm_clipped_output_window : forall W output hs cs channels start finish ow
  y c lane dy x n,
  hc_output_owned W output hs cs channels start finish ow ->
  0 <= start -> start <= y < finish -> 0 <= c < channels ->
  0 <= lane < 4 -> 0 <= dy <= 1 ->
  0 <= x -> 0 < n -> x+n <= ow -> 0 < output -> 0 < ow ->
  4*ow <= hs -> finish*hs <= cs ->
  output+(channels-1)*cs+(finish-1)*hs+4*ow <= hc_u64_limit ->
  let a := hc_output_address output hs cs
    (hc_store_channel channels c lane) (hc_store_row finish y dy) x in
  (0 < a < hc_u64_limit) /\ hc_addr64 a = a /\
  hc_write_window W (hc_addr64 a) n.
Proof.
  intros W output hs cs channels start finish ow y c lane dy x n
    Howned HS HY HC HL HD HX HN HXN HO HOW HHS HCS Hlimit.
  cbn zeta.
  set (sc := hc_store_channel channels c lane).
  set (sr := hc_store_row finish y dy).
  assert (Hsc : 0 <= sc < channels).
  { unfold sc; apply hcm_store_channel_bounds; assumption. }
  assert (Hsr : start <= sr < finish).
  { unfold sr; apply hcm_store_row_bounds; assumption. }
  set (a := hc_output_address output hs cs sc sr x).
  assert (Ha : 0 < a < hc_u64_limit).
  { unfold a; apply (hcm_output_address_range output hs cs channels finish ow sc sr x); try assumption; lia. }
  assert (Haddr : hc_addr64 a = a).
  { unfold hc_addr64; apply Z.mod_small; unfold hc_u64_limit in Ha; lia. }
  split; [exact Ha|]. split; [exact Haddr|].
  rewrite Haddr; unfold hc_write_window.
  split; [lia|]. split; [lia|].
  intros j HJ.
  replace (a+4*j) with (hc_output_address output hs cs sc sr (x+j))
    by (unfold a, hc_output_address; ring).
  destruct Howned as [_ Howned]; apply Howned; lia.
Qed.

Module SecondMain443WindowFacts.
Definition channel_exact : forall channels c lane,
  0 <= c < channels -> 0 <= lane < 4 ->
  0 <= hc_store_channel channels c lane < channels := hcm_store_channel_bounds.
Definition row_exact : forall start finish y dy,
  0 <= start -> start <= y < finish -> 0 <= dy <= 1 ->
  start <= hc_store_row finish y dy < finish := hcm_store_row_bounds.
Definition address_exact : forall output hs cs channels finish ow c y x,
  0 < output -> 0 < ow -> 0 < finish ->
  4*ow <= hs -> finish*hs <= cs ->
  output+(channels-1)*cs+(finish-1)*hs+4*ow <= hc_u64_limit ->
  0 <= c < channels -> 0 <= y < finish -> 0 <= x < ow ->
  0 < hc_output_address output hs cs c y x < hc_u64_limit :=
  hcm_output_address_range.
Definition window_exact : forall W output hs cs channels start finish ow
  y c lane dy x n,
  hc_output_owned W output hs cs channels start finish ow ->
  0 <= start -> start <= y < finish -> 0 <= c < channels ->
  0 <= lane < 4 -> 0 <= dy <= 1 ->
  0 <= x -> 0 < n -> x+n <= ow -> 0 < output -> 0 < ow ->
  4*ow <= hs -> finish*hs <= cs ->
  output+(channels-1)*cs+(finish-1)*hs+4*ow <= hc_u64_limit ->
  let a := hc_output_address output hs cs
    (hc_store_channel channels c lane) (hc_store_row finish y dy) x in
  (0 < a < hc_u64_limit) /\ hc_addr64 a = a /\
  hc_write_window W (hc_addr64 a) n := hcm_clipped_output_window.
End SecondMain443WindowFacts.

Print Assumptions hcm_store_channel_bounds.
Print Assumptions hcm_store_row_bounds.
Print Assumptions hcm_output_address_range.
Print Assumptions hcm_clipped_output_window.
Print Assumptions SecondMain443WindowFacts.channel_exact.
Print Assumptions SecondMain443WindowFacts.row_exact.
Print Assumptions SecondMain443WindowFacts.address_exact.
Print Assumptions SecondMain443WindowFacts.window_exact.
