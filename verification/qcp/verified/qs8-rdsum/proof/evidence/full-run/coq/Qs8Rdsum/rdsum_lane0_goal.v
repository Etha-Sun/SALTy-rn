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
Require Import Qs8Rdsum.Model.
Require Import Qs8Rdsum.Types.
Require Import Qs8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function rdsum_lane0 -----*)

Definition rdsum_lane0_return_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  TT && emp 
|--
  “ (a0 = a0) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_rdsum_lane0_return_wit_1 : rdsum_lane0_return_wit_1.

End VC_Correct.
