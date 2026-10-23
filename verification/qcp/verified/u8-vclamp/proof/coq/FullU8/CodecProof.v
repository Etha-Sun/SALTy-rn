From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From FullU8 Require Import Packed32Model.
Import ListNotations.
Local Open Scope Z_scope.

Lemma pack4_range : forall a b c d,
 0<=a<=255 -> 0<=b<=255 -> 0<=c<=255 -> 0<=d<=255 ->
 0<=pack4 a b c d<=4294967295.
Proof. unfold pack4;intros;lia. Qed.
Lemma word_byte_range : forall w l, 0<=word_byte w l<=255.
Proof. intros;unfold word_byte;pose proof(Z.mod_pos_bound (w/2^(8*l)) 256 ltac:(lia));lia. Qed.
Lemma low_digit : forall a q,0<=a<256 -> (a+256*q) mod 256=a.
Proof. intros;symmetry;apply (Z.mod_unique_pos _ _ q);lia. Qed.
Lemma pack4_bytes : forall a b c d,
 0<=a<=255 -> 0<=b<=255 -> 0<=c<=255 -> 0<=d<=255 ->
 word_byte(pack4 a b c d)0=a /\ word_byte(pack4 a b c d)1=b /\
 word_byte(pack4 a b c d)2=c /\ word_byte(pack4 a b c d)3=d.
Proof.
 intros a b c d Ha Hb Hc Hd;unfold word_byte,pack4.
 change ((a+256*b+65536*c+16777216*d)/1 mod 256=a /\
 (a+256*b+65536*c+16777216*d)/256 mod 256=b /\
 (a+256*b+65536*c+16777216*d)/65536 mod 256=c /\
 (a+256*b+65536*c+16777216*d)/16777216 mod 256=d).
 assert(H1:(a+256*b+65536*c+16777216*d)/256=b+256*c+65536*d).
 { symmetry;apply(Z.div_unique_pos _ _ _ a);lia. }
 assert(H2:(a+256*b+65536*c+16777216*d)/65536=c+256*d).
 { symmetry;apply(Z.div_unique_pos _ _ _ (a+256*b));lia. }
 assert(H3:(a+256*b+65536*c+16777216*d)/16777216=d).
 { symmetry;apply(Z.div_unique_pos _ _ _ (a+256*b+65536*c));lia. }
 rewrite Z.div_1_r,H1,H2,H3;repeat split.
 - replace(a+256*b+65536*c+16777216*d)with(a+256*(b+256*c+65536*d))by ring;apply low_digit;lia.
 - replace(b+256*c+65536*d)with(b+256*(c+256*d))by ring;apply low_digit;lia.
 - apply low_digit;lia.
 - apply Z.mod_small;lia.
Qed.
Lemma word_roundtrip : forall w,0<=w<=4294967295 ->
 pack4(word_byte w 0)(word_byte w 1)(word_byte w 2)(word_byte w 3)=w.
Proof.
 intros w Hw;unfold word_byte,pack4.
 change (w/1 mod 256+256*(w/256 mod 256)+65536*(w/65536 mod 256)+16777216*(w/16777216 mod 256)=w).
 rewrite Z.div_1_r.
 pose proof(Z.div_mod w 256 ltac:(lia))as H0.
 pose proof(Z.div_mod (w/256)256 ltac:(lia))as H1.
 pose proof(Z.div_mod (w/65536)256 ltac:(lia))as H2.
 replace(w/256/256)with(w/65536)in H1 by(rewrite Z.div_div by lia;reflexivity).
 replace(w/65536/256)with(w/16777216)in H2 by(rewrite Z.div_div by lia;reflexivity).
 assert(Hq:0<=w/16777216<256).
 { split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]. }
 assert(Hlast:w/16777216 mod 256=w/16777216)by(apply Z.mod_small;lia).
 rewrite Hlast;lia.
Qed.
Lemma active_min_range : forall x y vl i,0<=x<=255 ->0<=y<=255 ->0<=active_min x y vl i<=255.
Proof. intros;unfold active_min;destruct(Z.ltb i vl);[destruct(Z_le_gt_dec x y);[rewrite Z.min_l by lia|rewrite Z.min_r by lia]|];lia. Qed.
Lemma active_max_range : forall x y vl i,0<=x<=255 ->0<=y<=255 ->0<=active_max x y vl i<=255.
Proof. intros;unfold active_max;destruct(Z.ltb i vl);[destruct(Z_le_gt_dec x y);[rewrite Z.max_r by lia|rewrite Z.max_l by lia]|];lia. Qed.
Lemma word_min_byte : forall w y vl wi l,0<=y<=255 ->0<=l<4 ->
 word_byte(word_min w y vl wi)l=active_min(word_byte w l)y vl(4*wi+l).
