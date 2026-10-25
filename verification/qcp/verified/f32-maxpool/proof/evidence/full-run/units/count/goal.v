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
Require Import MaxPool.Model.
Local Open Scope sac.

(*----- Function mp_count_after_group -----*)

Definition mp_count_after_group_safety_wit_1 := 
forall (k_pre: Z) ,
  ((( &( "k" ) )) # UInt64  |-> k_pre)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition mp_count_after_group_safety_wit_2 := 
forall (k_pre: Z) (PreH1 : (k_pre > 9)) ,
  ((( &( "k" ) )) # UInt64  |-> k_pre)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition mp_count_after_group_safety_wit_3 := 
forall (k_pre: Z) (PreH1 : (k_pre <= 9)) ,
  ((( &( "k" ) )) # UInt64  |-> k_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition mp_count_after_group_return_wit_1 := 
(
forall (k_pre: Z) (PreH1 : (k_pre <= 9)) ,
  TT && emp 
|--
  “ (0 = (mp_remaining (k_pre))) ”
  &&  emp
) \/
(
forall (k_pre: Z) (PreH1 : (k_pre <= 9)) ,
  TT && emp 
|--
  “ (0 = (mp_remaining (k_pre))) ”
  &&  emp
).

Definition mp_count_after_group_return_wit_1_split_goal_1 := 
forall (k_pre: Z) (PreH1 : (k_pre <= 9)) ,
  (0 = (mp_remaining (k_pre)))
.

Definition mp_count_after_group_return_wit_2 := 
(
forall (k_pre: Z) (PreH1 : (k_pre > 9)) ,
  TT && emp 
|--
  “ ((k_pre - 9 ) = (mp_remaining (k_pre))) ”
  &&  emp
) \/
(
forall (k_pre: Z) (PreH1 : (k_pre > 9)) ,
  TT && emp 
|--
  “ ((k_pre - 9 ) = (mp_remaining (k_pre))) ”
  &&  emp
).

Definition mp_count_after_group_return_wit_2_split_goal_1 := 
forall (k_pre: Z) (PreH1 : (k_pre > 9)) ,
  ((k_pre - 9 ) = (mp_remaining (k_pre)))
.

Module Type VC_Correct.


Axiom proof_of_mp_count_after_group_safety_wit_1 : mp_count_after_group_safety_wit_1.
Axiom proof_of_mp_count_after_group_safety_wit_2 : mp_count_after_group_safety_wit_2.
Axiom proof_of_mp_count_after_group_safety_wit_3 : mp_count_after_group_safety_wit_3.
Axiom proof_of_mp_count_after_group_return_wit_1 : mp_count_after_group_return_wit_1.
Axiom proof_of_mp_count_after_group_return_wit_2 : mp_count_after_group_return_wit_2.

End VC_Correct.
