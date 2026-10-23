From Coq Require Import List ZArith Lia.
From AUXLib Require Import ListLib.
From VCMul Require Export ComplexModel.
Import ListNotations.
Local Open Scope Z_scope.

(* Every default-changing lookup below has an explicit in-bounds premise.
   Float operations are only unfolded, never simplified using real arithmetic. *)
Lemma complex_at_Znth : forall xs i d,
  0 <= i < Zlength xs ->
  Znth i xs d = complex_at xs (Z.to_nat i).
Proof.
  intros xs i d Hi. unfold complex_at.
  change (Znth i xs d = Znth i xs fp32_zero).
  apply Znth_indep; exact Hi.
Qed.

Lemma complex_map_seq_nth : forall (f:nat -> fp32) start count i d,
  (i < count)%nat ->
  nth i (map f (seq start count)) d = f (start+i)%nat.
Proof.
  intros f start count i d Hi.
  rewrite (@List.nth_indep fp32 (map f (seq start count)) i d (f 0%nat))
    by (rewrite length_map, length_seq; exact Hi).
  rewrite map_nth, seq_nth by exact Hi. reflexivity.
Qed.

Lemma complex_map_seq_append : forall (f:nat -> fp32) k r,
  0 <= k -> 0 <= r ->
  map f (seq 0 (Z.to_nat (k+r))) =
  map f (seq 0 (Z.to_nat k)) ++
  map f (seq (Z.to_nat k) (Z.to_nat r)).
Proof.
  intros f k r Hk Hr.
  rewrite Z2Nat.inj_add by lia.
  rewrite seq_app, map_app. reflexivity.
Qed.

Lemma complex_seq_chunk4 : forall (f:nat -> fp32) k,
  0 <= k ->
  map f (seq (Z.to_nat k) 4) =
  [f (Z.to_nat k); f (Z.to_nat (k+1));
   f (Z.to_nat (k+2)); f (Z.to_nat (k+3))].
Proof.
  intros f k Hk.
  replace (Z.to_nat (k+1)) with (S (Z.to_nat k)) by lia.
  replace (Z.to_nat (k+2)) with (S (S (Z.to_nat k))) by lia.
  replace (Z.to_nat (k+3)) with (S (S (S (Z.to_nat k)))) by lia.
  reflexivity.
Qed.

Lemma complex_seq_tail : forall (f:nat -> fp32) k r,
  0 <= k -> 0 <= r <= 4 ->
  map f (seq (Z.to_nat k) (Z.to_nat r)) =
  firstn (Z.to_nat r)
    [f (Z.to_nat k); f (Z.to_nat (k+1));
     f (Z.to_nat (k+2)); f (Z.to_nat (k+3))].
Proof.
  intros f k r Hk Hr.
  replace (Z.to_nat (k+1)) with (S (Z.to_nat k)) by lia.
  replace (Z.to_nat (k+2)) with (S (S (Z.to_nat k))) by lia.
  replace (Z.to_nat (k+3)) with (S (S (S (Z.to_nat k)))) by lia.
  assert (r=0 \/ r=1 \/ r=2 \/ r=3 \/ r=4) as Hcases by lia.
  destruct Hcases as [H|[H|[H|[H|H]]]]; subst r; reflexivity.
Qed.

Lemma complex_real_mls : forall n i A B dA dB,
  0 <= n -> 0 <= i -> n+i < Zlength A -> n+i < Zlength B ->
  vcmul_mls (fp32_mul (Znth i A dA) (Znth i B dB))
    (Znth (n+i) A dA) (Znth (n+i) B dB) =
  complex_real (Z.to_nat n) A B (Z.to_nat i).
Proof.
  intros n i A B dA dB Hn Hi HA HB.
  unfold vcmul_mls, complex_real.
  repeat rewrite complex_at_Znth by lia.
  rewrite Z2Nat.inj_add by lia. reflexivity.
Qed.

Lemma complex_imag_mla : forall n i A B dA dB,
  0 <= n -> 0 <= i -> n+i < Zlength A -> n+i < Zlength B ->
  vcmul_mla (fp32_mul (Znth i A dA) (Znth (n+i) B dB))
    (Znth (n+i) A dA) (Znth i B dB) =
  complex_imag (Z.to_nat n) A B (Z.to_nat i).
Proof.
  intros n i A B dA dB Hn Hi HA HB.
  unfold vcmul_mla, complex_imag.
  repeat rewrite complex_at_Znth by lia.
  rewrite Z2Nat.inj_add by lia. reflexivity.
Qed.

Lemma complex_real_prefix_length : forall count n A B,
  0 <= count -> Zlength (complex_real_prefix count n A B) = count.
Proof.
  intros count n A B Hcount. unfold complex_real_prefix.
  rewrite Zlength_correct, length_map, length_seq, Z2Nat.id by exact Hcount.
  reflexivity.
Qed.

