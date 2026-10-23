From Coq Require Import ZArith Lia List.
From S8Clamp Require Import Model Types NeonStoreModel.
Import ListNotations.
Local Open Scope Z_scope.

Definition s8_bulk_prefix (k lo hi:Z) (A:list Z) : list Z :=
 map (fun x => s8_bulk_lane x lo hi) (firstn (Z.to_nat k) A).
Definition s8_tail_prefix (n r lo hi:Z) (A:list Z) : list Z :=
 s8_bulk_prefix (s8_bulk_count n) lo hi A ++
 map (fun x => s8_tail_lane x lo hi)
  (firstn (Z.to_nat r) (skipn (Z.to_nat (s8_bulk_count n)) A)).
Definition s8_window (k r:Z) (A:list Z) : list Z :=
 firstn (Z.to_nat r) (skipn (Z.to_nat k) A).

Lemma s8_firstn_add : forall (T:Type) (k r:nat) (A:list T),
 firstn (k+r) A=firstn k A++firstn r (skipn k A).
Proof.
 intros T k;induction k;intros r A;[reflexivity|].
 destruct A;cbn;[now rewrite firstn_nil|now rewrite IHk].
Qed.
Lemma s8_window_length : forall k r A,
 0<=k -> 0<=r -> k+r<=Zlength A -> length(s8_window k r A)=Z.to_nat r.
Proof.
 intros k r A Hk Hr Hbound. unfold s8_window.
 rewrite firstn_length,skipn_length,Nat.min_l;[reflexivity|].
 rewrite Zlength_correct in Hbound. lia.
Qed.
Lemma s8_window_Zlength : forall k r A,
 0<=k -> 0<=r -> k+r<=Zlength A -> Zlength(s8_window k r A)=r.
Proof. intros;rewrite Zlength_correct,s8_window_length by assumption;rewrite Z2Nat.id by assumption;reflexivity. Qed.
Lemma s8_Znth_map : forall (f:Z->Z) A i,
 0<=i<Zlength A -> Znth i(map f A)0=f(Znth i A 0).
Proof.
 intros f A i Hi. unfold Znth.
 rewrite (@List.nth_indep Z (map f A) (Z.to_nat i) 0 (f 0)).
 - apply List.map_nth.
 - rewrite map_length. rewrite Zlength_correct in Hi;lia.
Qed.
Lemma s8_window_nth : forall k r A i,
 0<=k -> 0<=i<r -> k+r<=Zlength A ->
 Znth i(s8_window k r A)0=Znth(k+i)A 0.
Proof.
 intros k r A i Hk Hi Hbound. unfold s8_window,Znth.
 rewrite List.nth_firstn. destruct (Nat.ltb_spec (Z.to_nat i)(Z.to_nat r));[|lia].
 rewrite List.nth_skipn,Z2Nat.inj_add by lia. reflexivity.
Qed.
Lemma s8_map_window_nth : forall (f:Z->Z) k r A i,
 0<=k -> 0<=i<r -> k+r<=Zlength A ->
 Znth i(map f(s8_window k r A))0=f(Znth(k+i)A 0).
Proof.
 intros f k r A i Hk Hi Hb. rewrite s8_Znth_map.
 - now rewrite s8_window_nth.
 - rewrite s8_window_Zlength by lia;lia.
Qed.
Lemma s8_window_append : forall (f:Z->Z) k r t A,
 0<=k -> 0<=r -> 0<=t -> k+r+t<=Zlength A ->
 map f(s8_window k(r+t)A)=map f(s8_window k r A)++map f(s8_window(k+r)t A).
Proof.
 intros f k r t A Hk Hr Ht Hb. unfold s8_window.
 rewrite Z2Nat.inj_add by lia. rewrite s8_firstn_add,map_app.
 f_equal. rewrite skipn_skipn,Z2Nat.inj_add by lia.
 replace (Z.to_nat r+Z.to_nat k)%nat with (Z.to_nat k+Z.to_nat r)%nat by lia.
 reflexivity.
Qed.
Lemma s8_bulk_prefix_zero : forall lo hi A,s8_bulk_prefix 0 lo hi A=[].
Proof. reflexivity. Qed.
Lemma s8_bulk_prefix_length : forall k lo hi A,
 0<=k<=Zlength A -> Zlength(s8_bulk_prefix k lo hi A)=k.
Proof.
 intros k lo hi A H. unfold s8_bulk_prefix.
 rewrite Zlength_correct,map_length,firstn_length,Nat.min_l.
 - rewrite Z2Nat.id by lia;reflexivity.
 - rewrite Zlength_correct in H;lia.
Qed.
Lemma s8_bulk_prefix_nth : forall k lo hi A i,
 0<=i<k -> k<=Zlength A ->
 Znth i(s8_bulk_prefix k lo hi A)0=s8_bulk_lane(Znth i A 0)lo hi.
Proof.
 intros k lo hi A i Hi Hb. unfold s8_bulk_prefix. rewrite s8_Znth_map.
 - unfold Znth. rewrite List.nth_firstn. destruct(Nat.ltb_spec(Z.to_nat i)(Z.to_nat k));[reflexivity|lia].
 - rewrite Zlength_correct,firstn_length,Nat.min_l;rewrite Zlength_correct in Hb;lia.
