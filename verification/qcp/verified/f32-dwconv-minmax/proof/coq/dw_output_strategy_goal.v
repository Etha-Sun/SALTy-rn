Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Require Import Dwconv.MemoryInterface Dwconv.NeonTailModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition dw_output_strategy1 :=
  forall (W : (@list Z)) (O : DwOutput),
    TT &&
    emp **
    ((dw_output W O))
    |--
    (
    TT &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp **
    ((dw_output W O))
    ).

Module Type dw_output_Strategy_Correct.

  Axiom dw_output_strategy1_correctness : dw_output_strategy1.

End dw_output_Strategy_Correct.
