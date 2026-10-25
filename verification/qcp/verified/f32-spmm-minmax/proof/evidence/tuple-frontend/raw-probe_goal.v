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
From SpmmTupleProbe Require Import probe_def.
Import Snaive_C_Rules64.
Require Import SpmmSpec.TupleMemory.
Local Open Scope sac.
From SpmmSpec Require Import tuple_strategy_goal.
From SpmmSpec Require Import tuple_strategy_proof.

(*----- Function tuple_probe -----*)

Definition tuple_probe_safety_wit_1 := 
forall (out_pre: Z) (p_pre: Z) (hi: fp32) (lo: fp32) (retval: Z) ,
  (UndefStructPredfloat32x4_t ( &( "vmin" ) ) )
  **  (Structfloat32x4_tArray.full &(( &( "vminmax" ) )->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((out_pre) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition tuple_probe_return_wit_1 := 
(
forall (out_pre: Z) (p_pre: Z) (hi: fp32) (lo: fp32) (retval: Z) ,
  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  ((out_pre) # Float  |-> ((tuple_at (0) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f0) ))
|--
  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  ((out_pre) # Float  |-> lo)
) \/
(
forall (hi: fp32) (lo: fp32) (retval: Z) ,
  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
|--
  “ (fp32_eq ((tuple_at (0) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f0) ) lo) ”
  &&  emp
).

Definition tuple_probe_return_wit_1_split_goal_1 := 
forall (hi: fp32) (lo: fp32) (retval: Z) ,
  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
|--
  “ (fp32_eq ((tuple_at (0) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f0) ) lo) ”
.

Definition tuple_probe_return_wit_1_split_goal_spatial := 
forall (hi: fp32) (lo: fp32) (retval: Z) ,
  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
|--
  TT && emp 
.

Definition tuple_probe_partial_solve_wit_1 := 
forall (out_pre: Z) (p_pre: Z) (hi: fp32) (lo: fp32) ,
  (UndefStructPredfloat32x4x2_t ( &( "vminmax" ) ) )
  **  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  ((out_pre) # Float  |->_)
|--
  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  (UndefStructPredfloat32x4x2_t ( &( "vminmax" ) ) )
  **  ((out_pre) # Float  |->_)
.

Definition tuple_probe_partial_solve_wit_2 := 
forall (out_pre: Z) (p_pre: Z) (hi: fp32) (lo: fp32) (retval: Z) ,
  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  (UndefStructPredfloat32x4x2_t ( &( "vminmax" ) ) )
  **  ((out_pre) # Float  |->_)
|--
  (Structfloat32x4_tArray.undef_full &(( &( "vminmax" ) )->ₛ "val") 2 )
  **  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  ((out_pre) # Float  |->_)
.

Definition tuple_probe_partial_solve_wit_3 := 
forall (out_pre: Z) (p_pre: Z) (hi: fp32) (lo: fp32) (retval: Z) ,
  (UndefStructPredfloat32x4_t ( &( "vmin" ) ) )
  **  (Structfloat32x4_tArray.full &(( &( "vminmax" ) )->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  ((out_pre) # Float  |->_)
|--
  ((&(( &( "vmin" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (0 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((tuple_at (0) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f3) ))
  **  ((&(( &( "vmin" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (0 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((tuple_at (0) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f2) ))
  **  ((&(( &( "vmin" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (0 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((tuple_at (0) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f1) ))
  **  ((&(( &( "vmin" ) )->ₛ "s0")) # Float  |->_)
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (0 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((tuple_at (0) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f0) ))
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (1 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((tuple_at (1) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f3) ))
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (1 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((tuple_at (1) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f2) ))
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (1 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((tuple_at (1) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f1) ))
  **  ((&(((&(( &( "vminmax" ) )->ₛ "val") + (1 * sizeof( "float32x4_t" ))))  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((tuple_at (1) ((cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))))).(f0) ))
  **  (Structfloat32x4_tArray.full &((retval)  # "float32x4x2_t" ->ₛ "val") 2 (cons ((vec4 (lo) (lo) (lo) (lo))) ((cons ((vec4 (hi) (hi) (hi) (hi))) ((@nil Recordfloat32x4_t))))) )
  **  ((p_pre) # Float  |-> lo)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> hi)
  **  ((out_pre) # Float  |->_)
.

Module Type VC_Correct.

Include tuple_Strategy_Correct.

Axiom proof_of_tuple_probe_safety_wit_1 : tuple_probe_safety_wit_1.
Axiom proof_of_tuple_probe_return_wit_1 : tuple_probe_return_wit_1.
Axiom proof_of_tuple_probe_partial_solve_wit_1 : tuple_probe_partial_solve_wit_1.
Axiom proof_of_tuple_probe_partial_solve_wit_2 : tuple_probe_partial_solve_wit_2.
Axiom proof_of_tuple_probe_partial_solve_wit_3 : tuple_probe_partial_solve_wit_3.

End VC_Correct.
