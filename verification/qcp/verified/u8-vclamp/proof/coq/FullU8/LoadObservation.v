From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From FullU8 Require Import U8Logic Packed32Model CodecProof VectorBridge.
Local Open Scope Z_scope.
Lemma lane_load_range : forall A vl i,0<=i ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->0<=lane_load A vl i<=255.
Proof.
 intros A vl i Hi Hb;unfold lane_load;destruct(Z.ltb i vl)eqn:Ht.
 - apply Z.ltb_lt in Ht;apply Hb;lia.
 - lia.
Qed.
Lemma word_load_byte : forall A vl wi l,0<=wi<32 ->0<=l<4 ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->
 word_byte(word_load A vl wi)l=lane_load A vl(4*wi+l).
Proof.
 intros A vl wi l Hwi Hl Hb;unfold word_load.
 pose proof(pack4_bytes
  (lane_load A vl(4*wi))(lane_load A vl(4*wi+1))
  (lane_load A vl(4*wi+2))(lane_load A vl(4*wi+3))
  (lane_load_range A vl (4*wi) ltac:(lia) Hb)
  (lane_load_range A vl (4*wi+1) ltac:(lia) Hb)
  (lane_load_range A vl (4*wi+2) ltac:(lia) Hb)
  (lane_load_range A vl (4*wi+3) ltac:(lia) Hb))as[H0[H1[H2 H3]]].
 assert(l=0\/l=1\/l=2\/l=3)by lia;destruct H as[Heq|[Heq|[Heq|Heq]]];subst l;rewrite ?Z.add_0_r;assumption.
Qed.
Lemma vec_bytes_load_at : forall W A vl i,0<=i<128 ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->
 (forall wi,0<=wi<32 ->Znth wi W 0=word_load A vl wi) ->
 Znth i(vec_bytes W)0=lane_load A vl i.
Proof.
 intros W A vl i Hi Hb Hw;rewrite vec_bytes_index by exact Hi;unfold vec_byte.
 assert(Hq:0<=i/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]).
 rewrite Hw by exact Hq;rewrite word_load_byte by(try assumption;pose proof(Z.mod_pos_bound i 4 ltac:(lia));lia).
 replace(4*(i/4)+i mod 4)with i by(pose proof(Z.div_mod i 4 ltac:(lia));lia);reflexivity.
Qed.
Lemma vec_bytes_load_active : forall W A vl i,0<=i<vl ->vl<=128 ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->
 (forall wi,0<=wi<32 ->Znth wi W 0=word_load A vl wi) ->
 Znth i(vec_bytes W)0=Znth i A 0.
Proof.
 intros;rewrite(vec_bytes_load_at W A vl i)by(try assumption;lia).
 unfold lane_load;assert(Hlt:Z.ltb i vl=true)by(apply Z.ltb_lt;lia);rewrite Hlt;reflexivity.
Qed.
Lemma vec_bytes_prefix_active : forall W0 W1 W2 A lo hi vl i,
 0<=lo<=255 ->0<=hi<=255 ->0<=i<vl ->vl<=128 ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->
 (forall wi,0<=wi<32 ->Znth wi W0 0=word_load A vl wi) ->
 (forall wi,0<=wi<32 ->Znth wi W1 0=word_max(Znth wi W0 0)lo vl wi) ->
 (forall wi,0<=wi<32 ->Znth wi W2 0=word_min(Znth wi W1 0)hi vl wi) ->
 Znth i(vec_bytes W2)0=u8_prefix(Znth i A 0)lo hi.
Proof.
 intros W0 W1 W2 A lo hi vl i Hlo Hhi Hi Hvl Hb Hload Hmax Hmin.
 assert(H128:0<=i<128)by lia.
 pose proof(vec_bytes_load_at W0 A vl i H128 Hb Hload)as H0.
 pose proof(vec_bytes_max_at W0 W1 lo vl i Hlo H128 Hmax)as H1.
 pose proof(vec_bytes_min_at W1 W2 hi vl i Hhi H128 Hmin)as H2.
 rewrite H1,H0 in H2;unfold lane_load,active_min,active_max,u8_prefix in *.
 assert(Hlt:Z.ltb i vl=true)by(apply Z.ltb_lt;lia);rewrite Hlt in H2;exact H2.
Qed.
Lemma vec_bytes_suffix_active : forall W0 W1 W2 A lo hi vl i,
 0<=lo<=255 ->0<=hi<=255 ->0<=i<vl ->vl<=128 ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->
 (forall wi,0<=wi<32 ->Znth wi W0 0=word_load A vl wi) ->
 (forall wi,0<=wi<32 ->Znth wi W1 0=word_min(Znth wi W0 0)hi vl wi) ->
 (forall wi,0<=wi<32 ->Znth wi W2 0=word_max(Znth wi W1 0)lo vl wi) ->
 Znth i(vec_bytes W2)0=u8_suffix(Znth i A 0)lo hi.
Proof.
 intros W0 W1 W2 A lo hi vl i Hlo Hhi Hi Hvl Hb Hload Hmin Hmax.
 assert(H128:0<=i<128)by lia.
 pose proof(vec_bytes_load_at W0 A vl i H128 Hb Hload)as H0.
 pose proof(vec_bytes_min_at W0 W1 hi vl i Hhi H128 Hmin)as H1.
 pose proof(vec_bytes_max_at W1 W2 lo vl i Hlo H128 Hmax)as H2.
 rewrite H1,H0 in H2;unfold lane_load,active_min,active_max,u8_suffix in *.
 assert(Hlt:Z.ltb i vl=true)by(apply Z.ltb_lt;lia);rewrite Hlt in H2;exact H2.
Qed.
Print Assumptions lane_load_range.
Print Assumptions word_load_byte.
Print Assumptions vec_bytes_load_at.
Print Assumptions vec_bytes_load_active.
Print Assumptions vec_bytes_prefix_active.
Print Assumptions vec_bytes_suffix_active.
