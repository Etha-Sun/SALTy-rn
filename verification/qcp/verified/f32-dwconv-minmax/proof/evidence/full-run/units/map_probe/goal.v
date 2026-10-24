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
Require Import Dwconv.MemoryInterface.
Local Open Scope sac.
From Dwconv Require Import dw_maps_strategy_goal.
From Dwconv Require Import dw_maps_strategy_proof.

(*----- Function dw_read_float_auto -----*)

Definition dw_read_float_auto_return_wit_1 := 
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_present F p_pre )) ,
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
|--
  “ (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) ) ”
  &&  (dw_data F )
) \/
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_present F p_pre )) ,
  TT && emp 
|--
  “ (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) ) ”
  &&  emp
).

Definition dw_read_float_auto_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (F: DwROMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_present F p_pre )) ,
  (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) )
.

Definition dw_read_float_auto_partial_solve_wit_1 := 
forall (p_pre: Z) (F: DwROMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_present F p_pre )) ,
  (dw_data F )
|--
  “ (p_pre <> 0) ” 
  &&  “ (dw_present F p_pre ) ”
  &&  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
.

(*----- Function dw_read_table_auto -----*)

Definition dw_read_table_auto_return_wit_1 := 
forall (p_pre: Z) (P: DwPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_ptr_present P p_pre )) ,
  ((p_pre) # Ptr  |-> (dw_ptr_get (P) (p_pre)))
  **  (dw_ptr_data (dw_ptr_pop (P) (p_pre)) )
|--
  “ ((dw_ptr_get (P) (p_pre)) = (dw_ptr_get (P) (p_pre))) ”
  &&  (dw_ptr_data P )
.

Definition dw_read_table_auto_partial_solve_wit_1 := 
forall (p_pre: Z) (P: DwPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_ptr_present P p_pre )) ,
  (dw_ptr_data P )
|--
  “ (p_pre <> 0) ” 
  &&  “ (dw_ptr_present P p_pre ) ”
  &&  ((p_pre) # Ptr  |-> (dw_ptr_get (P) (p_pre)))
  **  (dw_ptr_data (dw_ptr_pop (P) (p_pre)) )
.

Module Type VC_Correct.

Include dw_maps_Strategy_Correct.

Axiom proof_of_dw_read_float_auto_return_wit_1 : dw_read_float_auto_return_wit_1.
Axiom proof_of_dw_read_float_auto_partial_solve_wit_1 : dw_read_float_auto_partial_solve_wit_1.
Axiom proof_of_dw_read_table_auto_return_wit_1 : dw_read_table_auto_return_wit_1.
Axiom proof_of_dw_read_table_auto_partial_solve_wit_1 : dw_read_table_auto_partial_solve_wit_1.

End VC_Correct.
