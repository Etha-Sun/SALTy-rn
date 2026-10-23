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
Require Import QcpVadd.VaddBits.
Require Import VaddComparator.ComparatorLogic.
Require Import VaddWrapper.WrapperLogic.
Require Import NanBridge.BridgeLogic.
Local Open Scope sac.
From VaddComparator Require Import comparator_strategy_goal.
From VaddComparator Require Import comparator_strategy_proof.
From VaddWrapper Require Import wrapper_strategy_goal.
From VaddWrapper Require Import wrapper_strategy_proof.

(*----- Function equivalent -----*)

Definition equivalent_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) ,
  (UndefStructPredxnn_f32_default_params ( &( "params" ) ) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full input_a_pre (n_pre + 3 ) A )
  **  (FloatArray.full input_b_pre (n_pre + 3 ) B )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_entail_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) ,
  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
  **  (FloatArray.full input_a_pre (n_pre + 3 ) A )
  **  (FloatArray.full input_b_pre (n_pre + 3 ) B )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
  **  (FloatArray.full input_a_pre (n_pre + 3 ) A )
  **  (FloatArray.full input_b_pre (n_pre + 3 ) B )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
) \/
(
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) ,
  TT && emp 
|--
  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ”
  &&  emp
).

Definition equivalent_entail_wit_1_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) ,
  (( &( "params" ) ) <> 0)
.

Definition equivalent_entail_wit_1_split_goal_2 := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) ,
  (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)
.

Definition equivalent_entail_wit_1_split_goal_3 := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) ,
  (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))
.

Definition equivalent_return_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH6 : (( &( "params" ) ) <> 0)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 4611686018427387900)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (left_pre <> 0)) (PreH12 : (right_pre <> 0)) ,
  (FloatArray.full left_pre n_pre (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full right_pre n_pre (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (retval = 1) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full input_a_pre (n_pre + 3 ) A )
  **  (FloatArray.full input_b_pre (n_pre + 3 ) B )
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH6 : (( &( "params" ) ) <> 0)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 4611686018427387900)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (left_pre <> 0)) (PreH12 : (right_pre <> 0)) ,
  TT && emp 
|--
  “ (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) ) ”
  &&  emp
).

Definition equivalent_return_wit_1_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH6 : (( &( "params" ) ) <> 0)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 4611686018427387900)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (left_pre <> 0)) (PreH12 : (right_pre <> 0)) ,
  (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH2 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH3 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH4 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH5 : (( &( "params" ) ) <> 0)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
  **  (FloatArray.full input_a_pre (n_pre + 3 ) A )
  **  (FloatArray.full input_b_pre (n_pre + 3 ) B )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH2 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH3 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH4 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH5 : (( &( "params" ) ) <> 0)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) ,
  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
  **  (FloatArray.full input_a_pre (n_pre + 3 ) A )
  **  (FloatArray.full input_b_pre (n_pre + 3 ) B )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) )
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
  **  (FloatArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH2 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH3 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH4 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH5 : (( &( "params" ) ) <> 0)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) ,
  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH2 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH3 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH4 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH5 : (( &( "params" ) ) <> 0)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) ,
  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
(
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH2 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH3 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH4 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH5 : (( &( "params" ) ) <> 0)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) ,
  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (outputs_related (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) ) ” 
  &&  “ (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) ) ”
) \/
(
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre <= UINT64_MAX)) (PreH2 : (n_pre >= 0)) (PreH3 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH4 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH5 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH6 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH7 : (( &( "params" ) ) <> 0)) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) ,
  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
|--
  “ (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) ) ” 
  &&  “ (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) ) ”
).

Definition equivalent_partial_solve_wit_3_pure_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre <= UINT64_MAX)) (PreH2 : (n_pre >= 0)) (PreH3 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH4 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH5 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH6 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH7 : (( &( "params" ) ) <> 0)) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) ,
  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
|--
  “ (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) ) ”
.

Definition equivalent_partial_solve_wit_3_pure_split_goal_2 := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre <= UINT64_MAX)) (PreH2 : (n_pre >= 0)) (PreH3 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH4 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH5 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH6 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH7 : (( &( "params" ) ) <> 0)) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) ,
  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
|--
  “ (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) ) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH2 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH3 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH4 : ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603)) (PreH5 : (( &( "params" ) ) <> 0)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) ,
  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  (FloatArray.full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (outputs_related (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) ) ” 
  &&  “ (outputs_related (vadd_values (n_pre) (A) (B)) (vadd_values (n_pre) (A) (B)) ) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= 18446744073709551603) ” 
  &&  “ (( &( "params" ) ) <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full left_pre n_pre (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full right_pre n_pre (vadd_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A) (B)) )
  **  (FloatArray.full input_a_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) B )
  **  ((&(( &( "params" ) )->ₛ "unused")) # Char  |-> 0)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include comparator_Strategy_Correct.
Include wrapper_Strategy_Correct.

Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.

End VC_Correct.
