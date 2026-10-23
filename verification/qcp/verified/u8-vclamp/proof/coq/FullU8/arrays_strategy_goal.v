Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import FullU8.U8Logic FullU8.U8KernelLogic.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition arrays_strategy1 :=
  forall (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.lt 0 n) ”) &&
    emp **
    ((UCharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar p)) **
    ((UCharArray.undef_seg p 1 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar q)) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar q))
    ).

Definition arrays_strategy4 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : (@list Z)) (p : Z),
    TT &&
    (“ (l = (@nil Z)) ”) &&
    emp -*
    TT &&
    emp **
    ((UCharArray.full p 0 l))
    ).

Definition arrays_strategy40 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z) (n : Z),
    TT &&
    emp **
    ((UCharArray.undef_full p n)) -*
    TT &&
    emp **
    ((UCharArray.undef_seg p 0 n))
    ).

Definition arrays_strategy101 :=
  forall (lo : Z) (hi : Z),
    TT &&
    (“ (lo = hi) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (l : (@list Z)) (p : Z),
      TT &&
      (“ (l = (@nil Z)) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.seg p lo hi l))
      ).

Definition arrays_strategy102 :=
  forall (i : Z) (p : Z) (l1 : (@list Z)) (n : Z),
    TT &&
    (“ (i = 0) ”) &&
    emp **
    ((UCharArray.full p n l1))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (l2 : (@list Z)),
      TT &&
      (“ (l1 = l2) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.full (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))) n l2))
      ).

Definition arrays_strategy103 :=
  forall (i : Z) (p : Z) (n : Z),
    TT &&
    (“ (i = 0) ”) &&
    emp **
    ((UCharArray.undef_full p n))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UCharArray.undef_full (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))) n))
    ).

Definition arrays_strategy105 :=
  forall (n1 : Z) (n2 : Z) (p : Z) (q : Z) (l1 : (@list Z)),
    TT &&
    (“ (q = p) ”) &&
    (“ (n1 = n2) ”) &&
    emp **
    ((UCharArray.full q n1 l1))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (l2 : (@list Z)),
      TT &&
      (“ (l1 = l2) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.full p n2 l2))
      ).

Definition arrays_strategy106 :=
  forall (n1 : Z) (n2 : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (n1 = n2) ”) &&
    emp **
    ((UCharArray.undef_full q n1))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UCharArray.undef_full p n2))
    ).

Definition arrays_strategy107 :=
  forall (hi1 : Z) (hi2 : Z) (q : Z) (p : Z) (lo2 : Z) (lo1 : Z) (l1 : (@list Z)),
    TT &&
    (“ (q = p) ”) &&
    (“ (lo1 = lo2) ”) &&
    (“ (hi1 = hi2) ”) &&
    emp **
    ((UCharArray.seg q lo1 hi1 l1))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (l2 : (@list Z)),
      TT &&
      (“ (l1 = l2) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.seg p lo2 hi2 l2))
      ).

Definition arrays_strategy108 :=
  forall (hi1 : Z) (hi2 : Z) (p : Z) (l1 : (@list Z)),
    TT &&
    (“ (hi1 = hi2) ”) &&
    emp **
    ((UCharArray.seg p 0 hi1 l1))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (l2 : (@list Z)),
      TT &&
      (“ (l1 = l2) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.seg p 0 hi2 l2))
      ).

Definition arrays_strategy150 :=
  forall (q : Z) (p : Z) (n1 : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UCharArray.undef_full q n1))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (n2 : Z),
      TT &&
      (“ (n1 = n2) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.undef_full p n2))
      ).

Definition arrays_strategy151 :=
  forall (q : Z) (p : Z) (l1 : (@list Z)) (n1 : Z),
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((UCharArray.full q n1 l1))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (l2 : (@list Z)) (n2 : Z),
      TT &&
      (“ (n1 = n2) ”) &&
      (“ (l1 = l2) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.full p n2 l2))
      ).

