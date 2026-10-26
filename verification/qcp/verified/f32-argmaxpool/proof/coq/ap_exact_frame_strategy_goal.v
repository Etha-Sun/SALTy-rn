Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition ap_exact_frame_strategy1 :=
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

Definition ap_exact_frame_strategy2 :=
  forall (x : Z) (p : Z),
    TT &&
    emp **
    ((poly_store FET_uint p x))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_store FET_uint p x))
    ).

Module Type ap_exact_frame_Strategy_Correct.

  Axiom ap_exact_frame_strategy1_correctness : ap_exact_frame_strategy1.
  Axiom ap_exact_frame_strategy2_correctness : ap_exact_frame_strategy2.

End ap_exact_frame_Strategy_Correct.
