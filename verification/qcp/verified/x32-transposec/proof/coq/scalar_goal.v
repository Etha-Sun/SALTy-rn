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
Require Import X32Transpose.VectorModel.
Require Import X32Transpose.ProgramModel.
Require Import X32Transpose.ArithmeticModel.
Local Open Scope sac.

(*----- Function doz -----*)

Definition doz_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  ((( &( "a" ) )) # UInt64  |-> a_pre)
  **  ((( &( "b" ) )) # UInt64  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition doz_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  TT && emp 
|--
  “ (0 = (xt_doz (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  TT && emp 
|--
  “ (0 = (xt_doz (a_pre) (b_pre))) ”
  &&  emp
).

Definition doz_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  (0 = (xt_doz (a_pre) (b_pre)))
.

Definition doz_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  TT && emp 
|--
  “ ((a_pre - b_pre ) = (xt_doz (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  TT && emp 
|--
  “ ((a_pre - b_pre ) = (xt_doz (a_pre) (b_pre))) ”
  &&  emp
).

Definition doz_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  ((a_pre - b_pre ) = (xt_doz (a_pre) (b_pre)))
.

(*----- Function round_down_po2 -----*)

Definition round_down_po2_safety_wit_1 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (q_pre > 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "q" ) )) # UInt64  |-> q_pre)
|--
  “ (q_pre <> 0) ”
.

Definition round_down_po2_return_wit_1 := 
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (q_pre > 0)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((n_pre - (n_pre % ( q_pre ) ) )) (64)) = (xt_round_down (n_pre) (q_pre))) ”
  &&  emp
) \/
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (q_pre > 0)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((n_pre - (n_pre % ( q_pre ) ) )) (64)) = (xt_round_down (n_pre) (q_pre))) ”
  &&  emp
).

Definition round_down_po2_return_wit_1_split_goal_1 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (q_pre > 0)) ,
  ((unsigned_last_nbits ((n_pre - (n_pre % ( q_pre ) ) )) (64)) = (xt_round_down (n_pre) (q_pre)))
.

Module Type VC_Correct.


Axiom proof_of_doz_safety_wit_1 : doz_safety_wit_1.
Axiom proof_of_doz_return_wit_1 : doz_return_wit_1.
Axiom proof_of_doz_return_wit_2 : doz_return_wit_2.
Axiom proof_of_round_down_po2_safety_wit_1 : round_down_po2_safety_wit_1.
Axiom proof_of_round_down_po2_return_wit_1 : round_down_po2_return_wit_1.

End VC_Correct.
