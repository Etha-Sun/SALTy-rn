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

Definition neon_vmulc_strategy1 :=
  forall (count : Z) (n : Z),
    TT &&
    (“ (n = 0) ”) &&
    (“ (count = 0) ”) &&
    emp
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (p : Z) (a : (@list fp32)) (c : fp32),
      TT &&
      emp -*
      TT &&
      emp **
      ((FloatArray.full p n ( vmulc_values count a c)))
      ).

Module Type neon_vmulc_Strategy_Correct.

  Axiom neon_vmulc_strategy1_correctness : neon_vmulc_strategy1.

End neon_vmulc_Strategy_Correct.
