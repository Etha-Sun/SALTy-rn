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
Require Import Qs8Mul.KernelFacts.
Local Open Scope sac.

(*----- Function qm_setvl_positive -----*)

Definition qm_setvl_positive_return_wit_1 := 
(
forall (n_pre: Z) (retval: Z) (PreH1 : (qm_vl_allowed n_pre retval )) (PreH2 : (0 < n_pre)) ,
  TT && emp 
|--
  “ (qm_vl_allowed n_pre retval ) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n_pre) ”
  &&  emp
) \/
(
forall (n_pre: Z) (retval: Z) (PreH1 : (qm_vl_allowed n_pre retval )) (PreH2 : (0 < n_pre)) ,
  TT && emp 
|--
  “ (retval <= n_pre) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (1 <= retval) ”
  &&  emp
).

Definition qm_setvl_positive_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (retval: Z) (PreH1 : (qm_vl_allowed n_pre retval )) (PreH2 : (0 < n_pre)) ,
  (retval <= n_pre)
.

Definition qm_setvl_positive_return_wit_1_split_goal_2 := 
forall (n_pre: Z) (retval: Z) (PreH1 : (qm_vl_allowed n_pre retval )) (PreH2 : (0 < n_pre)) ,
  (retval <= 32)
.

Definition qm_setvl_positive_return_wit_1_split_goal_3 := 
forall (n_pre: Z) (retval: Z) (PreH1 : (qm_vl_allowed n_pre retval )) (PreH2 : (0 < n_pre)) ,
  (1 <= retval)
.

Definition qm_setvl_positive_partial_solve_wit_1 := 
forall (n_pre: Z) (PreH1 : (0 < n_pre)) ,
  TT && emp 
|--
  “ (0 < n_pre) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_qm_setvl_positive_return_wit_1 : qm_setvl_positive_return_wit_1.
Axiom proof_of_qm_setvl_positive_partial_solve_wit_1 : qm_setvl_positive_partial_solve_wit_1.

End VC_Correct.