Qed.
Lemma s8_bulk_prefix_append : forall k r lo hi A,
 0<=k -> 0<=r -> k+r<=Zlength A ->
 s8_bulk_prefix(k+r)lo hi A=s8_bulk_prefix k lo hi A++
 map(fun x=>s8_bulk_lane x lo hi)(s8_window k r A).
Proof. intros;unfold s8_bulk_prefix,s8_window;rewrite Z2Nat.inj_add by lia;rewrite s8_firstn_add,map_app;reflexivity. Qed.
Lemma s8_tail_prefix_zero : forall n lo hi A,
 s8_tail_prefix n 0 lo hi A=s8_bulk_prefix(s8_bulk_count n)lo hi A.
Proof. intros;unfold s8_tail_prefix;cbn;rewrite app_nil_r;reflexivity. Qed.
Lemma s8_tail_prefix_full : forall n lo hi A,
 s8_tail_prefix n(n mod 64)lo hi A=s8_values n lo hi A.
Proof. reflexivity. Qed.
Lemma s8_tail_prefix_length : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r<=Zlength A ->
 Zlength(s8_tail_prefix n r lo hi A)=s8_bulk_count n+r.
Proof.
 intros n r lo hi A Hn Hr Hb. pose proof(s8_bulk_count_bounds n Hn)as Hbc.
 unfold s8_tail_prefix. rewrite Zlength_app,s8_bulk_prefix_length by lia.
 change (s8_bulk_count n+Zlength(map(fun x=>s8_tail_lane x lo hi)(s8_window(s8_bulk_count n)r A))=s8_bulk_count n+r).
 rewrite Zlength_correct,map_length,s8_window_length by lia.
 rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma s8_values_length : forall n lo hi A,
 0<=n<=Zlength A -> Zlength(s8_values n lo hi A)=n.
Proof.
 intros n lo hi A Hn. rewrite <-s8_tail_prefix_full.
 rewrite s8_tail_prefix_length;unfold s8_bulk_count;pose proof(Z.mod_pos_bound n 64 ltac:(lia));lia.
Qed.
Lemma s8_tail_prefix_append : forall n r t lo hi A,
 0<=n -> 0<=r -> 0<=t -> s8_bulk_count n+r+t<=Zlength A ->
 s8_tail_prefix n(r+t)lo hi A=s8_tail_prefix n r lo hi A++
 map(fun x=>s8_tail_lane x lo hi)(s8_window(s8_bulk_count n+r)t A).
Proof.
 intros n r t lo hi A Hn Hr Ht Hb. pose proof(s8_bulk_count_bounds n Hn)as Hbc.
 unfold s8_tail_prefix.
 change (s8_bulk_prefix(s8_bulk_count n)lo hi A++map(fun x=>s8_tail_lane x lo hi)(s8_window(s8_bulk_count n)(r+t)A)=
 (s8_bulk_prefix(s8_bulk_count n)lo hi A++map(fun x=>s8_tail_lane x lo hi)(s8_window(s8_bulk_count n)r A))++map(fun x=>s8_tail_lane x lo hi)(s8_window(s8_bulk_count n+r)t A)).
 rewrite s8_window_append by lia;rewrite app_assoc;reflexivity.
Qed.
Lemma s8_tail_prefix_nth_bulk : forall n r lo hi A i,
 0<=n -> 0<=r -> s8_bulk_count n+r<=Zlength A -> 0<=i<s8_bulk_count n ->
 Znth i(s8_tail_prefix n r lo hi A)0=s8_bulk_lane(Znth i A 0)lo hi.
Proof.
 intros n r lo hi A i Hn Hr Hb Hi. pose proof(s8_bulk_count_bounds n Hn)as Hbc.
 unfold s8_tail_prefix. rewrite app_Znth1.
 - apply s8_bulk_prefix_nth;lia.
 - rewrite s8_bulk_prefix_length by lia;lia.
Qed.
Lemma s8_tail_prefix_nth_tail : forall n r lo hi A i,
 0<=n -> 0<=r -> s8_bulk_count n+r<=Zlength A -> s8_bulk_count n<=i<s8_bulk_count n+r ->
 Znth i(s8_tail_prefix n r lo hi A)0=s8_tail_lane(Znth i A 0)lo hi.
Proof.
 intros n r lo hi A i Hn Hr Hb Hi. pose proof(s8_bulk_count_bounds n Hn)as Hbc.
 unfold s8_tail_prefix. rewrite app_Znth2.
 - rewrite s8_bulk_prefix_length by lia.
   change (Znth(i-s8_bulk_count n)(map(fun x=>s8_tail_lane x lo hi)(s8_window(s8_bulk_count n)r A))0=s8_tail_lane(Znth i A 0)lo hi).
   rewrite s8_map_window_nth by lia. replace(s8_bulk_count n+(i-s8_bulk_count n))with i by lia;reflexivity.
 - rewrite s8_bulk_prefix_length by lia;lia.
Qed.

Lemma s8_map_window_1 : forall(f:Z->Z)k A,
 0<=k -> k+1<=Zlength A -> map f(s8_window k 1 A)=[f(Znth(k+0)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <- (Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 1 A))0=nth i [f(Znth(k+0)A 0)]0).
   rewrite s8_map_window_nth by lia.
   do 1 (destruct i as[|i];[reflexivity|]);lia.
Qed.

