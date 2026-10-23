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
Require Import Qu8Cvt.ProgramModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition cvt_rvv_strategy1 :=
  forall (count : Z) (lo : Z) (hi : Z),
    TT &&
    (“ (lo = 0) ”) &&
    (“ (hi = 0) ”) &&
    (“ (count = 0) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (p : Z) (z : Z) (scale : fp32) (a : (@list Z)),
      TT &&
      emp -*
      TT &&
      emp **
      ((FloatArray.seg p lo hi ( cvt_values count a z scale)))
      ).

Definition cvt_rvv_strategy2 :=
  forall (x : fp32) (p : Z),
    TT &&
    emp **
    ((store_float p x))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((store_float p x))
    ).

Definition cvt_rvv_strategy3 :=
  forall (x : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_int p x))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_store FET_int p x))
    ).

Definition cvt_rvv_strategy4 :=
  forall ty (x : Z) (p : Z),
    TT &&
    emp **
    ((poly_store ty p x))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_store ty p x))
    ).

Module Type cvt_rvv_Strategy_Correct.

  Axiom cvt_rvv_strategy1_correctness : cvt_rvv_strategy1.
  Axiom cvt_rvv_strategy2_correctness : cvt_rvv_strategy2.
  Axiom cvt_rvv_strategy3_correctness : cvt_rvv_strategy3.
  Axiom cvt_rvv_strategy4_correctness : cvt_rvv_strategy4.

End cvt_rvv_Strategy_Correct.
