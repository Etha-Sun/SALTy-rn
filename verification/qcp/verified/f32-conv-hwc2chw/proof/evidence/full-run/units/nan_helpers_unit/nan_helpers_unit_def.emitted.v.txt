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

Record Recordvbool32_t : Type := make_record_vbool32_t {
  vbool32_t_s0 : Z;
  vbool32_t_s1 : Z;
  vbool32_t_s2 : Z;
  vbool32_t_s3 : Z
}.

Definition zero_record_vbool32_t : Recordvbool32_t :=
  make_record_vbool32_t 0 0 0 0.

Definition StructPredvbool32_t (x : Z) (v : Recordvbool32_t) : Assertion :=
  ((&(x # "vbool32_t" ->ₛ "s0")) # UInt  |-> v.(vbool32_t_s0)) **
  ((&(x # "vbool32_t" ->ₛ "s1")) # UInt  |-> v.(vbool32_t_s1)) **
  ((&(x # "vbool32_t" ->ₛ "s2")) # UInt  |-> v.(vbool32_t_s2)) **
  ((&(x # "vbool32_t" ->ₛ "s3")) # UInt  |-> v.(vbool32_t_s3)).

Definition UndefStructPredvbool32_t (x : Z) : Assertion :=
  ((&(x # "vbool32_t" ->ₛ "s0")) # UInt  |->_) **
  ((&(x # "vbool32_t" ->ₛ "s1")) # UInt  |->_) **
  ((&(x # "vbool32_t" ->ₛ "s2")) # UInt  |->_) **
  ((&(x # "vbool32_t" ->ₛ "s3")) # UInt  |->_).

Lemma store_Predvbool32_t_to_undef : forall x v,
  StructPredvbool32_t x v |-- UndefStructPredvbool32_t x.
Proof.
  intros.
  unfold StructPredvbool32_t, UndefStructPredvbool32_t.
  sep_apply store_uint_undef_store_uint.
  sep_apply store_uint_undef_store_uint.
  sep_apply store_uint_undef_store_uint.
  sep_apply store_uint_undef_store_uint.
  cancel.
Qed.

Lemma undefstore_Predvbool32_t_to_align : forall x,
  UndefStructPredvbool32_t x |-- store_align_n ((((0 + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)).
Proof.
  intros.
  unfold UndefStructPredvbool32_t.
  sep_apply undef_store_uint_align4.
  sep_apply undef_store_uint_align4.
  sep_apply undef_store_uint_align4.
  sep_apply undef_store_uint_align4.
  sep_apply store_align4_to_store_align.
  sep_apply (store_align_merge (4 * 1)).
  sep_apply (store_align_merge ((4 * 1 + 4 * 1))).
  sep_apply (store_align_merge (((4 * 1 + 4 * 1) + 4 * 1))).
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  replace (((((0 + 4) + 4) + 4) + 4)) with 16 by lia.
  replace ((((4 * 1 + 4 * 1) + 4 * 1) + 4 * 1)) with 16 by lia.
  cancel.
Qed.

Lemma store_Predvbool32_t_to_align : forall x v,
  StructPredvbool32_t x v |-- store_align_n ((((0 + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)).
Proof.
  intros.
  sep_apply store_Predvbool32_t_to_undef.
  sep_apply undefstore_Predvbool32_t_to_align.
  cancel.
Qed.

Module StoreStructvbool32_tAsElement <: ELEMENT_STORE.
  Definition A := Recordvbool32_t.
  Definition sizeA := ((((0 + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)).
  Definition storeA (x: addr) (lo: Z) (a: Recordvbool32_t): Assertion :=
    (StructPredvbool32_t (x + lo * sizeA) a).
  Definition undefstoreA (x: addr) (lo: Z): Assertion :=
    (UndefStructPredvbool32_t (x + lo * sizeA)).

  Lemma store_to_undefstore : forall x lo a,
    storeA x lo a |-- undefstoreA x lo.
  Proof.
    intros.
    unfold storeA, undefstoreA.
    sep_apply store_Predvbool32_t_to_undef.
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
    sep_apply store_Predvbool32_t_to_align.
    cancel.
  Qed.

  Lemma undefstore_to_align : forall x lo, undefstoreA x lo |-- store_align_n sizeA.
  Proof.
    intros.
    unfold undefstoreA, sizeA.
    sep_apply undefstore_Predvbool32_t_to_align.
    cancel.
  Qed.

  Lemma sizeA_valid : 0 < sizeA < Int.max_unsigned.
  Proof.
    unfold sizeA.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
    replace Int.max_unsigned with 4294967295 by reflexivity.
    lia.
  Qed.

End StoreStructvbool32_tAsElement.

Module Structvbool32_tArray := ArrayLib (StoreStructvbool32_tAsElement).

Record Recordvuint32m1_t : Type := make_record_vuint32m1_t {
  vuint32m1_t_s0 : Z;
  vuint32m1_t_s1 : Z;
  vuint32m1_t_s2 : Z;
  vuint32m1_t_s3 : Z
}.

Definition zero_record_vuint32m1_t : Recordvuint32m1_t :=
  make_record_vuint32m1_t 0 0 0 0.

Definition StructPredvuint32m1_t (x : Z) (v : Recordvuint32m1_t) : Assertion :=
  ((&(x # "vuint32m1_t" ->ₛ "s0")) # UInt  |-> v.(vuint32m1_t_s0)) **
  ((&(x # "vuint32m1_t" ->ₛ "s1")) # UInt  |-> v.(vuint32m1_t_s1)) **
  ((&(x # "vuint32m1_t" ->ₛ "s2")) # UInt  |-> v.(vuint32m1_t_s2)) **
  ((&(x # "vuint32m1_t" ->ₛ "s3")) # UInt  |-> v.(vuint32m1_t_s3)).

Definition UndefStructPredvuint32m1_t (x : Z) : Assertion :=
  ((&(x # "vuint32m1_t" ->ₛ "s0")) # UInt  |->_) **
  ((&(x # "vuint32m1_t" ->ₛ "s1")) # UInt  |->_) **
  ((&(x # "vuint32m1_t" ->ₛ "s2")) # UInt  |->_) **
  ((&(x # "vuint32m1_t" ->ₛ "s3")) # UInt  |->_).

Lemma store_Predvuint32m1_t_to_undef : forall x v,
  StructPredvuint32m1_t x v |-- UndefStructPredvuint32m1_t x.
Proof.
  intros.
  unfold StructPredvuint32m1_t, UndefStructPredvuint32m1_t.
  sep_apply store_uint_undef_store_uint.
  sep_apply store_uint_undef_store_uint.
  sep_apply store_uint_undef_store_uint.
  sep_apply store_uint_undef_store_uint.
  cancel.
Qed.

Lemma undefstore_Predvuint32m1_t_to_align : forall x,
  UndefStructPredvuint32m1_t x |-- store_align_n ((((0 + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)).
Proof.
  intros.
  unfold UndefStructPredvuint32m1_t.
  sep_apply undef_store_uint_align4.
  sep_apply undef_store_uint_align4.
  sep_apply undef_store_uint_align4.
  sep_apply undef_store_uint_align4.
  sep_apply store_align4_to_store_align.
  sep_apply (store_align_merge (4 * 1)).
  sep_apply (store_align_merge ((4 * 1 + 4 * 1))).
  sep_apply (store_align_merge (((4 * 1 + 4 * 1) + 4 * 1))).
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  replace (((((0 + 4) + 4) + 4) + 4)) with 16 by lia.
  replace ((((4 * 1 + 4 * 1) + 4 * 1) + 4 * 1)) with 16 by lia.
  cancel.
Qed.

Lemma store_Predvuint32m1_t_to_align : forall x v,
  StructPredvuint32m1_t x v |-- store_align_n ((((0 + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)).
Proof.
  intros.
  sep_apply store_Predvuint32m1_t_to_undef.
  sep_apply undefstore_Predvuint32m1_t_to_align.
  cancel.
Qed.

Module StoreStructvuint32m1_tAsElement <: ELEMENT_STORE.
  Definition A := Recordvuint32m1_t.
  Definition sizeA := ((((0 + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)) + sizeof(UINT)).
  Definition storeA (x: addr) (lo: Z) (a: Recordvuint32m1_t): Assertion :=
    (StructPredvuint32m1_t (x + lo * sizeA) a).
  Definition undefstoreA (x: addr) (lo: Z): Assertion :=
    (UndefStructPredvuint32m1_t (x + lo * sizeA)).

  Lemma store_to_undefstore : forall x lo a,
    storeA x lo a |-- undefstoreA x lo.
  Proof.
    intros.
    unfold storeA, undefstoreA.
    sep_apply store_Predvuint32m1_t_to_undef.
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
    sep_apply store_Predvuint32m1_t_to_align.
    cancel.
  Qed.

  Lemma undefstore_to_align : forall x lo, undefstoreA x lo |-- store_align_n sizeA.
  Proof.
    intros.
    unfold undefstoreA, sizeA.
    sep_apply undefstore_Predvuint32m1_t_to_align.
    cancel.
  Qed.

  Lemma sizeA_valid : 0 < sizeA < Int.max_unsigned.
  Proof.
    unfold sizeA.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
  try rewrite sizeof_uint.
    replace Int.max_unsigned with 4294967295 by reflexivity.
    lia.
  Qed.

End StoreStructvuint32m1_tAsElement.

Module Structvuint32m1_tArray := ArrayLib (StoreStructvuint32m1_tAsElement).

Record Recordvfloat32m1_t : Type := make_record_vfloat32m1_t {
  vfloat32m1_t_s0 : R;
  vfloat32m1_t_s1 : R;
  vfloat32m1_t_s2 : R;
  vfloat32m1_t_s3 : R
}.

Definition zero_record_vfloat32m1_t : Recordvfloat32m1_t :=
  make_record_vfloat32m1_t 0 0 0 0.

Definition StructPredvfloat32m1_t (x : Z) (v : Recordvfloat32m1_t) : Assertion :=
  ((&(x # "vfloat32m1_t" ->ₛ "s0")) # Int  |-> v.(vfloat32m1_t_s0)) **
  ((&(x # "vfloat32m1_t" ->ₛ "s1")) # Int  |-> v.(vfloat32m1_t_s1)) **
  ((&(x # "vfloat32m1_t" ->ₛ "s2")) # Int  |-> v.(vfloat32m1_t_s2)) **
  ((&(x # "vfloat32m1_t" ->ₛ "s3")) # Int  |-> v.(vfloat32m1_t_s3)).

Definition UndefStructPredvfloat32m1_t (x : Z) : Assertion :=
  ((&(x # "vfloat32m1_t" ->ₛ "s0")) # Int  |->_) **
  ((&(x # "vfloat32m1_t" ->ₛ "s1")) # Int  |->_) **
  ((&(x # "vfloat32m1_t" ->ₛ "s2")) # Int  |->_) **
  ((&(x # "vfloat32m1_t" ->ₛ "s3")) # Int  |->_).

Lemma store_Predvfloat32m1_t_to_undef : forall x v,
  StructPredvfloat32m1_t x v |-- UndefStructPredvfloat32m1_t x.
Proof.
  intros.
  unfold StructPredvfloat32m1_t, UndefStructPredvfloat32m1_t.
  sep_apply store_int_undef_store_int.
  sep_apply store_int_undef_store_int.
  sep_apply store_int_undef_store_int.
  sep_apply store_int_undef_store_int.
  cancel.
Qed.

Lemma undefstore_Predvfloat32m1_t_to_align : forall x,
  UndefStructPredvfloat32m1_t x |-- store_align_n ((((0 + 4) + 4) + 4) + 4).
Proof.
  intros.
  unfold UndefStructPredvfloat32m1_t.
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

Lemma store_Predvfloat32m1_t_to_align : forall x v,
  StructPredvfloat32m1_t x v |-- store_align_n ((((0 + 4) + 4) + 4) + 4).
Proof.
  intros.
  sep_apply store_Predvfloat32m1_t_to_undef.
  sep_apply undefstore_Predvfloat32m1_t_to_align.
  cancel.
Qed.

Module StoreStructvfloat32m1_tAsElement <: ELEMENT_STORE.
  Definition A := Recordvfloat32m1_t.
  Definition sizeA := ((((0 + 4) + 4) + 4) + 4).
  Definition storeA (x: addr) (lo: Z) (a: Recordvfloat32m1_t): Assertion :=
    (StructPredvfloat32m1_t (x + lo * sizeA) a).
  Definition undefstoreA (x: addr) (lo: Z): Assertion :=
    (UndefStructPredvfloat32m1_t (x + lo * sizeA)).

  Lemma store_to_undefstore : forall x lo a,
    storeA x lo a |-- undefstoreA x lo.
  Proof.
    intros.
    unfold storeA, undefstoreA.
    sep_apply store_Predvfloat32m1_t_to_undef.
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
    sep_apply store_Predvfloat32m1_t_to_align.
    cancel.
  Qed.

  Lemma undefstore_to_align : forall x lo, undefstoreA x lo |-- store_align_n sizeA.
  Proof.
    intros.
    unfold undefstoreA, sizeA.
    sep_apply undefstore_Predvfloat32m1_t_to_align.
    cancel.
  Qed.

  Lemma sizeA_valid : 0 < sizeA < Int.max_unsigned.
  Proof.
    unfold sizeA.
    replace Int.max_unsigned with 4294967295 by reflexivity.
    lia.
  Qed.

End StoreStructvfloat32m1_tAsElement.

Module Structvfloat32m1_tArray := ArrayLib (StoreStructvfloat32m1_tAsElement).

