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
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Local Open Scope sac.

(*----- Function ap_assert -----*)

Definition ap_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_ap_assert_return_wit_1 : ap_assert_return_wit_1.

End VC_Correct.
