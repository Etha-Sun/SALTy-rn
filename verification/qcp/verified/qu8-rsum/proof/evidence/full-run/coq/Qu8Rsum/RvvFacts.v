From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Export RvvProgramModel VectorFacts PrefixFacts.
Import ListNotations.
Local Open Scope Z_scope.
Lemma rs_u32_idem : forall x,rs_u32(rs_u32 x)=rs_u32 x.
Proof. intros;apply rs_u32_in_range;apply rs_u32_bound. Qed.
Lemma rs_sum_map_u32 : forall L,rs_u32(rs_sum(map rs_u32 L))=rs_u32(rs_sum L).
Proof.
 induction L as[|x xs IH];[reflexivity|].
 change(rs_u32(rs_u32 x+rs_sum(map rs_u32 xs))=rs_u32(x+rs_sum xs)).
 rewrite rs_u32_add_l.
 rewrite <- (rs_u32_add_r x (rs_sum(map rs_u32 xs))).
 rewrite IH;apply rs_u32_add_r.
Qed.
Lemma rs_sum_zipadd : forall A B,
 length A=length B ->
 rs_sum(map (fun p=>fst p+snd p)(combine A B))=rs_sum A+rs_sum B.
Proof. induction A;intros B H;destruct B;simpl in *;try discriminate;[reflexivity|].
 change(a+z+rs_sum(map(fun p=>fst p+snd p)(combine A B))=a+rs_sum A+(z+rs_sum B)).
 rewrite IHA by lia;lia.
Qed.
Lemma rs_u32_zipadd : forall A B,
 length A=length B ->
 rs_u32(rs_sum(map(fun p=>rs_u32(fst p+snd p))(combine A B)))=rs_u32(rs_sum A+rs_sum B).
Proof.
 intros A B H;rewrite <-map_map;rewrite rs_sum_map_u32.
 rewrite rs_sum_zipadd by exact H;reflexivity.
Qed.
Lemma rs_read_splat : forall i vl k A,
 rs_splat_u32(rs_read_lane i vl k A)i vl=rs_read_lane i vl k A.
Proof. intros;unfold rs_splat_u32,rs_read_lane;destruct(Z.ltb i vl);reflexivity. Qed.
Lemma rs_active_read_add : forall a i vl k A,
 0<=a<=4294967295 -> 0<=rs_read_lane i vl k A<=4294967295 ->
 rs_active_u32 a (rs_splat_u32(rs_read_lane i vl k A)i vl)i vl=
 rs_u32(a+rs_read_lane i vl k A).
Proof.
 intros a i vl k A Ha Hb;rewrite rs_read_splat;unfold rs_active_u32.
 destruct(Z.ltb i vl)eqn:H.
 - apply rs_add_u32_wrap;assumption.
 - unfold rs_read_lane;rewrite H,Z.add_0_r;symmetry;apply rs_u32_in_range;exact Ha.
Qed.
Lemma rs_fold_u32_zero_sum : forall L,
 Forall(fun x=>0<=x<=4294967295)L -> rs_fold_u32 0 L=rs_u32(rs_sum L).
Proof. intros L H;rewrite rs_fold_u32_sum by (try exact H;lia);f_equal;lia. Qed.
Lemma rs_initial_add : forall init sum,
 0<=init<=4294967295 -> 0<=sum<=4294967295 ->
 unsigned_last_nbits(init+sum)32=rs_u32(init+sum).
Proof. reflexivity. Qed.
Print Assumptions rs_u32_idem.
Print Assumptions rs_sum_map_u32.
Print Assumptions rs_sum_zipadd.
Print Assumptions rs_u32_zipadd.
Print Assumptions rs_read_splat.
Print Assumptions rs_active_read_add.
Print Assumptions rs_fold_u32_zero_sum.
Print Assumptions rs_initial_add.

Fixpoint rs_read_sum(A:list Z)(idx vl:Z)(k:nat):Z :=
 match k with O=>0|S j=>rs_read_sum A idx vl j+rs_read_lane(Z.of_nat j)vl idx A end.
Lemma rs_read_sum_chunk : forall k A idx vl,
 0<=vl -> rs_read_sum A idx vl k=rs_chunk A idx (Nat.min k (Z.to_nat vl)).
