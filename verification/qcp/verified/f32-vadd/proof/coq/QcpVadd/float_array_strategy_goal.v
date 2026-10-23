Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpVadd.VaddBits.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition float_array_strategy1 :=
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

Definition float_array_strategy2 :=
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

Module Type float_array_Strategy_Correct.

  Axiom float_array_strategy1_correctness : float_array_strategy1.
  Axiom float_array_strategy2_correctness : float_array_strategy2.

End float_array_Strategy_Correct.
