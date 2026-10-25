Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Require Import Qs8Mul.VectorValues.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition byte_store_strategy4 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((CharArray.undef_full p n))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((CharArray.undef_seg q 0 m))
    ).

Definition byte_store_strategy5 :=
  forall (n : Z),
    TT &&
    (“ (n = 0) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (p : Z) (L : (@list Z)),
      TT &&
      emp -*
      TT &&
      emp **
      ((CharArray.full p n ( qm_take32 n L)))
      ).

Definition byte_store_strategy1 :=
  forall (lo : Z) (hi : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = (Z.add p (Z.mul lo (@sizeof_front_end_type FET_char)))) ”) &&
    (“ (Z.lt lo hi) ”) &&
    emp **
    ((CharArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp **
    ((CharArray.undef_seg p (Z.add lo 1) hi))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_char q))
    ).

Definition byte_store_strategy2 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z) (l : (@list Z)),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((CharArray.full p n l))
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
      ((CharArray.full q m r))
      ).

Definition byte_store_strategy3 :=
  forall (hi : Z) (hi2 : Z) (p : Z) (q : Z) (lo2 : Z) (lo : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (lo = lo2) ”) &&
    (“ (hi = hi2) ”) &&
    emp **
    ((CharArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((CharArray.undef_seg q lo2 hi2))
    ).

Definition byte_store_strategy6 :=
  forall (n : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (Z.lt 0 n) ”) &&
    emp **
    ((CharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((CharArray.undef_full (Z.add p (Z.mul 1 (@sizeof_front_end_type FET_char))) (Z.sub n 1)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_char q))
    ).

Module Type byte_store_Strategy_Correct.

  Axiom byte_store_strategy4_correctness : byte_store_strategy4.
  Axiom byte_store_strategy5_correctness : byte_store_strategy5.
  Axiom byte_store_strategy1_correctness : byte_store_strategy1.
  Axiom byte_store_strategy2_correctness : byte_store_strategy2.
  Axiom byte_store_strategy3_correctness : byte_store_strategy3.
  Axiom byte_store_strategy6_correctness : byte_store_strategy6.

End byte_store_Strategy_Correct.