Definition arrays_strategy200 :=
  forall (i : Z) (n : Z) (p : Z),
    TT &&
    (“ (Z.le 4 n) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i 4) ”) &&
    emp **
    ((UCharArray.undef_seg p 0 n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 0 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 1 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 2 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 3 (@sizeof_front_end_type FET_uchar))))) **
    ((UCharArray.undef_seg p 4 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    ).

Definition arrays_strategy201 :=
  forall (i : Z) (n : Z) (p : Z),
    TT &&
    (“ (Z.le 2 n) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i 2) ”) &&
    emp **
    ((UCharArray.undef_seg p 0 n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 0 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 1 (@sizeof_front_end_type FET_uchar))))) **
    ((UCharArray.undef_seg p 2 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    ).

Definition arrays_strategy202 :=
  forall (i : Z) (n : Z) (p : Z),
    TT &&
    (“ (Z.le 1 n) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i 1) ”) &&
    emp **
    ((UCharArray.undef_seg p 0 n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 0 (@sizeof_front_end_type FET_uchar))))) **
    ((UCharArray.undef_seg p 1 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    ).

Definition arrays_strategy203 :=
  forall (i : Z) (n : Z) (p : Z),
    TT &&
    (“ (Z.le 4 n) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i 4) ”) &&
    emp **
    ((UCharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 0 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 1 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 2 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 3 (@sizeof_front_end_type FET_uchar))))) **
    ((UCharArray.undef_seg p 4 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    ).

Definition arrays_strategy204 :=
  forall (i : Z) (n : Z) (p : Z),
    TT &&
    (“ (Z.le 2 n) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i 2) ”) &&
    emp **
    ((UCharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 0 (@sizeof_front_end_type FET_uchar))))) **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 1 (@sizeof_front_end_type FET_uchar))))) **
    ((UCharArray.undef_seg p 2 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    ).

Definition arrays_strategy205 :=
  forall (i : Z) (n : Z) (p : Z),
    TT &&
    (“ (Z.le 1 n) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i 1) ”) &&
    emp **
    ((UCharArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul 0 (@sizeof_front_end_type FET_uchar))))) **
    ((UCharArray.undef_seg p 1 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))))) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar)))))
    ).

Definition arrays_strategy220 :=
  forall (q : Z) (p : Z) (lo : Z) (hi : Z),
    TT &&
    (“ (q = (Z.add p (Z.mul lo (@sizeof_front_end_type FET_uchar)))) ”) &&
    emp **
    ((UCharArray.undef_seg p lo hi))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (n : Z),
      TT &&
      (“ (n = (Z.sub hi lo)) ”) &&
      emp -*
      TT &&
      emp **
      ((UCharArray.undef_full q n))
      ).

Definition arrays_strategy221 :=
  forall (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.lt 0 n) ”) &&
    emp **
    ((UCharArray.undef_seg p 0 n))
    |--
    (
    TT &&
    emp **
    ((poly_undef_store FET_uchar p)) **
    ((UCharArray.undef_seg p 1 n))
    ) ** (
    TT &&
    emp **
    ((poly_undef_store FET_uchar q)) -*
    TT &&
    emp **
    ((poly_undef_store FET_uchar q))
    ).

Definition arrays_strategy104 :=
  forall (i : Z) (p : Z) (n : Z),
    TT &&
    (“ (i = 0) ”) &&
    emp **
    ((UCharArray.undef_full (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))) n))
    |--
    (
    TT &&
    emp **
    ((UCharArray.undef_full p n))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition arrays_strategy2 :=
  forall (i : Z) (n : Z) (p : Z) (l : (@list Z)),
    TT &&
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
      ((poly_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))) v))
      ).

Definition arrays_strategy3 :=
  forall (i : Z) (n : Z) (l : (@list Z)) (p : Z),
    TT &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i n) ”) &&
    emp **
    ((UCharArray.missing_i p i 0 n l)) **
    ((poly_store FET_uchar (Z.add p (Z.mul i (@sizeof_front_end_type FET_uchar))) (Znth i l  0)))
    |--
    (
    TT &&
    emp **
    ((UCharArray.full p n l))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition arrays_strategy11 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : (@list Z)) (p : Z),
    TT &&
    (“ ((@Zlength Z l) = 1) ”) &&
    emp **
    ((poly_store FET_uchar (Z.add p 0) (Znth 0 l  0))) -*
    TT &&
    emp **
    ((UCharArray.full p 1 l))
    ).

Definition arrays_strategy12 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : (@list Z)) (p : Z),
    TT &&
    (“ ((@Zlength Z l) = 2) ”) &&
    emp **
    ((poly_store FET_uchar (Z.add p 0) (Znth 0 l  0))) **
    ((poly_store FET_uchar (Z.add p 1) (Znth 1 l  0))) -*
    TT &&
    emp **
    ((UCharArray.full p 2 l))
    ).

Definition arrays_strategy14 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : (@list Z)) (p : Z),
    TT &&
    (“ ((@Zlength Z l) = 4) ”) &&
    emp **
    ((poly_store FET_uchar (Z.add p 0) (Znth 0 l  0))) **
    ((poly_store FET_uchar (Z.add p 1) (Znth 1 l  0))) **
    ((poly_store FET_uchar (Z.add p 2) (Znth 2 l  0))) **
    ((poly_store FET_uchar (Z.add p 3) (Znth 3 l  0))) -*
    TT &&
    emp **
    ((UCharArray.full p 4 l))
    ).

