Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Dwconv.MemoryInterface.
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

Definition dw_maps_strategy6 :=
  forall (P : DwPtrMap),
    TT &&
    emp **
    ((dw_ptr_data P))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((dw_ptr_data P))
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

Definition dw_maps_strategy8 :=
  forall (p : Z) (q : Z) (v : Z),
    TT &&
    (“ (p = q) ”) &&
    emp **
    ((poly_store FET_ptr p v))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((poly_store FET_ptr q v))
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

Definition dw_maps_strategy4 :=
  forall (p : Z) (P : DwPtrMap) (q : Z),
    TT &&
    (“ (q = p) ”) &&
    (“ (dw_ptr_present P p) ”) &&
    emp **
    ((dw_ptr_data ( dw_ptr_pop P p))) **
    ((poly_store FET_ptr q ( dw_ptr_get P p)))
    |--
    (
    TT &&
    emp **
    ((dw_ptr_data P))
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

Definition dw_maps_strategy3 :=
  forall (p : Z) (P : DwPtrMap),
    TT &&
    (“ (dw_ptr_present P p) ”) &&
    emp **
    ((dw_ptr_data P))
    |--
    (
    TT &&
    emp **
    ((dw_ptr_data ( dw_ptr_pop P p))) **
    ((poly_store FET_ptr p ( dw_ptr_get P p)))
    ) ** (
    ALL (v : Z),
      TT &&
      emp **
      ((poly_store FET_ptr p v)) -*
      TT &&
      emp **
      ((poly_store FET_ptr p v))
      ).

Module Type dw_maps_Strategy_Correct.

  Axiom dw_maps_strategy5_correctness : dw_maps_strategy5.
  Axiom dw_maps_strategy6_correctness : dw_maps_strategy6.
  Axiom dw_maps_strategy7_correctness : dw_maps_strategy7.
  Axiom dw_maps_strategy8_correctness : dw_maps_strategy8.
  Axiom dw_maps_strategy2_correctness : dw_maps_strategy2.
  Axiom dw_maps_strategy4_correctness : dw_maps_strategy4.
  Axiom dw_maps_strategy1_correctness : dw_maps_strategy1.
  Axiom dw_maps_strategy3_correctness : dw_maps_strategy3.

End dw_maps_Strategy_Correct.
