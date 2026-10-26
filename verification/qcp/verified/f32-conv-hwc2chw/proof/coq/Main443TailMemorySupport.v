From HwcConv Require Export Main443BackedgeFacts Main443CallGeneralTactics Main443PixelValuesFacts Main443TileStoreFacts Main443TailStoreFacts HwcTileFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
From Coq Require Import ZArith Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hct_dispatch:=first[
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hct_dispatch|hct_dispatch]end|
 lazymatch goal with|-_ |-- coq_prop _=>apply hmi_pure_intro end|
 solve[sepcon_assoc_change;fast_cancel]|
 match goal with|-?G=>idtac "TAIL_SPATIAL_REMAINING" G end].
Ltac hct_first:=lazymatch goal with|-_ |-- (_ || _)=>
 eapply derivable1_trans;[|apply derivable1_orp_intros1];hct_first|_=>idtac end.
Ltac hct_last:=lazymatch goal with|-_ |-- (_ || _)=>
 eapply derivable1_trans;[|apply derivable1_orp_intros2];hct_last|_=>idtac end.
Ltac hct_context:=rewrite ?Z.sub_0_r in *;
 multimatch goal with HD:hc_input_domain _ _ _ _ _ _ _ _ _ _ _|-_=>
 let HX:=fresh "Hdomain"in pose proof HD as HX;unfold hc_input_domain in HX;
 repeat match type of HX with _ /\ _=>let HA:=fresh "Hdomain"in destruct HX as[HA HX]end end;
 multimatch goal with HL:hc_output_layout _ _ _ _ _ _ _|-_=>
 let HX:=fresh "Hlayout"in pose proof HL as HX;unfold hc_output_layout in HX;
 repeat match type of HX with _ /\ _=>let HA:=fresh "Hlayout"in destruct HX as[HA HX]end end;
 repeat progress(rewrite Z.quot_div_nonneg in * by lia);
 repeat match goal with HE:(hc_addr64 ?e = ?e)|-_=>rewrite HE in * end.
Ltac hct_outer n rem:=unfold hc_outer_input;repeat split;
 lazymatch goal with|-_ = ?p=>
 let E:=fresh "Hrestored"in pose proof(hcm_input_rewind p n rem ltac:(eassumption)ltac:(lia)ltac:(lia)ltac:(rewrite ?Z.sub_0_r;hmi_zero;assumption))as E;
 rewrite ?Z.sub_0_r,?Z.add_0_r in E;exact E end.
Ltac hct_pending:=unfold hc_channel_pending;intro;repeat split;intros;
 first[solve[lia]|hmb_mod_nf2;unfold hc_output_address,hc_store_channel,hc_store_row;
 repeat first[rewrite Z.min_l by lia|rewrite Z.min_r by lia];apply(f_equal hc_addr64);ring].
