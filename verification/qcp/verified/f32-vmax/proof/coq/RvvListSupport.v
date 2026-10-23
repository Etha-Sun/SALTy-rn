From FMax Require Import ProgramModel.
From Coq Require Import List ZArith Lia.
From AUXLib Require Import ListLib.
From QcpVadd Require Import VaddBits.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations.
Open Scope Z_scope.

Lemma mm_rvv_firstn_add_split {T} : forall k m (xs : list T),
  firstn (k+m) xs = firstn k xs ++ firstn m (skipn k xs).
Proof.
  induction k; intros m xs; simpl; [reflexivity|].
  destruct xs; simpl; [now rewrite firstn_nil|].
  f_equal. apply IHk.
Qed.

Lemma mm_rvv_skipn_combine_both {A B} : forall k (xs : list A) (ys : list B),
  skipn k (combine xs ys) = combine (skipn k xs) (skipn k ys).
Proof.
  induction k; intros xs ys; simpl; [reflexivity|].
  destruct xs,ys; simpl; try rewrite skipn_nil; try reflexivity.
  - now rewrite combine_nil.
  - apply IHk.
Qed.

Lemma mm_rvv_values_length : forall k a b,
  0 <= k -> k <= Zlength a -> k <= Zlength b ->
  Zlength (mm_rvv_values k a b) = k.
Proof.
  intros k a b Hk Ha Hb. unfold mm_rvv_values. rewrite !Zlength_correct in *.
  rewrite length_firstn, length_map, length_combine.
  rewrite Nat.min_l; [lia|]. apply Nat.min_glb; lia.
Qed.

Lemma mm_rvv_values_split : forall k m a b,
  0 <= k -> 0 <= m ->
  mm_rvv_values (k+m) a b = mm_rvv_values k a b ++
    mm_rvv_values m (skipn (Z.to_nat k) a) (skipn (Z.to_nat k) b).
Proof.
  intros k m a b Hk Hm. unfold mm_rvv_values.
  rewrite Z2Nat.inj_add by lia. rewrite mm_rvv_firstn_add_split.
  rewrite skipn_map, mm_rvv_skipn_combine_both. reflexivity.
Qed.

Lemma mm_rvv_nth_combine_bounded {A B} : forall i (xs : list A) (ys : list B) da db,
  (i < length xs)%nat -> (i < length ys)%nat ->
  nth i (combine xs ys) (da,db) = (nth i xs da,nth i ys db).
Proof.
  induction i; intros xs ys da db Hx Hy; destruct xs,ys; simpl in *; try lia.
  - reflexivity.
  - apply IHi; lia.
Qed.

Lemma mm_rvv_values_nth : forall k i a b d da db,
  0 <= i < k -> k <= Zlength a -> k <= Zlength b ->
  Znth i (mm_rvv_values k a b) d = mm_repaired (Znth i a da) (Znth i b db).
Proof.
  intros k i a b d da db Hi Ha Hb.
  rewrite !Zlength_correct in *.
  unfold Znth, mm_rvv_values. rewrite nth_firstn by lia. rewrite nth_indep with (d' := mm_repaired da db).
  - pose proof (map_nth (fun ab : fp32 * fp32 => mm_repaired (fst ab) (snd ab))
        (combine a b) (da,db) (Z.to_nat i)) as Hmap.
    cbn [fst snd] in Hmap. rewrite Hmap.
    rewrite mm_rvv_nth_combine_bounded; try lia. reflexivity.
  - rewrite length_map, length_combine. apply Nat.min_glb_lt; lia.
Qed.

Print Assumptions mm_rvv_values_length.
Print Assumptions mm_rvv_values_split.
Print Assumptions mm_rvv_values_nth.

From Coq Require Import ZArith List Lia.
From QcpRvv32 Require Import RvvStoreModel.

From AUXLib Require Import ListLib.
Import ListNotations.
Open Scope Z_scope.

Lemma firstn_mm_rvv_truncate : forall n a b,
 firstn n (map (fun ab : fp32 * fp32 => mm_repaired (fst ab) (snd ab))
   (combine (firstn n a) (firstn n b))) =
 firstn n (map (fun ab : fp32 * fp32 => mm_repaired (fst ab) (snd ab)) (combine a b)).
Proof.
 induction n; intros a b; [reflexivity|].
 destruct a,b; cbn; try reflexivity.
 now rewrite IHn.
Qed.

Lemma mm_rvv_append : forall k vl a b,
 0 <= k -> 0 <= vl ->
 mm_rvv_values (k+vl) a b = mm_rvv_values k a b ++
 mm_rvv_values vl (sublist k (k+vl) a) (sublist k (k+vl) b).
Proof.
 intros k vl a b Hk Hv.
 rewrite mm_rvv_values_split by lia. f_equal.
 unfold sublist. rewrite !skipn_firstn_comm.
 rewrite Z2Nat.inj_add by lia.
 replace (Z.to_nat k + Z.to_nat vl - Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 unfold mm_rvv_values. symmetry. apply firstn_mm_rvv_truncate.
Qed.

Print Assumptions mm_rvv_append.
