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
Require Import HwcConv.SupportModel.
Local Open Scope sac.

(*----- Function hc_round_down4 -----*)

Definition hc_round_down4_safety_wit_1 := 
forall (n_pre: Z) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition hc_round_down4_return_wit_1 := 
(
forall (n_pre: Z) ,
  TT && emp 
|--
  “ ((Z.land n_pre (Z.lnot 3)) = (hc_round_model (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) ,
  TT && emp 
|--
  “ ((Z.land n_pre (Z.lnot 3)) = (hc_round_model (n_pre))) ”
  &&  emp
).

Definition hc_round_down4_return_wit_1_split_goal_1 := 
forall (n_pre: Z) ,
  ((Z.land n_pre (Z.lnot 3)) = (hc_round_model (n_pre)))
.

(*----- Function hc_doz -----*)

Definition hc_doz_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  ((( &( "a" ) )) # UInt64  |-> a_pre)
  **  ((( &( "b" ) )) # UInt64  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition hc_doz_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  TT && emp 
|--
  “ ((a_pre - b_pre ) = (hc_doz_model (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  TT && emp 
|--
  “ ((a_pre - b_pre ) = (hc_doz_model (a_pre) (b_pre))) ”
  &&  emp
).

Definition hc_doz_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  ((a_pre - b_pre ) = (hc_doz_model (a_pre) (b_pre)))
.

Definition hc_doz_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  TT && emp 
|--
  “ (0 = (hc_doz_model (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  TT && emp 
|--
  “ (0 = (hc_doz_model (a_pre) (b_pre))) ”
  &&  emp
).

Definition hc_doz_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  (0 = (hc_doz_model (a_pre) (b_pre)))
.

Module Type VC_Correct.


Axiom proof_of_hc_round_down4_safety_wit_1 : hc_round_down4_safety_wit_1.
Axiom proof_of_hc_round_down4_return_wit_1 : hc_round_down4_return_wit_1.
Axiom proof_of_hc_doz_safety_wit_1 : hc_doz_safety_wit_1.
Axiom proof_of_hc_doz_return_wit_1 : hc_doz_return_wit_1.
Axiom proof_of_hc_doz_return_wit_2 : hc_doz_return_wit_2.

End VC_Correct.
