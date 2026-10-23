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
Require Import VMulc.Model.
Require Import QcpVadd.VaddBits.
Require Import VaddComparator.ComparatorLogic.
Require Import VaddWrapper.WrapperLogic.
Require Import NanBridge.BridgeLogic.
Local Open Scope sac.

(*----- Function preserve_float -----*)

Definition preserve_float_return_wit_1 := 
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

Definition preserve_float_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) ,
  (bit_same x_pre x_pre )
.

(*----- Function check_observation -----*)

Definition check_observation_safety_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition check_observation_safety_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition check_observation_safety_wit_3 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition check_observation_safety_wit_4 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition check_observation_return_wit_1 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
).

Definition check_observation_return_wit_1_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  (returned_one 0 )
.

Definition check_observation_return_wit_2 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
).

Definition check_observation_return_wit_2_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  (returned_one 0 )
.

Definition check_observation_return_wit_3 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
).

Definition check_observation_return_wit_3_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  (returned_one 1 )
.

Definition check_observation_return_wit_4 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
).

Definition check_observation_return_wit_4_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  (returned_one 1 )
.

Definition check_observation_partial_solve_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (same_value x_pre y_pre ) ”
  &&  emp
.

Definition check_observation_partial_solve_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (bit_same retval x_pre )) (PreH2 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (bit_same retval x_pre ) ” 
  &&  “ (same_value x_pre y_pre ) ”
  &&  emp
.

(*----- Function same_lane -----*)

Definition same_lane_return_wit_1 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: Z) (PreH1 : (returned_one retval )) (PreH2 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (retval = 1) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: Z) (PreH1 : (returned_one retval )) (PreH2 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (retval = 1) ”
  &&  emp
).

Definition same_lane_return_wit_1_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: Z) (PreH1 : (returned_one retval )) (PreH2 : (same_value x_pre y_pre )) ,
  (retval = 1)
.

Definition same_lane_partial_solve_wit_1_pure := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (same_value x_pre y_pre )) ,
  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (same_value x_pre y_pre ) ”
.

Definition same_lane_partial_solve_wit_1_aux := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (same_value x_pre y_pre ) ” 
  &&  “ (same_value x_pre y_pre ) ”
  &&  emp
.

Definition same_lane_partial_solve_wit_1 := same_lane_partial_solve_wit_1_pure -> same_lane_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_preserve_float_return_wit_1 : preserve_float_return_wit_1.
Axiom proof_of_check_observation_safety_wit_1 : check_observation_safety_wit_1.
Axiom proof_of_check_observation_safety_wit_2 : check_observation_safety_wit_2.
Axiom proof_of_check_observation_safety_wit_3 : check_observation_safety_wit_3.
Axiom proof_of_check_observation_safety_wit_4 : check_observation_safety_wit_4.
Axiom proof_of_check_observation_return_wit_1 : check_observation_return_wit_1.
Axiom proof_of_check_observation_return_wit_2 : check_observation_return_wit_2.
Axiom proof_of_check_observation_return_wit_3 : check_observation_return_wit_3.
Axiom proof_of_check_observation_return_wit_4 : check_observation_return_wit_4.
Axiom proof_of_check_observation_partial_solve_wit_1 : check_observation_partial_solve_wit_1.
Axiom proof_of_check_observation_partial_solve_wit_2 : check_observation_partial_solve_wit_2.
Axiom proof_of_same_lane_return_wit_1 : same_lane_return_wit_1.
Axiom proof_of_same_lane_partial_solve_wit_1_pure : same_lane_partial_solve_wit_1_pure.
Axiom proof_of_same_lane_partial_solve_wit_1 : same_lane_partial_solve_wit_1.

End VC_Correct.
