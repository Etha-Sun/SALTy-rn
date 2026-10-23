From Coq Require Import List ZArith Lia.
From AUXLib Require Import ListLib.
From QcpVadd Require Import VaddBits.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations.
Open Scope Z_scope.

Lemma firstn_add_split {T} : forall k m (xs : list T),
  firstn (k+m) xs = firstn k xs ++ firstn m (skipn k xs).
Proof.
  induction k; intros m xs; simpl; [reflexivity|].
  destruct xs; simpl; [now rewrite firstn_nil|].
  f_equal. apply IHk.
Qed.

Lemma skipn_combine_both {A B} : forall k (xs : list A) (ys : list B),
  skipn k (combine xs ys) = combine (skipn k xs) (skipn k ys).
Proof.
  induction k; intros xs ys; simpl; [reflexivity|].
  destruct xs,ys; simpl; try rewrite skipn_nil; try reflexivity.
  - now rewrite combine_nil.
  - apply IHk.
Qed.

Lemma vadd_values_length : forall k a b,
  0 <= k -> k <= Zlength a -> k <= Zlength b ->
  Zlength (vadd_values k a b) = k.
Proof.
  intros k a b Hk Ha Hb. unfold vadd_values. rewrite !Zlength_correct in *.
  rewrite length_firstn, length_map, length_combine.
  rewrite Nat.min_l; [lia|]. apply Nat.min_glb; lia.
Qed.

Lemma vadd_values_split : forall k m a b,
  0 <= k -> 0 <= m ->
  vadd_values (k+m) a b = vadd_values k a b ++
    vadd_values m (skipn (Z.to_nat k) a) (skipn (Z.to_nat k) b).
Proof.
  intros k m a b Hk Hm. unfold vadd_values.
  rewrite Z2Nat.inj_add by lia. rewrite firstn_add_split.
  rewrite skipn_map, skipn_combine_both. reflexivity.
Qed.

Lemma nth_combine_bounded {A B} : forall i (xs : list A) (ys : list B) da db,
  (i < length xs)%nat -> (i < length ys)%nat ->
  nth i (combine xs ys) (da,db) = (nth i xs da,nth i ys db).
Proof.
  induction i; intros xs ys da db Hx Hy; destruct xs,ys; simpl in *; try lia.
  - reflexivity.
  - apply IHi; lia.
Qed.

Lemma vadd_values_nth : forall k i a b d da db,
  0 <= i < k -> k <= Zlength a -> k <= Zlength b ->
  Znth i (vadd_values k a b) d = fp32_sub (Znth i a da) (Znth i b db).
Proof.
  intros k i a b d da db Hi Ha Hb.
  rewrite !Zlength_correct in *.
  unfold Znth, vadd_values. rewrite nth_firstn by lia. rewrite nth_indep with (d' := fp32_sub da db).
  - pose proof (map_nth (fun ab : fp32 * fp32 => fp32_sub (fst ab) (snd ab))
        (combine a b) (da,db) (Z.to_nat i)) as Hmap.
    cbn [fst snd] in Hmap. rewrite Hmap.
    rewrite nth_combine_bounded; try lia. reflexivity.
  - rewrite length_map, length_combine. apply Nat.min_glb_lt; lia.
Qed.

Print Assumptions vadd_values_length.
Print Assumptions vadd_values_split.
Print Assumptions vadd_values_nth.
