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

(*----- Function probe_u32_s32 -----*)

Definition probe_u32_s32_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (qa_s32 (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (qa_s32 (x_pre))) ”
  &&  emp
).

Definition probe_u32_s32_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= UINT_MAX)) ,
  (x_pre = (qa_s32 (x_pre)))
.

(*----- Function probe_u16_s16 -----*)

Definition probe_u16_s16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ (x_pre = (qa_s16 (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ (x_pre = (qa_s16 (x_pre))) ”
  &&  emp
).

Definition probe_u16_s16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 65535)) ,
  (x_pre = (qa_s16 (x_pre)))
.

(*----- Function probe_neg64 -----*)

Definition probe_neg64_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((( &( "x" ) )) # Int  |-> x_pre)
|--
  “ (x_pre <> (INT64_MIN)) ”
.

Definition probe_neg64_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((-x_pre) = (qa_s32 ((-x_pre)))) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((-x_pre) = (qa_s32 ((-x_pre)))) ”
  &&  emp
).

Definition probe_neg64_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-x_pre) = (qa_s32 ((-x_pre))))
.

Module Type VC_Correct.


Axiom proof_of_probe_u32_s32_return_wit_1 : probe_u32_s32_return_wit_1.
Axiom proof_of_probe_u16_s16_return_wit_1 : probe_u16_s16_return_wit_1.
Axiom proof_of_probe_neg64_safety_wit_1 : probe_neg64_safety_wit_1.
Axiom proof_of_probe_neg64_return_wit_1 : probe_neg64_return_wit_1.

End VC_Correct.