Lemma s8_map_window_2 : forall(f:Z->Z)k A,
 0<=k -> k+2<=Zlength A -> map f(s8_window k 2 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <- (Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 2 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0)]0).
   rewrite s8_map_window_nth by lia.
   do 2 (destruct i as[|i];[reflexivity|]);lia.
Qed.

Lemma s8_map_window_4 : forall(f:Z->Z)k A,
 0<=k -> k+4<=Zlength A -> map f(s8_window k 4 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <- (Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 4 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0)]0).
   rewrite s8_map_window_nth by lia.
   do 4 (destruct i as[|i];[reflexivity|]);lia.
Qed.

Lemma s8_map_window_8 : forall(f:Z->Z)k A,
 0<=k -> k+8<=Zlength A -> map f(s8_window k 8 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0); f(Znth(k+7)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <- (Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 8 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0); f(Znth(k+7)A 0)]0).
   rewrite s8_map_window_nth by lia.
   do 8 (destruct i as[|i];[reflexivity|]);lia.
Qed.

Lemma s8_map_window_16 : forall(f:Z->Z)k A,
 0<=k -> k+16<=Zlength A -> map f(s8_window k 16 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0); f(Znth(k+7)A 0); f(Znth(k+8)A 0); f(Znth(k+9)A 0); f(Znth(k+10)A 0); f(Znth(k+11)A 0); f(Znth(k+12)A 0); f(Znth(k+13)A 0); f(Znth(k+14)A 0); f(Znth(k+15)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <- (Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 16 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0); f(Znth(k+7)A 0); f(Znth(k+8)A 0); f(Znth(k+9)A 0); f(Znth(k+10)A 0); f(Znth(k+11)A 0); f(Znth(k+12)A 0); f(Znth(k+13)A 0); f(Znth(k+14)A 0); f(Znth(k+15)A 0)]0).
   rewrite s8_map_window_nth by lia.
   do 16 (destruct i as[|i];[reflexivity|]);lia.
Qed.

Lemma s8_map_window_64 : forall(f:Z->Z)k A,
 0<=k -> k+64<=Zlength A -> map f(s8_window k 64 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0); f(Znth(k+7)A 0); f(Znth(k+8)A 0); f(Znth(k+9)A 0); f(Znth(k+10)A 0); f(Znth(k+11)A 0); f(Znth(k+12)A 0); f(Znth(k+13)A 0); f(Znth(k+14)A 0); f(Znth(k+15)A 0); f(Znth(k+16)A 0); f(Znth(k+17)A 0); f(Znth(k+18)A 0); f(Znth(k+19)A 0); f(Znth(k+20)A 0); f(Znth(k+21)A 0); f(Znth(k+22)A 0); f(Znth(k+23)A 0); f(Znth(k+24)A 0); f(Znth(k+25)A 0); f(Znth(k+26)A 0); f(Znth(k+27)A 0); f(Znth(k+28)A 0); f(Znth(k+29)A 0); f(Znth(k+30)A 0); f(Znth(k+31)A 0); f(Znth(k+32)A 0); f(Znth(k+33)A 0); f(Znth(k+34)A 0); f(Znth(k+35)A 0); f(Znth(k+36)A 0); f(Znth(k+37)A 0); f(Znth(k+38)A 0); f(Znth(k+39)A 0); f(Znth(k+40)A 0); f(Znth(k+41)A 0); f(Znth(k+42)A 0); f(Znth(k+43)A 0); f(Znth(k+44)A 0); f(Znth(k+45)A 0); f(Znth(k+46)A 0); f(Znth(k+47)A 0); f(Znth(k+48)A 0); f(Znth(k+49)A 0); f(Znth(k+50)A 0); f(Znth(k+51)A 0); f(Znth(k+52)A 0); f(Znth(k+53)A 0); f(Znth(k+54)A 0); f(Znth(k+55)A 0); f(Znth(k+56)A 0); f(Znth(k+57)A 0); f(Znth(k+58)A 0); f(Znth(k+59)A 0); f(Znth(k+60)A 0); f(Znth(k+61)A 0); f(Znth(k+62)A 0); f(Znth(k+63)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <- (Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 64 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0); f(Znth(k+7)A 0); f(Znth(k+8)A 0); f(Znth(k+9)A 0); f(Znth(k+10)A 0); f(Znth(k+11)A 0); f(Znth(k+12)A 0); f(Znth(k+13)A 0); f(Znth(k+14)A 0); f(Znth(k+15)A 0); f(Znth(k+16)A 0); f(Znth(k+17)A 0); f(Znth(k+18)A 0); f(Znth(k+19)A 0); f(Znth(k+20)A 0); f(Znth(k+21)A 0); f(Znth(k+22)A 0); f(Znth(k+23)A 0); f(Znth(k+24)A 0); f(Znth(k+25)A 0); f(Znth(k+26)A 0); f(Znth(k+27)A 0); f(Znth(k+28)A 0); f(Znth(k+29)A 0); f(Znth(k+30)A 0); f(Znth(k+31)A 0); f(Znth(k+32)A 0); f(Znth(k+33)A 0); f(Znth(k+34)A 0); f(Znth(k+35)A 0); f(Znth(k+36)A 0); f(Znth(k+37)A 0); f(Znth(k+38)A 0); f(Znth(k+39)A 0); f(Znth(k+40)A 0); f(Znth(k+41)A 0); f(Znth(k+42)A 0); f(Znth(k+43)A 0); f(Znth(k+44)A 0); f(Znth(k+45)A 0); f(Znth(k+46)A 0); f(Znth(k+47)A 0); f(Znth(k+48)A 0); f(Znth(k+49)A 0); f(Znth(k+50)A 0); f(Znth(k+51)A 0); f(Znth(k+52)A 0); f(Znth(k+53)A 0); f(Znth(k+54)A 0); f(Znth(k+55)A 0); f(Znth(k+56)A 0); f(Znth(k+57)A 0); f(Znth(k+58)A 0); f(Znth(k+59)A 0); f(Znth(k+60)A 0); f(Znth(k+61)A 0); f(Znth(k+62)A 0); f(Znth(k+63)A 0)]0).
   rewrite s8_map_window_nth by lia.
   do 64 (destruct i as[|i];[reflexivity|]);lia.