Definition arrays_strategy18 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : (@list Z)) (p : Z),
    TT &&
    (“ ((@Zlength Z l) = 8) ”) &&
    emp **
    ((poly_store FET_uchar (Z.add p 0) (Znth 0 l  0))) **
    ((poly_store FET_uchar (Z.add p 1) (Znth 1 l  0))) **
    ((poly_store FET_uchar (Z.add p 2) (Znth 2 l  0))) **
    ((poly_store FET_uchar (Z.add p 3) (Znth 3 l  0))) **
    ((poly_store FET_uchar (Z.add p 4) (Znth 4 l  0))) **
    ((poly_store FET_uchar (Z.add p 5) (Znth 5 l  0))) **
    ((poly_store FET_uchar (Z.add p 6) (Znth 6 l  0))) **
    ((poly_store FET_uchar (Z.add p 7) (Znth 7 l  0))) -*
    TT &&
    emp **
    ((UCharArray.full p 8 l))
    ).

Definition arrays_strategy26 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : (@list Z)) (p : Z),
    TT &&
    (“ ((@Zlength Z l) = 16) ”) &&
    emp **
    ((poly_store FET_uchar (Z.add p 0) (Znth 0 l  0))) **
    ((poly_store FET_uchar (Z.add p 1) (Znth 1 l  0))) **
    ((poly_store FET_uchar (Z.add p 2) (Znth 2 l  0))) **
    ((poly_store FET_uchar (Z.add p 3) (Znth 3 l  0))) **
    ((poly_store FET_uchar (Z.add p 4) (Znth 4 l  0))) **
    ((poly_store FET_uchar (Z.add p 5) (Znth 5 l  0))) **
    ((poly_store FET_uchar (Z.add p 6) (Znth 6 l  0))) **
    ((poly_store FET_uchar (Z.add p 7) (Znth 7 l  0))) **
    ((poly_store FET_uchar (Z.add p 8) (Znth 8 l  0))) **
    ((poly_store FET_uchar (Z.add p 9) (Znth 9 l  0))) **
    ((poly_store FET_uchar (Z.add p 10) (Znth 10 l  0))) **
    ((poly_store FET_uchar (Z.add p 11) (Znth 11 l  0))) **
    ((poly_store FET_uchar (Z.add p 12) (Znth 12 l  0))) **
    ((poly_store FET_uchar (Z.add p 13) (Znth 13 l  0))) **
    ((poly_store FET_uchar (Z.add p 14) (Znth 14 l  0))) **
    ((poly_store FET_uchar (Z.add p 15) (Znth 15 l  0))) -*
    TT &&
    emp **
    ((UCharArray.full p 16 l))
    ).

Module Type arrays_Strategy_Correct.

  Axiom arrays_strategy1_correctness : arrays_strategy1.
  Axiom arrays_strategy4_correctness : arrays_strategy4.
  Axiom arrays_strategy40_correctness : arrays_strategy40.
  Axiom arrays_strategy101_correctness : arrays_strategy101.
  Axiom arrays_strategy102_correctness : arrays_strategy102.
  Axiom arrays_strategy103_correctness : arrays_strategy103.
  Axiom arrays_strategy105_correctness : arrays_strategy105.
  Axiom arrays_strategy106_correctness : arrays_strategy106.
  Axiom arrays_strategy107_correctness : arrays_strategy107.
  Axiom arrays_strategy108_correctness : arrays_strategy108.
  Axiom arrays_strategy150_correctness : arrays_strategy150.
  Axiom arrays_strategy151_correctness : arrays_strategy151.
  Axiom arrays_strategy200_correctness : arrays_strategy200.
  Axiom arrays_strategy201_correctness : arrays_strategy201.
  Axiom arrays_strategy202_correctness : arrays_strategy202.
  Axiom arrays_strategy203_correctness : arrays_strategy203.
  Axiom arrays_strategy204_correctness : arrays_strategy204.
  Axiom arrays_strategy205_correctness : arrays_strategy205.
  Axiom arrays_strategy220_correctness : arrays_strategy220.
  Axiom arrays_strategy221_correctness : arrays_strategy221.
  Axiom arrays_strategy104_correctness : arrays_strategy104.
  Axiom arrays_strategy2_correctness : arrays_strategy2.
  Axiom arrays_strategy3_correctness : arrays_strategy3.
  Axiom arrays_strategy11_correctness : arrays_strategy11.
  Axiom arrays_strategy12_correctness : arrays_strategy12.
  Axiom arrays_strategy14_correctness : arrays_strategy14.
  Axiom arrays_strategy18_correctness : arrays_strategy18.
  Axiom arrays_strategy26_correctness : arrays_strategy26.

End arrays_Strategy_Correct.
