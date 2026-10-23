From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Export ProgramModel RvvModel.
Import ListNotations.
Local Open Scope Z_scope.

Lemma cvt_map_seq_nth : forall(f:nat->fp32)start count i d,
 (i<count)%nat -> nth i(map f(seq start count))d=f(start+i)%nat.
Proof.
 intros f start count i d Hi.
 rewrite(@List.nth_indep fp32(map f(seq start count))i d(f 0%nat))
  by(rewrite length_map,length_seq;assumption).
 rewrite(@List.map_nth nat fp32 f(seq start count)0%nat i).
 rewrite seq_nth by assumption. reflexivity.
Qed.
Lemma cvt_chunk_nth : forall k r A z scale i d,
 0<=i<r -> Znth i(cvt_chunk k r A z scale)d=
 cvt_neon_lane(Znth(k+i)A 0)z scale.
Proof.
 intros. unfold cvt_chunk,Znth at 1.
 rewrite cvt_map_seq_nth by lia. cbn[ Nat.add ].
 rewrite Z2Nat.id by lia. reflexivity.
Qed.
Lemma cvt_values_append : forall k r A z scale,
 0<=k -> 0<=r -> k+r<=Zlength A ->
 cvt_values(k+r)A z scale=cvt_values k A z scale++cvt_chunk k r A z scale.
