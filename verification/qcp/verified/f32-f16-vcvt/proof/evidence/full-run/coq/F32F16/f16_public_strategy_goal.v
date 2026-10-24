Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import F32F16.Types.
Require Import F32F16.UShortStoreModel.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import F32F16.ProgramModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition f16_public_strategy1 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((UShortArray.undef_full p n))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UShortArray.undef_full q m))
    ).

Definition f16_public_strategy2 :=
  forall (n : Z) (m : Z) (q : Z) (p : Z) (l : (@list Z)),
    TT &&
    (“ (p = q) ”) &&
    (“ (n = m) ”) &&
    emp **
    ((UShortArray.full p n l))
    |--
    (
    TT &&
    emp
    ) ** (
    ALL (r : (@list Z)),
      TT &&
      (“ (l = r) ”) &&
      emp -*
      TT &&
      emp **
      ((UShortArray.full q m r))
      ).

Module Type f16_public_Strategy_Correct.

  Axiom f16_public_strategy1_correctness : f16_public_strategy1.
  Axiom f16_public_strategy2_correctness : f16_public_strategy2.

End f16_public_Strategy_Correct.
