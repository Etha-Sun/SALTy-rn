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
Require Import Qs8Lrelu.Model.
Local Open Scope sac.

(*----- Function false_width -----*)

Definition false_width_return_wit_1 := 
(
  TT && emp 
|--
  “ (sizeof(UINT64) = 4) ”
  &&  emp
) \/
(
  TT && emp 
|--
  “ (sizeof(UINT64) = 4) ”
  &&  emp
).

Definition false_width_return_wit_1_split_goal_1 := 
  (sizeof(UINT64) = 4)
.

Module Type VC_Correct.


Axiom proof_of_false_width_return_wit_1 : false_width_return_wit_1.

End VC_Correct.
