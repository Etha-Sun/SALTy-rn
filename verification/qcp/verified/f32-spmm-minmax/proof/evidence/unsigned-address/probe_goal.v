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
Require Import SpmmSpec.Address.
Local Open Scope sac.

(*----- Function decrement -----*)

Definition decrement_safety_wit_1 := 
forall (count_pre: Z) (stride_pre: Z) ,
  ((( &( "stride" ) )) # UInt64  |-> stride_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition decrement_return_wit_1 := 
(
forall (count_pre: Z) (stride_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((stride_pre * count_pre )) (64)) - 16 )) (64)) = (word64 (((stride_pre * count_pre ) - 16 )))) ”
  &&  emp
) \/
(
forall (count_pre: Z) (stride_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((stride_pre * count_pre )) (64)) - 16 )) (64)) = (word64 (((stride_pre * count_pre ) - 16 )))) ”
  &&  emp
).

Definition decrement_return_wit_1_split_goal_1 := 
forall (count_pre: Z) (stride_pre: Z) ,
  ((unsigned_last_nbits (((unsigned_last_nbits ((stride_pre * count_pre )) (64)) - 16 )) (64)) = (word64 (((stride_pre * count_pre ) - 16 ))))
.

(*----- Function restore -----*)

Definition restore_safety_wit_1 := 
forall (count_pre: Z) (stride_pre: Z) (base_pre: Z) ,
  ((( &( "decrement" ) )) # UInt64  |->_)
  **  ((( &( "base" ) )) # UInt64  |-> base_pre)
  **  ((( &( "stride" ) )) # UInt64  |-> stride_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition restore_return_wit_1 := 
(
forall (count_pre: Z) (stride_pre: Z) (base_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((base_pre + (unsigned_last_nbits ((stride_pre * count_pre )) (64)) )) (64)) - (unsigned_last_nbits (((unsigned_last_nbits ((stride_pre * count_pre )) (64)) - 16 )) (64)) )) (64)) = (word64 ((base_pre + 16 )))) ”
  &&  emp
) \/
(
forall (count_pre: Z) (stride_pre: Z) (base_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((base_pre + (unsigned_last_nbits ((stride_pre * count_pre )) (64)) )) (64)) - (unsigned_last_nbits (((unsigned_last_nbits ((stride_pre * count_pre )) (64)) - 16 )) (64)) )) (64)) = (word64 ((base_pre + 16 )))) ”
  &&  emp
).

Definition restore_return_wit_1_split_goal_1 := 
forall (count_pre: Z) (stride_pre: Z) (base_pre: Z) ,
  ((unsigned_last_nbits (((unsigned_last_nbits ((base_pre + (unsigned_last_nbits ((stride_pre * count_pre )) (64)) )) (64)) - (unsigned_last_nbits (((unsigned_last_nbits ((stride_pre * count_pre )) (64)) - 16 )) (64)) )) (64)) = (word64 ((base_pre + 16 ))))
.

Module Type VC_Correct.


Axiom proof_of_decrement_safety_wit_1 : decrement_safety_wit_1.
Axiom proof_of_decrement_return_wit_1 : decrement_return_wit_1.
Axiom proof_of_restore_safety_wit_1 : restore_safety_wit_1.
Axiom proof_of_restore_return_wit_1 : restore_return_wit_1.

End VC_Correct.
