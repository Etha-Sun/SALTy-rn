From HwcConv Require Export RvvMain401GeometryTactics.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Definition hr401_cursor_step(p inc:Z):Z:=unsigned_last_nbits(unsigned_last_nbits p 64+inc)64.
Lemma hr401_pending_next_channel:forall output hs cs C finish y c x inc p0 p1 p2 p3 q0 q1 q2 q3,
 4<c->c<=C->inc=hc_addr64(4*cs-4*x)->
 p0=hc_output_address output hs cs(hc_store_channel C(C-c)0)(hc_store_row finish y 0)x->
 p1=hc_output_address output hs cs(hc_store_channel C(C-c)1)(hc_store_row finish y 0)x->
 p2=hc_output_address output hs cs(hc_store_channel C(C-c)2)(hc_store_row finish y 0)x->
 p3=hc_output_address output hs cs(hc_store_channel C(C-c)3)(hc_store_row finish y 0)x->
 q0=hc_output_address output hs cs(hc_store_channel C(C-c)0)(hc_store_row finish y 1)x->
 q1=hc_output_address output hs cs(hc_store_channel C(C-c)1)(hc_store_row finish y 1)x->
 q2=hc_output_address output hs cs(hc_store_channel C(C-c)2)(hc_store_row finish y 1)x->
 q3=hc_output_address output hs cs(hc_store_channel C(C-c)3)(hc_store_row finish y 1)x->
 hc_channel_pending output hs cs C finish y(C-(c-4))
 (hr401_cursor_step p0 inc)(hr401_cursor_step p1 inc)(hr401_cursor_step p2 inc)(hr401_cursor_step p3 inc)
 (hr401_cursor_step q0 inc)(hr401_cursor_step q1 inc)(hr401_cursor_step q2 inc)(hr401_cursor_step q3 inc).
Proof.
 intros output hs cs C finish y c x inc p0 p1 p2 p3 q0 q1 q2 q3 HC HCC HI HP0 HP1 HP2 HP3 HQ0 HQ1 HQ2 HQ3.
 subst inc p0 p1 p2 p3 q0 q1 q2 q3.
 unfold hc_channel_pending;intro Hnext.
 unfold hr401_cursor_step,hc_output_address,hc_store_channel.
 repeat rewrite Z.min_l by lia.
 repeat split;intros;hmb_mod_nf2;apply(f_equal hc_addr64);ring.
Qed.
Lemma hr401_finish_group_progress:forall R O output hs cs C start finish ow y c,
 0<c<=C->c<=4->
 hc_progress R O output hs cs C start finish ow y(C-c)ow=
 hc_progress R O output hs cs C start finish ow y C 0.
Proof.
 intros;rewrite hcm_progress_next_channel.
 transitivity(hc_progress R O output hs cs C start finish ow(y+2)0 0).
 - apply hcm_progress_next_row;lia.
 - symmetry;apply hcm_progress_next_row;lia.
Qed.
Lemma hr401_quot_add4:forall ch,0<=ch->Z.quot(ch+4)4=Z.quot ch 4+1.
Proof. intros;rewrite !Z.quot_div_nonneg by lia.
 replace(ch+4)with(1*4+ch)by ring;rewrite Z.div_add_l by lia;ring. Qed.
Lemma hr401_rem_add4:forall ch,0<=ch->Z.rem ch 4=0->Z.rem(ch+4)4=0.
Proof. intros;rewrite !Z.rem_mod_nonneg in * by lia.
 replace(ch+4)with(ch+1*4)by ring;rewrite Z.mod_add by lia;assumption. Qed.
Print Assumptions hr401_pending_next_channel.
Print Assumptions hr401_finish_group_progress.
Print Assumptions hr401_quot_add4.
Print Assumptions hr401_rem_add4.