Proof.
 intros k r A z scale Hk Hr Hb. unfold cvt_values.
 rewrite Z2Nat.inj_add by lia. rewrite seq_app,map_app. f_equal.
 apply List.nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - unfold cvt_chunk;rewrite !map_length,!seq_length;reflexivity.
 - intros i Hi. rewrite map_length,seq_length in Hi.
   rewrite cvt_map_seq_nth by assumption.
   rewrite <-(Nat2Z.id i) at 2.
   change(cvt_neon_lane(nth(Z.to_nat k+i)A 0)z scale=
    Znth(Z.of_nat i)(cvt_chunk k r A z scale)(Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia. unfold Znth.
   rewrite Z2Nat.inj_add,Nat2Z.id by lia. reflexivity.
Qed.
Lemma cvt_read_lane_active : forall i vl idx A,
 i<vl -> cvt_read_lane i vl idx A=Znth(idx+i)A 0.
Proof. intros;unfold cvt_read_lane;destruct(Z.ltb_spec i vl);[reflexivity|lia]. Qed.
Lemma cvt_active_chain : forall i vl x z scale,
 i<vl ->
 cvt_active_mul i vl(cvt_active_float i vl(cvt_active_int i vl
  (cvt_active_sub16 i vl(cvt_active_int i vl x)(cvt_s16 z))))scale=
 cvt_rvv_lane x z scale.
Proof.
 intros;unfold cvt_active_mul,cvt_active_float,cvt_active_int,cvt_active_sub16.
 destruct(Z.ltb_spec i vl);[reflexivity|lia].
Qed.
Print Assumptions cvt_map_seq_nth.
Print Assumptions cvt_chunk_nth.
Print Assumptions cvt_values_append.
Print Assumptions cvt_read_lane_active.
Print Assumptions cvt_active_chain.

Lemma cvt_chunk_1 : forall k A z scale,
 0<=k -> k+1<=Zlength A -> cvt_chunk k 1 A z scale=[cvt_neon_lane(Znth(k+0)A 0)z scale].
Proof.
 intros k A z scale Hk Hb. apply List.nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - change(length(cvt_chunk k 1 A z scale)=1%nat).
   pose proof(cvt_chunk_length k 1 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen;lia.
 - intros i Hi. pose proof(cvt_chunk_length k 1 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(cvt_chunk k 1 A z scale)(Z_to_fp32 0)=nth i[cvt_neon_lane(Znth(k+0)A 0)z scale](Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia.
   do 1(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma cvt_values_append1 : forall k A z scale,
 0<=k -> k+1<=Zlength A ->
 cvt_values(k+1)A z scale=cvt_values k A z scale++[cvt_neon_lane(Znth(k+0)A 0)z scale].
Proof. intros;rewrite cvt_values_append by lia;rewrite cvt_chunk_1 by assumption;reflexivity. Qed.
Print Assumptions cvt_chunk_1.
Print Assumptions cvt_values_append1.

Lemma cvt_chunk_2 : forall k A z scale,
 0<=k -> k+2<=Zlength A -> cvt_chunk k 2 A z scale=[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale].
Proof.
 intros k A z scale Hk Hb. apply List.nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - change(length(cvt_chunk k 2 A z scale)=2%nat).
   pose proof(cvt_chunk_length k 2 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen;lia.
 - intros i Hi. pose proof(cvt_chunk_length k 2 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(cvt_chunk k 2 A z scale)(Z_to_fp32 0)=nth i[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale](Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia.
   do 2(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma cvt_values_append2 : forall k A z scale,
 0<=k -> k+2<=Zlength A ->
 cvt_values(k+2)A z scale=cvt_values k A z scale++[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale].
Proof. intros;rewrite cvt_values_append by lia;rewrite cvt_chunk_2 by assumption;reflexivity. Qed.
Print Assumptions cvt_chunk_2.
Print Assumptions cvt_values_append2.

Lemma cvt_chunk_4 : forall k A z scale,
 0<=k -> k+4<=Zlength A -> cvt_chunk k 4 A z scale=[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale].
Proof.
 intros k A z scale Hk Hb. apply List.nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - change(length(cvt_chunk k 4 A z scale)=4%nat).
   pose proof(cvt_chunk_length k 4 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen;lia.
 - intros i Hi. pose proof(cvt_chunk_length k 4 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(cvt_chunk k 4 A z scale)(Z_to_fp32 0)=nth i[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale](Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia.
   do 4(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma cvt_values_append4 : forall k A z scale,
 0<=k -> k+4<=Zlength A ->
 cvt_values(k+4)A z scale=cvt_values k A z scale++[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale].
Proof. intros;rewrite cvt_values_append by lia;rewrite cvt_chunk_4 by assumption;reflexivity. Qed.
Print Assumptions cvt_chunk_4.
Print Assumptions cvt_values_append4.

Lemma cvt_chunk_8 : forall k A z scale,
 0<=k -> k+8<=Zlength A -> cvt_chunk k 8 A z scale=[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale;cvt_neon_lane(Znth(k+4)A 0)z scale;cvt_neon_lane(Znth(k+5)A 0)z scale;cvt_neon_lane(Znth(k+6)A 0)z scale;cvt_neon_lane(Znth(k+7)A 0)z scale].
Proof.
 intros k A z scale Hk Hb. apply List.nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - change(length(cvt_chunk k 8 A z scale)=8%nat).
   pose proof(cvt_chunk_length k 8 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen;lia.
 - intros i Hi. pose proof(cvt_chunk_length k 8 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(cvt_chunk k 8 A z scale)(Z_to_fp32 0)=nth i[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale;cvt_neon_lane(Znth(k+4)A 0)z scale;cvt_neon_lane(Znth(k+5)A 0)z scale;cvt_neon_lane(Znth(k+6)A 0)z scale;cvt_neon_lane(Znth(k+7)A 0)z scale](Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia.
   do 8(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma cvt_values_append8 : forall k A z scale,
 0<=k -> k+8<=Zlength A ->
 cvt_values(k+8)A z scale=cvt_values k A z scale++[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale;cvt_neon_lane(Znth(k+4)A 0)z scale;cvt_neon_lane(Znth(k+5)A 0)z scale;cvt_neon_lane(Znth(k+6)A 0)z scale;cvt_neon_lane(Znth(k+7)A 0)z scale].
Proof. intros;rewrite cvt_values_append by lia;rewrite cvt_chunk_8 by assumption;reflexivity. Qed.
Print Assumptions cvt_chunk_8.
Print Assumptions cvt_values_append8.

Lemma cvt_chunk_32 : forall k A z scale,
 0<=k -> k+32<=Zlength A -> cvt_chunk k 32 A z scale=[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale;cvt_neon_lane(Znth(k+4)A 0)z scale;cvt_neon_lane(Znth(k+5)A 0)z scale;cvt_neon_lane(Znth(k+6)A 0)z scale;cvt_neon_lane(Znth(k+7)A 0)z scale;cvt_neon_lane(Znth(k+8)A 0)z scale;cvt_neon_lane(Znth(k+9)A 0)z scale;cvt_neon_lane(Znth(k+10)A 0)z scale;cvt_neon_lane(Znth(k+11)A 0)z scale;cvt_neon_lane(Znth(k+12)A 0)z scale;cvt_neon_lane(Znth(k+13)A 0)z scale;cvt_neon_lane(Znth(k+14)A 0)z scale;cvt_neon_lane(Znth(k+15)A 0)z scale;cvt_neon_lane(Znth(k+16)A 0)z scale;cvt_neon_lane(Znth(k+17)A 0)z scale;cvt_neon_lane(Znth(k+18)A 0)z scale;cvt_neon_lane(Znth(k+19)A 0)z scale;cvt_neon_lane(Znth(k+20)A 0)z scale;cvt_neon_lane(Znth(k+21)A 0)z scale;cvt_neon_lane(Znth(k+22)A 0)z scale;cvt_neon_lane(Znth(k+23)A 0)z scale;cvt_neon_lane(Znth(k+24)A 0)z scale;cvt_neon_lane(Znth(k+25)A 0)z scale;cvt_neon_lane(Znth(k+26)A 0)z scale;cvt_neon_lane(Znth(k+27)A 0)z scale;cvt_neon_lane(Znth(k+28)A 0)z scale;cvt_neon_lane(Znth(k+29)A 0)z scale;cvt_neon_lane(Znth(k+30)A 0)z scale;cvt_neon_lane(Znth(k+31)A 0)z scale].
Proof.
 intros k A z scale Hk Hb. apply List.nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - change(length(cvt_chunk k 32 A z scale)=32%nat).
   pose proof(cvt_chunk_length k 32 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen;lia.
 - intros i Hi. pose proof(cvt_chunk_length k 32 A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(cvt_chunk k 32 A z scale)(Z_to_fp32 0)=nth i[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale;cvt_neon_lane(Znth(k+4)A 0)z scale;cvt_neon_lane(Znth(k+5)A 0)z scale;cvt_neon_lane(Znth(k+6)A 0)z scale;cvt_neon_lane(Znth(k+7)A 0)z scale;cvt_neon_lane(Znth(k+8)A 0)z scale;cvt_neon_lane(Znth(k+9)A 0)z scale;cvt_neon_lane(Znth(k+10)A 0)z scale;cvt_neon_lane(Znth(k+11)A 0)z scale;cvt_neon_lane(Znth(k+12)A 0)z scale;cvt_neon_lane(Znth(k+13)A 0)z scale;cvt_neon_lane(Znth(k+14)A 0)z scale;cvt_neon_lane(Znth(k+15)A 0)z scale;cvt_neon_lane(Znth(k+16)A 0)z scale;cvt_neon_lane(Znth(k+17)A 0)z scale;cvt_neon_lane(Znth(k+18)A 0)z scale;cvt_neon_lane(Znth(k+19)A 0)z scale;cvt_neon_lane(Znth(k+20)A 0)z scale;cvt_neon_lane(Znth(k+21)A 0)z scale;cvt_neon_lane(Znth(k+22)A 0)z scale;cvt_neon_lane(Znth(k+23)A 0)z scale;cvt_neon_lane(Znth(k+24)A 0)z scale;cvt_neon_lane(Znth(k+25)A 0)z scale;cvt_neon_lane(Znth(k+26)A 0)z scale;cvt_neon_lane(Znth(k+27)A 0)z scale;cvt_neon_lane(Znth(k+28)A 0)z scale;cvt_neon_lane(Znth(k+29)A 0)z scale;cvt_neon_lane(Znth(k+30)A 0)z scale;cvt_neon_lane(Znth(k+31)A 0)z scale](Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia.
   do 32(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma cvt_values_append32 : forall k A z scale,
 0<=k -> k+32<=Zlength A ->
 cvt_values(k+32)A z scale=cvt_values k A z scale++[cvt_neon_lane(Znth(k+0)A 0)z scale;cvt_neon_lane(Znth(k+1)A 0)z scale;cvt_neon_lane(Znth(k+2)A 0)z scale;cvt_neon_lane(Znth(k+3)A 0)z scale;cvt_neon_lane(Znth(k+4)A 0)z scale;cvt_neon_lane(Znth(k+5)A 0)z scale;cvt_neon_lane(Znth(k+6)A 0)z scale;cvt_neon_lane(Znth(k+7)A 0)z scale;cvt_neon_lane(Znth(k+8)A 0)z scale;cvt_neon_lane(Znth(k+9)A 0)z scale;cvt_neon_lane(Znth(k+10)A 0)z scale;cvt_neon_lane(Znth(k+11)A 0)z scale;cvt_neon_lane(Znth(k+12)A 0)z scale;cvt_neon_lane(Znth(k+13)A 0)z scale;cvt_neon_lane(Znth(k+14)A 0)z scale;cvt_neon_lane(Znth(k+15)A 0)z scale;cvt_neon_lane(Znth(k+16)A 0)z scale;cvt_neon_lane(Znth(k+17)A 0)z scale;cvt_neon_lane(Znth(k+18)A 0)z scale;cvt_neon_lane(Znth(k+19)A 0)z scale;cvt_neon_lane(Znth(k+20)A 0)z scale;cvt_neon_lane(Znth(k+21)A 0)z scale;cvt_neon_lane(Znth(k+22)A 0)z scale;cvt_neon_lane(Znth(k+23)A 0)z scale;cvt_neon_lane(Znth(k+24)A 0)z scale;cvt_neon_lane(Znth(k+25)A 0)z scale;cvt_neon_lane(Znth(k+26)A 0)z scale;cvt_neon_lane(Znth(k+27)A 0)z scale;cvt_neon_lane(Znth(k+28)A 0)z scale;cvt_neon_lane(Znth(k+29)A 0)z scale;cvt_neon_lane(Znth(k+30)A 0)z scale;cvt_neon_lane(Znth(k+31)A 0)z scale].
Proof. intros;rewrite cvt_values_append by lia;rewrite cvt_chunk_32 by assumption;reflexivity. Qed.
Print Assumptions cvt_chunk_32.
Print Assumptions cvt_values_append32.
