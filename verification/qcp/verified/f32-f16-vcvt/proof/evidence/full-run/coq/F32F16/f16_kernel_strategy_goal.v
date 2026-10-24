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

Definition f16_kernel_strategy1 :=
  forall (m : Z) (n : Z) (p : Z) (q : Z),
    TT &&
    (“ (p = q) ”) &&
    (“ (Z.le 0 m) ”) &&
    (“ (Z.le m n) ”) &&
    emp **
    ((UShortArray.undef_full p n))
    |--
    (
    TT &&
    emp **
    ((UShortArray.undef_full (Z.add p (Z.mul 2 m)) (Z.sub n m)))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((UShortArray.undef_full q m))
    ).

Module Type f16_kernel_Strategy_Correct.

  Axiom f16_kernel_strategy1_correctness : f16_kernel_strategy1.

End f16_kernel_Strategy_Correct.
