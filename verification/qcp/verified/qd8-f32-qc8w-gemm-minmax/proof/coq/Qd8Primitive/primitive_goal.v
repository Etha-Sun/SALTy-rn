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
Require Import Qd8API.ApiModel Qd8API.Layouts.
Local Open Scope sac.
From Qd8API Require Import copy_strategy_goal.
From Qd8API Require Import copy_strategy_proof.

(*----- Function vld1q_dup_s32 -----*)

Definition vld1q_dup_s32_return_wit_1 := 
forall (p_pre: Z) (x: Z) (record_return: Z) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> x)
  **  ((p_pre) # Int  |-> x)
|--
  ((p_pre) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> x)
.

Definition vld1q_dup_s32_partial_solve_wit_1 := 
forall (p_pre: Z) (x: Z) (record_return: Z) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> x)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> x)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> x)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> x)
  **  ((p_pre) # Int  |-> x)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> x)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> x)
  **  ((p_pre) # Int  |-> x)
.

(*----- Function vld1q_dup_f32 -----*)

Definition vld1q_dup_f32_return_wit_1 := 
forall (p_pre: Z) (x: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x)
  **  ((p_pre) # Float  |-> x)
|--
  ((p_pre) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x)
.

Definition vld1q_dup_f32_partial_solve_wit_1 := 
forall (p_pre: Z) (x: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x)
  **  ((p_pre) # Float  |-> x)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x)
  **  ((p_pre) # Float  |-> x)
.

(*----- Function vdupq_n_f32 -----*)

Definition vdupq_n_f32_return_wit_1 := 
forall (x_pre: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x_pre)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x_pre)
.

Definition vdupq_n_f32_partial_solve_wit_1 := 
forall (x_pre: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x_pre)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x_pre)
.

(*----- Function vget_low_s16 -----*)

Definition vget_low_s16_return_wit_1 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> x3)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> x2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> x1)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> x0)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> x0)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> x1)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> x2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> x3)
.

Definition vget_low_s16_partial_solve_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPredint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> x7)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> x7)
.

(*----- Function vget_high_s16 -----*)

Definition vget_high_s16_return_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (record_return: Z) ,
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> x7)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> x6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> x5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> x4)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> x4)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> x5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> x6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> x7)
.

Definition vget_high_s16_partial_solve_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPredint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> x7)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x7)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> x7)
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

(*----- Function vmovl_s8 -----*)

Definition vmovl_s8_return_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> x7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> x6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> x5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> x4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> x3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> x2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> x1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> x0)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> x0)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> x1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> x2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> x3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> x4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> x5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> x6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> x7)
.

Definition vmovl_s8_partial_solve_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> x7)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> x7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> x6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> x5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> x4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> x7)
.

(*----- Function vcvtq_f32_s32 -----*)

