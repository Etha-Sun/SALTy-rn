Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import F32F16.Types.
Require Import F32F16.UShortStoreModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition f16_ushort_store_strategy4 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((UShortArray.undef_full p n))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UShortArray.undef_seg q 0 m))
    ).

Definition f16_ushort_store_strategy5 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z) (l : (@list Z)),
    TT &&
    emp -*
    TT &&
    emp **
    ((UShortArray.seg p 0 0 ( f16_take 0 l)))
    ).

Definition f16_ushort_store_strategy1 :=
  forall (lo : Z) (hi : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = (Z.add p (Z.mul 2 lo))) ”) &&
    (“ (Z.lt lo hi) ”) &&
    emp **
    ((UShortArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp **
    ((UShortArray.undef_seg p (Z.add lo 1) hi))
    ) ** (
    ALL uint16_t,
      TT &&
      emp -*
      TT &&
      emp **
      ((poly_undef_store uint16_t q))
      ).

Definition f16_ushort_store_strategy2 :=
  forall (hi : Z) (hi2 : Z) (p : Z) (q : Z) (lo2 : Z) (lo : Z) (l : (@list Z)),
    TT &&
    (“ (p = q) ”) &&
    (“ (lo = lo2) ”) &&
    (“ (hi = hi2) ”) &&
    emp **
    ((UShortArray.seg p lo hi l))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (r : (@list Z)),
      TT &&
      (“ (l = r) ”) &&
      emp -*
      TT &&
      emp **
      ((UShortArray.seg q lo2 hi2 r))
      ).

Definition f16_ushort_store_strategy3 :=
  forall (hi : Z) (hi2 : Z) (p : Z) (q : Z) (lo2 : Z) (lo : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (lo = lo2) ”) &&
    (“ (hi = hi2) ”) &&
    emp **
    ((UShortArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UShortArray.undef_seg q lo2 hi2))
    ).

Module Type f16_ushort_store_Strategy_Correct.

  Axiom f16_ushort_store_strategy4_correctness : f16_ushort_store_strategy4.
  Axiom f16_ushort_store_strategy5_correctness : f16_ushort_store_strategy5.
  Axiom f16_ushort_store_strategy1_correctness : f16_ushort_store_strategy1.
  Axiom f16_ushort_store_strategy2_correctness : f16_ushort_store_strategy2.
  Axiom f16_ushort_store_strategy3_correctness : f16_ushort_store_strategy3.

End f16_ushort_store_Strategy_Correct.
