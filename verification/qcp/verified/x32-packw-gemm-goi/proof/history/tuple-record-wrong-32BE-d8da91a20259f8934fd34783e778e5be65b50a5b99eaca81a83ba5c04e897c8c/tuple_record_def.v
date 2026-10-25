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

Record Recorduint32x2_t : Type := make_record_uint32x2_t {
  uint32x2_t_s0 : Z;
  uint32x2_t_s1 : Z
}.

Definition zero_record_uint32x2_t : Recorduint32x2_t :=
  make_record_uint32x2_t 0 0.

Definition StructPreduint32x2_t (x : Z) (v : Recorduint32x2_t) : Assertion :=
  ((&(x # "uint32x2_t" ->ₛ "s0")) # UInt  |-> v.(uint32x2_t_s0)) **
  ((&(x # "uint32x2_t" ->ₛ "s1")) # UInt  |-> v.(uint32x2_t_s1)).

Definition UndefStructPreduint32x2_t (x : Z) : Assertion :=
  ((&(x # "uint32x2_t" ->ₛ "s0")) # UInt  |->_) **
  ((&(x # "uint32x2_t" ->ₛ "s1")) # UInt  |->_).

Lemma store_Preduint32x2_t_to_undef : forall x v,
  StructPreduint32x2_t x v |-- UndefStructPreduint32x2_t x.
Proof.
  intros.
  unfold StructPreduint32x2_t, UndefStructPreduint32x2_t.
  sep_apply store_uint_undef_store_uint.
  sep_apply store_uint_undef_store_uint.
  cancel.
Qed.

Lemma undefstore_Preduint32x2_t_to_align : forall x,
  UndefStructPreduint32x2_t x |-- store_align_n ((0 + sizeof(UINT)) + sizeof(UINT)).
Proof.
  intros.
  unfold UndefStructPreduint32x2_t.
  sep_apply undef_store_uint_align4.
  sep_apply undef_store_uint_align4.
  sep_apply store_align4_to_store_align.
  sep_apply (store_align_merge (4 * 1)).
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  replace (((0 + 4) + 4)) with 8 by lia.
  replace ((4 * 1 + 4 * 1)) with 8 by lia.
  cancel.
Qed.

Lemma store_Preduint32x2_t_to_align : forall x v,
  StructPreduint32x2_t x v |-- store_align_n ((0 + sizeof(UINT)) + sizeof(UINT)).
Proof.
  intros.
  sep_apply store_Preduint32x2_t_to_undef.
  sep_apply undefstore_Preduint32x2_t_to_align.
  cancel.
Qed.

Module StoreStructuint32x2_tAsElement <: ELEMENT_STORE.
  Definition A := Recorduint32x2_t.
  Definition sizeA := ((0 + sizeof(UINT)) + sizeof(UINT)).
  Definition storeA (x: addr) (lo: Z) (a: Recorduint32x2_t): Assertion :=
    (StructPreduint32x2_t (x + lo * sizeA) a).
  Definition undefstoreA (x: addr) (lo: Z): Assertion :=
    (UndefStructPreduint32x2_t (x + lo * sizeA)).

  Lemma store_to_undefstore : forall x lo a,
    storeA x lo a |-- undefstoreA x lo.
  Proof.
    intros.
    unfold storeA, undefstoreA.
    sep_apply store_Preduint32x2_t_to_undef.
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
    sep_apply store_Preduint32x2_t_to_align.
    cancel.
  Qed.

  Lemma undefstore_to_align : forall x lo, undefstoreA x lo |-- store_align_n sizeA.
  Proof.
    intros.
    unfold undefstoreA, sizeA.
    sep_apply undefstore_Preduint32x2_t_to_align.
    cancel.
  Qed.

  Lemma sizeA_valid : 0 < sizeA < Int.max_unsigned.
  Proof.
    unfold sizeA.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
    replace Int.max_unsigned with 4294967295 by reflexivity.
    lia.
  Qed.

End StoreStructuint32x2_tAsElement.

Module Structuint32x2_tArray := ArrayLib (StoreStructuint32x2_tAsElement).

Record Recorduint32x2x2_t : Type := make_record_uint32x2x2_t {
  uint32x2x2_t_val : list Recorduint32x2_t
}.

Definition zero_record_uint32x2x2_t : Recorduint32x2x2_t :=
  make_record_uint32x2x2_t (repeat_Z zero_record_uint32x2_t 2).

Definition StructPreduint32x2x2_t (x : Z) (v : Recorduint32x2x2_t) : Assertion :=
  (Structuint32x2_tArray.full (&(x # "uint32x2x2_t" ->ₛ "val")) 2 v.(uint32x2x2_t_val)).

Definition UndefStructPreduint32x2x2_t (x : Z) : Assertion :=
  (Structuint32x2_tArray.undef_full (&(x # "uint32x2x2_t" ->ₛ "val")) 2).

Lemma store_Preduint32x2x2_t_to_undef : forall x v,
  StructPreduint32x2x2_t x v |-- UndefStructPreduint32x2x2_t x.
Proof.
  intros.
  unfold StructPreduint32x2x2_t, UndefStructPreduint32x2x2_t.
  sep_apply Structuint32x2_tArray.full_to_undef_full.
  cancel.
Qed.

Lemma undefstore_Preduint32x2x2_t_to_align : forall x,
  UndefStructPreduint32x2x2_t x |-- store_align_n (0 + (2 * StoreStructuint32x2_tAsElement.sizeA)).
Proof.
  intros.
  unfold UndefStructPreduint32x2x2_t.
  sep_apply Structuint32x2_tArray.undef_full_to_align.
  unfold StoreStructuint32x2_tAsElement.sizeA.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  replace ((0 + (2 * ((0 + 4) + 4)))) with 16 by lia.
  replace ((2 * ((0 + 4) + 4))) with 16 by lia.
  cancel.
Qed.

Lemma store_Preduint32x2x2_t_to_align : forall x v,
  StructPreduint32x2x2_t x v |-- store_align_n (0 + (2 * StoreStructuint32x2_tAsElement.sizeA)).
Proof.
  intros.
  sep_apply store_Preduint32x2x2_t_to_undef.
  sep_apply undefstore_Preduint32x2x2_t_to_align.
  cancel.
Qed.

Module StoreStructuint32x2x2_tAsElement <: ELEMENT_STORE.
  Definition A := Recorduint32x2x2_t.
  Definition sizeA := (0 + (2 * StoreStructuint32x2_tAsElement.sizeA)).
  Definition storeA (x: addr) (lo: Z) (a: Recorduint32x2x2_t): Assertion :=
    (StructPreduint32x2x2_t (x + lo * sizeA) a).
  Definition undefstoreA (x: addr) (lo: Z): Assertion :=
    (UndefStructPreduint32x2x2_t (x + lo * sizeA)).

  Lemma store_to_undefstore : forall x lo a,
    storeA x lo a |-- undefstoreA x lo.
  Proof.
    intros.
    unfold storeA, undefstoreA.
    sep_apply store_Preduint32x2x2_t_to_undef.
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
    sep_apply store_Preduint32x2x2_t_to_align.
    cancel.
  Qed.

  Lemma undefstore_to_align : forall x lo, undefstoreA x lo |-- store_align_n sizeA.
  Proof.
    intros.
    unfold undefstoreA, sizeA.
    sep_apply undefstore_Preduint32x2x2_t_to_align.
    cancel.
  Qed.

  Lemma sizeA_valid : 0 < sizeA < Int.max_unsigned.
  Proof.
    unfold sizeA.
  unfold StoreStructuint32x2_tAsElement.sizeA.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
    replace Int.max_unsigned with 4294967295 by reflexivity.
    lia.
  Qed.

End StoreStructuint32x2x2_tAsElement.

Module Structuint32x2x2_tArray := ArrayLib (StoreStructuint32x2x2_tAsElement).

