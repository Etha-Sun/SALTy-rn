Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import QcpRvv32.RvvLogic.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rvv_arrays_strategy1 :=
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

Definition rvv_arrays_strategy3 :=
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

Definition rvv_arrays_strategy2 :=
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

Module Type rvv_arrays_Strategy_Correct.

  Axiom rvv_arrays_strategy1_correctness : rvv_arrays_strategy1.
  Axiom rvv_arrays_strategy3_correctness : rvv_arrays_strategy3.
  Axiom rvv_arrays_strategy2_correctness : rvv_arrays_strategy2.

End rvv_arrays_Strategy_Correct.
