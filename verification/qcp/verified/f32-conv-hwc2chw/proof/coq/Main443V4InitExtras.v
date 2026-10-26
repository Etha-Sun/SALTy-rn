From HwcConv Require Export Main443InitNormalize Main443OutputCursorFacts.
From Coq Require Import ZArith Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hcm_output_width_positive:forall N,0<N->0<(N+1)/2.
Proof. intros;apply Z.div_str_pos;lia. Qed.
Ltac hmi_v4_mod_output:=first[solve[hmi_output_solve]|
 solve[unfold hc_output_address,hc_store_channel,hc_store_row in *;
 repeat first[rewrite Z.min_l in * by lia|rewrite Z.min_r in * by lia];hmi_output_solve]|
 solve[multimatch goal with HP:(?p = hc_addr64 ?e)|-(?p = hc_addr64 ?f)=>
 rewrite HP;apply(f_equal hc_addr64);unfold hc_output_address,hc_store_channel,hc_store_row;
 repeat first[rewrite Z.min_l by lia|rewrite Z.min_r by lia];ring end]].
Ltac hmi_v4_output:=
 multimatch goal with
 | Hown:hc_output_owned ?W ?output ?hs ?cs ?C ?start ?finish ?ow,
 HL:hc_output_layout ?output ?hs ?cs ?H ?N ?C ?finish |-
 ?p=(?output+?cs*hc_store_channel ?C ?c ?lane+?hs*hc_store_row ?finish ?y ?dy)=>
 let E:=fresh "Hcursoractive"in
 assert(E:hc_addr64(output+cs*hc_store_channel C c lane+hs*hc_store_row finish y dy)=
 output+cs*hc_store_channel C c lane+hs*hc_store_row finish y dy)by
 (let HLayout:=fresh "HLayout"in pose proof HL as HLayout;
 unfold hc_output_layout in HLayout;
 repeat match type of HLayout with _ /\ _=>let HA:=fresh "Hlayout"in destruct HLayout as[HA HLayout]end;
 let HW:=fresh "Howpositive"in assert(HW:0<ow)by(apply hcm_output_width_positive;lia);
 replace(output+cs*hc_store_channel C c lane+hs*hc_store_row finish y dy)
 with(hc_output_address output hs cs(hc_store_channel C c lane)(hc_store_row finish y dy)0)by(unfold hc_output_address;ring);
 let HX:=fresh "Hwindow"in pose proof(hcm_clipped_output_window W output hs cs C start finish ow y c lane dy 0 1 Hown
 ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(first[assumption|lia])ltac:(first[assumption|lia]))as HX;
 exact(proj1(proj2 HX)));
 transitivity(hc_addr64(output+cs*hc_store_channel C c lane+hs*hc_store_row finish y dy));[hmi_v4_mod_output|exact E]
 end.
Print Assumptions hcm_output_width_positive.
