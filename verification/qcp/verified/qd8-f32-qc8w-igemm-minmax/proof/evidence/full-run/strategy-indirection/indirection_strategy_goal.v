Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Qd8Indirect.IndirectionModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition indirection_strategy3 :=
  forall (i : Z) (n : Z) (q : Z) (p : Z) (xs : (@list Z)),
    TT &&
    (“ (q = p) ”) &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i n) ”) &&
    emp **
    ((CharArray.full p n xs))
    |--
    (
    TT &&
    (“ (q = p) ”) &&
    emp **
    ((CharArray.missing_i p i 0 n xs))
    ) ** (
    ALL (v : Z),
      TT &&
      (“ (v = ( zget i xs)) ”) &&
      emp -*
      TT &&
      emp **
      ((poly_store FET_char (Z.add q (Z.mul i (@sizeof_front_end_type FET_char))) v))
      ).

Definition indirection_strategy1 :=
  forall (i : Z) (n : Z) (p : Z) (xs : (@list Z)),
    TT &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i n) ”) &&
    emp **
    ((PtrArray.full p n xs))
    |--
    (
    TT &&
    emp **
    ((PtrArray.missing_i p i 0 n xs))
    ) ** (
    ALL (v : Z),
      TT &&
      (“ (v = ( zget i xs)) ”) &&
      emp -*
      TT &&
      emp **
      ((poly_store FET_ptr (Z.add p (Z.mul i (@sizeof_front_end_type FET_ptr))) v))
      ).

Definition indirection_strategy2 :=
  forall (i : Z) (n : Z) (p : Z) (xs : (@list Z)),
    TT &&
    (“ (Z.le 0 i) ”) &&
    (“ (Z.lt i n) ”) &&
    emp **
    ((CharArray.full p n xs))
    |--
    (
    TT &&
    emp **
    ((CharArray.missing_i p i 0 n xs))
    ) ** (
    ALL (v : Z),
      TT &&
      (“ (v = ( zget i xs)) ”) &&
      emp -*
      TT &&
      emp **
      ((poly_store FET_char (Z.add p (Z.mul i (@sizeof_front_end_type FET_char))) v))
      ).

Module Type indirection_Strategy_Correct.

  Axiom indirection_strategy3_correctness : indirection_strategy3.
  Axiom indirection_strategy1_correctness : indirection_strategy1.
  Axiom indirection_strategy2_correctness : indirection_strategy2.

End indirection_Strategy_Correct.
