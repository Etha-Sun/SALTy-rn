From Coq Require Import ZArith Lia List.
From Qs8Add Require Export ProgramModel NeonStoreModel ComposedModel RvvMemoryFacts ShiftFacts.
Import ListNotations.
Local Open Scope Z_scope.
Definition qa_at(az bz ma mb raw oz lo hi:Z)(A B:list Z)(i:Z):Z :=
 qa_neon_lane (Znth i A 0) (Znth i B 0) az bz ma mb raw oz lo hi.
Definition qa_window(k r az bz ma mb raw oz lo hi:Z)(A B:list Z):list Z :=
 map(fun i:nat=>qa_neon_lane(nth i A 0)(nth i B 0)az bz ma mb raw oz lo hi)(seq(Z.to_nat k)(Z.to_nat r)).
Lemma qa_values_zero : forall az bz ma mb raw oz lo hi A B,qa_values 0 az bz ma mb raw oz lo hi A B=[].
Proof. reflexivity. Qed.
Lemma qa_values_length : forall n az bz ma mb raw oz lo hi A B,
 0<=n -> Zlength(qa_values n az bz ma mb raw oz lo hi A B)=n.
Proof. intros;unfold qa_values;rewrite Zlength_correct,map_length,seq_length,Z2Nat.id by lia;reflexivity. Qed.
Lemma qa_values_nth : forall n az bz ma mb raw oz lo hi A B i,
 0<=i<n -> n<=Zlength A -> n<=Zlength B ->
 Znth i(qa_values n az bz ma mb raw oz lo hi A B)0=qa_at az bz ma mb raw oz lo hi A B i.
Proof. intros;unfold qa_values,qa_at,Znth;rewrite s8_rvv_map_seq_nth by lia;reflexivity. Qed.
Lemma qa_window_length : forall k r az bz ma mb raw oz lo hi A B,
 0<=r -> length(qa_window k r az bz ma mb raw oz lo hi A B)=Z.to_nat r.
Proof. intros;unfold qa_window;rewrite map_length,seq_length;reflexivity. Qed.
Lemma qa_window_nth : forall k r az bz ma mb raw oz lo hi A B i,
 0<=k -> 0<=i<r -> k+r<=Zlength A -> k+r<=Zlength B ->
 Znth i(qa_window k r az bz ma mb raw oz lo hi A B)0=qa_at az bz ma mb raw oz lo hi A B(k+i).
Proof. intros;unfold qa_window,qa_at,Znth;rewrite s8_rvv_map_seq_nth by lia;rewrite Z2Nat.inj_add by lia;reflexivity. Qed.
Lemma qa_values_append : forall k r az bz ma mb raw oz lo hi A B,
 0<=k -> 0<=r -> k+r<=Zlength A -> k+r<=Zlength B ->
 qa_values(k+r)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++qa_window k r az bz ma mb raw oz lo hi A B.
Proof. intros;unfold qa_values,qa_window;rewrite Z2Nat.inj_add by lia;rewrite seq_app,map_app;reflexivity. Qed.
Lemma qa_lane_range : forall a b az bz ma mb raw oz lo hi,
 -128<=lo<=127 -> -128<=hi<=127 -> -128<=qa_neon_lane a b az bz ma mb raw oz lo hi<=127.
