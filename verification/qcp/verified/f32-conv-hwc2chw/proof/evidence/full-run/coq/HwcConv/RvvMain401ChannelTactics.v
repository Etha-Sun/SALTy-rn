From HwcConv Require Export RvvMain401GeometryTactics.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hr401_channel_context:=
 repeat progress(rewrite Z.quot_div_nonneg in * by lia);
 multimatch goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C,
 HO:hc_outer_input ?input ?zero ?H ?N ?top ?y ?i0 ?i1 ?i2 ?i3 ?i4,
 HP:hc_channel_pending ?output ?hs ?cs ?C ?finish ?y (?C-?c) ?p0 ?p1 ?p2 ?p3 ?q0 ?q1 ?q2 ?q3|-_=>
 let Hc:=fresh "Hcactive"in assert(Hc:0<c<=C)by lia;
 let HB:=fresh "Hblock"in pose proof(hr401_weight_block_resource F input zero weights params H N top start finish C c HD Hc)as HB;
 let HBF:=fresh "Hblockfoot"in let HBW:=fresh "Hblockwindow"in destruct HB as[HBF HBW];
 let HE:=fresh "Hblockaddr"in pose proof(hr401_footprint_addr (weights+448*((C-c)/4))112 HBF ltac:(lia))as HE;
 try multimatch goal with HWL:?wl=hc_addr64(?weights+448*((?C-?c)/4))|-_=>
 rewrite HE in HWL;rewrite<-HWL in HBF,HBW end;
 let HR:=fresh "Houtercopy"in pose proof HO as HR;
 let E0:=fresh "Er0"in let E1:=fresh "Er1"in let E2:=fresh "Er2"in let E3:=fresh "Er3"in let E4:=fresh "Er4"in
 unfold hc_outer_input in HR;destruct HR as[E0[E1[E2[E3 E4]]]];
 let HF0:=fresh "HF0"in let HW0:=fresh "HW0"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top)HD)as[HF0 HW0];rewrite<-E0 in HF0,HW0;
 let HF1:=fresh "HF1"in let HW1:=fresh "HW1"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+1)HD)as[HF1 HW1];rewrite<-E1 in HF1,HW1;
 let HF2:=fresh "HF2"in let HW2:=fresh "HW2"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+2)HD)as[HF2 HW2];rewrite<-E2 in HF2,HW2;
 let HF3:=fresh "HF3"in let HW3:=fresh "HW3"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+3)HD)as[HF3 HW3];rewrite<-E3 in HF3,HW3;
 let HF4:=fresh "HF4"in let HW4:=fresh "HW4"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+4)HD)as[HF4 HW4];rewrite<-E4 in HF4,HW4;
 let HPP:=fresh "Hpendingcopy"in pose proof(HP ltac:(lia))as HPP;
 let P0:=fresh "Hp0"in let Q0:=fresh "Hq0"in let P1:=fresh "Hp1"in let P2:=fresh "Hp2"in let P3:=fresh "Hp3"in
 destruct HPP as[P0[Q0[P1[P2 P3]]]];
 try(specialize(P1 ltac:(lia));destruct P1);
 try(specialize(P2 ltac:(lia));destruct P2);
 try(specialize(P3 ltac:(lia));destruct P3)
 end;hmi_zero.
Ltac hr401_channel_preaddress:=repeat multimatch goal with
 | H:context[hc_output_address _ _ _ _ _ _]|-_=>progress(unfold hc_output_address in H)end.
Ltac hr401_channel_prerows:=
 repeat multimatch goal with H:context[hc_store_row _ _ _]|-_=>progress(unfold hc_store_row in H)end;
 repeat multimatch goal with H:context[Z.min ?a ?b]|-_=>
 first[progress(rewrite(Z.min_l a b)in H by lia)|progress(rewrite(Z.min_r a b)in H by lia)]end.
