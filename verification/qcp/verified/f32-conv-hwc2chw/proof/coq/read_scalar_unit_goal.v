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
Require Import HwcConv.Types.
Require Import HwcConv.MemoryFacts HwcConv.FloatCopyModel.
Local Open Scope sac.
From HwcConv Require Import hc_maps_strategy_goal.
From HwcConv Require Import hc_maps_strategy_proof.

(*----- Function hc_read_scalar -----*)

Definition hc_read_scalar_return_wit_1 := 
(
forall (p_pre: Z) (F: HwcROMap) (PreH1 : (hc_present F p_pre )) ,
  ((p_pre) # Float  |-> (hc_get (F) (p_pre)))
  **  (hc_data (hc_pop (F) (p_pre)) )
|--
  “ (hc_same_bits (hc_get (F) (p_pre)) (hc_get (F) (p_pre)) ) ”
  &&  (hc_data F )
) \/
(
forall (p_pre: Z) (F: HwcROMap) (PreH1 : (hc_present F p_pre )) ,
  TT && emp 
|--
  “ (hc_same_bits (hc_get (F) (p_pre)) (hc_get (F) (p_pre)) ) ”
  &&  emp
).

Definition hc_read_scalar_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (F: HwcROMap) (PreH1 : (hc_present F p_pre )) ,
  (hc_same_bits (hc_get (F) (p_pre)) (hc_get (F) (p_pre)) )
.

Definition hc_read_scalar_partial_solve_wit_1 := 
forall (p_pre: Z) (F: HwcROMap) (PreH1 : (hc_present F p_pre )) ,
  (hc_data F )
|--
  “ (hc_present F p_pre ) ”
  &&  ((p_pre) # Float  |-> (hc_get (F) (p_pre)))
  **  (hc_data (hc_pop (F) (p_pre)) )
.

Module Type VC_Correct.

Include hc_maps_Strategy_Correct.

Axiom proof_of_hc_read_scalar_return_wit_1 : hc_read_scalar_return_wit_1.
Axiom proof_of_hc_read_scalar_partial_solve_wit_1 : hc_read_scalar_partial_solve_wit_1.

End VC_Correct.
