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
Require Import QC4W.PublicModel.
Require Import QC4W.ApiModel.
Local Open Scope sac.

(*----- Function qcp_identity -----*)

Definition qcp_identity_return_wit_1 := 
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qc4_bit_same x_pre x_pre ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qc4_bit_same x_pre x_pre ) ”
  &&  emp
).

Definition qcp_identity_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) ,
  (qc4_bit_same x_pre x_pre )
.

(*----- Function qcp_isnan -----*)

Definition qcp_isnan_safety_wit_1 := 
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_ne x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  ((( &( "y" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_isnan_safety_wit_2 := 
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  ((( &( "y" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_isnan_return_wit_1 := 
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (0 = (qc4_nan_flag (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (0 = (qc4_nan_flag (x_pre))) ”
  &&  emp
).

Definition qcp_isnan_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  (0 = (qc4_nan_flag (x_pre)))
.

Definition qcp_isnan_return_wit_2 := 
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_ne x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (1 = (qc4_nan_flag (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_ne x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (1 = (qc4_nan_flag (x_pre))) ”
  &&  emp
).

Definition qcp_isnan_return_wit_2_split_goal_1 := 
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_ne x_pre retval )) (PreH2 : (qc4_bit_same retval x_pre )) ,
  (1 = (qc4_nan_flag (x_pre)))
.

Definition qcp_isnan_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_qcp_identity_return_wit_1 : qcp_identity_return_wit_1.
Axiom proof_of_qcp_isnan_safety_wit_1 : qcp_isnan_safety_wit_1.
Axiom proof_of_qcp_isnan_safety_wit_2 : qcp_isnan_safety_wit_2.
Axiom proof_of_qcp_isnan_return_wit_1 : qcp_isnan_return_wit_1.
Axiom proof_of_qcp_isnan_return_wit_2 : qcp_isnan_return_wit_2.
Axiom proof_of_qcp_isnan_partial_solve_wit_1 : qcp_isnan_partial_solve_wit_1.

End VC_Correct.