Proof.
 induction k as[|k IH];intros A idx vl Hv;[reflexivity|].
 cbn[rs_read_sum];rewrite IH by exact Hv;unfold rs_read_lane.
 destruct(Z.ltb_spec(Z.of_nat k)vl).
 - replace(Nat.min k(Z.to_nat vl))with k by lia.
   replace(Nat.min(S k)(Z.to_nat vl))with(S k)by lia;reflexivity.
 - replace(Nat.min k(Z.to_nat vl))with(Z.to_nat vl)by lia.
   replace(Nat.min(S k)(Z.to_nat vl))with(Z.to_nat vl)by lia;lia.
Qed.
Lemma rs_read_sum32_prefix : forall A idx vl,
 0<=idx -> 0<=vl<=32 -> idx+vl<=Zlength A ->
 rs_prefix A(idx+vl)=rs_prefix A idx+rs_read_sum A idx vl 32.
Proof.
 intros A idx vl Hi Hv Hlen;rewrite rs_read_sum_chunk by lia.
 replace(Nat.min 32(Z.to_nat vl))with(Z.to_nat vl)by lia.
 rewrite <- (rs_prefix_chunk(Z.to_nat vl)A idx)by lia.
 replace(idx+Z.of_nat(Z.to_nat vl))with(idx+vl)by lia;reflexivity.
Qed.
Print Assumptions rs_read_sum_chunk.
Print Assumptions rs_read_sum32_prefix.

