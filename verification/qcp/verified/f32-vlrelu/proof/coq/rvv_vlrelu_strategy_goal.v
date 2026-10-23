Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import VLRelu.Model QcpRvv32.RvvLoopModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rvv_vlrelu_strategy1 :=
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
    ALL (p : Z) (c : fp32) (a : (@list fp32)),
      TT &&
      emp -*
      TT &&
      emp **
      ((FloatArray.seg p lo hi ( vlrelu_values count a c)))
      ).

Definition rvv_vlrelu_strategy2 :=
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

Definition rvv_vlrelu_strategy3 :=
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

Definition rvv_vlrelu_strategy4 :=
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

Module Type rvv_vlrelu_Strategy_Correct.

  Axiom rvv_vlrelu_strategy1_correctness : rvv_vlrelu_strategy1.
  Axiom rvv_vlrelu_strategy2_correctness : rvv_vlrelu_strategy2.
  Axiom rvv_vlrelu_strategy3_correctness : rvv_vlrelu_strategy3.
  Axiom rvv_vlrelu_strategy4_correctness : rvv_vlrelu_strategy4.

End rvv_vlrelu_Strategy_Correct.
