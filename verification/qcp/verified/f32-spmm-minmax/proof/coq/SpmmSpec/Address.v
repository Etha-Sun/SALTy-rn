From Coq Require Import ZArith Lia.
From SpmmSpec Require Export Packing.
Local Open Scope Z_scope.

(** Intermediate unsigned expressions may wrap; only accessed addresses
    require a capacity bound. This covers the original NEON decrement. *)
Definition word64 (x:Z) := x mod modulus64.
(** Keep byte arithmetic inside a Z-valued definition. In a C annotation,
    addition directly on a float pointer would scale its offset by four. *)
Definition spmm_output_cursor (base row stride column:Z) :=
 word64 (base+4*row+stride*column).
Lemma word64_sub : forall x y,
 word64 (word64 x - word64 y) = word64 (x-y).
Proof.
 intros;unfold word64;rewrite Zminus_mod.
 rewrite !Z.mod_mod by (pose proof modulus64_positive;lia).
 symmetry;apply Zminus_mod.
Qed.
Lemma word64_sub_left : forall x y,
 word64 (word64 x-y)=word64 (x-y).
Proof.
 intros;unfold word64;rewrite Zminus_mod.
 rewrite Z.mod_mod by (pose proof modulus64_positive;lia).
 symmetry;apply Zminus_mod.
Qed.
Lemma word64_add_right : forall x y,
 word64 (x+word64 y)=word64 (x+y).
Proof. intros;unfold word64;apply Z.add_mod_idemp_r;pose proof modulus64_positive;lia. Qed.
Lemma output_strip_restore : forall base stride columns step,
 word64 (word64 (base+word64(stride*columns))-
         word64(word64(stride*columns)-step)) = word64(base+step).
Proof.
 intros;rewrite word64_sub.
 replace (base + word64 (stride*columns) - (word64(stride*columns)-step))
  with (base+step) by ring;reflexivity.
Qed.
Lemma output_strip_restore_in_bounds : forall base stride columns step,
 0<=base+step<modulus64 ->
 word64 (word64 (base+word64(stride*columns))-
         word64(word64(stride*columns)-step)) = base+step.
Proof. intros;rewrite output_strip_restore;unfold word64;now apply Z.mod_small. Qed.
Print Assumptions word64_sub.
Print Assumptions word64_sub_left.
Print Assumptions word64_add_right.
Print Assumptions output_strip_restore.
Print Assumptions output_strip_restore_in_bounds.