Lemma rs_acc_update_total : forall (c0:Z) (c1:Z) (c2:Z) (c3:Z) (c4:Z) (c5:Z) (c6:Z) (c7:Z) (c8:Z) (c9:Z) (c10:Z) (c11:Z) (c12:Z) (c13:Z) (c14:Z) (c15:Z) (c16:Z) (c17:Z) (c18:Z) (c19:Z) (c20:Z) (c21:Z) (c22:Z) (c23:Z) (c24:Z) (c25:Z) (c26:Z) (c27:Z) (c28:Z) (c29:Z) (c30:Z) (c31:Z) (A:list Z)(idx vl:Z),
 0<=c0<=4294967295 ->
 0<=c1<=4294967295 ->
 0<=c2<=4294967295 ->
 0<=c3<=4294967295 ->
 0<=c4<=4294967295 ->
 0<=c5<=4294967295 ->
 0<=c6<=4294967295 ->
 0<=c7<=4294967295 ->
 0<=c8<=4294967295 ->
 0<=c9<=4294967295 ->
 0<=c10<=4294967295 ->
 0<=c11<=4294967295 ->
 0<=c12<=4294967295 ->
 0<=c13<=4294967295 ->
 0<=c14<=4294967295 ->
 0<=c15<=4294967295 ->
 0<=c16<=4294967295 ->
 0<=c17<=4294967295 ->
 0<=c18<=4294967295 ->
 0<=c19<=4294967295 ->
 0<=c20<=4294967295 ->
 0<=c21<=4294967295 ->
 0<=c22<=4294967295 ->
 0<=c23<=4294967295 ->
 0<=c24<=4294967295 ->
 0<=c25<=4294967295 ->
 0<=c26<=4294967295 ->
 0<=c27<=4294967295 ->
 0<=c28<=4294967295 ->
 0<=c29<=4294967295 ->
 0<=c30<=4294967295 ->
 0<=c31<=4294967295 ->
 0<=rs_read_lane 0 vl idx A<=4294967295 ->
 0<=rs_read_lane 1 vl idx A<=4294967295 ->
 0<=rs_read_lane 2 vl idx A<=4294967295 ->
 0<=rs_read_lane 3 vl idx A<=4294967295 ->
 0<=rs_read_lane 4 vl idx A<=4294967295 ->
 0<=rs_read_lane 5 vl idx A<=4294967295 ->
 0<=rs_read_lane 6 vl idx A<=4294967295 ->
 0<=rs_read_lane 7 vl idx A<=4294967295 ->
 0<=rs_read_lane 8 vl idx A<=4294967295 ->
 0<=rs_read_lane 9 vl idx A<=4294967295 ->
 0<=rs_read_lane 10 vl idx A<=4294967295 ->
 0<=rs_read_lane 11 vl idx A<=4294967295 ->
 0<=rs_read_lane 12 vl idx A<=4294967295 ->
 0<=rs_read_lane 13 vl idx A<=4294967295 ->
 0<=rs_read_lane 14 vl idx A<=4294967295 ->
 0<=rs_read_lane 15 vl idx A<=4294967295 ->
 0<=rs_read_lane 16 vl idx A<=4294967295 ->
 0<=rs_read_lane 17 vl idx A<=4294967295 ->
 0<=rs_read_lane 18 vl idx A<=4294967295 ->
 0<=rs_read_lane 19 vl idx A<=4294967295 ->
 0<=rs_read_lane 20 vl idx A<=4294967295 ->
 0<=rs_read_lane 21 vl idx A<=4294967295 ->
 0<=rs_read_lane 22 vl idx A<=4294967295 ->
 0<=rs_read_lane 23 vl idx A<=4294967295 ->
 0<=rs_read_lane 24 vl idx A<=4294967295 ->
 0<=rs_read_lane 25 vl idx A<=4294967295 ->
 0<=rs_read_lane 26 vl idx A<=4294967295 ->
 0<=rs_read_lane 27 vl idx A<=4294967295 ->
 0<=rs_read_lane 28 vl idx A<=4294967295 ->
 0<=rs_read_lane 29 vl idx A<=4294967295 ->
 0<=rs_read_lane 30 vl idx A<=4294967295 ->
 0<=rs_read_lane 31 vl idx A<=4294967295 ->
 rs_acc_total (rs_active_u32 c0 (rs_splat_u32(rs_read_lane 0 vl idx A)0 vl)0 vl) (rs_active_u32 c1 (rs_splat_u32(rs_read_lane 1 vl idx A)1 vl)1 vl) (rs_active_u32 c2 (rs_splat_u32(rs_read_lane 2 vl idx A)2 vl)2 vl) (rs_active_u32 c3 (rs_splat_u32(rs_read_lane 3 vl idx A)3 vl)3 vl) (rs_active_u32 c4 (rs_splat_u32(rs_read_lane 4 vl idx A)4 vl)4 vl) (rs_active_u32 c5 (rs_splat_u32(rs_read_lane 5 vl idx A)5 vl)5 vl) (rs_active_u32 c6 (rs_splat_u32(rs_read_lane 6 vl idx A)6 vl)6 vl) (rs_active_u32 c7 (rs_splat_u32(rs_read_lane 7 vl idx A)7 vl)7 vl) (rs_active_u32 c8 (rs_splat_u32(rs_read_lane 8 vl idx A)8 vl)8 vl) (rs_active_u32 c9 (rs_splat_u32(rs_read_lane 9 vl idx A)9 vl)9 vl) (rs_active_u32 c10 (rs_splat_u32(rs_read_lane 10 vl idx A)10 vl)10 vl) (rs_active_u32 c11 (rs_splat_u32(rs_read_lane 11 vl idx A)11 vl)11 vl) (rs_active_u32 c12 (rs_splat_u32(rs_read_lane 12 vl idx A)12 vl)12 vl) (rs_active_u32 c13 (rs_splat_u32(rs_read_lane 13 vl idx A)13 vl)13 vl) (rs_active_u32 c14 (rs_splat_u32(rs_read_lane 14 vl idx A)14 vl)14 vl) (rs_active_u32 c15 (rs_splat_u32(rs_read_lane 15 vl idx A)15 vl)15 vl) (rs_active_u32 c16 (rs_splat_u32(rs_read_lane 16 vl idx A)16 vl)16 vl) (rs_active_u32 c17 (rs_splat_u32(rs_read_lane 17 vl idx A)17 vl)17 vl) (rs_active_u32 c18 (rs_splat_u32(rs_read_lane 18 vl idx A)18 vl)18 vl) (rs_active_u32 c19 (rs_splat_u32(rs_read_lane 19 vl idx A)19 vl)19 vl) (rs_active_u32 c20 (rs_splat_u32(rs_read_lane 20 vl idx A)20 vl)20 vl) (rs_active_u32 c21 (rs_splat_u32(rs_read_lane 21 vl idx A)21 vl)21 vl) (rs_active_u32 c22 (rs_splat_u32(rs_read_lane 22 vl idx A)22 vl)22 vl) (rs_active_u32 c23 (rs_splat_u32(rs_read_lane 23 vl idx A)23 vl)23 vl) (rs_active_u32 c24 (rs_splat_u32(rs_read_lane 24 vl idx A)24 vl)24 vl) (rs_active_u32 c25 (rs_splat_u32(rs_read_lane 25 vl idx A)25 vl)25 vl) (rs_active_u32 c26 (rs_splat_u32(rs_read_lane 26 vl idx A)26 vl)26 vl) (rs_active_u32 c27 (rs_splat_u32(rs_read_lane 27 vl idx A)27 vl)27 vl) (rs_active_u32 c28 (rs_splat_u32(rs_read_lane 28 vl idx A)28 vl)28 vl) (rs_active_u32 c29 (rs_splat_u32(rs_read_lane 29 vl idx A)29 vl)29 vl) (rs_active_u32 c30 (rs_splat_u32(rs_read_lane 30 vl idx A)30 vl)30 vl) (rs_active_u32 c31 (rs_splat_u32(rs_read_lane 31 vl idx A)31 vl)31 vl)=rs_u32((rs_acc_total c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31)+rs_read_sum A idx vl 32).
