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
Require Import FMax.Types.
Local Open Scope sac.

(*----- Function vld1q_f32 -----*)

Definition vld1q_f32_safety_wit_1 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1q_f32_safety_wit_2 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vld1q_f32_safety_wit_3 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vld1q_f32_safety_wit_4 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vld1q_f32_return_wit_1 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

Definition vld1q_f32_partial_solve_wit_1 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
.

(*----- Function qcp_vst1q_f32 -----*)

Definition qcp_vst1q_f32_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_vst1q_f32_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_vst1q_f32_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_vst1q_f32_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_vst1q_f32_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
.

(*----- Function qcp_vst1_f32 -----*)

Definition qcp_vst1_f32_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_vst1_f32_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_vst1_f32_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
.

(*----- Function vget_low_f32 -----*)

Definition vget_low_f32_return_wit_1 := 
forall (x1: fp32) (x0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
.

Definition vget_low_f32_partial_solve_wit_1 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x2_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
.

(*----- Function vget_high_f32 -----*)

Definition vget_high_f32_return_wit_1 := 
forall (x3: fp32) (x2: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x2)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x2)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x3)
.

Definition vget_high_f32_partial_solve_wit_1 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x2_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
.

(*----- Function qcp_vst1_lane_f32 -----*)

Definition qcp_vst1_lane_f32_safety_wit_1 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 0)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_vst1_lane_f32_safety_wit_2 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 0)) (PreH2 : (lane_pre = 0)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ False ”
.

Definition qcp_vst1_lane_f32_safety_wit_3 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 0)) (PreH2 : (lane_pre = 0)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_vst1_lane_f32_safety_wit_4 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  “ False ”
.

Definition qcp_vst1_lane_f32_return_wit_1 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
.

(*----- Function qcp_assert -----*)

Definition qcp_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_vld1q_f32_safety_wit_1 : vld1q_f32_safety_wit_1.
Axiom proof_of_vld1q_f32_safety_wit_2 : vld1q_f32_safety_wit_2.
Axiom proof_of_vld1q_f32_safety_wit_3 : vld1q_f32_safety_wit_3.
Axiom proof_of_vld1q_f32_safety_wit_4 : vld1q_f32_safety_wit_4.
Axiom proof_of_vld1q_f32_return_wit_1 : vld1q_f32_return_wit_1.
Axiom proof_of_vld1q_f32_partial_solve_wit_1 : vld1q_f32_partial_solve_wit_1.
Axiom proof_of_qcp_vst1q_f32_safety_wit_1 : qcp_vst1q_f32_safety_wit_1.
Axiom proof_of_qcp_vst1q_f32_safety_wit_2 : qcp_vst1q_f32_safety_wit_2.
Axiom proof_of_qcp_vst1q_f32_safety_wit_3 : qcp_vst1q_f32_safety_wit_3.
Axiom proof_of_qcp_vst1q_f32_safety_wit_4 : qcp_vst1q_f32_safety_wit_4.
Axiom proof_of_qcp_vst1q_f32_return_wit_1 : qcp_vst1q_f32_return_wit_1.
Axiom proof_of_qcp_vst1_f32_safety_wit_1 : qcp_vst1_f32_safety_wit_1.
Axiom proof_of_qcp_vst1_f32_safety_wit_2 : qcp_vst1_f32_safety_wit_2.
Axiom proof_of_qcp_vst1_f32_return_wit_1 : qcp_vst1_f32_return_wit_1.
Axiom proof_of_vget_low_f32_return_wit_1 : vget_low_f32_return_wit_1.
Axiom proof_of_vget_low_f32_partial_solve_wit_1 : vget_low_f32_partial_solve_wit_1.
Axiom proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Axiom proof_of_vget_high_f32_partial_solve_wit_1 : vget_high_f32_partial_solve_wit_1.
Axiom proof_of_qcp_vst1_lane_f32_safety_wit_1 : qcp_vst1_lane_f32_safety_wit_1.
Axiom proof_of_qcp_vst1_lane_f32_safety_wit_2 : qcp_vst1_lane_f32_safety_wit_2.
Axiom proof_of_qcp_vst1_lane_f32_safety_wit_3 : qcp_vst1_lane_f32_safety_wit_3.
Axiom proof_of_qcp_vst1_lane_f32_safety_wit_4 : qcp_vst1_lane_f32_safety_wit_4.
Axiom proof_of_qcp_vst1_lane_f32_return_wit_1 : qcp_vst1_lane_f32_return_wit_1.
Axiom proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.

End VC_Correct.
