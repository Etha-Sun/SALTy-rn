Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Rndne.Types.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import Rndne.ProgramModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition rndne_addr_copy_strategy1 :=
  forall (p : Z) (q : Z) (x : fp32),
    TT &&
    (“ (p = q) ”) &&
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
    ((store_float q x))
    ).

Definition rndne_addr_copy_strategy2 :=
  forall ty (p : Z) (q : Z) (x : Z),
    TT &&
    (“ (p = q) ”) &&
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
    ((poly_store ty q x))
    ).

Module Type rndne_addr_copy_Strategy_Correct.

  Axiom rndne_addr_copy_strategy1_correctness : rndne_addr_copy_strategy1.
  Axiom rndne_addr_copy_strategy2_correctness : rndne_addr_copy_strategy2.

End rndne_addr_copy_Strategy_Correct.
