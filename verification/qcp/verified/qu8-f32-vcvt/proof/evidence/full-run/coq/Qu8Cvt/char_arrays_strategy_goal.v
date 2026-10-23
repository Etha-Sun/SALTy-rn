Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qu8Cvt.Model.
Require Import Qu8Cvt.Types.
Require Import Qu8Cvt.MemoryModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition char_arrays_strategy1 :=
  forall (i : Z) (n : Z) (q : Z) (p : Z) (l : (@list Z)),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i n) ”) &&
    emp **
    ((UCharArray.full p n l))
    |--
    (
    TT &&
    emp **
    ((UCharArray.missing_i p i 0 n l))
    ) ** (
    ALL (v : Z),
      TT &&
      (“ (v = (Znth i l  0)) ”) &&
      emp -*
      TT &&
      emp **
      ((poly_store FET_uchar (Z.add q (Z.mul i (@sizeof_front_end_type FET_uchar))) v))
      ).

Definition char_arrays_strategy2 :=
  forall (i : Z) (hi : Z) (j : Z) (p : Z) (q : Z) (lo : Z) (l : (@list Z)),
    TT &&
    (“ (q = p) ”) &&
    (“ (i = j) ”) &&
    (“ (Z.le lo i) ”) &&
    (“ (Z.lt i hi) ”) &&
    emp **
    ((UCharArray.missing_i p i lo hi l)) **
    ((poly_store FET_uchar (Z.add q (Z.mul j (@sizeof_front_end_type FET_uchar))) (Znth (Z.sub i lo) l  0)))
    |--
    (
    TT &&
    emp **
    ((UCharArray.seg p lo hi l))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Module Type char_arrays_Strategy_Correct.

  Axiom char_arrays_strategy1_correctness : char_arrays_strategy1.
  Axiom char_arrays_strategy2_correctness : char_arrays_strategy2.

End char_arrays_Strategy_Correct.
