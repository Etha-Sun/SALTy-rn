Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import DwChw.Types.
Require Import DwChw.MemoryFacts DwChw.OutputInterface.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition dw_maps_strategy5 :=
  forall (F : DwROMap),
    TT &&
    emp **
    ((dw_data F))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((dw_data F))
    ).

Definition dw_maps_strategy7 :=
  forall (p : Z) (q : Z) (v : fp32),
    TT &&
    (“ (p = q) ”) &&
    emp **
    ((store_float p v))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((store_float q v))
    ).

Definition dw_maps_strategy2 :=
  forall (p : Z) (F : DwROMap) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (dw_present F p) ”) &&
    emp **
    ((dw_data ( dw_pop F p))) **
    ((store_float q ( dw_get F p)))
    |--
    (
    TT &&
    emp **
    ((dw_data F))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition dw_maps_strategy1 :=
  forall (p : Z) (F : DwROMap),
    TT &&
    (“ (dw_present F p) ”) &&
    emp **
    ((dw_data F))
    |--
    (
    TT &&
    emp **
    ((dw_data ( dw_pop F p))) **
    ((store_float p ( dw_get F p)))
    ) ** (
    ALL (v : fp32),
      TT &&
      emp **
      ((store_float p v)) -*
      TT &&
      emp **
      ((store_float p v))
      ).

Module Type dw_maps_Strategy_Correct.

  Axiom dw_maps_strategy5_correctness : dw_maps_strategy5.
  Axiom dw_maps_strategy7_correctness : dw_maps_strategy7.
  Axiom dw_maps_strategy2_correctness : dw_maps_strategy2.
  Axiom dw_maps_strategy1_correctness : dw_maps_strategy1.

End dw_maps_Strategy_Correct.
