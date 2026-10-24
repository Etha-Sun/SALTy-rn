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
Require Import Qs8Add.Model.
Local Open Scope sac.

(*----- Function probe_negword -----*)

Definition probe_negword_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((( &( "neg" ) )) # Int64  |->_)
  **  ((( &( "wide" ) )) # Int64  |-> x_pre)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
|--
  “ (x_pre <> (INT64_MIN)) ”
.

Definition probe_negword_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((-x_pre) = (qa_negword (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((-x_pre) = (qa_negword (x_pre))) ”
  &&  emp
).

Definition probe_negword_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-x_pre) = (qa_negword (x_pre)))
.

(*----- Function probe_ctrl -----*)

Definition probe_ctrl_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((( &( "neg" ) )) # Int64  |->_)
  **  ((( &( "wide" ) )) # Int64  |-> x_pre)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
|--
  “ (x_pre <> (INT64_MIN)) ”
.

Definition probe_ctrl_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((-x_pre)) (8)) = (qa_ctrl (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((-x_pre)) (8)) = (qa_ctrl (x_pre))) ”
  &&  emp
).

Definition probe_ctrl_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits ((-x_pre)) (8)) = (qa_ctrl (x_pre)))
.

Module Type VC_Correct.


Axiom proof_of_probe_negword_safety_wit_1 : probe_negword_safety_wit_1.
Axiom proof_of_probe_negword_return_wit_1 : probe_negword_return_wit_1.
Axiom proof_of_probe_ctrl_safety_wit_1 : probe_ctrl_safety_wit_1.
Axiom proof_of_probe_ctrl_return_wit_1 : probe_ctrl_return_wit_1.

End VC_Correct.