Definition vcvtq_f32_s32_return_wit_1 := 
(
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Z_to_fp32 (x3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Z_to_fp32 (x2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Z_to_fp32 (x1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Z_to_fp32 (x0)))
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_of_Z (x0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_of_Z (x1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_of_Z (x2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_of_Z (x3)))
) \/
(
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  TT && emp 
|--
  “ (fp32_eq (Z_to_fp32 (x3)) (fp32_of_Z (x3))) ” 
  &&  “ (fp32_eq (Z_to_fp32 (x2)) (fp32_of_Z (x2))) ” 
  &&  “ (fp32_eq (Z_to_fp32 (x1)) (fp32_of_Z (x1))) ” 
  &&  “ (fp32_eq (Z_to_fp32 (x0)) (fp32_of_Z (x0))) ”
  &&  emp
).

Definition vcvtq_f32_s32_return_wit_1_split_goal_1 := 
forall (x3: Z) ,
  (fp32_eq (Z_to_fp32 (x3)) (fp32_of_Z (x3)))
.

Definition vcvtq_f32_s32_return_wit_1_split_goal_2 := 
forall (x2: Z) ,
  (fp32_eq (Z_to_fp32 (x2)) (fp32_of_Z (x2)))
.

Definition vcvtq_f32_s32_return_wit_1_split_goal_3 := 
forall (x1: Z) ,
  (fp32_eq (Z_to_fp32 (x1)) (fp32_of_Z (x1)))
.

Definition vcvtq_f32_s32_return_wit_1_split_goal_4 := 
forall (x0: Z) ,
  (fp32_eq (Z_to_fp32 (x0)) (fp32_of_Z (x0)))
.

Definition vcvtq_f32_s32_partial_solve_wit_1 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (Z_to_fp32 (x3)))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Z_to_fp32 (x2)))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Z_to_fp32 (x1)))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Z_to_fp32 (x0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> x3)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (Z_to_fp32 (x3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (Z_to_fp32 (x2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (Z_to_fp32 (x1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (Z_to_fp32 (x0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> x3)
.

(*----- Function vmulq_f32 -----*)

Definition vmulq_f32_return_wit_1 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_mul (x3) (y3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_mul (x2) (y2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_mul (x1) (y1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_mul (x0) (y0)))
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_mul (x0) (y0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_mul (x1) (y1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_mul (x2) (y2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_mul (x3) (y3)))
.

Definition vmulq_f32_partial_solve_wit_1 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (fp32_mul (x3) (y3)))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (fp32_mul (x2) (y2)))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (fp32_mul (x1) (y1)))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (fp32_mul (x0) (y0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (fp32_mul (x3) (y3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (fp32_mul (x2) (y2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (fp32_mul (x1) (y1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (fp32_mul (x0) (y0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
.

(*----- Function qcp_assert -----*)

Definition qcp_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

(*----- Function xnn_prefetch_to_l1 -----*)

Definition xnn_prefetch_to_l1_return_wit_1 := 
forall (p_pre: Z) (PreH1 : (0 <= p_pre)) (PreH2 : (p_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.

Include copy_Strategy_Correct.

Axiom proof_of_vld1q_dup_s32_return_wit_1 : vld1q_dup_s32_return_wit_1.
Axiom proof_of_vld1q_dup_s32_partial_solve_wit_1 : vld1q_dup_s32_partial_solve_wit_1.
Axiom proof_of_vld1q_dup_f32_return_wit_1 : vld1q_dup_f32_return_wit_1.
Axiom proof_of_vld1q_dup_f32_partial_solve_wit_1 : vld1q_dup_f32_partial_solve_wit_1.
Axiom proof_of_vdupq_n_f32_return_wit_1 : vdupq_n_f32_return_wit_1.
Axiom proof_of_vdupq_n_f32_partial_solve_wit_1 : vdupq_n_f32_partial_solve_wit_1.
Axiom proof_of_vget_low_s16_return_wit_1 : vget_low_s16_return_wit_1.
Axiom proof_of_vget_low_s16_partial_solve_wit_1 : vget_low_s16_partial_solve_wit_1.
Axiom proof_of_vget_high_s16_return_wit_1 : vget_high_s16_return_wit_1.
Axiom proof_of_vget_high_s16_partial_solve_wit_1 : vget_high_s16_partial_solve_wit_1.
Axiom proof_of_vget_low_f32_return_wit_1 : vget_low_f32_return_wit_1.
Axiom proof_of_vget_low_f32_partial_solve_wit_1 : vget_low_f32_partial_solve_wit_1.
Axiom proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Axiom proof_of_vget_high_f32_partial_solve_wit_1 : vget_high_f32_partial_solve_wit_1.
Axiom proof_of_vmovl_s8_return_wit_1 : vmovl_s8_return_wit_1.
Axiom proof_of_vmovl_s8_partial_solve_wit_1 : vmovl_s8_partial_solve_wit_1.
Axiom proof_of_vcvtq_f32_s32_return_wit_1 : vcvtq_f32_s32_return_wit_1.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_1 : vcvtq_f32_s32_partial_solve_wit_1.
Axiom proof_of_vmulq_f32_return_wit_1 : vmulq_f32_return_wit_1.
Axiom proof_of_vmulq_f32_partial_solve_wit_1 : vmulq_f32_partial_solve_wit_1.
Axiom proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Axiom proof_of_xnn_prefetch_to_l1_return_wit_1 : xnn_prefetch_to_l1_return_wit_1.

End VC_Correct.
