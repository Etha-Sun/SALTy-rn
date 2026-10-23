From Coq Require Import ZArith List Lia.
From QcpNeonLoop Require Import LoopMemory.
From QcpNeon Require Import NeonBridge.
From QcpVadd Require Import VaddBits.
From AUXLib Require Import ListLib.
Import Snaive_C_Rules64.
Require Import VaddSegments.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma slice_first_four : forall (xs:list fp32) d,
  4 <= Zlength xs ->
  fp32_slice 0 4 xs = [Znth 0 xs d; Znth 1 xs d; Znth 2 xs d; Znth 3 xs d].
Proof.
  intros xs d Hlen. unfold fp32_slice, sublist, Znth.
  rewrite Zlength_correct in Hlen.
  destruct xs as [|x0 xs]; [simpl in Hlen; lia|].
  destruct xs as [|x1 xs]; [simpl in Hlen; lia|].
  destruct xs as [|x2 xs]; [simpl in Hlen; lia|].
  destruct xs as [|x3 xs]; [simpl in Hlen; lia|].
  reflexivity.
Qed.

Lemma vadd_first_four : forall (a b:list fp32) d,
  4 <= Zlength a -> 4 <= Zlength b ->
  vadd_values 4 a b =
  [fp32_mul (Znth 0 a d) (Znth 0 b d);
   fp32_mul (Znth 1 a d) (Znth 1 b d);
   fp32_mul (Znth 2 a d) (Znth 2 b d);
   fp32_mul (Znth 3 a d) (Znth 3 b d)].
Proof.
  intros a b d Ha Hb. rewrite !Zlength_correct in *.
  destruct a as [|a0 a]; [simpl in Ha; lia|].
  destruct a as [|a1 a]; [simpl in Ha; lia|].
  destruct a as [|a2 a]; [simpl in Ha; lia|].
  destruct a as [|a3 a]; [simpl in Ha; lia|].
  destruct b as [|b0 b]; [simpl in Hb; lia|].
  destruct b as [|b1 b]; [simpl in Hb; lia|].
  destruct b as [|b2 b]; [simpl in Hb; lia|].
  destruct b as [|b3 b]; [simpl in Hb; lia|].
  reflexivity.
Qed.

Print Assumptions slice_first_four.
Print Assumptions vadd_first_four.

Lemma slice_to_skipn : forall k n (xs:list fp32),
  n = Zlength xs -> fp32_slice k n xs = skipn (Z.to_nat k) xs.
Proof.
 intros k n xs Hn. unfold fp32_slice, sublist.
 rewrite Hn, Zlength_correct, Nat2Z.id, firstn_all. reflexivity.
Qed.

Lemma vadd_step_four : forall k n (a b:list fp32) d,
  0 <= k -> k+4 <= n -> n = Zlength a -> n = Zlength b ->
  vadd_values (k+4) a b = vadd_values k a b ++
  [fp32_mul (Znth 0 (fp32_slice k n a) d) (Znth 0 (fp32_slice k n b) d);
   fp32_mul (Znth 1 (fp32_slice k n a) d) (Znth 1 (fp32_slice k n b) d);
   fp32_mul (Znth 2 (fp32_slice k n a) d) (Znth 2 (fp32_slice k n b) d);
   fp32_mul (Znth 3 (fp32_slice k n a) d) (Znth 3 (fp32_slice k n b) d)].
Proof.
 intros k n a b d Hk Hkn Ha Hb.
 rewrite vadd_values_split by lia.
 rewrite <- (slice_to_skipn k n a Ha), <- (slice_to_skipn k n b Hb).
 rewrite (vadd_first_four _ _ d); [reflexivity| |];
 unfold fp32_slice; rewrite Zlength_sublist; lia.
Qed.

Lemma slice_step_four : forall k n (xs:list fp32) d,
  0 <= k -> k+4 <= n -> n = Zlength xs ->
  fp32_slice 0 (k+4) xs = fp32_slice 0 k xs ++
  [Znth 0 (fp32_slice k n xs) d; Znth 1 (fp32_slice k n xs) d;
   Znth 2 (fp32_slice k n xs) d; Znth 3 (fp32_slice k n xs) d].
Proof.
 intros k n xs d Hk Hkn Hn.
 rewrite <- slice_first_four by (unfold fp32_slice; rewrite Zlength_sublist; lia).
 unfold fp32_slice. rewrite Zsublist_Zsublist by lia.
 replace (0+k) with k by lia.
 replace (4+k) with (k+4) by lia.
 apply sublist_split; lia.
Qed.

Lemma slice_suffix_four : forall k n (xs:list fp32),
  0 <= k -> k+4 <= n ->
  fp32_slice 4 (n-k) (fp32_slice k n xs) = fp32_slice (k+4) n xs.