Proof. intros;unfold qa_neon_lane,qa_clamp;pose proof(qa_sat8_range(qa_neon_add16(qa_sat16(qa_neon_shift(qa_neon_acc a b az bz ma mb)(qa_negword raw)))oz));lia. Qed.
Local Opaque qa_at.
Lemma qa_window_1 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+1<=Zlength A -> k+1<=Zlength B ->
 qa_window k 1 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 1 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0)] 0).
   rewrite qa_window_nth by lia.
   do 1(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append1 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+1<=Zlength A -> k+1<=Zlength B ->
 qa_values(k+1)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_1 by lia;reflexivity. Qed.
Lemma qa_window_2 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+2<=Zlength A -> k+2<=Zlength B ->
 qa_window k 2 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 2 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1)] 0).
   rewrite qa_window_nth by lia.
   do 2(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append2 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+2<=Zlength A -> k+2<=Zlength B ->
 qa_values(k+2)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_2 by lia;reflexivity. Qed.
Lemma qa_window_3 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+3<=Zlength A -> k+3<=Zlength B ->
 qa_window k 3 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 3 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2)] 0).
   rewrite qa_window_nth by lia.
   do 3(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append3 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+3<=Zlength A -> k+3<=Zlength B ->
 qa_values(k+3)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_3 by lia;reflexivity. Qed.
Lemma qa_window_4 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+4<=Zlength A -> k+4<=Zlength B ->
 qa_window k 4 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 4 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3)] 0).
   rewrite qa_window_nth by lia.
   do 4(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append4 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+4<=Zlength A -> k+4<=Zlength B ->
 qa_values(k+4)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_4 by lia;reflexivity. Qed.
Lemma qa_window_5 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+5<=Zlength A -> k+5<=Zlength B ->
 qa_window k 5 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 5 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4)] 0).
   rewrite qa_window_nth by lia.
   do 5(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append5 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+5<=Zlength A -> k+5<=Zlength B ->
 qa_values(k+5)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_5 by lia;reflexivity. Qed.
Lemma qa_window_6 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+6<=Zlength A -> k+6<=Zlength B ->
 qa_window k 6 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 6 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5)] 0).
   rewrite qa_window_nth by lia.
   do 6(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append6 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+6<=Zlength A -> k+6<=Zlength B ->
 qa_values(k+6)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_6 by lia;reflexivity. Qed.
Lemma qa_window_7 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+7<=Zlength A -> k+7<=Zlength B ->
 qa_window k 7 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 7 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6)] 0).
   rewrite qa_window_nth by lia.
   do 7(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append7 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+7<=Zlength A -> k+7<=Zlength B ->
 qa_values(k+7)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_7 by lia;reflexivity. Qed.
Lemma qa_window_8 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+8<=Zlength A -> k+8<=Zlength B ->
 qa_window k 8 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 8 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7)] 0).
   rewrite qa_window_nth by lia.
   do 8(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append8 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+8<=Zlength A -> k+8<=Zlength B ->
 qa_values(k+8)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_8 by lia;reflexivity. Qed.
Lemma qa_window_16 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+16<=Zlength A -> k+16<=Zlength B ->
 qa_window k 16 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7);qa_at az bz ma mb raw oz lo hi A B(k+8);qa_at az bz ma mb raw oz lo hi A B(k+9);qa_at az bz ma mb raw oz lo hi A B(k+10);qa_at az bz ma mb raw oz lo hi A B(k+11);qa_at az bz ma mb raw oz lo hi A B(k+12);qa_at az bz ma mb raw oz lo hi A B(k+13);qa_at az bz ma mb raw oz lo hi A B(k+14);qa_at az bz ma mb raw oz lo hi A B(k+15)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 16 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7);qa_at az bz ma mb raw oz lo hi A B(k+8);qa_at az bz ma mb raw oz lo hi A B(k+9);qa_at az bz ma mb raw oz lo hi A B(k+10);qa_at az bz ma mb raw oz lo hi A B(k+11);qa_at az bz ma mb raw oz lo hi A B(k+12);qa_at az bz ma mb raw oz lo hi A B(k+13);qa_at az bz ma mb raw oz lo hi A B(k+14);qa_at az bz ma mb raw oz lo hi A B(k+15)] 0).
   rewrite qa_window_nth by lia.
   do 16(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append16 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+16<=Zlength A -> k+16<=Zlength B ->
 qa_values(k+16)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7);qa_at az bz ma mb raw oz lo hi A B(k+8);qa_at az bz ma mb raw oz lo hi A B(k+9);qa_at az bz ma mb raw oz lo hi A B(k+10);qa_at az bz ma mb raw oz lo hi A B(k+11);qa_at az bz ma mb raw oz lo hi A B(k+12);qa_at az bz ma mb raw oz lo hi A B(k+13);qa_at az bz ma mb raw oz lo hi A B(k+14);qa_at az bz ma mb raw oz lo hi A B(k+15)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_16 by lia;reflexivity. Qed.
Lemma qa_window_32 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+32<=Zlength A -> k+32<=Zlength B ->
 qa_window k 32 az bz ma mb raw oz lo hi A B=[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7);qa_at az bz ma mb raw oz lo hi A B(k+8);qa_at az bz ma mb raw oz lo hi A B(k+9);qa_at az bz ma mb raw oz lo hi A B(k+10);qa_at az bz ma mb raw oz lo hi A B(k+11);qa_at az bz ma mb raw oz lo hi A B(k+12);qa_at az bz ma mb raw oz lo hi A B(k+13);qa_at az bz ma mb raw oz lo hi A B(k+14);qa_at az bz ma mb raw oz lo hi A B(k+15);qa_at az bz ma mb raw oz lo hi A B(k+16);qa_at az bz ma mb raw oz lo hi A B(k+17);qa_at az bz ma mb raw oz lo hi A B(k+18);qa_at az bz ma mb raw oz lo hi A B(k+19);qa_at az bz ma mb raw oz lo hi A B(k+20);qa_at az bz ma mb raw oz lo hi A B(k+21);qa_at az bz ma mb raw oz lo hi A B(k+22);qa_at az bz ma mb raw oz lo hi A B(k+23);qa_at az bz ma mb raw oz lo hi A B(k+24);qa_at az bz ma mb raw oz lo hi A B(k+25);qa_at az bz ma mb raw oz lo hi A B(k+26);qa_at az bz ma mb raw oz lo hi A B(k+27);qa_at az bz ma mb raw oz lo hi A B(k+28);qa_at az bz ma mb raw oz lo hi A B(k+29);qa_at az bz ma mb raw oz lo hi A B(k+30);qa_at az bz ma mb raw oz lo hi A B(k+31)].