Qed.

Lemma s8_bulk_prefix_append1_list : forall k lo hi A,
 0<=k -> k+1<=Zlength A -> s8_bulk_prefix(k+1)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi].
Proof. intros;rewrite s8_bulk_prefix_append by lia;rewrite s8_map_window_1 by lia;reflexivity. Qed.

Lemma s8_bulk_prefix_append2_list : forall k lo hi A,
 0<=k -> k+2<=Zlength A -> s8_bulk_prefix(k+2)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi].
Proof. intros;rewrite s8_bulk_prefix_append by lia;rewrite s8_map_window_2 by lia;reflexivity. Qed.

Lemma s8_bulk_prefix_append4_list : forall k lo hi A,
 0<=k -> k+4<=Zlength A -> s8_bulk_prefix(k+4)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi; s8_bulk_lane(Znth(k+2)A 0)lo hi; s8_bulk_lane(Znth(k+3)A 0)lo hi].
Proof. intros;rewrite s8_bulk_prefix_append by lia;rewrite s8_map_window_4 by lia;reflexivity. Qed.

Lemma s8_bulk_prefix_append8_list : forall k lo hi A,
 0<=k -> k+8<=Zlength A -> s8_bulk_prefix(k+8)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi; s8_bulk_lane(Znth(k+2)A 0)lo hi; s8_bulk_lane(Znth(k+3)A 0)lo hi; s8_bulk_lane(Znth(k+4)A 0)lo hi; s8_bulk_lane(Znth(k+5)A 0)lo hi; s8_bulk_lane(Znth(k+6)A 0)lo hi; s8_bulk_lane(Znth(k+7)A 0)lo hi].
Proof. intros;rewrite s8_bulk_prefix_append by lia;rewrite s8_map_window_8 by lia;reflexivity. Qed.

Lemma s8_bulk_prefix_append16_list : forall k lo hi A,
 0<=k -> k+16<=Zlength A -> s8_bulk_prefix(k+16)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi; s8_bulk_lane(Znth(k+2)A 0)lo hi; s8_bulk_lane(Znth(k+3)A 0)lo hi; s8_bulk_lane(Znth(k+4)A 0)lo hi; s8_bulk_lane(Znth(k+5)A 0)lo hi; s8_bulk_lane(Znth(k+6)A 0)lo hi; s8_bulk_lane(Znth(k+7)A 0)lo hi; s8_bulk_lane(Znth(k+8)A 0)lo hi; s8_bulk_lane(Znth(k+9)A 0)lo hi; s8_bulk_lane(Znth(k+10)A 0)lo hi; s8_bulk_lane(Znth(k+11)A 0)lo hi; s8_bulk_lane(Znth(k+12)A 0)lo hi; s8_bulk_lane(Znth(k+13)A 0)lo hi; s8_bulk_lane(Znth(k+14)A 0)lo hi; s8_bulk_lane(Znth(k+15)A 0)lo hi].
Proof. intros;rewrite s8_bulk_prefix_append by lia;rewrite s8_map_window_16 by lia;reflexivity. Qed.

