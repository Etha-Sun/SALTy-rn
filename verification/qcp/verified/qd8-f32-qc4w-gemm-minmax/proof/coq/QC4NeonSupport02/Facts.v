From Coq Require Import ZArith Lia.
From QC4W Require Export NeonModel.
Local Open Scope Z_scope.
Lemma qc_acc_wrap : forall depth ks zp lane A W,
 wrap32(qc4_acc depth ks zp lane A W)=qc4_acc depth ks zp lane A W.
Proof. intros;unfold wrap32;apply Z.mod_small;apply qc4_acc_range. Qed.
Lemma qc_signed_step : forall d t l zp A Ps,0<=d ->
 qc4_acc_signed(d+1)t l zp A Ps=
 qc4_mac_signed(qc4_acc_signed d t l zp A Ps)(qc4_zget d A)
 (qc4_weight d l(qc4_weights(qc4_panel_at Ps t))).
Proof.
 intros;unfold qc4_acc_signed;rewrite qc4_acc_step by lia.
 rewrite <-qc4_mac_signed_matches_bits,qc_acc_wrap;reflexivity.
Qed.
Lemma qc_weight_even : forall d l W,d mod 2=0 ->
 qc4_weight d l W=low_bitop(qc4_zget(8*d+l)W).
Proof.
 intros;unfold qc4_weight;rewrite H;cbn[Z.eqb].
 pose proof(Z.div_mod d 2 ltac:(lia));rewrite H in H0.
 replace(16*(d/2)+l)with(8*d+l)by lia;reflexivity.
Qed.
Lemma qc_weight_odd : forall d l W,d mod 2=0 ->
 qc4_weight(d+1)l W=high_bitop(qc4_zget(8*d+l)W).
Proof.
 intros;pose proof(Z.div_mod d 2 ltac:(lia));rewrite H in H0.
 assert(Hm:(d+1)mod 2=1)by(rewrite Z.add_mod by lia;rewrite H;reflexivity).
 pose proof(Z.div_mod(d+1)2 ltac:(lia));rewrite Hm in H1.
 unfold qc4_weight;rewrite Hm;cbn[Z.eqb].
 replace(16*((d+1)/2)+l)with(8*d+l)by lia;reflexivity.
Qed.
Lemma qc_signed_pair : forall d t l zp A Ps,0<=d ->d mod 2=0 ->
 qc4_acc_signed(d+2)t l zp A Ps=
 qc4_mac_signed(qc4_mac_signed(qc4_acc_signed d t l zp A Ps)(qc4_zget d A)
 (low_bitop(qc4_zget(8*d+l)(qc4_weights(qc4_panel_at Ps t)))))
 (qc4_zget(d+1)A)(high_bitop(qc4_zget(8*d+l)(qc4_weights(qc4_panel_at Ps t)))).
Proof.
 intros;replace(d+2)with((d+1)+1)by lia.
 rewrite qc_signed_step,qc_signed_step by lia.
 rewrite qc_weight_even,qc_weight_odd by assumption;reflexivity.
Qed.

Definition qc_neon_pair d t lane acc A Ps:=
 qc4_mac_signed(qc4_mac_signed acc(qc4_zget d A)
 (low_bitop(qc4_zget(8*d+lane)(qc4_weights(qc4_panel_at Ps t)))))
 (qc4_zget(d+1)A)(high_bitop(qc4_zget(8*d+lane)(qc4_weights(qc4_panel_at Ps t)))).
Lemma qc_neon_pair_exact : forall d t lane zp A Ps,0<=d ->d mod 2=0 ->
 qc4_acc_signed(d+2)t lane zp A Ps=qc_neon_pair d t lane(qc4_acc_signed d t lane zp A Ps)A Ps.
Proof. intros;apply qc_signed_pair;assumption. Qed.
Lemma qc_plus_even : forall d n,d mod 2=0 ->n mod 2=0 ->(d+n)mod 2=0.
Proof. intros;rewrite Z.add_mod,H,H0 by lia;reflexivity. Qed.
Lemma qc_neon_four_exact : forall d t lane zp A Ps,0<=d ->d mod 2=0 ->
 qc4_acc_signed(d+4)t lane zp A Ps=
 qc_neon_pair(d+2)t lane(qc_neon_pair d t lane(qc4_acc_signed d t lane zp A Ps)A Ps)A Ps.