Lemma complex_real_prefix_nth : forall count n A B i d,
  0 <= count -> 0 <= i < count ->
  Znth i (complex_real_prefix count n A B) d =
  complex_real (Z.to_nat n) A B (Z.to_nat i).
Proof.
  intros count n A B i d Hcount Hi. unfold complex_real_prefix, Znth.
  apply complex_map_seq_nth. lia.
Qed.

Lemma complex_real_prefix_append : forall k r n A B,
  0 <= k -> 0 <= r ->
  complex_real_prefix (k+r) n A B = complex_real_prefix k n A B ++
  map (complex_real (Z.to_nat n) A B) (seq (Z.to_nat k) (Z.to_nat r)).
Proof. intros; unfold complex_real_prefix; apply complex_map_seq_append; assumption. Qed.

Lemma complex_real_prefix_append4 : forall k n A B,
  0 <= k ->
  complex_real_prefix (k+4) n A B = complex_real_prefix k n A B ++
  [complex_real (Z.to_nat n) A B (Z.to_nat k);
   complex_real (Z.to_nat n) A B (Z.to_nat (k+1));
   complex_real (Z.to_nat n) A B (Z.to_nat (k+2));
   complex_real (Z.to_nat n) A B (Z.to_nat (k+3))].
Proof.
  intros k n A B Hk. rewrite complex_real_prefix_append by lia.
  rewrite complex_seq_chunk4 by exact Hk. reflexivity.
Qed.

Lemma complex_real_prefix_tail : forall k r n A B,
  0 <= k -> 0 <= r <= 4 ->
  complex_real_prefix (k+r) n A B = complex_real_prefix k n A B ++
  firstn (Z.to_nat r)
  [complex_real (Z.to_nat n) A B (Z.to_nat k);
   complex_real (Z.to_nat n) A B (Z.to_nat (k+1));
   complex_real (Z.to_nat n) A B (Z.to_nat (k+2));
   complex_real (Z.to_nat n) A B (Z.to_nat (k+3))].
Proof.
  intros k r n A B Hk Hr. rewrite complex_real_prefix_append by lia.
  rewrite complex_seq_tail by assumption. reflexivity.
Qed.

Lemma complex_real_prefix_append1 : forall k n A B,
  0 <= k ->
  complex_real_prefix (k+1) n A B = complex_real_prefix k n A B ++
  [complex_real (Z.to_nat n) A B (Z.to_nat k)].
Proof.
  intros k n A B Hk. rewrite complex_real_prefix_tail by lia. reflexivity.
Qed.

Lemma complex_real_prefix_append2 : forall k n A B,
  0 <= k ->
  complex_real_prefix (k+2) n A B = complex_real_prefix k n A B ++
  [complex_real (Z.to_nat n) A B (Z.to_nat k);
   complex_real (Z.to_nat n) A B (Z.to_nat (k+1))].
Proof.
  intros k n A B Hk. rewrite complex_real_prefix_tail by lia. reflexivity.
Qed.

Lemma complex_real_prefix_append3 : forall k n A B,
  0 <= k ->
  complex_real_prefix (k+3) n A B = complex_real_prefix k n A B ++
  [complex_real (Z.to_nat n) A B (Z.to_nat k);
   complex_real (Z.to_nat n) A B (Z.to_nat (k+1));
   complex_real (Z.to_nat n) A B (Z.to_nat (k+2))].
Proof.
  intros k n A B Hk. rewrite complex_real_prefix_tail by lia. reflexivity.
Qed.

Lemma complex_real_mls_padded : forall n i A B dA dB,
  0 <= n -> 0 <= i < n+3 ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  vcmul_mls (fp32_mul (Znth i A dA) (Znth i B dB))
    (Znth (n+i) A dA) (Znth (n+i) B dB) =
  complex_real (Z.to_nat n) A B (Z.to_nat i).
Proof. intros; apply complex_real_mls; lia. Qed.

Lemma complex_real_mls_active : forall n i A B dA dB,
  0 <= n -> 0 <= i < n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  vcmul_mls (fp32_mul (Znth i A dA) (Znth i B dB))
    (Znth (n+i) A dA) (Znth (n+i) B dB) =
  complex_real (Z.to_nat n) A B (Z.to_nat i).
Proof. intros; apply complex_real_mls; lia. Qed.

Lemma complex_real_prefix_scalar : forall count n A B i d dA dB,
  0 <= count -> 0 <= n -> 0 <= i < count ->
  n+i < Zlength A -> n+i < Zlength B ->
  Znth i (complex_real_prefix count n A B) d =
  vcmul_mls (fp32_mul (Znth i A dA) (Znth i B dB))
    (Znth (n+i) A dA) (Znth (n+i) B dB).
Proof.
  intros. rewrite complex_real_prefix_nth by assumption.
  symmetry. apply complex_real_mls; lia.
Qed.