Lemma s8_bulk_prefix_append64_list : forall k lo hi A,
 0<=k -> k+64<=Zlength A -> s8_bulk_prefix(k+64)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi; s8_bulk_lane(Znth(k+2)A 0)lo hi; s8_bulk_lane(Znth(k+3)A 0)lo hi; s8_bulk_lane(Znth(k+4)A 0)lo hi; s8_bulk_lane(Znth(k+5)A 0)lo hi; s8_bulk_lane(Znth(k+6)A 0)lo hi; s8_bulk_lane(Znth(k+7)A 0)lo hi; s8_bulk_lane(Znth(k+8)A 0)lo hi; s8_bulk_lane(Znth(k+9)A 0)lo hi; s8_bulk_lane(Znth(k+10)A 0)lo hi; s8_bulk_lane(Znth(k+11)A 0)lo hi; s8_bulk_lane(Znth(k+12)A 0)lo hi; s8_bulk_lane(Znth(k+13)A 0)lo hi; s8_bulk_lane(Znth(k+14)A 0)lo hi; s8_bulk_lane(Znth(k+15)A 0)lo hi; s8_bulk_lane(Znth(k+16)A 0)lo hi; s8_bulk_lane(Znth(k+17)A 0)lo hi; s8_bulk_lane(Znth(k+18)A 0)lo hi; s8_bulk_lane(Znth(k+19)A 0)lo hi; s8_bulk_lane(Znth(k+20)A 0)lo hi; s8_bulk_lane(Znth(k+21)A 0)lo hi; s8_bulk_lane(Znth(k+22)A 0)lo hi; s8_bulk_lane(Znth(k+23)A 0)lo hi; s8_bulk_lane(Znth(k+24)A 0)lo hi; s8_bulk_lane(Znth(k+25)A 0)lo hi; s8_bulk_lane(Znth(k+26)A 0)lo hi; s8_bulk_lane(Znth(k+27)A 0)lo hi; s8_bulk_lane(Znth(k+28)A 0)lo hi; s8_bulk_lane(Znth(k+29)A 0)lo hi; s8_bulk_lane(Znth(k+30)A 0)lo hi; s8_bulk_lane(Znth(k+31)A 0)lo hi; s8_bulk_lane(Znth(k+32)A 0)lo hi; s8_bulk_lane(Znth(k+33)A 0)lo hi; s8_bulk_lane(Znth(k+34)A 0)lo hi; s8_bulk_lane(Znth(k+35)A 0)lo hi; s8_bulk_lane(Znth(k+36)A 0)lo hi; s8_bulk_lane(Znth(k+37)A 0)lo hi; s8_bulk_lane(Znth(k+38)A 0)lo hi; s8_bulk_lane(Znth(k+39)A 0)lo hi; s8_bulk_lane(Znth(k+40)A 0)lo hi; s8_bulk_lane(Znth(k+41)A 0)lo hi; s8_bulk_lane(Znth(k+42)A 0)lo hi; s8_bulk_lane(Znth(k+43)A 0)lo hi; s8_bulk_lane(Znth(k+44)A 0)lo hi; s8_bulk_lane(Znth(k+45)A 0)lo hi; s8_bulk_lane(Znth(k+46)A 0)lo hi; s8_bulk_lane(Znth(k+47)A 0)lo hi; s8_bulk_lane(Znth(k+48)A 0)lo hi; s8_bulk_lane(Znth(k+49)A 0)lo hi; s8_bulk_lane(Znth(k+50)A 0)lo hi; s8_bulk_lane(Znth(k+51)A 0)lo hi; s8_bulk_lane(Znth(k+52)A 0)lo hi; s8_bulk_lane(Znth(k+53)A 0)lo hi; s8_bulk_lane(Znth(k+54)A 0)lo hi; s8_bulk_lane(Znth(k+55)A 0)lo hi; s8_bulk_lane(Znth(k+56)A 0)lo hi; s8_bulk_lane(Znth(k+57)A 0)lo hi; s8_bulk_lane(Znth(k+58)A 0)lo hi; s8_bulk_lane(Znth(k+59)A 0)lo hi; s8_bulk_lane(Znth(k+60)A 0)lo hi; s8_bulk_lane(Znth(k+61)A 0)lo hi; s8_bulk_lane(Znth(k+62)A 0)lo hi; s8_bulk_lane(Znth(k+63)A 0)lo hi].
Proof. intros;rewrite s8_bulk_prefix_append by lia;rewrite s8_map_window_64 by lia;reflexivity. Qed.

Lemma s8_tail_prefix_append1_list : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+1<=Zlength A -> s8_tail_prefix n(r+1)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi].
Proof. intros;pose proof(s8_bulk_count_bounds n ltac:(lia))as Hbc;rewrite s8_tail_prefix_append by lia;rewrite s8_map_window_1 by lia;reflexivity. Qed.

Lemma s8_tail_prefix_append2_list : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+2<=Zlength A -> s8_tail_prefix n(r+2)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi].
Proof. intros;pose proof(s8_bulk_count_bounds n ltac:(lia))as Hbc;rewrite s8_tail_prefix_append by lia;rewrite s8_map_window_2 by lia;reflexivity. Qed.

Lemma s8_tail_prefix_append4_list : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+4<=Zlength A -> s8_tail_prefix n(r+4)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi].
Proof. intros;pose proof(s8_bulk_count_bounds n ltac:(lia))as Hbc;rewrite s8_tail_prefix_append by lia;rewrite s8_map_window_4 by lia;reflexivity. Qed.

Lemma s8_tail_prefix_append8_list : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+8<=Zlength A -> s8_tail_prefix n(r+8)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+4)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+5)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+6)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+7)A 0)lo hi].
Proof. intros;pose proof(s8_bulk_count_bounds n ltac:(lia))as Hbc;rewrite s8_tail_prefix_append by lia;rewrite s8_map_window_8 by lia;reflexivity. Qed.

Lemma s8_tail_prefix_append16_list : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+16<=Zlength A -> s8_tail_prefix n(r+16)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+4)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+5)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+6)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+7)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+8)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+9)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+10)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+11)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+12)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+13)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+14)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+15)A 0)lo hi].
Proof. intros;pose proof(s8_bulk_count_bounds n ltac:(lia))as Hbc;rewrite s8_tail_prefix_append by lia;rewrite s8_map_window_16 by lia;reflexivity. Qed.

