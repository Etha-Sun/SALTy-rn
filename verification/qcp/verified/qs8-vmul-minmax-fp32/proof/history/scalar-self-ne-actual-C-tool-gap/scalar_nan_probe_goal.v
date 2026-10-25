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
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ScalarCompareFacts.
Local Open Scope sac.

(*----- Function qm_scalar_nan_probe -----*)

Definition qm_scalar_nan_probe_safety_wit_1 := 
forall (scale_pre: fp32) (PreH1 : (fp32_ne scale_pre scale_pre )) ,
  ((( &( "scale" ) )) # Float  |-> scale_pre)
|--
  “ False ”
.

Definition qm_scalar_nan_probe_safety_wit_2 := 
forall (scale_pre: fp32) (PreH1 : (fp32_eq scale_pre scale_pre )) ,
  ((( &( "scale" ) )) # Float  |-> scale_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qm_scalar_nan_probe_return_wit_1 := 
(
forall (scale_pre: fp32) (PreH1 : (fp32_eq scale_pre scale_pre )) ,
  TT && emp 
|--
  “ (0 = 0) ” 
  &&  “ ((qm_ne (scale_pre) (scale_pre)) = 0) ”
  &&  emp
) \/
(
forall (scale_pre: fp32) (PreH1 : (fp32_eq scale_pre scale_pre )) ,
  TT && emp 
|--
  “ ((qm_ne (scale_pre) (scale_pre)) = 0) ”
  &&  emp
).

Definition qm_scalar_nan_probe_return_wit_1_split_goal_1 := 
forall (scale_pre: fp32) (PreH1 : (fp32_eq scale_pre scale_pre )) ,
  ((qm_ne (scale_pre) (scale_pre)) = 0)
.

Module Type VC_Correct.


Axiom proof_of_qm_scalar_nan_probe_safety_wit_1 : qm_scalar_nan_probe_safety_wit_1.
Axiom proof_of_qm_scalar_nan_probe_safety_wit_2 : qm_scalar_nan_probe_safety_wit_2.
Axiom proof_of_qm_scalar_nan_probe_return_wit_1 : qm_scalar_nan_probe_return_wit_1.

End VC_Correct.
