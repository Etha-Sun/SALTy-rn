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

(*----- Function load4a -----*)

Definition load4a_safety_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (UndefStructPredv4a ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (IntArray.full p_pre 4 L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition load4a_safety_wit_2 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (UndefStructPredv4a ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (IntArray.full p_pre 4 L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition load4a_safety_wit_3 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") 1 4 )
  **  (IntArray.full p_pre 4 L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition load4a_safety_wit_4 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") 1 4 )
  **  (IntArray.full p_pre 4 L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition load4a_safety_wit_5 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") (1 + 1 ) 4 )
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition load4a_safety_wit_6 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") (1 + 1 ) 4 )
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition load4a_safety_wit_7 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") ((1 + 1 ) + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition load4a_safety_wit_8 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") ((1 + 1 ) + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition load4a_entail_wit_1 := 
(
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") (((1 + 1 ) + 1 ) + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (3 * sizeof(INT)))) # Int  |-> (Znth 3 L 0))
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  (IntArray.full p_pre 4 L )
  **  (IntArray.full &(( &( "r" ) )->ₛ "s") 4 L )
) \/
(
forall (p_pre: Z) (L: (@list Z)) (PreH1 : ((Znth 0 L 0) <= INT_MAX)) (PreH2 : ((Znth 1 L 0) <= INT_MAX)) (PreH3 : ((Znth 2 L 0) <= INT_MAX)) (PreH4 : ((Znth 3 L 0) <= INT_MAX)) (PreH5 : ((Znth 0 L 0) >= INT_MIN)) (PreH6 : ((Znth 1 L 0) >= INT_MIN)) (PreH7 : ((Znth 2 L 0) >= INT_MIN)) (PreH8 : ((Znth 3 L 0) >= INT_MIN)) ,
  (((&(( &( "r" ) )->ₛ "s") + (3 * sizeof(INT)))) # Int  |-> (Znth 3 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  (IntArray.full &(( &( "r" ) )->ₛ "s") 4 L )
).

Definition load4a_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (L: (@list Z)) (PreH1 : ((Znth 0 L 0) <= INT_MAX)) (PreH2 : ((Znth 1 L 0) <= INT_MAX)) (PreH3 : ((Znth 2 L 0) <= INT_MAX)) (PreH4 : ((Znth 3 L 0) <= INT_MAX)) (PreH5 : ((Znth 0 L 0) >= INT_MIN)) (PreH6 : ((Znth 1 L 0) >= INT_MIN)) (PreH7 : ((Znth 2 L 0) >= INT_MIN)) (PreH8 : ((Znth 3 L 0) >= INT_MIN)) ,
  (((&(( &( "r" ) )->ₛ "s") + (3 * sizeof(INT)))) # Int  |-> (Znth 3 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  (IntArray.full &(( &( "r" ) )->ₛ "s") 4 L )
.

Definition load4a_return_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) (record_return: Z) ,
  (IntArray.full &((record_return)  # "v4a" ->ₛ "s") 4 L )
  **  (IntArray.full p_pre 4 L )
|--
  (IntArray.full p_pre 4 L )
  **  (IntArray.full &((record_return)  # "v4a" ->ₛ "s") 4 L )
.

Definition load4a_partial_solve_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (UndefStructPredv4a ( &( "r" ) ) )
  **  (IntArray.full p_pre 4 L )
|--
  (((p_pre + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  (IntArray.missing_i p_pre 0 0 4 L )
  **  (UndefStructPredv4a ( &( "r" ) ) )
.

Definition load4a_partial_solve_wit_2 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.undef_full &(( &( "r" ) )->ₛ "s") 4 )
  **  (IntArray.full p_pre 4 L )
|--
  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") 1 4 )
  **  (IntArray.full p_pre 4 L )
.

Definition load4a_partial_solve_wit_3 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") 1 4 )
  **  (IntArray.full p_pre 4 L )
|--
  (((p_pre + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (IntArray.missing_i p_pre 1 0 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") 1 4 )
.

Definition load4a_partial_solve_wit_4 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") 1 4 )
|--
  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") (1 + 1 ) 4 )
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
.

Definition load4a_partial_solve_wit_5 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") (1 + 1 ) 4 )
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
|--
  (((p_pre + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (IntArray.missing_i p_pre 2 0 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") (1 + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
.

Definition load4a_partial_solve_wit_6 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") (1 + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
|--
  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_missing_i &(( &( "r" ) )->ₛ "s") 2 (1 + 1 ) 4 )
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
.

Definition load4a_partial_solve_wit_7 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") ((1 + 1 ) + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
|--
  (((p_pre + (3 * sizeof(INT)))) # Int  |-> (Znth 3 L 0))
  **  (IntArray.missing_i p_pre 3 0 4 L )
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") ((1 + 1 ) + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
.

Definition load4a_partial_solve_wit_8 := 
forall (p_pre: Z) (L: (@list Z)) ,
  (IntArray.full p_pre 4 L )
  **  (IntArray.undef_seg &(( &( "r" ) )->ₛ "s") ((1 + 1 ) + 1 ) 4 )
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
|--
  (((&(( &( "r" ) )->ₛ "s") + (3 * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_missing_i &(( &( "r" ) )->ₛ "s") 3 ((1 + 1 ) + 1 ) 4 )
  **  (IntArray.full p_pre 4 L )
  **  (((&(( &( "r" ) )->ₛ "s") + (2 * sizeof(INT)))) # Int  |-> (Znth 2 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (1 * sizeof(INT)))) # Int  |-> (Znth 1 L 0))
  **  (((&(( &( "r" ) )->ₛ "s") + (0 * sizeof(INT)))) # Int  |-> (Znth 0 L 0))
.

Definition load4a_partial_solve_wit_9 := 
forall (p_pre: Z) (L: (@list Z)) (record_return: Z) ,
  (UndefStructPredv4a record_return )
  **  (IntArray.full p_pre 4 L )
  **  (IntArray.full &(( &( "r" ) )->ₛ "s") 4 L )
|--
  (IntArray.undef_full &((record_return)  # "v4a" ->ₛ "s") 4 )
  **  (IntArray.full &(( &( "r" ) )->ₛ "s") 4 L )
  **  (IntArray.full p_pre 4 L )
.

(*----- Function use_kernel -----*)

Definition use_kernel_return_wit_1 := 
(
forall (src_pre: Z) (L: (@list Z)) (retval: Z) ,
  (IntArray.full &((retval)  # "v4a" ->ₛ "s") 4 L )
  **  (IntArray.full src_pre 4 L )
|--
  (IntArray.full src_pre 4 L )
) \/
(
forall (L: (@list Z)) (retval: Z) ,
  (IntArray.full &((retval)  # "v4a" ->ₛ "s") 4 L )
|--
  TT && emp 
).

Definition use_kernel_return_wit_1_split_goal_spatial := 
forall (L: (@list Z)) (retval: Z) ,
  (IntArray.full &((retval)  # "v4a" ->ₛ "s") 4 L )
|--
  TT && emp 
.

Definition use_kernel_partial_solve_wit_1 := 
forall (src_pre: Z) (L: (@list Z)) ,
  (UndefStructPredv4a ( &( "v" ) ) )
  **  (IntArray.full src_pre 4 L )
|--
  (IntArray.full src_pre 4 L )
  **  (UndefStructPredv4a ( &( "v" ) ) )
.

Definition use_kernel_partial_solve_wit_2 := 
forall (src_pre: Z) (L: (@list Z)) (retval: Z) ,
  (IntArray.full src_pre 4 L )
  **  (IntArray.full &((retval)  # "v4a" ->ₛ "s") 4 L )
  **  (UndefStructPredv4a ( &( "v" ) ) )
|--
  (IntArray.undef_full &(( &( "v" ) )->ₛ "s") 4 )
  **  (IntArray.full &((retval)  # "v4a" ->ₛ "s") 4 L )
  **  (IntArray.full src_pre 4 L )
.

Module Type VC_Correct.

Include int_array_Strategy_Correct.
Include uint_array_Strategy_Correct.
Include undef_uint_array_Strategy_Correct.
Include array_shape_Strategy_Correct.

Axiom proof_of_load4a_safety_wit_1 : load4a_safety_wit_1.
Axiom proof_of_load4a_safety_wit_2 : load4a_safety_wit_2.
Axiom proof_of_load4a_safety_wit_3 : load4a_safety_wit_3.
Axiom proof_of_load4a_safety_wit_4 : load4a_safety_wit_4.
Axiom proof_of_load4a_safety_wit_5 : load4a_safety_wit_5.
Axiom proof_of_load4a_safety_wit_6 : load4a_safety_wit_6.
Axiom proof_of_load4a_safety_wit_7 : load4a_safety_wit_7.
Axiom proof_of_load4a_safety_wit_8 : load4a_safety_wit_8.
Axiom proof_of_load4a_entail_wit_1 : load4a_entail_wit_1.
Axiom proof_of_load4a_return_wit_1 : load4a_return_wit_1.
Axiom proof_of_load4a_partial_solve_wit_1 : load4a_partial_solve_wit_1.
Axiom proof_of_load4a_partial_solve_wit_2 : load4a_partial_solve_wit_2.
Axiom proof_of_load4a_partial_solve_wit_3 : load4a_partial_solve_wit_3.
Axiom proof_of_load4a_partial_solve_wit_4 : load4a_partial_solve_wit_4.
Axiom proof_of_load4a_partial_solve_wit_5 : load4a_partial_solve_wit_5.
Axiom proof_of_load4a_partial_solve_wit_6 : load4a_partial_solve_wit_6.
Axiom proof_of_load4a_partial_solve_wit_7 : load4a_partial_solve_wit_7.
Axiom proof_of_load4a_partial_solve_wit_8 : load4a_partial_solve_wit_8.
Axiom proof_of_load4a_partial_solve_wit_9 : load4a_partial_solve_wit_9.
Axiom proof_of_use_kernel_return_wit_1 : use_kernel_return_wit_1.
Axiom proof_of_use_kernel_partial_solve_wit_1 : use_kernel_partial_solve_wit_1.
Axiom proof_of_use_kernel_partial_solve_wit_2 : use_kernel_partial_solve_wit_2.

End VC_Correct.