Lemma s8_tail_prefix_append64_list : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+64<=Zlength A -> s8_tail_prefix n(r+64)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+4)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+5)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+6)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+7)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+8)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+9)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+10)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+11)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+12)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+13)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+14)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+15)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+16)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+17)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+18)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+19)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+20)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+21)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+22)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+23)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+24)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+25)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+26)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+27)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+28)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+29)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+30)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+31)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+32)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+33)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+34)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+35)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+36)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+37)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+38)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+39)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+40)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+41)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+42)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+43)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+44)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+45)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+46)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+47)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+48)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+49)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+50)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+51)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+52)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+53)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+54)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+55)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+56)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+57)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+58)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+59)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+60)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+61)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+62)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+63)A 0)lo hi].
Proof. intros;pose proof(s8_bulk_count_bounds n ltac:(lia))as Hbc;rewrite s8_tail_prefix_append by lia;rewrite s8_map_window_64 by lia;reflexivity. Qed.

Print Assumptions s8_firstn_add.
Print Assumptions s8_window_length.
Print Assumptions s8_window_Zlength.
Print Assumptions s8_Znth_map.
Print Assumptions s8_window_nth.
Print Assumptions s8_map_window_nth.
Print Assumptions s8_window_append.
Print Assumptions s8_bulk_prefix_zero.
Print Assumptions s8_bulk_prefix_length.
Print Assumptions s8_bulk_prefix_nth.
Print Assumptions s8_bulk_prefix_append.
Print Assumptions s8_tail_prefix_zero.
Print Assumptions s8_tail_prefix_full.
Print Assumptions s8_tail_prefix_length.
Print Assumptions s8_values_length.
Print Assumptions s8_tail_prefix_append.
Print Assumptions s8_tail_prefix_nth_bulk.
Print Assumptions s8_tail_prefix_nth_tail.
Print Assumptions s8_map_window_1.
Print Assumptions s8_map_window_2.
Print Assumptions s8_map_window_4.
Print Assumptions s8_map_window_8.
Print Assumptions s8_map_window_16.
Print Assumptions s8_map_window_64.
Print Assumptions s8_bulk_prefix_append1_list.
Print Assumptions s8_bulk_prefix_append2_list.
Print Assumptions s8_bulk_prefix_append4_list.
Print Assumptions s8_bulk_prefix_append8_list.
Print Assumptions s8_bulk_prefix_append16_list.
Print Assumptions s8_bulk_prefix_append64_list.
Print Assumptions s8_tail_prefix_append1_list.
Print Assumptions s8_tail_prefix_append2_list.
Print Assumptions s8_tail_prefix_append4_list.
Print Assumptions s8_tail_prefix_append8_list.
Print Assumptions s8_tail_prefix_append16_list.
Print Assumptions s8_tail_prefix_append64_list.

Lemma s8_map_pack8 : forall(f:Z->Z)(x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z),map f(s8_pack8 x0 x1 x2 x3 x4 x5 x6 x7)=s8_pack8 (f x0) (f x1) (f x2) (f x3) (f x4) (f x5) (f x6) (f x7).
Proof. reflexivity. Qed.
Lemma s8_window_pack8 : forall(f:Z->Z)k A,
 0<=k -> k+8<=Zlength A -> map f(s8_window k 8 A)=s8_pack8 (f(Znth(k+0)A 0)) (f(Znth(k+1)A 0)) (f(Znth(k+2)A 0)) (f(Znth(k+3)A 0)) (f(Znth(k+4)A 0)) (f(Znth(k+5)A 0)) (f(Znth(k+6)A 0)) (f(Znth(k+7)A 0)).
Proof. intros;unfold s8_pack8;apply s8_map_window_8;assumption. Qed.
Print Assumptions s8_map_pack8.
Print Assumptions s8_window_pack8.

Lemma s8_map_pack16 : forall(f:Z->Z)(x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z),map f(s8_pack16 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15)=s8_pack16 (f x0) (f x1) (f x2) (f x3) (f x4) (f x5) (f x6) (f x7) (f x8) (f x9) (f x10) (f x11) (f x12) (f x13) (f x14) (f x15).
Proof. reflexivity. Qed.
Lemma s8_window_pack16 : forall(f:Z->Z)k A,
 0<=k -> k+16<=Zlength A -> map f(s8_window k 16 A)=s8_pack16 (f(Znth(k+0)A 0)) (f(Znth(k+1)A 0)) (f(Znth(k+2)A 0)) (f(Znth(k+3)A 0)) (f(Znth(k+4)A 0)) (f(Znth(k+5)A 0)) (f(Znth(k+6)A 0)) (f(Znth(k+7)A 0)) (f(Znth(k+8)A 0)) (f(Znth(k+9)A 0)) (f(Znth(k+10)A 0)) (f(Znth(k+11)A 0)) (f(Znth(k+12)A 0)) (f(Znth(k+13)A 0)) (f(Znth(k+14)A 0)) (f(Znth(k+15)A 0)).
Proof. intros;unfold s8_pack16;apply s8_map_window_16;assumption. Qed.
Print Assumptions s8_map_pack16.
Print Assumptions s8_window_pack16.

Lemma s8_bulk_prefix_append1 : forall k lo hi A,
 0<=k -> k+1<=Zlength A -> s8_bulk_prefix(k+1)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi].
Proof. intros;apply s8_bulk_prefix_append1_list;assumption. Qed.
Print Assumptions s8_bulk_prefix_append1.

Lemma s8_bulk_prefix_append2 : forall k lo hi A,
 0<=k -> k+2<=Zlength A -> s8_bulk_prefix(k+2)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi].
Proof. intros;apply s8_bulk_prefix_append2_list;assumption. Qed.
Print Assumptions s8_bulk_prefix_append2.

