Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import VMulc.Model QcpRvv32.RvvLoopModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition vmulc_strategy1 :=
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
      ((FloatArray.seg p lo hi ( vmulc_values count a c)))
      ).

Module Type vmulc_Strategy_Correct.

  Axiom vmulc_strategy1_correctness : vmulc_strategy1.

End vmulc_Strategy_Correct.
