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
Local Open Scope sac.
From SimpleC.EE.QCP_demos_human Require Import int_array_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import int_array_strategy_proof.
From SimpleC.EE.QCP_demos_human Require Import uint_array_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import uint_array_strategy_proof.
From SimpleC.EE.QCP_demos_human Require Import undef_uint_array_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import undef_uint_array_strategy_proof.
From SimpleC.EE.QCP_demos_human Require Import array_shape_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import array_shape_strategy_proof.

(*----- Function load4 -----*)

Definition load4_safety_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (UndefStructPredv4 ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (IntArray.full p_pre 4 L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition load4_safety_wit_2 := 
forall (p_pre: Z) (L: (@list Z)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  (IntArray.full p_pre 4 L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition load4_safety_wit_3 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.full p_pre 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition load4_safety_wit_4 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.full p_pre 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition load4_return_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) (record_return: Z) ,
  ((&((record_return)  # "v4" ->ₛ "s3")) # Int  |-> (Znth 3 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  (IntArray.full p_pre 4 L )
|--
  (IntArray.full p_pre 4 L )
  **  ((&((record_return)  # "v4" ->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s3")) # Int  |-> (Znth 3 L 0))
.

Definition load4_partial_solve_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (UndefStructPredv4 ( &( "r" ) ) )
  **  (IntArray.full p_pre 4 L )
|--
  (((p_pre + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  (IntArray.missing_i p_pre 0 0 4 L )
  **  (UndefStructPredv4 ( &( "r" ) ) )
.

Definition load4_partial_solve_wit_2 := 
forall (p_pre: Z) (L: (@list Z)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  (IntArray.full p_pre 4 L )
|--
  (((p_pre + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (IntArray.missing_i p_pre 1 0 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
.

Definition load4_partial_solve_wit_3 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.full p_pre 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
|--
  (((p_pre + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (IntArray.missing_i p_pre 2 0 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
.

Definition load4_partial_solve_wit_4 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.full p_pre 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
|--
  (((p_pre + (3 * sizeof(INT)))) # Int  |-> (Znth 3 L 0))
  **  (IntArray.missing_i p_pre 3 0 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
.

Definition load4_partial_solve_wit_5 := 
forall (p_pre: Z) (L: (@list Z)) (record_return: Z) ,
  (UndefStructPredv4 record_return )
  **  (IntArray.full p_pre 4 L )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> (Znth 3 L 0))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
|--
  ((&((record_return)  # "v4" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> (Znth 3 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&((record_return)  # "v4" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  (IntArray.full p_pre 4 L )
.

(*----- Function use_kernel -----*)

Definition use_kernel_return_wit_1 := 
forall (src_pre: Z) (L: (@list Z)) ,
  (IntArray.full src_pre 4 L )
|--
  (IntArray.full src_pre 4 L )
.

Definition use_kernel_partial_solve_wit_1 := 
forall (src_pre: Z) (L: (@list Z)) ,
  (UndefStructPredv4 ( &( "v" ) ) )
  **  (IntArray.full src_pre 4 L )
|--
  (IntArray.full src_pre 4 L )
  **  (UndefStructPredv4 ( &( "v" ) ) )
.

Definition use_kernel_partial_solve_wit_2 := 
forall (src_pre: Z) (L: (@list Z)) (retval: Z) ,
  (IntArray.full src_pre 4 L )
  **  ((&((retval)  # "v4" ->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  ((&((retval)  # "v4" ->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&((retval)  # "v4" ->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&((retval)  # "v4" ->ₛ "s3")) # Int  |-> (Znth 3 L 0))
  **  (UndefStructPredv4 ( &( "v" ) ) )
|--
  ((&(( &( "v" ) )->ₛ "s3")) # Int  |->_)
  **  ((&((retval)  # "v4" ->ₛ "s3")) # Int  |-> (Znth 3 L 0))
  **  ((&(( &( "v" ) )->ₛ "s2")) # Int  |->_)
  **  ((&((retval)  # "v4" ->ₛ "s2")) # Int  |-> (Znth 2 L 0))
  **  ((&(( &( "v" ) )->ₛ "s1")) # Int  |->_)
  **  ((&((retval)  # "v4" ->ₛ "s1")) # Int  |-> (Znth 1 L 0))
  **  ((&(( &( "v" ) )->ₛ "s0")) # Int  |->_)
  **  ((&((retval)  # "v4" ->ₛ "s0")) # Int  |-> (Znth 0 L 0))
  **  (IntArray.full src_pre 4 L )
.

Module Type VC_Correct.

Include int_array_Strategy_Correct.
Include uint_array_Strategy_Correct.
Include undef_uint_array_Strategy_Correct.
Include array_shape_Strategy_Correct.

Axiom proof_of_load4_safety_wit_1 : load4_safety_wit_1.
Axiom proof_of_load4_safety_wit_2 : load4_safety_wit_2.
Axiom proof_of_load4_safety_wit_3 : load4_safety_wit_3.
Axiom proof_of_load4_safety_wit_4 : load4_safety_wit_4.
Axiom proof_of_load4_return_wit_1 : load4_return_wit_1.
Axiom proof_of_load4_partial_solve_wit_1 : load4_partial_solve_wit_1.
Axiom proof_of_load4_partial_solve_wit_2 : load4_partial_solve_wit_2.
Axiom proof_of_load4_partial_solve_wit_3 : load4_partial_solve_wit_3.
Axiom proof_of_load4_partial_solve_wit_4 : load4_partial_solve_wit_4.
Axiom proof_of_load4_partial_solve_wit_5 : load4_partial_solve_wit_5.
Axiom proof_of_use_kernel_return_wit_1 : use_kernel_return_wit_1.
Axiom proof_of_use_kernel_partial_solve_wit_1 : use_kernel_partial_solve_wit_1.
Axiom proof_of_use_kernel_partial_solve_wit_2 : use_kernel_partial_solve_wit_2.

End VC_Correct.
