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
Require Import GemmSpec.FmaModel.
Local Open Scope sac.

(*----- Function qcp_identity -----*)

Definition qcp_identity_return_wit_1 := 
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (bit_same x_pre x_pre ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (bit_same x_pre x_pre ) ”
  &&  emp
).

Definition qcp_identity_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) ,
  (bit_same x_pre x_pre )
.

(*----- Function qcp_assert -----*)

Definition qcp_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

(*----- Function xnn_prefetch_to_l1 -----*)

Definition xnn_prefetch_to_l1_return_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition xnn_prefetch_to_l1_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_qcp_identity_return_wit_1 : qcp_identity_return_wit_1.
Axiom proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Axiom proof_of_xnn_prefetch_to_l1_return_wit_1 : xnn_prefetch_to_l1_return_wit_1.
Axiom proof_of_xnn_prefetch_to_l1_partial_solve_wit_1 : xnn_prefetch_to_l1_partial_solve_wit_1.

End VC_Correct.
