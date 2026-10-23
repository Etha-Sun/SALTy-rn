From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From FullU8 Require Import U8Logic U8KernelLogic Packed32Model CodecProof VectorBridge LoadObservation.
Import ListNotations.
Local Open Scope Z_scope.
Definition words32(f:Z->Z):list Z := [f 0;f 1;f 2;f 3;f 4;f 5;f 6;f 7;f 8;f 9;f 10;f 11;f 12;f 13;f 14;f 15;f 16;f 17;f 18;f 19;f 20;f 21;f 22;f 23;f 24;f 25;f 26;f 27;f 28;f 29;f 30;f 31].
Lemma words32_nth : forall f wi,0<=wi<32 ->Znth wi(words32 f)0=f wi.
Proof.
 intros f wi Hwi;assert(Hcases:wi=0\/wi=1\/wi=2\/wi=3\/wi=4\/wi=5\/wi=6\/wi=7\/wi=8\/wi=9\/wi=10\/wi=11\/wi=12\/wi=13\/wi=14\/wi=15\/wi=16\/wi=17\/wi=18\/wi=19\/wi=20\/wi=21\/wi=22\/wi=23\/wi=24\/wi=25\/wi=26\/wi=27\/wi=28\/wi=29\/wi=30\/wi=31)by lia.
 repeat destruct Hcases as[Hcases|Hcases];subst wi;reflexivity.
Qed.
Lemma Znth_map_in : forall(f:Z->Z)A i,0<=i<Zlength A ->
 Znth i(map f A)0=f(Znth i A 0).
Proof.
 intros f A i Hi;unfold Znth.
 rewrite(@nth_indep Z (map f A)(Z.to_nat i)0(f 0))by(rewrite map_length;rewrite Zlength_correct in Hi;lia).
 rewrite map_nth;reflexivity.
Qed.
Lemma Zlength_map_int : forall(f:Z->Z)A,Zlength(map f A)=Zlength A.
Proof. intros;rewrite !Zlength_correct,map_length;reflexivity. Qed.
Lemma nested_sublist : forall(A:list Z)lo hi i j,
 0<=lo<=hi ->hi<=Zlength A ->0<=i<=j ->j<=hi-lo ->
 sublist i j(sublist lo hi A)=sublist(lo+i)(lo+j)A.
Proof.
 intros A lo hi i j Hlo Hhi Hij Hj.
 assert(Hinner:Zlength(sublist lo hi A)=hi-lo)by(apply Zlength_sublist;lia).
 apply(proj2(list_eq_ext _ _ 0));split.
 - rewrite !Zlength_sublist by lia;lia.
 - intros k Hk;rewrite Zlength_sublist in Hk by lia.
   rewrite !Znth_sublist by lia;f_equal;lia.
Qed.
Lemma packed_prefix_list : forall A lo hi vl,
 0<=lo<=255 ->0<=hi<=255 ->0<=vl<=128 ->vl<=Zlength A ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->
 sublist 0 vl(vec_bytes (words32(fun wi=>word_min(word_max(word_load A vl wi)lo vl wi)hi vl wi)))=u8_prefix_list lo hi(sublist 0 vl A).
Proof.
 intros A lo hi vl Hlo Hhi Hvl Hlen Hb.
 assert(Hvec:Zlength(vec_bytes (words32(fun wi=>word_min(word_max(word_load A vl wi)lo vl wi)hi vl wi)))=128)by(rewrite Zlength_correct,vec_bytes_length;reflexivity).
 apply(proj2(list_eq_ext _ _ 0));split.
 - unfold u8_prefix_list;rewrite Zlength_map_int.
   rewrite !Zlength_sublist0 by lia;reflexivity.
 - intros i Hi;rewrite Zlength_sublist0 in Hi by lia.
   rewrite Znth_sublist0 by lia.
   unfold u8_prefix_list;rewrite Znth_map_in by(rewrite Zlength_sublist0 by lia;lia).
   rewrite Znth_sublist0 by lia.
   eapply(vec_bytes_prefix_active (words32(fun wi=>word_load A vl wi)) (words32(fun wi=>word_max(word_load A vl wi)lo vl wi)) (words32(fun wi=>word_min(word_max(word_load A vl wi)lo vl wi)hi vl wi)) A lo hi vl i);try assumption;try lia.
   all:intros wi Hwi;rewrite !words32_nth by lia;reflexivity.
Qed.
Print Assumptions packed_prefix_list.
Lemma packed_suffix_list : forall A lo hi vl,
 0<=lo<=255 ->0<=hi<=255 ->0<=vl<=128 ->vl<=Zlength A ->
 (forall j,0<=j<vl ->0<=Znth j A 0<=255) ->
 sublist 0 vl(vec_bytes (words32(fun wi=>word_max(word_min(word_load A vl wi)hi vl wi)lo vl wi)))=u8_suffix_list lo hi(sublist 0 vl A).
Proof.
 intros A lo hi vl Hlo Hhi Hvl Hlen Hb.
 assert(Hvec:Zlength(vec_bytes (words32(fun wi=>word_max(word_min(word_load A vl wi)hi vl wi)lo vl wi)))=128)by(rewrite Zlength_correct,vec_bytes_length;reflexivity).
 apply(proj2(list_eq_ext _ _ 0));split.
 - unfold u8_suffix_list;rewrite Zlength_map_int.
   rewrite !Zlength_sublist0 by lia;reflexivity.
 - intros i Hi;rewrite Zlength_sublist0 in Hi by lia.
   rewrite Znth_sublist0 by lia.
   unfold u8_suffix_list;rewrite Znth_map_in by(rewrite Zlength_sublist0 by lia;lia).
   rewrite Znth_sublist0 by lia.
   eapply(vec_bytes_suffix_active (words32(fun wi=>word_load A vl wi)) (words32(fun wi=>word_min(word_load A vl wi)hi vl wi)) (words32(fun wi=>word_max(word_min(word_load A vl wi)hi vl wi)lo vl wi)) A lo hi vl i);try assumption;try lia.
   all:intros wi Hwi;rewrite !words32_nth by lia;reflexivity.
Qed.
Print Assumptions packed_suffix_list.
Print Assumptions words32_nth.
Print Assumptions Znth_map_in.
