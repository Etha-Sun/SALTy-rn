Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qs8Lrelu.Model.
Require Import Qs8Lrelu.Types.
Require Import Qs8Lrelu.MemoryModel.
Require Import Qs8Lrelu.RvvMemoryModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rvv_store_strategy4 :=
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

Definition rvv_store_strategy5 :=
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
    ((CharArray.seg p 0 0 ( s8_rvv_prefix 0 l)))
    ).

Definition rvv_store_strategy1 :=
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

Definition rvv_store_strategy2 :=
  forall (hi : Z) (hi2 : Z) (p : Z) (q : Z) (lo2 : Z) (lo : Z) (l : (@list Z)),
    TT &&
    (“ (p = q) ”) &&
    (“ (lo = lo2) ”) &&
    (“ (hi = hi2) ”) &&
    emp **
    ((CharArray.seg p lo hi l))
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
      ((CharArray.seg q lo2 hi2 r))
      ).

Definition rvv_store_strategy3 :=
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

Module Type rvv_store_Strategy_Correct.

  Axiom rvv_store_strategy4_correctness : rvv_store_strategy4.
  Axiom rvv_store_strategy5_correctness : rvv_store_strategy5.
  Axiom rvv_store_strategy1_correctness : rvv_store_strategy1.
  Axiom rvv_store_strategy2_correctness : rvv_store_strategy2.
  Axiom rvv_store_strategy3_correctness : rvv_store_strategy3.

End rvv_store_Strategy_Correct.
