Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import VCMul.RvvStoreModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition vcmul_store_strategy4 :=
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

Definition vcmul_store_strategy5 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z) (l : (@list fp32)),
    TT &&
    emp -*
    TT &&
    emp **
    ((FloatArray.seg p 0 0 ( rvv_take 0 l)))
    ).

Definition vcmul_store_strategy1 :=
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

Definition vcmul_store_strategy2 :=
  forall (hi : Z) (hi2 : Z) (p : Z) (q : Z) (lo2 : Z) (lo : Z) (l : (@list fp32)),
    TT &&
    (“ (p = q) ”) &&
    (“ (lo = lo2) ”) &&
    (“ (hi = hi2) ”) &&
    emp **
    ((FloatArray.seg p lo hi l))
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
      ((FloatArray.seg q lo2 hi2 r))
      ).

Definition vcmul_store_strategy3 :=
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

Module Type vcmul_store_Strategy_Correct.

  Axiom vcmul_store_strategy4_correctness : vcmul_store_strategy4.
  Axiom vcmul_store_strategy5_correctness : vcmul_store_strategy5.
  Axiom vcmul_store_strategy1_correctness : vcmul_store_strategy1.
  Axiom vcmul_store_strategy2_correctness : vcmul_store_strategy2.
  Axiom vcmul_store_strategy3_correctness : vcmul_store_strategy3.

End vcmul_store_Strategy_Correct.
