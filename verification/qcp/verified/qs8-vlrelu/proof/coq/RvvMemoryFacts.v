From Coq Require Import ZArith Lia List.
From Qs8Lrelu Require Export RvvMemoryModel.
Import ListNotations.
Local Open Scope Z_scope.
Lemma s8_rvv_take_step : forall (xs:list Z) i,
 0<=i<Zlength xs -> s8_rvv_snoc (s8_rvv_prefix i xs) (s8_rvv_nth xs i) = s8_rvv_prefix (i+1) xs.
Proof.
 assert (Hnth : forall (n:nat) (l:list Z), (n<length l)%nat -> firstn n l ++ [nth n l 0] = firstn (S n) l).
 { induction n; destruct l; simpl; intros; try lia; try reflexivity. f_equal. apply IHn. lia. }
 intros xs i Hi. unfold s8_rvv_snoc,s8_rvv_prefix,s8_rvv_nth,Znth.
 replace (Z.to_nat(i+1)) with (S(Z.to_nat i)) by lia.
 apply Hnth. rewrite Zlength_correct in Hi. lia.
Qed.
Lemma s8_rvv_map_seq_nth : forall (f:nat->Z) start count i d,
 (i<count)%nat -> nth i (map f (seq start count)) d = f (start+i)%nat.
Proof.
 intros f start count i d Hi.
 rewrite (@List.nth_indep Z (map f (seq start count)) i d (f 0%nat))
 by (rewrite length_map,length_seq;exact Hi).
 rewrite map_nth,seq_nth by exact Hi. reflexivity.
Qed.
Lemma s8_rvv_prefix_zero : forall xs, s8_rvv_prefix 0 xs = [].
Proof. reflexivity. Qed.
Lemma s8_rvv_prefix_length : forall n xs,
 0<=n<=Zlength xs -> Zlength (s8_rvv_prefix n xs)=n.
Proof.
 intros n xs H. unfold s8_rvv_prefix. rewrite Zlength_correct,length_firstn.
 rewrite Nat.min_l by (rewrite Zlength_correct in H;lia).
 rewrite Z2Nat.id by lia. reflexivity.
Qed.
Lemma s8_rvv_prefix_nth : forall xs i n d,
 0<=i<n -> n<=Zlength xs -> Znth i (s8_rvv_prefix n xs) d = Znth i xs d.
Proof.
 intros xs i n d Hi Hn. unfold s8_rvv_prefix,Znth.
 apply nth_firstn. lia.
Qed.
Lemma s8_rvv_prefix_map_seq : forall (f:nat->Z) n,
 0<=n<=32 -> s8_rvv_prefix n (map f (seq 0 32))=map f (seq 0 (Z.to_nat n)).
Proof.
 intros f n H. unfold s8_rvv_prefix. rewrite firstn_map.
 assert (Hs : forall n k start, firstn n (seq start k) = seq start (Nat.min n k)).
 { intros m; induction m as [|m IH]; intros k start; destruct k; simpl; try reflexivity. now rewrite IH. }
 rewrite Hs. rewrite Nat.min_l by lia. reflexivity.
Qed.
Lemma s8_rvv_read_lane_active : forall i vl idx L, i<vl -> s8_read_lane i vl idx L = Znth (idx+i) L 0.
Proof. intros. unfold s8_read_lane. destruct (Z.ltb_spec i vl); [reflexivity|lia]. Qed.
Lemma s8_rvv_pack32_seq : forall (f:Z->Z),s8_rvv_pack32 (f 0) (f 1) (f 2) (f 3) (f 4) (f 5) (f 6) (f 7) (f 8) (f 9) (f 10) (f 11) (f 12) (f 13) (f 14) (f 15) (f 16) (f 17) (f 18) (f 19) (f 20) (f 21) (f 22) (f 23) (f 24) (f 25) (f 26) (f 27) (f 28) (f 29) (f 30) (f 31)=map(fun i=>f(Z.of_nat i))(seq 0 32).
Proof. intros;reflexivity. Qed.
