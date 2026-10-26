From HwcConv Require Export Main443AdvancedPureTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hcp_window_mod_fast :=
 multimatch goal with
 | Hown:hc_output_owned ?W ?output ?hs ?cs ?C ?start ?finish ?ow |-
   context[hc_write_window ?W (hc_addr64
   (?output+?cs*hc_store_channel ?C ?c ?lane+?hs*hc_store_row ?finish ?y ?dy+4*?x)) ?n] =>
  let Hwindow:=fresh "Hwindow"in
  assert(Hwindow:hc_write_window W(hc_addr64(hc_output_address output hs cs
   (hc_store_channel C c lane)(hc_store_row finish y dy)x))n)by
   (apply(proj2(proj2(hcm_clipped_output_window W output hs cs C start finish ow y c lane dy x n
    Hown ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
    ltac:(lia)ltac:(lia)ltac:(lia)ltac:(first[assumption|lia])ltac:(first[assumption|lia])))));
  unfold hc_output_address in Hwindow;
  replace(hc_store_channel C c lane*cs)with(cs*hc_store_channel C c lane)in Hwindow by ring;
  replace(hc_store_row finish y dy*hs)with(hs*hc_store_row finish y dy)in Hwindow by ring
 end.
Ltac hcp_window_raw_fast :=
 multimatch goal with
 | Hown:hc_output_owned ?W ?output ?hs ?cs ?C ?start ?finish ?ow |-
   context[hc_write_window ?W
   (?output+?cs*hc_store_channel ?C ?c ?lane+?hs*hc_store_row ?finish ?y ?dy+4*?x) ?n] =>
  let HA:=fresh "Hactive"in
  pose proof(hcm_clipped_output_window W output hs cs C start finish ow y c lane dy x n
    Hown ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)
    ltac:(lia)ltac:(lia)ltac:(lia)ltac:(first[assumption|lia])ltac:(first[assumption|lia]))as HA;
  let HRange:=fresh "Hrange"in let HE:=fresh "Hwordactive"in let HW:=fresh "Hwindow"in
  destruct HA as[HRange[HE HW]];rewrite HE in HW;
  unfold hc_output_address in HW;
  replace(hc_store_channel C c lane*cs)with(cs*hc_store_channel C c lane)in HW by ring;
  replace(hc_store_row finish y dy*hs)with(hs*hc_store_row finish y dy)in HW by ring
 end.
Ltac hcp_window_fast := first[hcp_window_raw_fast|hcp_window_mod_fast].
Ltac hcp_window_pure_fast :=
 lazymatch goal with|-_ \/ _=>right|_=>idtac end;
 intros;hcm_constants;subst;hcm_domain;hcp_columns;
 try hcp_window_fast;
 entailer!;try lia.
