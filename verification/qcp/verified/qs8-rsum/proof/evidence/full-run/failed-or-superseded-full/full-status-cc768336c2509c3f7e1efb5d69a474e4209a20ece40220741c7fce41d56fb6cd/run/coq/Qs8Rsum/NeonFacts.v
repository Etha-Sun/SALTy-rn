From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Export NeonProgramModel VectorFacts.
Import ListNotations.
Local Open Scope Z_scope.
Lemma rs_sum_map_s32 : forall L,rs_s32(rs_sum(map rs_s32 L))=rs_s32(rs_sum L).
Proof.
 induction L as[|x xs IH];[reflexivity|].
 change(rs_s32(rs_s32 x+rs_sum(map rs_s32 xs))=rs_s32(x+rs_sum xs)).
 rewrite rs_s32_add_l.
 rewrite <- (rs_s32_add_r x (rs_sum(map rs_s32 xs))).
 rewrite IH;apply rs_s32_add_r.
Qed.
Lemma rs_mod16_positive : forall x,0<x -> rs_mod16 x=0 -> 16<=x.
Proof. intros x Hx Hm;unfold rs_mod16 in Hm;destruct(Z_lt_ge_dec x 16);[rewrite Z.mod_small in Hm by lia;lia|lia]. Qed.
Lemma rs_count16_next : forall x,rs_count16(x+16)=rs_count16 x+1.
Proof. intros;unfold rs_count16;replace(x+16)with(x+1*16)by ring;rewrite Z.div_add by lia;lia. Qed.
Lemma rs_rem2048_bound : forall n,0<=rs_rem2048 n<2048.
Proof. intros;unfold rs_rem2048;apply Z.mod_pos_bound;lia. Qed.
Lemma rs_rem2048_sub : forall n,rs_rem2048(n-2048)=rs_rem2048 n.
Proof. intros;unfold rs_rem2048;replace(n-2048)with(n+(-1)*2048)by ring;rewrite Z.mod_add by lia;reflexivity. Qed.
Lemma rs_mod16_sub : forall n,rs_mod16(n-16)=rs_mod16 n.
Proof. intros;unfold rs_mod16;replace(n-16)with(n+(-1)*16)by ring;rewrite Z.mod_add by lia;reflexivity. Qed.
Lemma rs_mod16_add : forall n,rs_mod16(n+16)=rs_mod16 n.
Proof. intros;unfold rs_mod16;replace(n+16)with(n+1*16)by ring;rewrite Z.mod_add by lia;reflexivity. Qed.
Lemma rs_rem2048_small : forall n,0<=n<2048 -> rs_rem2048 n=n.
Proof. intros;unfold rs_rem2048;apply Z.mod_small;assumption. Qed.
Lemma rs_count16_multiple : forall x,rs_mod16 x=0 -> x=16*rs_count16 x.
Proof. intros;unfold rs_mod16 in H;unfold rs_count16;pose proof(Z.div_mod x 16 ltac:(lia));nia. Qed.
Lemma rs_sum8_pair_step : forall k (w0:Z) (w1:Z) (w2:Z) (w3:Z) (w4:Z) (w5:Z) (w6:Z) (w7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z),
 0<=k<128 -> -256*k<=w0<=254*k -> -256*k<=w1<=254*k -> -256*k<=w2<=254*k -> -256*k<=w3<=254*k -> -256*k<=w4<=254*k -> -256*k<=w5<=254*k -> -256*k<=w6<=254*k -> -256*k<=w7<=254*k -> -128<=b0<=127 -> -128<=b1<=127 -> -128<=b2<=127 -> -128<=b3<=127 -> -128<=b4<=127 -> -128<=b5<=127 -> -128<=b6<=127 -> -128<=b7<=127 -> -128<=b8<=127 -> -128<=b9<=127 -> -128<=b10<=127 -> -128<=b11<=127 -> -128<=b12<=127 -> -128<=b13<=127 -> -128<=b14<=127 -> -128<=b15<=127 ->
 rs_sum8 (rs_pair_s8 w0 b0 b1) (rs_pair_s8 w1 b2 b3) (rs_pair_s8 w2 b4 b5) (rs_pair_s8 w3 b6 b7) (rs_pair_s8 w4 b8 b9) (rs_pair_s8 w5 b10 b11) (rs_pair_s8 w6 b12 b13) (rs_pair_s8 w7 b14 b15)=(rs_sum8 w0 w1 w2 w3 w4 w5 w6 w7)+rs_sum[b0;b1;b2;b3;b4;b5;b6;b7;b8;b9;b10;b11;b12;b13;b14;b15].
