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
Local Open Scope sac.
From Sqrt Require Import sqrt_store_strategy_goal.
From Sqrt Require Import sqrt_store_strategy_proof.
From QcpRvv32 Require Import rvv_store_strategy_goal.
From QcpRvv32 Require Import rvv_store_strategy_proof.

(*----- Function qcp_sqrt_store4 -----*)

Definition qcp_sqrt_store4_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (FloatArray.undef_full p_pre 4 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_sqrt_store4_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (FloatArray.undef_seg p_pre 1 4 )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_sqrt_store4_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (FloatArray.undef_seg p_pre (1 + 1 ) 4 )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_sqrt_store4_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (FloatArray.undef_seg p_pre ((1 + 1 ) + 1 ) 4 )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_sqrt_store4_return_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (FloatArray.undef_seg p_pre (((1 + 1 ) + 1 ) + 1 ) 4 )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (FloatArray.full p_pre 4 (sqrt_pack4 (x0) (x1) (x2) (x3)) )
) \/
(
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (FloatArray.undef_seg p_pre (((1 + 1 ) + 1 ) + 1 ) 4 )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
|--
  (FloatArray.full p_pre 4 (sqrt_pack4 (x0) (x1) (x2) (x3)) )
).

Definition qcp_sqrt_store4_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (FloatArray.undef_seg p_pre (((1 + 1 ) + 1 ) + 1 ) 4 )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
|--
  (FloatArray.full p_pre 4 (sqrt_pack4 (x0) (x1) (x2) (x3)) )
.

Definition qcp_sqrt_store4_partial_solve_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (FloatArray.undef_full p_pre 4 )
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre 1 4 )
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

Definition qcp_sqrt_store4_partial_solve_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (FloatArray.undef_seg p_pre 1 4 )
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre (1 + 1 ) 4 )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

Definition qcp_sqrt_store4_partial_solve_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (FloatArray.undef_seg p_pre (1 + 1 ) 4 )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre ((1 + 1 ) + 1 ) 4 )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

Definition qcp_sqrt_store4_partial_solve_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (FloatArray.undef_seg p_pre ((1 + 1 ) + 1 ) 4 )
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre (((1 + 1 ) + 1 ) + 1 ) 4 )
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

(*----- Function qcp_sqrt_store2 -----*)

Definition qcp_sqrt_store2_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (FloatArray.undef_full p_pre 2 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_sqrt_store2_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (FloatArray.undef_seg p_pre 1 2 )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_sqrt_store2_return_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (FloatArray.undef_seg p_pre (1 + 1 ) 2 )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (FloatArray.full p_pre 2 (sqrt_pack2 (x0) (x1)) )
) \/
(
forall (p_pre: Z) (x1: fp32) (x0: fp32) ,
  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (FloatArray.undef_seg p_pre (1 + 1 ) 2 )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
|--
  (FloatArray.full p_pre 2 (sqrt_pack2 (x0) (x1)) )
).

Definition qcp_sqrt_store2_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x1: fp32) (x0: fp32) ,
  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (FloatArray.undef_seg p_pre (1 + 1 ) 2 )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
|--
  (FloatArray.full p_pre 2 (sqrt_pack2 (x0) (x1)) )
.

Definition qcp_sqrt_store2_partial_solve_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (FloatArray.undef_full p_pre 2 )
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre 1 2 )
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
.

Definition qcp_sqrt_store2_partial_solve_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (FloatArray.undef_seg p_pre 1 2 )
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
|--
  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre (1 + 1 ) 2 )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
.

(*----- Function qcp_sqrt_store1_0 -----*)

Definition qcp_sqrt_store1_0_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (FloatArray.undef_full p_pre 1 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_sqrt_store1_0_return_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (FloatArray.undef_seg p_pre 1 1 )
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (FloatArray.full p_pre 1 (sqrt_pack1 (x0)) )
) \/
(
forall (p_pre: Z) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (FloatArray.undef_seg p_pre 1 1 )
|--
  (FloatArray.full p_pre 1 (sqrt_pack1 (x0)) )
).

Definition qcp_sqrt_store1_0_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (FloatArray.undef_seg p_pre 1 1 )
|--
  (FloatArray.full p_pre 1 (sqrt_pack1 (x0)) )
.

Definition qcp_sqrt_store1_0_partial_solve_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (FloatArray.undef_full p_pre 1 )
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre 1 1 )
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
.

Module Type VC_Correct.

Include sqrt_store_Strategy_Correct.
Include rvv_store_Strategy_Correct.

Axiom proof_of_qcp_sqrt_store4_safety_wit_1 : qcp_sqrt_store4_safety_wit_1.
Axiom proof_of_qcp_sqrt_store4_safety_wit_2 : qcp_sqrt_store4_safety_wit_2.
Axiom proof_of_qcp_sqrt_store4_safety_wit_3 : qcp_sqrt_store4_safety_wit_3.
Axiom proof_of_qcp_sqrt_store4_safety_wit_4 : qcp_sqrt_store4_safety_wit_4.
Axiom proof_of_qcp_sqrt_store4_return_wit_1 : qcp_sqrt_store4_return_wit_1.
Axiom proof_of_qcp_sqrt_store4_partial_solve_wit_1 : qcp_sqrt_store4_partial_solve_wit_1.
Axiom proof_of_qcp_sqrt_store4_partial_solve_wit_2 : qcp_sqrt_store4_partial_solve_wit_2.
Axiom proof_of_qcp_sqrt_store4_partial_solve_wit_3 : qcp_sqrt_store4_partial_solve_wit_3.
Axiom proof_of_qcp_sqrt_store4_partial_solve_wit_4 : qcp_sqrt_store4_partial_solve_wit_4.
Axiom proof_of_qcp_sqrt_store2_safety_wit_1 : qcp_sqrt_store2_safety_wit_1.
Axiom proof_of_qcp_sqrt_store2_safety_wit_2 : qcp_sqrt_store2_safety_wit_2.
Axiom proof_of_qcp_sqrt_store2_return_wit_1 : qcp_sqrt_store2_return_wit_1.
Axiom proof_of_qcp_sqrt_store2_partial_solve_wit_1 : qcp_sqrt_store2_partial_solve_wit_1.
Axiom proof_of_qcp_sqrt_store2_partial_solve_wit_2 : qcp_sqrt_store2_partial_solve_wit_2.
Axiom proof_of_qcp_sqrt_store1_0_safety_wit_1 : qcp_sqrt_store1_0_safety_wit_1.
Axiom proof_of_qcp_sqrt_store1_0_return_wit_1 : qcp_sqrt_store1_0_return_wit_1.
Axiom proof_of_qcp_sqrt_store1_0_partial_solve_wit_1 : qcp_sqrt_store1_0_partial_solve_wit_1.

End VC_Correct.