Lemma complex_imag_prefix_length : forall count n A B,
  0 <= count -> Zlength (complex_imag_prefix count n A B) = count.
Proof.
  intros count n A B Hcount. unfold complex_imag_prefix.
  rewrite Zlength_correct, length_map, length_seq, Z2Nat.id by exact Hcount.
  reflexivity.
Qed.

Lemma complex_imag_prefix_nth : forall count n A B i d,
  0 <= count -> 0 <= i < count ->
  Znth i (complex_imag_prefix count n A B) d =
  complex_imag (Z.to_nat n) A B (Z.to_nat i).
Proof.
  intros count n A B i d Hcount Hi. unfold complex_imag_prefix, Znth.
  apply complex_map_seq_nth. lia.
Qed.

Lemma complex_imag_prefix_append : forall k r n A B,
  0 <= k -> 0 <= r ->
  complex_imag_prefix (k+r) n A B = complex_imag_prefix k n A B ++
  map (complex_imag (Z.to_nat n) A B) (seq (Z.to_nat k) (Z.to_nat r)).
Proof. intros; unfold complex_imag_prefix; apply complex_map_seq_append; assumption. Qed.

Lemma complex_imag_prefix_append4 : forall k n A B,
  0 <= k ->
  complex_imag_prefix (k+4) n A B = complex_imag_prefix k n A B ++
  [complex_imag (Z.to_nat n) A B (Z.to_nat k);
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+1));
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+2));
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+3))].
Proof.
  intros k n A B Hk. rewrite complex_imag_prefix_append by lia.
  rewrite complex_seq_chunk4 by exact Hk. reflexivity.
Qed.

Lemma complex_imag_prefix_tail : forall k r n A B,
  0 <= k -> 0 <= r <= 4 ->
  complex_imag_prefix (k+r) n A B = complex_imag_prefix k n A B ++
  firstn (Z.to_nat r)
  [complex_imag (Z.to_nat n) A B (Z.to_nat k);
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+1));
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+2));
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+3))].
Proof.
  intros k r n A B Hk Hr. rewrite complex_imag_prefix_append by lia.
  rewrite complex_seq_tail by assumption. reflexivity.
Qed.

Lemma complex_imag_prefix_append1 : forall k n A B,
  0 <= k ->
  complex_imag_prefix (k+1) n A B = complex_imag_prefix k n A B ++
  [complex_imag (Z.to_nat n) A B (Z.to_nat k)].
Proof.
  intros k n A B Hk. rewrite complex_imag_prefix_tail by lia. reflexivity.
Qed.

Lemma complex_imag_prefix_append2 : forall k n A B,
  0 <= k ->
  complex_imag_prefix (k+2) n A B = complex_imag_prefix k n A B ++
  [complex_imag (Z.to_nat n) A B (Z.to_nat k);
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+1))].
Proof.
  intros k n A B Hk. rewrite complex_imag_prefix_tail by lia. reflexivity.
Qed.

Lemma complex_imag_prefix_append3 : forall k n A B,
  0 <= k ->
  complex_imag_prefix (k+3) n A B = complex_imag_prefix k n A B ++
  [complex_imag (Z.to_nat n) A B (Z.to_nat k);
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+1));
   complex_imag (Z.to_nat n) A B (Z.to_nat (k+2))].
Proof.
  intros k n A B Hk. rewrite complex_imag_prefix_tail by lia. reflexivity.
Qed.

Lemma complex_imag_mla_padded : forall n i A B dA dB,
  0 <= n -> 0 <= i < n+3 ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  vcmul_mla (fp32_mul (Znth i A dA) (Znth (n+i) B dB))
    (Znth (n+i) A dA) (Znth i B dB) =
  complex_imag (Z.to_nat n) A B (Z.to_nat i).
Proof. intros; apply complex_imag_mla; lia. Qed.

Lemma complex_imag_mla_active : forall n i A B dA dB,
  0 <= n -> 0 <= i < n ->
  Zlength A = 2*n+3 -> Zlength B = 2*n+3 ->
  vcmul_mla (fp32_mul (Znth i A dA) (Znth (n+i) B dB))
    (Znth (n+i) A dA) (Znth i B dB) =
  complex_imag (Z.to_nat n) A B (Z.to_nat i).
Proof. intros; apply complex_imag_mla; lia. Qed.

Lemma complex_imag_prefix_scalar : forall count n A B i d dA dB,
  0 <= count -> 0 <= n -> 0 <= i < count ->
  n+i < Zlength A -> n+i < Zlength B ->
  Znth i (complex_imag_prefix count n A B) d =
  vcmul_mla (fp32_mul (Znth i A dA) (Znth (n+i) B dB))
    (Znth (n+i) A dA) (Znth i B dB).
Proof.
  intros. rewrite complex_imag_prefix_nth by assumption.
  symmetry. apply complex_imag_mla; lia.
Qed.

