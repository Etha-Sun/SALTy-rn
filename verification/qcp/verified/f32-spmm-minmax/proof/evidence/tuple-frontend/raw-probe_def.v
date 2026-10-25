Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.
Import naive_C_Rules.
Local Open Scope sac.

Record Recordfloat32x4_t : Type := make_record_float32x4_t {
  float32x4_t_s0 : R;
  float32x4_t_s1 : R;
  float32x4_t_s2 : R;
  float32x4_t_s3 : R
}.

Definition zero_record_float32x4_t : Recordfloat32x4_t :=
  make_record_float32x4_t 0 0 0 0.

Definition StructPredfloat32x4_t (x : Z) (v : Recordfloat32x4_t) : Assertion :=
  ((&(x # "float32x4_t" ->ₛ "s0")) # Int  |-> v.(float32x4_t_s0)) **
  ((&(x # "float32x4_t" ->ₛ "s1")) # Int  |-> v.(float32x4_t_s1)) **
  ((&(x # "float32x4_t" ->ₛ "s2")) # Int  |-> v.(float32x4_t_s2)) **
  ((&(x # "float32x4_t" ->ₛ "s3")) # Int  |-> v.(float32x4_t_s3)).

Definition UndefStructPredfloat32x4_t (x : Z) : Assertion :=
  ((&(x # "float32x4_t" ->ₛ "s0")) # Int  |->_) **
  ((&(x # "float32x4_t" ->ₛ "s1")) # Int  |->_) **
  ((&(x # "float32x4_t" ->ₛ "s2")) # Int  |->_) **
  ((&(x # "float32x4_t" ->ₛ "s3")) # Int  |->_).

Lemma store_Predfloat32x4_t_to_undef : forall x v,
  StructPredfloat32x4_t x v |-- UndefStructPredfloat32x4_t x.
Proof.
  intros.
  unfold StructPredfloat32x4_t, UndefStructPredfloat32x4_t.
  sep_apply store_int_undef_store_int.
  sep_apply store_int_undef_store_int.
  sep_apply store_int_undef_store_int.
  sep_apply store_int_undef_store_int.
  cancel.
Qed.

Lemma undefstore_Predfloat32x4_t_to_align : forall x,
  UndefStructPredfloat32x4_t x |-- store_align_n ((((0 + 4) + 4) + 4) + 4).
Proof.
  intros.
  unfold UndefStructPredfloat32x4_t.
  sep_apply undef_store_int_align4.
  sep_apply undef_store_int_align4.
  sep_apply undef_store_int_align4.
  sep_apply undef_store_int_align4.
  sep_apply store_align4_to_store_align.
  sep_apply (store_align_merge (4 * 1)).
  sep_apply (store_align_merge ((4 * 1 + 4 * 1))).
  sep_apply (store_align_merge (((4 * 1 + 4 * 1) + 4 * 1))).
  replace (((((0 + 4) + 4) + 4) + 4)) with 16 by lia.
  replace ((((4 * 1 + 4 * 1) + 4 * 1) + 4 * 1)) with 16 by lia.
  cancel.
Qed.

Lemma store_Predfloat32x4_t_to_align : forall x v,
  StructPredfloat32x4_t x v |-- store_align_n ((((0 + 4) + 4) + 4) + 4).
Proof.
  intros.
  sep_apply store_Predfloat32x4_t_to_undef.
  sep_apply undefstore_Predfloat32x4_t_to_align.
  cancel.
Qed.

Module StoreStructfloat32x4_tAsElement <: ELEMENT_STORE.
  Definition A := Recordfloat32x4_t.
  Definition sizeA := ((((0 + 4) + 4) + 4) + 4).
  Definition storeA (x: addr) (lo: Z) (a: Recordfloat32x4_t): Assertion :=
    (StructPredfloat32x4_t (x + lo * sizeA) a).
  Definition undefstoreA (x: addr) (lo: Z): Assertion :=
    (UndefStructPredfloat32x4_t (x + lo * sizeA)).

  Lemma store_to_undefstore : forall x lo a,
    storeA x lo a |-- undefstoreA x lo.
  Proof.
    intros.
    unfold storeA, undefstoreA.
    sep_apply store_Predfloat32x4_t_to_undef.
    cancel.
  Qed.

  Lemma storeA_shift : forall x n lo a,
    storeA (x + n * sizeA) lo a --||-- storeA x (lo + n) a.
  Proof.
    intros.
    unfold storeA.
    replace (x + n * sizeA + lo * sizeA) with (x + (lo + n) * sizeA) by lia.
    reflexivity.
  Qed.

  Lemma undefstoreA_shift : forall x n lo,
    undefstoreA (x + n * sizeA) lo --||-- undefstoreA x (lo + n).
  Proof.
    intros.
    unfold undefstoreA.
    replace (x + n * sizeA + lo * sizeA) with (x + (lo + n) * sizeA) by lia.
    reflexivity.
  Qed.

  Lemma store_to_align : forall x lo a, storeA x lo a |-- store_align_n sizeA.
  Proof.
    intros.
    unfold storeA, sizeA.
    sep_apply store_Predfloat32x4_t_to_align.
    cancel.
  Qed.

  Lemma undefstore_to_align : forall x lo, undefstoreA x lo |-- store_align_n sizeA.
  Proof.
    intros.
    unfold undefstoreA, sizeA.
    sep_apply undefstore_Predfloat32x4_t_to_align.
    cancel.
  Qed.

  Lemma sizeA_valid : 0 < sizeA < Int.max_unsigned.
  Proof.
    unfold sizeA.
    replace Int.max_unsigned with 4294967295 by reflexivity.
    lia.
  Qed.

End StoreStructfloat32x4_tAsElement.

Module Structfloat32x4_tArray := ArrayLib (StoreStructfloat32x4_tAsElement).

