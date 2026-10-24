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
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpVadd.VaddBits.
Require Import Sqrt.Types Sqrt.Pack Sqrt.Borrowed.
Require Import VaddComparator.ComparatorLogic.
Local Open Scope sac.
From Sqrt Require Import sqrt_public_strategy_goal.
From Sqrt Require Import sqrt_public_strategy_proof.

(*----- Function equivalent -----*)

Definition equivalent_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (sqrt_arm_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_entail_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
) \/
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  TT && emp 
|--
  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ”
  &&  emp
).

Definition equivalent_entail_wit_1_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)
.

Definition equivalent_entail_wit_1_split_goal_2 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))
.

Definition equivalent_entail_wit_2 := 
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (sqrt_rvv_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (sqrt_arm_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) ) ”
  &&  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.full left_pre n_pre (sqrt_arm_values (n_pre) (A)) )
  **  (FloatArray.full right_pre n_pre (sqrt_rvv_values (n_pre) (A)) )
) \/
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  TT && emp 
|--
  “ (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) ) ”
  &&  emp
).

Definition equivalent_entail_wit_2_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) )
.

Definition equivalent_return_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) )) ,
  (FloatArray.full left_pre n_pre (sqrt_arm_values (n_pre) (A)) )
  **  (FloatArray.full right_pre n_pre (sqrt_rvv_values (n_pre) (A)) )
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (retval = 1) ” 
  &&  “ (sqrt_outputs_related L R ) ”
  &&  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (A: (@list fp32)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) )) ,
  TT && emp 
|--
  “ (sqrt_outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) ) ”
  &&  emp
).

Definition equivalent_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (A: (@list fp32)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) )) ,
  (sqrt_outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) )
  **  (FloatArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (sqrt_arm_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (sqrt_arm_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (sqrt_arm_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) )) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.full left_pre n_pre (sqrt_arm_values (n_pre) (A)) )
  **  (FloatArray.full right_pre n_pre (sqrt_rvv_values (n_pre) (A)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) ) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) )) ,
  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (FloatArray.full left_pre n_pre (sqrt_arm_values (n_pre) (A)) )
  **  (FloatArray.full right_pre n_pre (sqrt_rvv_values (n_pre) (A)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related (sqrt_arm_values (n_pre) (A)) (sqrt_rvv_values (n_pre) (A)) ) ”
  &&  (FloatArray.full left_pre n_pre (sqrt_arm_values (n_pre) (A)) )
  **  (FloatArray.full right_pre n_pre (sqrt_rvv_values (n_pre) (A)) )
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include sqrt_public_Strategy_Correct.

Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_safety_wit_2 : equivalent_safety_wit_2.
Axiom proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Axiom proof_of_equivalent_entail_wit_2 : equivalent_entail_wit_2.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.

End VC_Correct.