Proof.
 intros;apply List.nth_ext with(d:=0)(d':=0).
 - rewrite qa_window_length by lia;reflexivity.
 - intros i Hi;rewrite qa_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(qa_window k 32 az bz ma mb raw oz lo hi A B)0=nth i [qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7);qa_at az bz ma mb raw oz lo hi A B(k+8);qa_at az bz ma mb raw oz lo hi A B(k+9);qa_at az bz ma mb raw oz lo hi A B(k+10);qa_at az bz ma mb raw oz lo hi A B(k+11);qa_at az bz ma mb raw oz lo hi A B(k+12);qa_at az bz ma mb raw oz lo hi A B(k+13);qa_at az bz ma mb raw oz lo hi A B(k+14);qa_at az bz ma mb raw oz lo hi A B(k+15);qa_at az bz ma mb raw oz lo hi A B(k+16);qa_at az bz ma mb raw oz lo hi A B(k+17);qa_at az bz ma mb raw oz lo hi A B(k+18);qa_at az bz ma mb raw oz lo hi A B(k+19);qa_at az bz ma mb raw oz lo hi A B(k+20);qa_at az bz ma mb raw oz lo hi A B(k+21);qa_at az bz ma mb raw oz lo hi A B(k+22);qa_at az bz ma mb raw oz lo hi A B(k+23);qa_at az bz ma mb raw oz lo hi A B(k+24);qa_at az bz ma mb raw oz lo hi A B(k+25);qa_at az bz ma mb raw oz lo hi A B(k+26);qa_at az bz ma mb raw oz lo hi A B(k+27);qa_at az bz ma mb raw oz lo hi A B(k+28);qa_at az bz ma mb raw oz lo hi A B(k+29);qa_at az bz ma mb raw oz lo hi A B(k+30);qa_at az bz ma mb raw oz lo hi A B(k+31)] 0).
   rewrite qa_window_nth by lia.
   do 32(destruct i as[|i];[reflexivity|]);exfalso;lia.
Qed.
Lemma qa_values_append32 : forall k az bz ma mb raw oz lo hi A B,
 0<=k -> k+32<=Zlength A -> k+32<=Zlength B ->
 qa_values(k+32)az bz ma mb raw oz lo hi A B=qa_values k az bz ma mb raw oz lo hi A B++[qa_at az bz ma mb raw oz lo hi A B(k+0);qa_at az bz ma mb raw oz lo hi A B(k+1);qa_at az bz ma mb raw oz lo hi A B(k+2);qa_at az bz ma mb raw oz lo hi A B(k+3);qa_at az bz ma mb raw oz lo hi A B(k+4);qa_at az bz ma mb raw oz lo hi A B(k+5);qa_at az bz ma mb raw oz lo hi A B(k+6);qa_at az bz ma mb raw oz lo hi A B(k+7);qa_at az bz ma mb raw oz lo hi A B(k+8);qa_at az bz ma mb raw oz lo hi A B(k+9);qa_at az bz ma mb raw oz lo hi A B(k+10);qa_at az bz ma mb raw oz lo hi A B(k+11);qa_at az bz ma mb raw oz lo hi A B(k+12);qa_at az bz ma mb raw oz lo hi A B(k+13);qa_at az bz ma mb raw oz lo hi A B(k+14);qa_at az bz ma mb raw oz lo hi A B(k+15);qa_at az bz ma mb raw oz lo hi A B(k+16);qa_at az bz ma mb raw oz lo hi A B(k+17);qa_at az bz ma mb raw oz lo hi A B(k+18);qa_at az bz ma mb raw oz lo hi A B(k+19);qa_at az bz ma mb raw oz lo hi A B(k+20);qa_at az bz ma mb raw oz lo hi A B(k+21);qa_at az bz ma mb raw oz lo hi A B(k+22);qa_at az bz ma mb raw oz lo hi A B(k+23);qa_at az bz ma mb raw oz lo hi A B(k+24);qa_at az bz ma mb raw oz lo hi A B(k+25);qa_at az bz ma mb raw oz lo hi A B(k+26);qa_at az bz ma mb raw oz lo hi A B(k+27);qa_at az bz ma mb raw oz lo hi A B(k+28);qa_at az bz ma mb raw oz lo hi A B(k+29);qa_at az bz ma mb raw oz lo hi A B(k+30);qa_at az bz ma mb raw oz lo hi A B(k+31)].
Proof. intros;rewrite qa_values_append by lia;rewrite qa_window_32 by lia;reflexivity. Qed.