Proof.
 intros;unfold rs_acc_total.
 repeat rewrite rs_active_read_add by assumption.
 replace (0+(rs_u32(c0+rs_read_lane 0 vl idx A))+(rs_u32(c1+rs_read_lane 1 vl idx A))+(rs_u32(c2+rs_read_lane 2 vl idx A))+(rs_u32(c3+rs_read_lane 3 vl idx A))+(rs_u32(c4+rs_read_lane 4 vl idx A))+(rs_u32(c5+rs_read_lane 5 vl idx A))+(rs_u32(c6+rs_read_lane 6 vl idx A))+(rs_u32(c7+rs_read_lane 7 vl idx A))+(rs_u32(c8+rs_read_lane 8 vl idx A))+(rs_u32(c9+rs_read_lane 9 vl idx A))+(rs_u32(c10+rs_read_lane 10 vl idx A))+(rs_u32(c11+rs_read_lane 11 vl idx A))+(rs_u32(c12+rs_read_lane 12 vl idx A))+(rs_u32(c13+rs_read_lane 13 vl idx A))+(rs_u32(c14+rs_read_lane 14 vl idx A))+(rs_u32(c15+rs_read_lane 15 vl idx A))+(rs_u32(c16+rs_read_lane 16 vl idx A))+(rs_u32(c17+rs_read_lane 17 vl idx A))+(rs_u32(c18+rs_read_lane 18 vl idx A))+(rs_u32(c19+rs_read_lane 19 vl idx A))+(rs_u32(c20+rs_read_lane 20 vl idx A))+(rs_u32(c21+rs_read_lane 21 vl idx A))+(rs_u32(c22+rs_read_lane 22 vl idx A))+(rs_u32(c23+rs_read_lane 23 vl idx A))+(rs_u32(c24+rs_read_lane 24 vl idx A))+(rs_u32(c25+rs_read_lane 25 vl idx A))+(rs_u32(c26+rs_read_lane 26 vl idx A))+(rs_u32(c27+rs_read_lane 27 vl idx A))+(rs_u32(c28+rs_read_lane 28 vl idx A))+(rs_u32(c29+rs_read_lane 29 vl idx A))+(rs_u32(c30+rs_read_lane 30 vl idx A))+(rs_u32(c31+rs_read_lane 31 vl idx A)))with(rs_sum(map rs_u32 [c0+rs_read_lane 0 vl idx A;c1+rs_read_lane 1 vl idx A;c2+rs_read_lane 2 vl idx A;c3+rs_read_lane 3 vl idx A;c4+rs_read_lane 4 vl idx A;c5+rs_read_lane 5 vl idx A;c6+rs_read_lane 6 vl idx A;c7+rs_read_lane 7 vl idx A;c8+rs_read_lane 8 vl idx A;c9+rs_read_lane 9 vl idx A;c10+rs_read_lane 10 vl idx A;c11+rs_read_lane 11 vl idx A;c12+rs_read_lane 12 vl idx A;c13+rs_read_lane 13 vl idx A;c14+rs_read_lane 14 vl idx A;c15+rs_read_lane 15 vl idx A;c16+rs_read_lane 16 vl idx A;c17+rs_read_lane 17 vl idx A;c18+rs_read_lane 18 vl idx A;c19+rs_read_lane 19 vl idx A;c20+rs_read_lane 20 vl idx A;c21+rs_read_lane 21 vl idx A;c22+rs_read_lane 22 vl idx A;c23+rs_read_lane 23 vl idx A;c24+rs_read_lane 24 vl idx A;c25+rs_read_lane 25 vl idx A;c26+rs_read_lane 26 vl idx A;c27+rs_read_lane 27 vl idx A;c28+rs_read_lane 28 vl idx A;c29+rs_read_lane 29 vl idx A;c30+rs_read_lane 30 vl idx A;c31+rs_read_lane 31 vl idx A]))by(cbn[rs_sum fold_right map];ring).
 rewrite rs_sum_map_u32,rs_u32_add_l;f_equal;cbn[rs_sum fold_right map rs_read_sum Z.of_nat Pos.of_succ_nat Pos.succ];ring.