Lemma s8_bulk_prefix_append4 : forall k lo hi A,
 0<=k -> k+4<=Zlength A -> s8_bulk_prefix(k+4)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi; s8_bulk_lane(Znth(k+2)A 0)lo hi; s8_bulk_lane(Znth(k+3)A 0)lo hi].
Proof. intros;apply s8_bulk_prefix_append4_list;assumption. Qed.
Print Assumptions s8_bulk_prefix_append4.

Lemma s8_bulk_prefix_append8 : forall k lo hi A,
 0<=k -> k+8<=Zlength A -> s8_bulk_prefix(k+8)lo hi A=s8_bulk_prefix k lo hi A++s8_pack8 (s8_bulk_lane(Znth(k+0)A 0)lo hi) (s8_bulk_lane(Znth(k+1)A 0)lo hi) (s8_bulk_lane(Znth(k+2)A 0)lo hi) (s8_bulk_lane(Znth(k+3)A 0)lo hi) (s8_bulk_lane(Znth(k+4)A 0)lo hi) (s8_bulk_lane(Znth(k+5)A 0)lo hi) (s8_bulk_lane(Znth(k+6)A 0)lo hi) (s8_bulk_lane(Znth(k+7)A 0)lo hi).
Proof. intros;unfold s8_pack8;apply s8_bulk_prefix_append8_list;assumption. Qed.
Print Assumptions s8_bulk_prefix_append8.

Lemma s8_bulk_prefix_append16 : forall k lo hi A,
 0<=k -> k+16<=Zlength A -> s8_bulk_prefix(k+16)lo hi A=s8_bulk_prefix k lo hi A++s8_pack16 (s8_bulk_lane(Znth(k+0)A 0)lo hi) (s8_bulk_lane(Znth(k+1)A 0)lo hi) (s8_bulk_lane(Znth(k+2)A 0)lo hi) (s8_bulk_lane(Znth(k+3)A 0)lo hi) (s8_bulk_lane(Znth(k+4)A 0)lo hi) (s8_bulk_lane(Znth(k+5)A 0)lo hi) (s8_bulk_lane(Znth(k+6)A 0)lo hi) (s8_bulk_lane(Znth(k+7)A 0)lo hi) (s8_bulk_lane(Znth(k+8)A 0)lo hi) (s8_bulk_lane(Znth(k+9)A 0)lo hi) (s8_bulk_lane(Znth(k+10)A 0)lo hi) (s8_bulk_lane(Znth(k+11)A 0)lo hi) (s8_bulk_lane(Znth(k+12)A 0)lo hi) (s8_bulk_lane(Znth(k+13)A 0)lo hi) (s8_bulk_lane(Znth(k+14)A 0)lo hi) (s8_bulk_lane(Znth(k+15)A 0)lo hi).
Proof. intros;unfold s8_pack16;apply s8_bulk_prefix_append16_list;assumption. Qed.
Print Assumptions s8_bulk_prefix_append16.

Lemma s8_bulk_prefix_append64 : forall k lo hi A,
 0<=k -> k+64<=Zlength A -> s8_bulk_prefix(k+64)lo hi A=s8_bulk_prefix k lo hi A++[s8_bulk_lane(Znth(k+0)A 0)lo hi; s8_bulk_lane(Znth(k+1)A 0)lo hi; s8_bulk_lane(Znth(k+2)A 0)lo hi; s8_bulk_lane(Znth(k+3)A 0)lo hi; s8_bulk_lane(Znth(k+4)A 0)lo hi; s8_bulk_lane(Znth(k+5)A 0)lo hi; s8_bulk_lane(Znth(k+6)A 0)lo hi; s8_bulk_lane(Znth(k+7)A 0)lo hi; s8_bulk_lane(Znth(k+8)A 0)lo hi; s8_bulk_lane(Znth(k+9)A 0)lo hi; s8_bulk_lane(Znth(k+10)A 0)lo hi; s8_bulk_lane(Znth(k+11)A 0)lo hi; s8_bulk_lane(Znth(k+12)A 0)lo hi; s8_bulk_lane(Znth(k+13)A 0)lo hi; s8_bulk_lane(Znth(k+14)A 0)lo hi; s8_bulk_lane(Znth(k+15)A 0)lo hi; s8_bulk_lane(Znth(k+16)A 0)lo hi; s8_bulk_lane(Znth(k+17)A 0)lo hi; s8_bulk_lane(Znth(k+18)A 0)lo hi; s8_bulk_lane(Znth(k+19)A 0)lo hi; s8_bulk_lane(Znth(k+20)A 0)lo hi; s8_bulk_lane(Znth(k+21)A 0)lo hi; s8_bulk_lane(Znth(k+22)A 0)lo hi; s8_bulk_lane(Znth(k+23)A 0)lo hi; s8_bulk_lane(Znth(k+24)A 0)lo hi; s8_bulk_lane(Znth(k+25)A 0)lo hi; s8_bulk_lane(Znth(k+26)A 0)lo hi; s8_bulk_lane(Znth(k+27)A 0)lo hi; s8_bulk_lane(Znth(k+28)A 0)lo hi; s8_bulk_lane(Znth(k+29)A 0)lo hi; s8_bulk_lane(Znth(k+30)A 0)lo hi; s8_bulk_lane(Znth(k+31)A 0)lo hi; s8_bulk_lane(Znth(k+32)A 0)lo hi; s8_bulk_lane(Znth(k+33)A 0)lo hi; s8_bulk_lane(Znth(k+34)A 0)lo hi; s8_bulk_lane(Znth(k+35)A 0)lo hi; s8_bulk_lane(Znth(k+36)A 0)lo hi; s8_bulk_lane(Znth(k+37)A 0)lo hi; s8_bulk_lane(Znth(k+38)A 0)lo hi; s8_bulk_lane(Znth(k+39)A 0)lo hi; s8_bulk_lane(Znth(k+40)A 0)lo hi; s8_bulk_lane(Znth(k+41)A 0)lo hi; s8_bulk_lane(Znth(k+42)A 0)lo hi; s8_bulk_lane(Znth(k+43)A 0)lo hi; s8_bulk_lane(Znth(k+44)A 0)lo hi; s8_bulk_lane(Znth(k+45)A 0)lo hi; s8_bulk_lane(Znth(k+46)A 0)lo hi; s8_bulk_lane(Znth(k+47)A 0)lo hi; s8_bulk_lane(Znth(k+48)A 0)lo hi; s8_bulk_lane(Znth(k+49)A 0)lo hi; s8_bulk_lane(Znth(k+50)A 0)lo hi; s8_bulk_lane(Znth(k+51)A 0)lo hi; s8_bulk_lane(Znth(k+52)A 0)lo hi; s8_bulk_lane(Znth(k+53)A 0)lo hi; s8_bulk_lane(Znth(k+54)A 0)lo hi; s8_bulk_lane(Znth(k+55)A 0)lo hi; s8_bulk_lane(Znth(k+56)A 0)lo hi; s8_bulk_lane(Znth(k+57)A 0)lo hi; s8_bulk_lane(Znth(k+58)A 0)lo hi; s8_bulk_lane(Znth(k+59)A 0)lo hi; s8_bulk_lane(Znth(k+60)A 0)lo hi; s8_bulk_lane(Znth(k+61)A 0)lo hi; s8_bulk_lane(Znth(k+62)A 0)lo hi; s8_bulk_lane(Znth(k+63)A 0)lo hi].
