From HwcConv Require Export Main443InitNormalize Main443ProgressFacts.
From Coq Require Import ZArith Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hcm_weight_block_resource:forall F input zero weights params H N top start finish C c,
 hc_input_domain F input zero weights params H N top start finish C->0<c<=C->(C-c)mod 4=0->
 let q:=(C-c)/4 in
 hc_footprint(weights+448*q)112 /\hc_window F(weights+448*q)112.
Proof.
 intros F input zero weights params H N top start finish C c HD HC HM q.
 pose proof HD as HX;unfold hc_input_domain in HX;
 destruct HX as[HH[HN[HCC[HT[HY[HE[HF[HZ[HW[HP[WI[WZ[WW WP]]]]]]]]]]]]].
 assert(Hq:0<=q)by(unfold q;apply Z.div_pos;lia).
 assert(Hdq:C-c=4*q)by(pose proof(Z.div_mod(C-c)4 ltac:(lia));unfold q;lia).
 assert(Hmax:q+1<=(C+3)/4)by(apply Z.div_le_lower_bound;lia).
 split.
 - unfold hc_footprint,hc_u64_limit in HW|-*;destruct HW as[Hw[Hcnt HB]];repeat split;nia.
 - replace(weights+448*q)with(weights+4*(112*q))by ring;
   eapply hmi_window_slice;[exact WW|lia|lia|nia].
Qed.
Ltac hcm_channel_context:=
 multimatch goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C,
 HR:hc_outer_input ?input ?zero ?H ?N ?top ?y ?i0 ?i1 ?i2 ?i3 ?i4|-_=>
 idtac "CONTEXT_ROWS";let HB:=fresh "Hloop"in pose proof(hmi_loop_bounds F input zero weights params H N top start finish C y HD ltac:(lia))as HB;
 repeat match type of HB with _ /\ _=>let HA:=fresh "Hloop"in destruct HB as[HA HB]end;
 let HF0:=fresh "HF0"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+0)HD)as HF0;destruct HF0;
 let HF1:=fresh "HF1"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+1)HD)as HF1;destruct HF1;
 let HF2:=fresh "HF2"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+2)HD)as HF2;destruct HF2;
 let HF3:=fresh "HF3"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+3)HD)as HF3;destruct HF3;
 let HF4:=fresh "HF4"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+4)HD)as HF4;destruct HF4;
 unfold hc_outer_input in HR;destruct HR as[? [? [? [? ?]]]]
 end;
 repeat progress(rewrite Z.rem_mod_nonneg in * by lia);
 multimatch goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C,HC:(0 <= ?c),HC1:(?c <> 0),HCL:(?c <= ?C),HM:((?C - ?c) mod 4 = 0)|-_=>
 idtac "CONTEXT_WEIGHT";let HF:=fresh "Hweight"in pose proof(hcm_weight_block_resource F input zero weights params H N top start finish C c HD ltac:(lia)HM)as HF;destruct HF
 end;
 multimatch goal with HP:hc_channel_pending ?o ?hs ?cs ?C ?finish ?y ?ch ?p0 ?p1 ?p2 ?p3 ?q0 ?q1 ?q2 ?q3|-_=>
 idtac "CONTEXT_OUTPUT";let HOut:=fresh "Hout"in pose proof(HP ltac:(lia))as HOut;destruct HOut as[? [? [? [? ?]]]]end;
 repeat progress(rewrite Z.quot_div_nonneg in * by lia);hmi_word_context;hmi_zero.