Proof.
 intros;replace(d+4)with((d+2)+2)by lia.
 rewrite qc_neon_pair_exact by(first[assumption|apply qc_plus_even;[assumption|reflexivity]|lia]).
 rewrite qc_neon_pair_exact by assumption;reflexivity.
Qed.
Lemma qc_neon_six_exact : forall d t lane zp A Ps,0<=d ->d mod 2=0 ->
 qc4_acc_signed(d+6)t lane zp A Ps=
 qc_neon_pair(d+4)t lane(qc_neon_pair(d+2)t lane(qc_neon_pair d t lane(qc4_acc_signed d t lane zp A Ps)A Ps)A Ps)A Ps.
Proof.
 intros;replace(d+6)with((d+4)+2)by lia.
 rewrite qc_neon_pair_exact by(first[assumption|apply qc_plus_even;[assumption|reflexivity]|lia]).
 rewrite qc_neon_four_exact by assumption;reflexivity.
Qed.
Lemma qc_neon_eight_exact : forall d t lane zp A Ps,0<=d ->d mod 2=0 ->
 qc4_acc_signed(d+8)t lane zp A Ps=
 qc_neon_pair(d+6)t lane(qc_neon_pair(d+4)t lane(qc_neon_pair(d+2)t lane(qc_neon_pair d t lane(qc4_acc_signed d t lane zp A Ps)A Ps)A Ps)A Ps)A Ps.
Proof.
 intros;replace(d+8)with((d+6)+2)by lia.
 rewrite qc_neon_pair_exact by(first[assumption|apply qc_plus_even;[assumption|reflexivity]|lia]).
 rewrite qc_neon_six_exact by assumption;reflexivity.
Qed.
Lemma qc_tail_load_extent : forall K d,0<=d ->d mod 8=0 ->d<rounded_depth K<=d+8 ->qc4_a_extent K=d+8.
Proof.
 intros K d Hd Hm Hb;unfold qc4_a_extent.
 pose proof(Z.div_mod d 8 ltac:(lia));rewrite Hm in H.
 pose proof(Z.div_mod(rounded_depth K+7)8 ltac:(lia)).
 pose proof(Z.mod_pos_bound(rounded_depth K+7)8 ltac:(lia));lia.
Qed.
Lemma qc_tail_even_cases : forall k,0<=k<8 ->k mod 2=0 ->k=0 \/k=2 \/k=4 \/k=6.
Proof. intros;pose proof(Z.div_mod k 2 ltac:(lia));rewrite H0 in H1;lia. Qed.
Print Assumptions qc_neon_pair_exact.
Print Assumptions qc_neon_four_exact.
Print Assumptions qc_neon_six_exact.
Print Assumptions qc_neon_eight_exact.
Print Assumptions qc_tail_load_extent.
Print Assumptions qc_tail_even_cases.

Lemma qc_mac_comm : forall acc a b,qc4_mac_signed acc a b=qc4_mac_signed acc b a.
Proof. intros;unfold qc4_mac_signed;rewrite Z.mul_comm;reflexivity. Qed.
Lemma qc_neon_lane0 : forall x0 x1 x2 x3,qc4_i16_lane 0 x0 x1 x2 x3=x0.
Proof. reflexivity. Qed.
Lemma qc_neon_lane1 : forall x0 x1 x2 x3,qc4_i16_lane 1 x0 x1 x2 x3=x1.
Proof. reflexivity. Qed.
Lemma qc_neon_lane2 : forall x0 x1 x2 x3,qc4_i16_lane 2 x0 x1 x2 x3=x2.
Proof. reflexivity. Qed.
Lemma qc_neon_lane3 : forall x0 x1 x2 x3,qc4_i16_lane 3 x0 x1 x2 x3=x3.
Proof. reflexivity. Qed.
Print Assumptions qc_mac_comm.
Print Assumptions qc_neon_lane0.
Print Assumptions qc_neon_lane1.
Print Assumptions qc_neon_lane2.
Print Assumptions qc_neon_lane3.
