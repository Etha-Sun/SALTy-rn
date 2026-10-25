Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import DwChw.Types.
Require Import DwChw.MemoryFacts DwChw.OutputInterface.
Local Open Scope sac.
From DwChw Require Import dw_maps_strategy_goal.
From DwChw Require Import dw_maps_strategy_proof.
From DwChw Require Import dw_output_strategy_goal.
From DwChw Require Import dw_output_strategy_proof.

(*----- Function dw_read_scalar -----*)

Definition dw_read_scalar_return_wit_1 := 
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
|--
  “ (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) ) ”
  &&  (dw_data F )
) \/
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  TT && emp 
|--
  “ (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) ) ”
  &&  emp
).

Definition dw_read_scalar_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) )
.

Definition dw_read_scalar_partial_solve_wit_1 := 
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  (dw_data F )
|--
  “ (dw_present F p_pre ) ”
  &&  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
.

Module Type VC_Correct.

Include dw_maps_Strategy_Correct.
Include dw_output_Strategy_Correct.

Axiom proof_of_dw_read_scalar_return_wit_1 : dw_read_scalar_return_wit_1.
Axiom proof_of_dw_read_scalar_partial_solve_wit_1 : dw_read_scalar_partial_solve_wit_1.

End VC_Correct.
