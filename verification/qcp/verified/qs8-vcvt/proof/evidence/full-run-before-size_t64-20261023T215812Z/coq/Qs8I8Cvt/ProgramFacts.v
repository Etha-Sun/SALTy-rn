From Coq Require Import ZArith Lia List.
From Qs8I8Cvt Require Export ProgramModel NeonStoreModel RvvModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qcv_window(k r:Z)(A:list Z):list Z := firstn(Z.to_nat r)(skipn(Z.to_nat k)A).
Definition qcv_chunk(k r z m o:Z)(A:list Z):list Z := map(fun x=>qcv_neon_lane x z m o)(qcv_window k r A).
Lemma qcv_firstn_add : forall (T:Type) (k r:nat) (A:list T),
 firstn (k+r) A=firstn k A++firstn r (skipn k A).
Proof.
 intros T k;induction k;intros r A;[reflexivity|].
 destruct A;cbn;[now rewrite firstn_nil|now rewrite IHk].
Qed.
Lemma qcv_window_length : forall k r A,
 0<=k -> 0<=r -> k+r<=Zlength A -> length(qcv_window k r A)=Z.to_nat r.
Proof.
 intros k r A Hk Hr Hbound. unfold qcv_window.
 rewrite firstn_length,skipn_length,Nat.min_l;[reflexivity|].
 rewrite Zlength_correct in Hbound. lia.
Qed.
Lemma qcv_window_Zlength : forall k r A,
 0<=k -> 0<=r -> k+r<=Zlength A -> Zlength(qcv_window k r A)=r.
Proof. intros;rewrite Zlength_correct,qcv_window_length by assumption;rewrite Z2Nat.id by assumption;reflexivity. Qed.
Lemma qcv_Znth_map : forall (f:Z->Z) A i,
 0<=i<Zlength A -> Znth i(map f A)0=f(Znth i A 0).
Proof.
 intros f A i Hi. unfold Znth.
 rewrite (@List.nth_indep Z (map f A) (Z.to_nat i) 0 (f 0)).
 - apply List.map_nth.
 - rewrite map_length. rewrite Zlength_correct in Hi;lia.
Qed.
Lemma qcv_window_nth : forall k r A i,
 0<=k -> 0<=i<r -> k+r<=Zlength A ->
 Znth i(qcv_window k r A)0=Znth(k+i)A 0.
Proof.
 intros k r A i Hk Hi Hbound. unfold qcv_window,Znth.
 rewrite List.nth_firstn. destruct (Nat.ltb_spec (Z.to_nat i)(Z.to_nat r));[|lia].
 rewrite List.nth_skipn,Z2Nat.inj_add by lia. reflexivity.
Qed.
Lemma qcv_map_window_nth : forall (f:Z->Z) k r A i,
 0<=k -> 0<=i<r -> k+r<=Zlength A ->
 Znth i(map f(qcv_window k r A))0=f(Znth(k+i)A 0).
Proof.
 intros f k r A i Hk Hi Hb. rewrite qcv_Znth_map.
 - now rewrite qcv_window_nth.
 - rewrite qcv_window_Zlength by lia;lia.
Qed.
Lemma qcv_window_append : forall (f:Z->Z) k r t A,
 0<=k -> 0<=r -> 0<=t -> k+r+t<=Zlength A ->
 map f(qcv_window k(r+t)A)=map f(qcv_window k r A)++map f(qcv_window(k+r)t A).
Proof.
 intros f k r t A Hk Hr Ht Hb. unfold qcv_window.
 rewrite Z2Nat.inj_add by lia. rewrite qcv_firstn_add,map_app.
 f_equal. rewrite skipn_skipn,Z2Nat.inj_add by lia.
 replace (Z.to_nat r+Z.to_nat k)%nat with (Z.to_nat k+Z.to_nat r)%nat by lia.
 reflexivity.
Qed.

Lemma qcv_values_zero : forall z m o A,qcv_values 0 z m o A=[].
Proof. reflexivity. Qed.
Lemma qcv_values_length : forall k z m o A,
 0<=k<=Zlength A -> Zlength(qcv_values k z m o A)=k.
Proof.
 intros. unfold qcv_values. rewrite Zlength_correct,map_length,firstn_length,Nat.min_l.
 - rewrite Z2Nat.id by lia;reflexivity.
 - rewrite Zlength_correct in H;lia.
Qed.
Lemma qcv_values_nth : forall k z m o A i,
 0<=i<k -> k<=Zlength A -> Znth i(qcv_values k z m o A)0=qcv_neon_lane(Znth i A 0)z m o.
Proof.
 intros. unfold qcv_values;rewrite qcv_Znth_map.
 - unfold Znth;rewrite List.nth_firstn;destruct(Nat.ltb_spec(Z.to_nat i)(Z.to_nat k));[reflexivity|lia].
 - rewrite Zlength_correct,firstn_length,Nat.min_l;rewrite Zlength_correct in H0;lia.
