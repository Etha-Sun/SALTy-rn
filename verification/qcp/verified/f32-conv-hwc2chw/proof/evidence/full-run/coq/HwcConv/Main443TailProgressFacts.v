From HwcConv Require Export Main443ProgressFacts SupportModel.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma hcm_progress_channel_complete:forall R O output hs cs C start finish ow y c,
 0<c<=C->
 hc_progress R O output hs cs C start finish ow y(C-c)ow=
 hc_progress R O output hs cs C start finish ow y(C-hc_doz_model c 4)0.
Proof.
 intros;rewrite hcm_progress_next_channel;unfold hc_doz_model.
 destruct(Z_le_dec 4 c).
 - rewrite Z.max_r by lia;replace(C-(c-4))with(C-c+4)by lia;reflexivity.
 - rewrite Z.max_l by lia;etransitivity;[apply hcm_progress_next_row;lia|symmetry;apply hcm_progress_next_row;lia].
Qed.
Lemma hcm_width_tail_three:forall N iw,
 0<=iw<=N->Z.rem(N-iw)4=0->iw=3->Z.quot(N-iw)2+2=Z.quot(N+1)2.
Proof.
 intros;subst iw;rewrite !Z.quot_div_nonneg in * by lia;
 rewrite Z.rem_mod_nonneg in H0 by lia;
 pose proof(Z.div_mod(N-3)4 ltac:(lia));
 pose proof(Z.div_mod(N-3)2 ltac:(lia));
 pose proof(Z.mod_pos_bound(N-3)2 ltac:(lia));
 pose proof(Z.div_mod(N+1)2 ltac:(lia));
 pose proof(Z.mod_pos_bound(N+1)2 ltac:(lia));nia.
Qed.
Lemma hcm_width_tail_one:forall N iw,
 0<=iw<=N->Z.rem(N-iw)4=0->0<iw<3->Z.quot(N-iw)2+1=Z.quot(N+1)2.
Proof.
 intros;rewrite !Z.quot_div_nonneg in * by lia;
 rewrite Z.rem_mod_nonneg in H0 by lia;
 pose proof(Z.div_mod(N-iw)4 ltac:(lia));
 pose proof(Z.div_mod(N-iw)2 ltac:(lia));
 pose proof(Z.mod_pos_bound(N-iw)2 ltac:(lia));
 pose proof(Z.div_mod(N+1)2 ltac:(lia));
 pose proof(Z.mod_pos_bound(N+1)2 ltac:(lia));nia.
Qed.
Lemma hcm_width_tail_zero:forall N iw,
 0<=iw<=N->Z.rem(N-iw)4=0->iw=0->Z.quot(N-iw)2=Z.quot(N+1)2.
Proof.
 intros;subst iw;rewrite Z.sub_0_r in *;rewrite !Z.quot_div_nonneg in * by lia;
 rewrite Z.rem_mod_nonneg in H0 by lia.
 remember(N/4)as q eqn:HQ.
 assert(EN:N=4*q)by(pose proof(Z.div_mod N 4 ltac:(lia));lia).
 rewrite EN;replace(4*q)with((2*q)*2)by ring.
 replace(2*q*2+1)with(1+(2*q)*2)by ring.
 rewrite Z.div_mul,Z.div_add by lia;change(1/2)with 0;lia.
Qed.
Print Assumptions hcm_progress_channel_complete.
Print Assumptions hcm_width_tail_three.
Print Assumptions hcm_width_tail_one.
Print Assumptions hcm_width_tail_zero.