Qed.
Print Assumptions rs_acc_update_total.

Lemma rs_active_full : forall a b i vl,
 i<vl -> rs_active_u32 a b i vl=rs_add_u32 a b.
Proof. intros;unfold rs_active_u32;destruct(Z.ltb_spec i vl);[reflexivity|lia]. Qed.
Lemma rs_add_u32_bound : forall a b,
 0<=a<=4294967295 -> 0<=b<=4294967295 -> 0<=rs_add_u32 a b<=4294967295.
Proof. intros;rewrite rs_add_u32_wrap by assumption;apply rs_u32_bound. Qed.
Ltac rs_reduce_range := lazymatch goal with
 | |-0<=rs_add_u32 ?a ?b<=4294967295=>apply rs_add_u32_bound;[rs_reduce_range|rs_reduce_range]
 | _=>lia end.
Print Assumptions rs_active_full.
Print Assumptions rs_add_u32_bound.
Lemma rs_reduction_total : forall (c0:Z) (c1:Z) (c2:Z) (c3:Z) (c4:Z) (c5:Z) (c6:Z) (c7:Z) (c8:Z) (c9:Z) (c10:Z) (c11:Z) (c12:Z) (c13:Z) (c14:Z) (c15:Z) (c16:Z) (c17:Z) (c18:Z) (c19:Z) (c20:Z) (c21:Z) (c22:Z) (c23:Z) (c24:Z) (c25:Z) (c26:Z) (c27:Z) (c28:Z) (c29:Z) (c30:Z) (c31:Z),
 0<=c0<=4294967295 ->
 0<=c1<=4294967295 ->
 0<=c2<=4294967295 ->
 0<=c3<=4294967295 ->
 0<=c4<=4294967295 ->
 0<=c5<=4294967295 ->
 0<=c6<=4294967295 ->
 0<=c7<=4294967295 ->
 0<=c8<=4294967295 ->
 0<=c9<=4294967295 ->
 0<=c10<=4294967295 ->
 0<=c11<=4294967295 ->
 0<=c12<=4294967295 ->
 0<=c13<=4294967295 ->
 0<=c14<=4294967295 ->
 0<=c15<=4294967295 ->
 0<=c16<=4294967295 ->
 0<=c17<=4294967295 ->
 0<=c18<=4294967295 ->
 0<=c19<=4294967295 ->
 0<=c20<=4294967295 ->
 0<=c21<=4294967295 ->
 0<=c22<=4294967295 ->
 0<=c23<=4294967295 ->
 0<=c24<=4294967295 ->
 0<=c25<=4294967295 ->
 0<=c26<=4294967295 ->
 0<=c27<=4294967295 ->
 0<=c28<=4294967295 ->
 0<=c29<=4294967295 ->
 0<=c30<=4294967295 ->
 0<=c31<=4294967295 ->
 rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (rs_active_u32 (0) c0 0 32) c1 1 32) c2 2 32) c3 3 32) c4 4 32) c5 5 32) c6 6 32) c7 7 32) c8 8 32) c9 9 32) c10 10 32) c11 11 32) c12 12 32) c13 13 32) c14 14 32) c15 15 32) c16 16 32) c17 17 32) c18 18 32) c19 19 32) c20 20 32) c21 21 32) c22 22 32) c23 23 32) c24 24 32) c25 25 32) c26 26 32) c27 27 32) c28 28 32) c29 29 32) c30 30 32) c31 31 32=rs_acc_total c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31.
Proof.
 intros;repeat rewrite rs_active_full by lia.
 repeat rewrite rs_add_u32_wrap by rs_reduce_range.
 repeat first[progress rewrite <-Z.add_assoc|progress rewrite rs_u32_add_l].
 unfold rs_acc_total;f_equal;ring.
Qed.
Print Assumptions rs_reduction_total.