Qed.
Lemma qcv_values_append : forall k r z m o A,
 0<=k -> 0<=r -> k+r<=Zlength A ->
 qcv_values(k+r)z m o A=qcv_values k z m o A++qcv_chunk k r z m o A.
Proof. intros;unfold qcv_values,qcv_chunk,qcv_window;rewrite Z2Nat.inj_add by lia;rewrite qcv_firstn_add,map_app;reflexivity. Qed.
Lemma qcv_chunk_length : forall k r z m o A,
 0<=k -> 0<=r -> k+r<=Zlength A -> length(qcv_chunk k r z m o A)=Z.to_nat r.
Proof. intros;unfold qcv_chunk;rewrite map_length,qcv_window_length by assumption;reflexivity. Qed.
Lemma qcv_chunk_nth : forall k r z m o A i,
 0<=k -> 0<=i<r -> k+r<=Zlength A -> Znth i(qcv_chunk k r z m o A)0=qcv_neon_lane(Znth(k+i)A 0)z m o.
Proof. intros;unfold qcv_chunk;now rewrite qcv_map_window_nth. Qed.

Lemma qcv_chunk_1 : forall k z m o A,
 0<=k -> k+1<=Zlength A -> qcv_chunk k 1 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 1 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 1(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append1 : forall k z m o A,
 0<=k -> k+1<=Zlength A -> qcv_values(k+1)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_1 by assumption;reflexivity. Qed.

Lemma qcv_chunk_2 : forall k z m o A,
 0<=k -> k+2<=Zlength A -> qcv_chunk k 2 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 2 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 2(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append2 : forall k z m o A,
 0<=k -> k+2<=Zlength A -> qcv_values(k+2)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_2 by assumption;reflexivity. Qed.

Lemma qcv_chunk_3 : forall k z m o A,
 0<=k -> k+3<=Zlength A -> qcv_chunk k 3 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 3 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 3(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append3 : forall k z m o A,
 0<=k -> k+3<=Zlength A -> qcv_values(k+3)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_3 by assumption;reflexivity. Qed.

Lemma qcv_chunk_4 : forall k z m o A,
 0<=k -> k+4<=Zlength A -> qcv_chunk k 4 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 4 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 4(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append4 : forall k z m o A,
 0<=k -> k+4<=Zlength A -> qcv_values(k+4)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_4 by assumption;reflexivity. Qed.

Lemma qcv_chunk_5 : forall k z m o A,
 0<=k -> k+5<=Zlength A -> qcv_chunk k 5 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 5 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 5(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append5 : forall k z m o A,
 0<=k -> k+5<=Zlength A -> qcv_values(k+5)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_5 by assumption;reflexivity. Qed.

Lemma qcv_chunk_6 : forall k z m o A,
 0<=k -> k+6<=Zlength A -> qcv_chunk k 6 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 6 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 6(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append6 : forall k z m o A,
 0<=k -> k+6<=Zlength A -> qcv_values(k+6)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_6 by assumption;reflexivity. Qed.

Lemma qcv_chunk_7 : forall k z m o A,
 0<=k -> k+7<=Zlength A -> qcv_chunk k 7 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 7 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 7(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append7 : forall k z m o A,
 0<=k -> k+7<=Zlength A -> qcv_values(k+7)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_7 by assumption;reflexivity. Qed.

Lemma qcv_chunk_8 : forall k z m o A,
 0<=k -> k+8<=Zlength A -> qcv_chunk k 8 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o;qcv_neon_lane(Znth(k+7)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 8 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o;qcv_neon_lane(Znth(k+7)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 8(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append8 : forall k z m o A,
 0<=k -> k+8<=Zlength A -> qcv_values(k+8)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o;qcv_neon_lane(Znth(k+7)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_8 by assumption;reflexivity. Qed.

Lemma qcv_chunk_32 : forall k z m o A,
 0<=k -> k+32<=Zlength A -> qcv_chunk k 32 z m o A=[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o;qcv_neon_lane(Znth(k+7)A 0)z m o;qcv_neon_lane(Znth(k+8)A 0)z m o;qcv_neon_lane(Znth(k+9)A 0)z m o;qcv_neon_lane(Znth(k+10)A 0)z m o;qcv_neon_lane(Znth(k+11)A 0)z m o;qcv_neon_lane(Znth(k+12)A 0)z m o;qcv_neon_lane(Znth(k+13)A 0)z m o;qcv_neon_lane(Znth(k+14)A 0)z m o;qcv_neon_lane(Znth(k+15)A 0)z m o;qcv_neon_lane(Znth(k+16)A 0)z m o;qcv_neon_lane(Znth(k+17)A 0)z m o;qcv_neon_lane(Znth(k+18)A 0)z m o;qcv_neon_lane(Znth(k+19)A 0)z m o;qcv_neon_lane(Znth(k+20)A 0)z m o;qcv_neon_lane(Znth(k+21)A 0)z m o;qcv_neon_lane(Znth(k+22)A 0)z m o;qcv_neon_lane(Znth(k+23)A 0)z m o;qcv_neon_lane(Znth(k+24)A 0)z m o;qcv_neon_lane(Znth(k+25)A 0)z m o;qcv_neon_lane(Znth(k+26)A 0)z m o;qcv_neon_lane(Znth(k+27)A 0)z m o;qcv_neon_lane(Znth(k+28)A 0)z m o;qcv_neon_lane(Znth(k+29)A 0)z m o;qcv_neon_lane(Znth(k+30)A 0)z m o;qcv_neon_lane(Znth(k+31)A 0)z m o].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qcv_chunk_length by lia;reflexivity.
 - intros i Hi;rewrite qcv_chunk_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qcv_chunk k 32 z m o A)0=nth i [qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o;qcv_neon_lane(Znth(k+7)A 0)z m o;qcv_neon_lane(Znth(k+8)A 0)z m o;qcv_neon_lane(Znth(k+9)A 0)z m o;qcv_neon_lane(Znth(k+10)A 0)z m o;qcv_neon_lane(Znth(k+11)A 0)z m o;qcv_neon_lane(Znth(k+12)A 0)z m o;qcv_neon_lane(Znth(k+13)A 0)z m o;qcv_neon_lane(Znth(k+14)A 0)z m o;qcv_neon_lane(Znth(k+15)A 0)z m o;qcv_neon_lane(Znth(k+16)A 0)z m o;qcv_neon_lane(Znth(k+17)A 0)z m o;qcv_neon_lane(Znth(k+18)A 0)z m o;qcv_neon_lane(Znth(k+19)A 0)z m o;qcv_neon_lane(Znth(k+20)A 0)z m o;qcv_neon_lane(Znth(k+21)A 0)z m o;qcv_neon_lane(Znth(k+22)A 0)z m o;qcv_neon_lane(Znth(k+23)A 0)z m o;qcv_neon_lane(Znth(k+24)A 0)z m o;qcv_neon_lane(Znth(k+25)A 0)z m o;qcv_neon_lane(Znth(k+26)A 0)z m o;qcv_neon_lane(Znth(k+27)A 0)z m o;qcv_neon_lane(Znth(k+28)A 0)z m o;qcv_neon_lane(Znth(k+29)A 0)z m o;qcv_neon_lane(Znth(k+30)A 0)z m o;qcv_neon_lane(Znth(k+31)A 0)z m o] 0).
   rewrite qcv_chunk_nth by lia.
   do 32(destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma qcv_values_append32 : forall k z m o A,
 0<=k -> k+32<=Zlength A -> qcv_values(k+32)z m o A=qcv_values k z m o A++[qcv_neon_lane(Znth(k+0)A 0)z m o;qcv_neon_lane(Znth(k+1)A 0)z m o;qcv_neon_lane(Znth(k+2)A 0)z m o;qcv_neon_lane(Znth(k+3)A 0)z m o;qcv_neon_lane(Znth(k+4)A 0)z m o;qcv_neon_lane(Znth(k+5)A 0)z m o;qcv_neon_lane(Znth(k+6)A 0)z m o;qcv_neon_lane(Znth(k+7)A 0)z m o;qcv_neon_lane(Znth(k+8)A 0)z m o;qcv_neon_lane(Znth(k+9)A 0)z m o;qcv_neon_lane(Znth(k+10)A 0)z m o;qcv_neon_lane(Znth(k+11)A 0)z m o;qcv_neon_lane(Znth(k+12)A 0)z m o;qcv_neon_lane(Znth(k+13)A 0)z m o;qcv_neon_lane(Znth(k+14)A 0)z m o;qcv_neon_lane(Znth(k+15)A 0)z m o;qcv_neon_lane(Znth(k+16)A 0)z m o;qcv_neon_lane(Znth(k+17)A 0)z m o;qcv_neon_lane(Znth(k+18)A 0)z m o;qcv_neon_lane(Znth(k+19)A 0)z m o;qcv_neon_lane(Znth(k+20)A 0)z m o;qcv_neon_lane(Znth(k+21)A 0)z m o;qcv_neon_lane(Znth(k+22)A 0)z m o;qcv_neon_lane(Znth(k+23)A 0)z m o;qcv_neon_lane(Znth(k+24)A 0)z m o;qcv_neon_lane(Znth(k+25)A 0)z m o;qcv_neon_lane(Znth(k+26)A 0)z m o;qcv_neon_lane(Znth(k+27)A 0)z m o;qcv_neon_lane(Znth(k+28)A 0)z m o;qcv_neon_lane(Znth(k+29)A 0)z m o;qcv_neon_lane(Znth(k+30)A 0)z m o;qcv_neon_lane(Znth(k+31)A 0)z m o].
Proof. intros;rewrite qcv_values_append by lia;rewrite qcv_chunk_32 by assumption;reflexivity. Qed.