Proof. intros;repeat rewrite rs_pair_s8_plain by nia;unfold rs_sum8,rs_sum;cbn[fold_right];lia. Qed.
Lemma rs_sum4_pair_step : forall (c0:Z) (c1:Z) (c2:Z) (c3:Z) (w0:Z) (w1:Z) (w2:Z) (w3:Z) (w4:Z) (w5:Z) (w6:Z) (w7:Z),
 -2147483648<=c0<=2147483647 -> -2147483648<=c1<=2147483647 -> -2147483648<=c2<=2147483647 -> -2147483648<=c3<=2147483647 -> -32768<=w0<=32767 -> -32768<=w1<=32767 -> -32768<=w2<=32767 -> -32768<=w3<=32767 -> -32768<=w4<=32767 -> -32768<=w5<=32767 -> -32768<=w6<=32767 -> -32768<=w7<=32767 ->
 rs_s32(rs_sum4 (rs_pair_s16 c0 w0 w1) (rs_pair_s16 c1 w2 w3) (rs_pair_s16 c2 w4 w5) (rs_pair_s16 c3 w6 w7))=rs_s32((rs_sum4 c0 c1 c2 c3)+(rs_sum8 w0 w1 w2 w3 w4 w5 w6 w7)).
Proof. intros;repeat rewrite rs_pair_s16_wrap by assumption.
 pose proof(rs_sum_map_s32 [c0+w0+w1;c1+w2+w3;c2+w4+w5;c3+w6+w7])as Hmap.
 unfold rs_sum4,rs_sum8;unfold rs_sum in Hmap;cbn[map fold_right]in Hmap.
 replace (0+rs_s32(c0+w0+w1)+rs_s32(c1+w2+w3)+rs_s32(c2+w4+w5)+rs_s32(c3+w6+w7))with(rs_s32(c0+w0+w1)+(rs_s32(c1+w2+w3)+(rs_s32(c2+w4+w5)+(rs_s32(c3+w6+w7)+0))))by ring.
 rewrite Hmap;f_equal;lia. Qed.
Lemma rs_reduce4 : forall (c0:Z) (c1:Z) (c2:Z) (c3:Z),
 -2147483648<=c0<=2147483647 -> -2147483648<=c1<=2147483647 -> -2147483648<=c2<=2147483647 -> -2147483648<=c3<=2147483647 ->
 rs_add_s32 (rs_add_s32 (rs_add_s32 (rs_add_s32 (0) c0) c1) c2) c3=rs_s32(rs_sum4 c0 c1 c2 c3).
Proof. intros;change(rs_fold_s32 0 [c0;c1;c2;c3]=rs_s32(rs_sum4 c0 c1 c2 c3));rewrite rs_fold_s32_sum by (repeat constructor;lia);unfold rs_sum,rs_sum4;cbn[fold_right];f_equal;lia. Qed.
Print Assumptions rs_sum_map_s32.
Print Assumptions rs_mod16_positive.
Print Assumptions rs_count16_next.
Print Assumptions rs_rem2048_bound.
Print Assumptions rs_rem2048_sub.
Print Assumptions rs_mod16_sub.
Print Assumptions rs_mod16_add.
Print Assumptions rs_rem2048_small.
Print Assumptions rs_count16_multiple.
Print Assumptions rs_sum8_pair_step.
Print Assumptions rs_sum4_pair_step.
Print Assumptions rs_reduce4.

Lemma rs_chunk16_values : forall A idx,rs_chunk A idx 16=rs_sum [Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;Znth(idx+10)A 0;Znth(idx+11)A 0;Znth(idx+12)A 0;Znth(idx+13)A 0;Znth(idx+14)A 0;Znth(idx+15)A 0].
Proof. intros;cbn[rs_chunk rs_sum fold_right Z.of_nat Pos.of_succ_nat Pos.succ];ring. Qed.
Lemma rs_prefix16_values : forall A idx,0<=idx -> idx+16<=Zlength A ->
 rs_prefix A(idx+16)=rs_prefix A idx+rs_sum [Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;Znth(idx+10)A 0;Znth(idx+11)A 0;Znth(idx+12)A 0;Znth(idx+13)A 0;Znth(idx+14)A 0;Znth(idx+15)A 0].
Proof. intros;pose proof(rs_prefix_chunk 16 A idx H H0)as Hstep;rewrite rs_chunk16_values in Hstep;exact Hstep. Qed.
Print Assumptions rs_chunk16_values.
Print Assumptions rs_prefix16_values.
