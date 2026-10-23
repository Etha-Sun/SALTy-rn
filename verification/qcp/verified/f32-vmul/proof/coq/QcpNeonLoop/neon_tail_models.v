From Coq Require Import ZArith List Lia.
From QcpNeonLoop Require Import neon_init_lemmas.
From QcpNeon Require Import NeonBridge.
From QcpVadd Require Import VaddBits.
From AUXLib Require Import ListLib.
Require Import VaddSegments.
Import ListNotations.
Local Open Scope Z_scope.

Lemma vadd_values_take : forall m n (a b:list fp32),
  0 <= m <= n ->
  firstn (Z.to_nat m) (vadd_values n a b) = vadd_values m a b.
Proof.
 intros m n a b Hmn. unfold vadd_values.
 rewrite firstn_firstn, Nat.min_l; [reflexivity|lia].
Qed.

Lemma vadd_tail_four : forall k m (a b:list fp32) d,
  0 <= k -> 0 <= m <= 4 -> k+4 <= Zlength a -> k+4 <= Zlength b ->
  vadd_values (k+m) a b = vadd_values k a b ++
  firstn (Z.to_nat m)
   [fp32_mul (Znth 0 (fp32_slice k (Zlength a) a) d) (Znth 0 (fp32_slice k (Zlength b) b) d);
    fp32_mul (Znth 1 (fp32_slice k (Zlength a) a) d) (Znth 1 (fp32_slice k (Zlength b) b) d);
    fp32_mul (Znth 2 (fp32_slice k (Zlength a) a) d) (Znth 2 (fp32_slice k (Zlength b) b) d);
    fp32_mul (Znth 3 (fp32_slice k (Zlength a) a) d) (Znth 3 (fp32_slice k (Zlength b) b) d)].
Proof.
 intros k m a b d Hk Hm Ha Hb.
 rewrite vadd_values_split by lia.
 rewrite <- (slice_to_skipn k (Zlength a) a eq_refl),
         <- (slice_to_skipn k (Zlength b) b eq_refl).
 rewrite <- (vadd_values_take m 4 _ _ Hm).
 rewrite (vadd_first_four _ _ d); [reflexivity| |];
 unfold fp32_slice; rewrite Zlength_sublist; lia.
Qed.

Print Assumptions vadd_values_take.
Print Assumptions vadd_tail_four.