Proof.
 intros. unfold fp32_slice. rewrite Zsublist_Zsublist by lia.
 f_equal; lia.
Qed.
Print Assumptions vadd_step_four.
Print Assumptions slice_step_four.
Print Assumptions slice_suffix_four.

Lemma float_input_step_four : forall p k n (xs:list fp32) d,
  0 <= k -> k+4 <= n -> n = Zlength xs ->
  FloatArray.full p k (fp32_slice 0 k xs) **
  float_cells4 (p+k*sizeof(FLOAT))
    (Znth 0 (fp32_slice k n xs) d) (Znth 1 (fp32_slice k n xs) d)
    (Znth 2 (fp32_slice k n xs) d) (Znth 3 (fp32_slice k n xs) d) **
  FloatArray.seg (p+k*sizeof(FLOAT)) 4 (n-k) (fp32_slice 4 (n-k) (fp32_slice k n xs))
  |-- FloatArray.full p (k+4) (fp32_slice 0 (k+4) xs) **
      FloatArray.full (p+(k+4)*sizeof(FLOAT)) (n-(k+4)) (fp32_slice (k+4) n xs).
Proof.
 intros p k n xs d Hk Hkn Hn.
 sep_apply (float_prefix_append4 p k (fp32_slice 0 k xs)
    (Znth 0 (fp32_slice k n xs) d) (Znth 1 (fp32_slice k n xs) d)
    (Znth 2 (fp32_slice k n xs) d) (Znth 3 (fp32_slice k n xs) d) Hk).
 sep_apply (float_suffix_after4 (p+k*sizeof(FLOAT)) (n-k)
    (fp32_slice 4 (n-k) (fp32_slice k n xs))).
 rewrite <- (slice_step_four k n xs d Hk Hkn Hn).
 rewrite slice_suffix_four by lia.
 replace (p+k*sizeof(FLOAT)+4*sizeof(FLOAT)) with (p+(k+4)*sizeof(FLOAT)) by ring.
 replace (n-k-4) with (n-(k+4)) by lia.
 entailer!.
Qed.

Lemma float_output_step_four : forall p k n total (a b:list fp32) d,
  0 <= k -> k+4 <= n -> n <= total -> total = Zlength a -> total = Zlength b ->
  FloatArray.full p k (vadd_values k a b) **
  float_cells4 (p+k*sizeof(FLOAT))
    (fp32_mul (Znth 0 (fp32_slice k total a) d) (Znth 0 (fp32_slice k total b) d))
    (fp32_mul (Znth 1 (fp32_slice k total a) d) (Znth 1 (fp32_slice k total b) d))
    (fp32_mul (Znth 2 (fp32_slice k total a) d) (Znth 2 (fp32_slice k total b) d))
    (fp32_mul (Znth 3 (fp32_slice k total a) d) (Znth 3 (fp32_slice k total b) d)) **
  FloatArray.undef_seg (p+k*sizeof(FLOAT)) 4 (n-k)
  |-- FloatArray.full p (k+4) (vadd_values (k+4) a b) **
      FloatArray.undef_full (p+(k+4)*sizeof(FLOAT)) (n-(k+4)).
Proof.
 intros p k n total a b d Hk Hkn Hnt Ha Hb.
 sep_apply (float_prefix_append4 p k (vadd_values k a b)
    (fp32_mul (Znth 0 (fp32_slice k total a) d) (Znth 0 (fp32_slice k total b) d))
    (fp32_mul (Znth 1 (fp32_slice k total a) d) (Znth 1 (fp32_slice k total b) d))
    (fp32_mul (Znth 2 (fp32_slice k total a) d) (Znth 2 (fp32_slice k total b) d))
    (fp32_mul (Znth 3 (fp32_slice k total a) d) (Znth 3 (fp32_slice k total b) d)) Hk).
 sep_apply (FloatArray.undef_seg_to_undef_full (p+k*sizeof(FLOAT)) 4 (n-k)).
 rewrite <- (vadd_step_four k total a b d Hk ltac:(lia) Ha Hb).
 replace (p+k*sizeof(FLOAT)+4*sizeof(FLOAT)) with (p+(k+4)*sizeof(FLOAT)) by ring.
 replace (n-k-4) with (n-(k+4)) by lia.
 entailer!.
Qed.
Print Assumptions float_input_step_four.
Print Assumptions float_output_step_four.

Lemma float_address_nonnegative : forall p v,
  p # Float |-> v |-- “ 0 <= p ”.
Proof.
 intros. prop_apply (valid_store_float p v). Intros_p Hvalid.
 unfold isvalidptr_float, valid_object, valid_addr_range in Hvalid.
 entailer!.
Qed.
Print Assumptions float_address_nonnegative.
