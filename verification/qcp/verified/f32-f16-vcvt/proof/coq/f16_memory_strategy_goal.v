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

Definition f16_memory_strategy1 :=
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
    ALL (p : Z) (a : (@list fp32)),
      TT &&
      emp -*
      TT &&
      emp **
      ((UShortArray.full p n ( f16_values count a)))
      ).

Definition f16_memory_strategy2 :=
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
    ALL (p : Z) (a : (@list fp32)),
      TT &&
      emp -*
      TT &&
      emp **
      ((UShortArray.seg p lo hi ( f16_rvv_values count a)))
      ).

Definition f16_memory_strategy3 :=
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

Definition f16_memory_strategy4 :=
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

Module Type f16_memory_Strategy_Correct.

  Axiom f16_memory_strategy1_correctness : f16_memory_strategy1.
  Axiom f16_memory_strategy2_correctness : f16_memory_strategy2.
  Axiom f16_memory_strategy3_correctness : f16_memory_strategy3.
  Axiom f16_memory_strategy4_correctness : f16_memory_strategy4.

End f16_memory_Strategy_Correct.
