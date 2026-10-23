From Coq Require Import ZArith List Lia.
From compcert.lib Require Import Coqlib.
From SimpleC.SL Require Export IntLib.
Import ListNotations.
Local Open Scope Z_scope.

Definition s8_narrow (x:Z) : Z := signed_last_nbits x 8.
Definition s8_min (a b:Z) : Z := Z.min a b.
Definition s8_max (a b:Z) : Z := Z.max a b.
Definition s8_bulk_lane (x lo hi:Z) : Z := s8_min (s8_max x lo) hi.
Definition s8_tail_lane (x lo hi:Z) : Z := s8_max (s8_min x hi) lo.
Definition s8_bulk_count (n:Z) : Z := n - Z.modulo n 64.
Definition s8_values (n lo hi:Z) (A:list Z) : list Z :=
  map (fun x => s8_bulk_lane x lo hi) (firstn (Z.to_nat (s8_bulk_count n)) A) ++
  map (fun x => s8_tail_lane x lo hi)
      (firstn (Z.to_nat (Z.modulo n 64)) (skipn (Z.to_nat (s8_bulk_count n)) A)).

Lemma s8_narrow_range : forall x, -128 <= s8_narrow x <= 127.
Proof.
 intros x. unfold s8_narrow,signed_last_nbits.
 change (-128 <= (let u := x mod 256 in if zlt u 128 then u else u-256) <= 127).
 assert (0 <= x mod 256 < 256) by (apply Z.mod_pos_bound;lia).
 cbv zeta. destruct (zlt (x mod 256) 128);lia.
Qed.
Lemma s8_narrow_id : forall x, -128<=x<=127 -> s8_narrow x=x.
Proof.
 intros. unfold s8_narrow. apply signed_last_nbits_eq;[lia|].
 change (-128<=x<128). lia.
Qed.
Lemma s8_min_branch : forall a b, s8_min a b = if Z.ltb a b then a else b.
Proof. intros. unfold s8_min. destruct (Z.ltb_spec a b);[rewrite Z.min_l|rewrite Z.min_r];lia. Qed.
Lemma s8_max_branch : forall a b, s8_max a b = if Z.ltb b a then a else b.
Proof. intros. unfold s8_max. destruct (Z.ltb_spec b a);[rewrite Z.max_l|rewrite Z.max_r];lia. Qed.
Lemma s8_min_range : forall a b, -128<=a<=127 -> -128<=b<=127 -> -128<=s8_min a b<=127.
Proof. intros. rewrite s8_min_branch. destruct (Z.ltb a b);lia. Qed.
Lemma s8_max_range : forall a b, -128<=a<=127 -> -128<=b<=127 -> -128<=s8_max a b<=127.
Proof. intros. rewrite s8_max_branch. destruct (Z.ltb b a);lia. Qed.
Lemma s8_bulk_range : forall x lo hi, -128<=x<=127 -> -128<=lo<=127 -> -128<=hi<=127 -> -128<=s8_bulk_lane x lo hi<=127.
Proof. intros. unfold s8_bulk_lane. apply s8_min_range;auto using s8_max_range. Qed.
Lemma s8_tail_range : forall x lo hi, -128<=x<=127 -> -128<=lo<=127 -> -128<=hi<=127 -> -128<=s8_tail_lane x lo hi<=127.
Proof. intros. unfold s8_tail_lane. apply s8_max_range;auto using s8_min_range. Qed.
Lemma s8_ordered_schedules : forall x lo hi, lo<=hi -> s8_bulk_lane x lo hi=s8_tail_lane x lo hi.
Proof.
 intros. unfold s8_bulk_lane,s8_tail_lane,s8_min,s8_max.
 destruct (Z_le_dec x lo), (Z_le_dec x hi); repeat first [rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];lia.
Qed.
Lemma s8_unordered_bulk : forall x lo hi, hi<lo -> s8_bulk_lane x lo hi=hi.
Proof. intros. unfold s8_bulk_lane,s8_min,s8_max. rewrite Z.min_r;[reflexivity|]. pose proof (Z.le_max_r x lo);lia. Qed.
Lemma s8_unordered_tail : forall x lo hi, hi<lo -> s8_tail_lane x lo hi=lo.
Proof. intros. unfold s8_tail_lane,s8_min,s8_max. rewrite Z.max_r;[reflexivity|]. pose proof (Z.le_min_r x hi);lia. Qed.
Lemma s8_actual_counterexample : s8_tail_lane 0 1 0=1 /\ s8_bulk_lane 0 1 0=0.
Proof. split;reflexivity. Qed.
Lemma s8_bulk_count_bounds : forall n, 0<=n -> 0<=s8_bulk_count n<=n /\ 0<=Z.modulo n 64<64.
Proof.
 intros n Hn. assert (Hr:0<=Z.modulo n 64<64) by (apply Z.mod_pos_bound;lia).
 pose proof (Z.div_mod n 64 ltac:(lia)). pose proof (Z.div_pos n 64 Hn ltac:(lia)).
 unfold s8_bulk_count. lia.
Qed.
Lemma s8_bulk_count_multiple : forall n, s8_bulk_count n=64*(n/64).
Proof. intros. unfold s8_bulk_count. pose proof (Z.div_mod n 64 ltac:(lia));lia. Qed.