Proof. intros;apply s8_bulk_prefix_append64_list;assumption. Qed.
Print Assumptions s8_bulk_prefix_append64.

Lemma s8_tail_prefix_append1 : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+1<=Zlength A -> s8_tail_prefix n(r+1)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi].
Proof. intros;apply s8_tail_prefix_append1_list;assumption. Qed.
Print Assumptions s8_tail_prefix_append1.

Lemma s8_tail_prefix_append2 : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+2<=Zlength A -> s8_tail_prefix n(r+2)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi].
Proof. intros;apply s8_tail_prefix_append2_list;assumption. Qed.
Print Assumptions s8_tail_prefix_append2.

Lemma s8_tail_prefix_append4 : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+4<=Zlength A -> s8_tail_prefix n(r+4)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi].
Proof. intros;apply s8_tail_prefix_append4_list;assumption. Qed.
Print Assumptions s8_tail_prefix_append4.

Lemma s8_tail_prefix_append8 : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+8<=Zlength A -> s8_tail_prefix n(r+8)lo hi A=s8_tail_prefix n r lo hi A++s8_pack8 (s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+4)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+5)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+6)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+7)A 0)lo hi).
Proof. intros;unfold s8_pack8;apply s8_tail_prefix_append8_list;assumption. Qed.
Print Assumptions s8_tail_prefix_append8.

Lemma s8_tail_prefix_append16 : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+16<=Zlength A -> s8_tail_prefix n(r+16)lo hi A=s8_tail_prefix n r lo hi A++s8_pack16 (s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+4)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+5)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+6)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+7)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+8)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+9)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+10)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+11)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+12)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+13)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+14)A 0)lo hi) (s8_tail_lane(Znth(s8_bulk_count n+r+15)A 0)lo hi).
Proof. intros;unfold s8_pack16;apply s8_tail_prefix_append16_list;assumption. Qed.
Print Assumptions s8_tail_prefix_append16.

Lemma s8_tail_prefix_append64 : forall n r lo hi A,
 0<=n -> 0<=r -> s8_bulk_count n+r+64<=Zlength A -> s8_tail_prefix n(r+64)lo hi A=s8_tail_prefix n r lo hi A++[s8_tail_lane(Znth(s8_bulk_count n+r+0)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+1)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+2)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+3)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+4)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+5)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+6)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+7)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+8)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+9)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+10)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+11)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+12)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+13)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+14)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+15)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+16)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+17)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+18)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+19)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+20)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+21)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+22)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+23)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+24)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+25)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+26)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+27)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+28)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+29)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+30)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+31)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+32)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+33)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+34)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+35)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+36)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+37)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+38)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+39)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+40)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+41)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+42)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+43)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+44)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+45)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+46)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+47)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+48)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+49)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+50)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+51)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+52)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+53)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+54)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+55)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+56)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+57)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+58)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+59)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+60)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+61)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+62)A 0)lo hi; s8_tail_lane(Znth(s8_bulk_count n+r+63)A 0)lo hi].
Proof. intros;apply s8_tail_prefix_append64_list;assumption. Qed.
Print Assumptions s8_tail_prefix_append64.
