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
Require Import GemmSpec.FmaModel GemmSpec.IntrinsicModel
 Qd8Phase.IntegerFold Qd8Cast.CastModel.
Require Import Qd8Public.CandidateLogic.
Require Import Qd8API.ApiModel Qd8API.Layouts Qd8Rvv.RvvModel.
Require Import Qd8Rvv.RvvModel.
Local Open Scope sac.
From Qd8API Require Import copy_strategy_goal.
From Qd8API Require Import copy_strategy_proof.

(*----- Function qcp_qd8_identity -----*)

Definition qcp_qd8_identity_return_wit_1 := 
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qd8_bit_same x_pre x_pre ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qd8_bit_same x_pre x_pre ) ”
  &&  emp
).

Definition qcp_qd8_identity_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) ,
  (qd8_bit_same x_pre x_pre )
.

(*----- Function qcp_qd8_isnan -----*)

Definition qcp_qd8_isnan_return_wit_1 := 
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (qd8_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (0 = (qd8_nan_flag (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (qd8_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (0 = (qd8_nan_flag (x_pre))) ”
  &&  emp
).

Definition qcp_qd8_isnan_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (qd8_bit_same retval x_pre )) ,
  (0 = (qd8_nan_flag (x_pre)))
.

Definition qcp_qd8_isnan_return_wit_2 := 
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_ne x_pre retval )) (PreH2 : (qd8_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (1 = (qd8_nan_flag (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_ne x_pre retval )) (PreH2 : (qd8_bit_same retval x_pre )) ,
  TT && emp 
|--
  “ (1 = (qd8_nan_flag (x_pre))) ”
  &&  emp
).

Definition qcp_qd8_isnan_return_wit_2_split_goal_1 := 
forall (x_pre: fp32) (retval: fp32) (PreH1 : (fp32_ne x_pre retval )) (PreH2 : (qd8_bit_same retval x_pre )) ,
  (1 = (qd8_nan_flag (x_pre)))
.

Definition qcp_qd8_isnan_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function bounds_probe -----*)

Definition bounds_probe_return_wit_1 := 
(
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = (qd8_nan_flag (lo_pre)))) ,
  TT && emp 
|--
  “ (1 = (qd8_bounds_flag (lo_pre) (hi_pre))) ”
  &&  emp
) \/
(
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = (qd8_nan_flag (lo_pre)))) ,
  TT && emp 
|--
  “ (1 = (qd8_bounds_flag (lo_pre) (hi_pre))) ”
  &&  emp
).

Definition bounds_probe_return_wit_1_split_goal_1 := 
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = (qd8_nan_flag (lo_pre)))) ,
  (1 = (qd8_bounds_flag (lo_pre) (hi_pre)))
.

Definition bounds_probe_return_wit_2 := 
(
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 0)) (PreH2 : (retval_2 = (qd8_nan_flag (hi_pre)))) (PreH3 : (retval = 0)) (PreH4 : (retval = (qd8_nan_flag (lo_pre)))) ,
  TT && emp 
|--
  “ (1 = (qd8_bounds_flag (lo_pre) (hi_pre))) ”
  &&  emp
) \/
(
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 0)) (PreH2 : (retval_2 = (qd8_nan_flag (hi_pre)))) (PreH3 : (retval = 0)) (PreH4 : (retval = (qd8_nan_flag (lo_pre)))) ,
  TT && emp 
|--
  “ (1 = (qd8_bounds_flag (lo_pre) (hi_pre))) ”
  &&  emp
).

Definition bounds_probe_return_wit_2_split_goal_1 := 
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 <> 0)) (PreH2 : (retval_2 = (qd8_nan_flag (hi_pre)))) (PreH3 : (retval = 0)) (PreH4 : (retval = (qd8_nan_flag (lo_pre)))) ,
  (1 = (qd8_bounds_flag (lo_pre) (hi_pre)))
.

Definition bounds_probe_return_wit_3 := 
(
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval_2 = (qd8_nan_flag (hi_pre)))) (PreH3 : (retval = 0)) (PreH4 : (retval = (qd8_nan_flag (lo_pre)))) ,
  TT && emp 
|--
  “ (0 = (qd8_bounds_flag (lo_pre) (hi_pre))) ”
  &&  emp
) \/
(
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval_2 = (qd8_nan_flag (hi_pre)))) (PreH3 : (retval = 0)) (PreH4 : (retval = (qd8_nan_flag (lo_pre)))) ,
  TT && emp 
|--
  “ (0 = (qd8_bounds_flag (lo_pre) (hi_pre))) ”
  &&  emp
).

Definition bounds_probe_return_wit_3_split_goal_1 := 
forall (hi_pre: fp32) (lo_pre: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (retval_2 = (qd8_nan_flag (hi_pre)))) (PreH3 : (retval = 0)) (PreH4 : (retval = (qd8_nan_flag (lo_pre)))) ,
  (0 = (qd8_bounds_flag (lo_pre) (hi_pre)))
.

Definition bounds_probe_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Definition bounds_probe_partial_solve_wit_2 := 
forall (lo_pre: fp32) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = (qd8_nan_flag (lo_pre)))) ,
  TT && emp 
|--
  “ (retval = 0) ” 
  &&  “ (retval = (qd8_nan_flag (lo_pre))) ”
  &&  emp
.

Module Type VC_Correct.

Include copy_Strategy_Correct.

Axiom proof_of_qcp_qd8_identity_return_wit_1 : qcp_qd8_identity_return_wit_1.
Axiom proof_of_qcp_qd8_isnan_return_wit_1 : qcp_qd8_isnan_return_wit_1.
Axiom proof_of_qcp_qd8_isnan_return_wit_2 : qcp_qd8_isnan_return_wit_2.
Axiom proof_of_qcp_qd8_isnan_partial_solve_wit_1 : qcp_qd8_isnan_partial_solve_wit_1.
Axiom proof_of_bounds_probe_return_wit_1 : bounds_probe_return_wit_1.
Axiom proof_of_bounds_probe_return_wit_2 : bounds_probe_return_wit_2.
Axiom proof_of_bounds_probe_return_wit_3 : bounds_probe_return_wit_3.
Axiom proof_of_bounds_probe_partial_solve_wit_1 : bounds_probe_partial_solve_wit_1.
Axiom proof_of_bounds_probe_partial_solve_wit_2 : bounds_probe_partial_solve_wit_2.

End VC_Correct.
