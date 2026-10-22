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
Local Open Scope sac.

(*----- Function isnan32 -----*)

Definition isnan32_safety_wit_1 := 
forall (x_pre: fp32) (PreH1 : (fp32_ne x_pre x_pre )) ,
  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ False ”
.

Definition isnan32_safety_wit_2 := 
forall (x_pre: fp32) (PreH1 : (fp32_eq x_pre x_pre )) ,
  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition isnan32_return_wit_1 := 
forall (x_pre: fp32) (PreH1 : (fp32_eq x_pre x_pre )) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_isnan32_safety_wit_1 : isnan32_safety_wit_1.
Axiom proof_of_isnan32_safety_wit_2 : isnan32_safety_wit_2.
Axiom proof_of_isnan32_return_wit_1 : isnan32_return_wit_1.

End VC_Correct.
