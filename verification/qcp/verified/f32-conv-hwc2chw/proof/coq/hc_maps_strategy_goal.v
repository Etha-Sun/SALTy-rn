Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import HwcConv.Types.
Require Import HwcConv.MemoryFacts HwcConv.FloatCopyModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition hc_maps_strategy5 :=
  forall (F : HwcROMap),
    TT &&
    emp **
    ((hc_data F))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((hc_data F))
    ).

Definition hc_maps_strategy7 :=
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

Definition hc_maps_strategy2 :=
  forall (p : Z) (F : HwcROMap) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (hc_present F p) ”) &&
    emp **
    ((hc_data ( hc_pop F p))) **
    ((store_float q ( hc_get F p)))
    |--
    (
    TT &&
    emp **
    ((hc_data F))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition hc_maps_strategy1 :=
  forall (p : Z) (F : HwcROMap),
    TT &&
    (“ (hc_present F p) ”) &&
    emp **
    ((hc_data F))
    |--
    (
    TT &&
    emp **
    ((hc_data ( hc_pop F p))) **
    ((store_float p ( hc_get F p)))
    ) ** (
    ALL (v : fp32),
      TT &&
      emp **
      ((store_float p v)) -*
      TT &&
      emp **
      ((store_float p v))
      ).

Module Type hc_maps_Strategy_Correct.

  Axiom hc_maps_strategy5_correctness : hc_maps_strategy5.
  Axiom hc_maps_strategy7_correctness : hc_maps_strategy7.
  Axiom hc_maps_strategy2_correctness : hc_maps_strategy2.
  Axiom hc_maps_strategy1_correctness : hc_maps_strategy1.

End hc_maps_Strategy_Correct.
