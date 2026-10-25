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
Require Import MaxPool.MemoryModel.
Local Open Scope sac.

(*----- Function mp_read_table -----*)

Definition mp_read_table_entail_wit_1 := 
(
forall (p_pre: Z) (P: MPPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (mp_ptr_present P p_pre )) ,
  (mp_ptr_data P )
|--
  “ (mp_ptr_present P p_pre ) ”
  &&  ((p_pre) # Ptr  |-> (mp_ptr_get (P) (p_pre)))
  **  (mp_ptr_data (mp_ptr_pop (P) (p_pre)) )
) \/
(
forall (p_pre: Z) (P: MPPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (mp_ptr_present P p_pre )) ,
  (mp_ptr_data P )
|--
  ((p_pre) # Ptr  |-> (mp_ptr_get (P) (p_pre)))
  **  (mp_ptr_data (mp_ptr_pop (P) (p_pre)) )
).

Definition mp_read_table_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (P: MPPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (mp_ptr_present P p_pre )) ,
  (mp_ptr_data P )
|--
  ((p_pre) # Ptr  |-> (mp_ptr_get (P) (p_pre)))
  **  (mp_ptr_data (mp_ptr_pop (P) (p_pre)) )
.

Definition mp_read_table_return_wit_1 := 
(
forall (p_pre: Z) (P: MPPtrMap) (PreH1 : (mp_ptr_present P p_pre )) ,
  ((p_pre) # Ptr  |-> (mp_ptr_get (P) (p_pre)))
  **  (mp_ptr_data (mp_ptr_pop (P) (p_pre)) )
|--
  “ ((mp_ptr_get (P) (p_pre)) = (mp_ptr_get (P) (p_pre))) ”
  &&  (mp_ptr_data P )
) \/
(
forall (p_pre: Z) (P: MPPtrMap) (PreH1 : (mp_ptr_present P p_pre )) ,
  ((p_pre) # Ptr  |-> (mp_ptr_get (P) (p_pre)))
  **  (mp_ptr_data (mp_ptr_pop (P) (p_pre)) )
|--
  (mp_ptr_data P )
).

Definition mp_read_table_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (P: MPPtrMap) (PreH1 : (mp_ptr_present P p_pre )) ,
  ((p_pre) # Ptr  |-> (mp_ptr_get (P) (p_pre)))
  **  (mp_ptr_data (mp_ptr_pop (P) (p_pre)) )
|--
  (mp_ptr_data P )
.

Module Type VC_Correct.


Axiom proof_of_mp_read_table_entail_wit_1 : mp_read_table_entail_wit_1.
Axiom proof_of_mp_read_table_return_wit_1 : mp_read_table_return_wit_1.

End VC_Correct.
