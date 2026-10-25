Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import DwChw.Types.
Require Import DwChw.VectorModel.
Require Import DwChw.Store8Model.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition float_store_strategy4 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((FloatArray.undef_full p n))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((FloatArray.undef_seg q 0 m))
    ).

Definition float_store_strategy5 :=
  forall (n : Z),
    TT &&
    (“ (n = 0) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (p : Z) (a1 : fp32) (a3 : fp32) (a5 : fp32) (a7 : fp32) (a6 : fp32) (a4 : fp32) (a2 : fp32) (a0 : fp32),
      TT &&
      emp -*
      TT &&
      emp **
      ((FloatArray.full p n ( dw_values8 a0 a1 a2 a3 a4 a5 a6 a7 n)))
      ).

Definition float_store_strategy1 :=
  forall (lo : Z) (hi : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = (Z.add p (Z.mul lo (@sizeof_front_end_type FET_float)))) ”) &&
    (“ (Z.lt lo hi) ”) &&
    emp **
    ((FloatArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp **
    ((FloatArray.undef_seg p (Z.add lo 1) hi))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_float q))
    ).

Definition float_store_strategy2 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z) (l : (@list fp32)),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((FloatArray.full p n l))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (r : (@list fp32)),
      TT &&
      (“ (l = r) ”) &&
      emp -*
      TT &&
      emp **
      ((FloatArray.full q m r))
      ).

Definition float_store_strategy3 :=
  forall (hi : Z) (hi2 : Z) (p : Z) (q : Z) (lo2 : Z) (lo : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (lo = lo2) ”) &&
    (“ (hi = hi2) ”) &&
    emp **
    ((FloatArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((FloatArray.undef_seg q lo2 hi2))
    ).

Definition float_store_strategy6 :=
  forall (n : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (Z.lt 0 n) ”) &&
    emp **
    ((FloatArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((FloatArray.undef_full (Z.add p (Z.mul 1 (@sizeof_front_end_type FET_float))) (Z.sub n 1)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_undef_store FET_float q))
    ).

Module Type float_store_Strategy_Correct.

  Axiom float_store_strategy4_correctness : float_store_strategy4.
  Axiom float_store_strategy5_correctness : float_store_strategy5.
  Axiom float_store_strategy1_correctness : float_store_strategy1.
  Axiom float_store_strategy2_correctness : float_store_strategy2.
  Axiom float_store_strategy3_correctness : float_store_strategy3.
  Axiom float_store_strategy6_correctness : float_store_strategy6.

End float_store_Strategy_Correct.
