Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpVadd.VaddBits.
Require Import VaddComparator.ComparatorLogic.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition comparator_strategy3 :=
  forall (p : Z) (n : Z) (l : (@list fp32)),
    TT &&
    emp **
    ((FloatArray.seg p 0 n l))
    |--
    (
    TT &&
    emp **
    ((FloatArray.full p n l))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition comparator_strategy1 :=
  forall (i : Z) (n : Z) (q : Z) (p : Z) (l : (@list fp32)),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i n) ”) &&
    emp **
    ((FloatArray.full p n l))
    |--
    (
    TT &&
    emp **
    ((FloatArray.missing_i p i 0 n l))
    ) ** (
    ALL (v : fp32) (__default_fp32 : fp32),
      TT &&
      (“ (v = (Znth i l __default_fp32)) ”) &&
      emp -*
      TT &&
      emp **
      ((store_float (Z.add q (Z.mul i (@sizeof_front_end_type FET_float))) v))
      ).

Definition comparator_strategy4 :=
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

Definition comparator_strategy2 :=
  forall (i : Z) (hi : Z) (j : Z) (p : Z) (q : Z) (lo : Z) (l : (@list fp32)) (__default_fp32 : fp32),
    TT &&
    (“ (q = p) ”) &&
    (“ (i = j) ”) &&
    (“ (Z.le lo i) ”) &&
    (“ (Z.lt i hi) ”) &&
    emp **
    ((FloatArray.missing_i p i lo hi l)) **
    ((store_float (Z.add q (Z.mul j (@sizeof_front_end_type FET_float))) (Znth (Z.sub i lo) l __default_fp32)))
    |--
    (
    TT &&
    emp **
    ((FloatArray.seg p lo hi l))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Module Type comparator_Strategy_Correct.

  Axiom comparator_strategy3_correctness : comparator_strategy3.
  Axiom comparator_strategy1_correctness : comparator_strategy1.
  Axiom comparator_strategy4_correctness : comparator_strategy4.
  Axiom comparator_strategy2_correctness : comparator_strategy2.

End comparator_Strategy_Correct.
