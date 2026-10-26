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
From ExpMinusMax Require Import public_caller_def.
Import Snaive_C_Rules64.
Require Import ExpMinusMax.VectorRecords.
Require Import ExpMinusMax.IntrinsicModel.
Require Import ExpMinusMax.BorrowedMemory.
Require Import ExpMinusMax.MemoryInterface.
Require Import ExpMinusMax.RecordStageFacts.
Require Import ExpMinusMax.RvvIntrinsicModel ExpMinusMax.RvvMemoryDomain.
Require Import ExpMinusMax.PublicModel.
Local Open Scope sac.

(*----- Function expminusmax_checked_pair -----*)

Definition expminusmax_checked_pair_safety_wit_1 := 
forall (params_pre: Z) (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W (em_rvv_result (F) (P) (M) (Q) (S) (N) ((em_arm_result (F) (P) (M) (Q) (S) (N) (O)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "max" ) )) # Ptr  |-> max_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "sum" ) )) # Ptr  |-> sum_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition expminusmax_checked_pair_return_wit_1 := 
(
forall (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W (em_rvv_result (F) (P) (M) (Q) (S) (N) ((em_arm_result (F) (P) (M) (Q) (S) (N) (O)))) )
|--
  “ (1 = 1) ” 
  &&  “ (em_pair_observation F P M Q S N O ) ”
  &&  (em_data F )
  **  (em_output W (em_pair_result (F) (P) (M) (Q) (S) (N) (O)) )
) \/
(
forall (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W (em_rvv_result (F) (P) (M) (Q) (S) (N) ((em_arm_result (F) (P) (M) (Q) (S) (N) (O)))) )
|--
  “ (em_pair_observation F input_pre max_pre output_pre sum_pre N O ) ”
  &&  (em_data F )
  **  (em_output W (em_pair_result (F) (P) (M) (Q) (S) (N) (O)) )
).

Definition expminusmax_checked_pair_return_wit_1_split_goal_1 := 
forall (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W (em_rvv_result (F) (P) (M) (Q) (S) (N) ((em_arm_result (F) (P) (M) (Q) (S) (N) (O)))) )
|--
  “ (em_pair_observation F input_pre max_pre output_pre sum_pre N O ) ”
.

Definition expminusmax_checked_pair_return_wit_1_split_goal_spatial := 
forall (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W (em_rvv_result (F) (P) (M) (Q) (S) (N) ((em_arm_result (F) (P) (M) (Q) (S) (N) (O)))) )
|--
  (em_data F )
  **  (em_output W (em_pair_result (F) (P) (M) (Q) (S) (N) (O)) )
.

Definition expminusmax_checked_pair_partial_solve_wit_1_pure := 
forall (params_pre: Z) (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "max" ) )) # Ptr  |-> max_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "sum" ) )) # Ptr  |-> sum_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (em_data F )
  **  (em_output W O )
|--
  “ (batch_pre = (4 * N )) ” 
  &&  “ (input_pre = P) ” 
  &&  “ (max_pre = M) ” 
  &&  “ (output_pre = Q) ” 
  &&  “ (sum_pre = S) ” 
  &&  “ (em_valid F W P M Q S N ) ”
.

Definition expminusmax_checked_pair_partial_solve_wit_1_aux := 
forall (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W O )
|--
  “ (batch_pre = (4 * N )) ” 
  &&  “ (input_pre = P) ” 
  &&  “ (max_pre = M) ” 
  &&  “ (output_pre = Q) ” 
  &&  “ (sum_pre = S) ” 
  &&  “ (em_valid F W P M Q S N ) ” 
  &&  “ (batch_pre = (4 * N )) ” 
  &&  “ (input_pre = P) ” 
  &&  “ (max_pre = M) ” 
  &&  “ (output_pre = Q) ” 
  &&  “ (sum_pre = S) ” 
  &&  “ (em_valid F W P M Q S N ) ”
  &&  (em_data F )
  **  (em_output W O )
.

Definition expminusmax_checked_pair_partial_solve_wit_1 := expminusmax_checked_pair_partial_solve_wit_1_pure -> expminusmax_checked_pair_partial_solve_wit_1_aux.

Definition expminusmax_checked_pair_partial_solve_wit_2_pure := 
forall (params_pre: Z) (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W (em_arm_result (F) (P) (M) (Q) (S) (N) (O)) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "max" ) )) # Ptr  |-> max_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "sum" ) )) # Ptr  |-> sum_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (batch_pre = (4 * N )) ” 
  &&  “ (input_pre = P) ” 
  &&  “ (max_pre = M) ” 
  &&  “ (output_pre = Q) ” 
  &&  “ (sum_pre = S) ” 
  &&  “ (em_valid F W P M Q S N ) ”
.

Definition expminusmax_checked_pair_partial_solve_wit_2_aux := 
forall (sum_pre: Z) (output_pre: Z) (max_pre: Z) (input_pre: Z) (batch_pre: Z) (S: Z) (Q: Z) (M: Z) (P: Z) (N: Z) (O: EMOutput) (W: (@list Z)) (F: EMMap) (PreH1 : (batch_pre = (4 * N ))) (PreH2 : (input_pre = P)) (PreH3 : (max_pre = M)) (PreH4 : (output_pre = Q)) (PreH5 : (sum_pre = S)) (PreH6 : (em_valid F W P M Q S N )) ,
  (em_data F )
  **  (em_output W (em_arm_result (F) (P) (M) (Q) (S) (N) (O)) )
|--
  “ (batch_pre = (4 * N )) ” 
  &&  “ (input_pre = P) ” 
  &&  “ (max_pre = M) ” 
  &&  “ (output_pre = Q) ” 
  &&  “ (sum_pre = S) ” 
  &&  “ (em_valid F W P M Q S N ) ” 
  &&  “ (batch_pre = (4 * N )) ” 
  &&  “ (input_pre = P) ” 
  &&  “ (max_pre = M) ” 
  &&  “ (output_pre = Q) ” 
  &&  “ (sum_pre = S) ” 
  &&  “ (em_valid F W P M Q S N ) ”
  &&  (em_data F )
  **  (em_output W (em_arm_result (F) (P) (M) (Q) (S) (N) (O)) )
.

Definition expminusmax_checked_pair_partial_solve_wit_2 := expminusmax_checked_pair_partial_solve_wit_2_pure -> expminusmax_checked_pair_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_expminusmax_checked_pair_safety_wit_1 : expminusmax_checked_pair_safety_wit_1.
Axiom proof_of_expminusmax_checked_pair_return_wit_1 : expminusmax_checked_pair_return_wit_1.
Axiom proof_of_expminusmax_checked_pair_partial_solve_wit_1_pure : expminusmax_checked_pair_partial_solve_wit_1_pure.
Axiom proof_of_expminusmax_checked_pair_partial_solve_wit_1 : expminusmax_checked_pair_partial_solve_wit_1.
Axiom proof_of_expminusmax_checked_pair_partial_solve_wit_2_pure : expminusmax_checked_pair_partial_solve_wit_2_pure.
Axiom proof_of_expminusmax_checked_pair_partial_solve_wit_2 : expminusmax_checked_pair_partial_solve_wit_2.

End VC_Correct.