Proof.
 intros w y vl wi l Hy Hl;unfold word_min.
 pose proof(pack4_bytes
  (active_min(word_byte w 0)y vl(4*wi))
  (active_min(word_byte w 1)y vl(4*wi+1))
  (active_min(word_byte w 2)y vl(4*wi+2))
  (active_min(word_byte w 3)y vl(4*wi+3))
  (active_min_range _ _ _ _ (word_byte_range _ _) Hy)
  (active_min_range _ _ _ _ (word_byte_range _ _) Hy)
  (active_min_range _ _ _ _ (word_byte_range _ _) Hy)
  (active_min_range _ _ _ _ (word_byte_range _ _) Hy))as[H0[H1[H2 H3]]].
 assert(l=0\/l=1\/l=2\/l=3)by lia;destruct H as[Heq|[Heq|[Heq|Heq]]];subst l;rewrite ?Z.add_0_r;assumption.
Qed.
Lemma word_max_byte : forall w y vl wi l,0<=y<=255 ->0<=l<4 ->
 word_byte(word_max w y vl wi)l=active_max(word_byte w l)y vl(4*wi+l).
Proof.
 intros w y vl wi l Hy Hl;unfold word_max.
 pose proof(pack4_bytes
  (active_max(word_byte w 0)y vl(4*wi))
  (active_max(word_byte w 1)y vl(4*wi+1))
  (active_max(word_byte w 2)y vl(4*wi+2))
  (active_max(word_byte w 3)y vl(4*wi+3))
  (active_max_range _ _ _ _ (word_byte_range _ _) Hy)
  (active_max_range _ _ _ _ (word_byte_range _ _) Hy)
  (active_max_range _ _ _ _ (word_byte_range _ _) Hy)
  (active_max_range _ _ _ _ (word_byte_range _ _) Hy))as[H0[H1[H2 H3]]].
 assert(l=0\/l=1\/l=2\/l=3)by lia;destruct H as[Heq|[Heq|[Heq|Heq]]];subst l;rewrite ?Z.add_0_r;assumption.
Qed.
Lemma vec_byte_word_lane : forall W wi l,0<=wi<32 ->0<=l<4 ->
 vec_byte W(4*wi+l)=word_byte(Znth wi W 0)l.
Proof.
 intros W wi l Hwi Hl;unfold vec_byte.
 assert(Hd:(4*wi+l)/4=wi)by(symmetry;apply(Z.div_unique_pos _ _ _ l);lia).
 assert(Hm:(4*wi+l)mod 4=l)by(symmetry;apply(Z.mod_unique_pos _ _ wi);lia).
 now rewrite Hd,Hm.
Qed.
Lemma vec_bytes_length : forall W,length(vec_bytes W)=128%nat.
Proof. intros;unfold vec_bytes;rewrite map_length,seq_length;reflexivity. Qed.
Lemma vec_bytes_index : forall W i,0<=i<128 ->Znth i(vec_bytes W)0=vec_byte W i.
Proof.
 intros W i Hi;unfold Znth,vec_bytes.
 rewrite(@nth_indep Z _ _ 0 (vec_byte W 0))by(rewrite map_length,seq_length;lia).
 change(nth(Z.to_nat i)(map(fun n=>vec_byte W(Z.of_nat n))(seq 0 128))((fun n=>vec_byte W(Z.of_nat n))0%nat)=vec_byte W i).
 rewrite map_nth,seq_nth by lia;cbn;rewrite Z2Nat.id by lia;reflexivity.
Qed.
Print Assumptions pack4_range.
Print Assumptions word_byte_range.
Print Assumptions pack4_bytes.
Print Assumptions word_roundtrip.
Print Assumptions word_min_byte.
Print Assumptions word_max_byte.
Print Assumptions vec_byte_word_lane.
Print Assumptions vec_bytes_length.
Print Assumptions vec_bytes_index.
