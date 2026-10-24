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
Require Import F32F16.Types.
Require Import F32F16.Bits.
Require Import F32F16.Model.
Require Import F32F16.IntegerModel.
Require Import F32F16.VectorModel.
Local Open Scope sac.

(*----- Function vdupq_n_f32 -----*)

Definition vdupq_n_f32_return_wit_1 := 
forall (b_pre: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b_pre)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b_pre)
.

Definition vdupq_n_f32_partial_solve_wit_1 := 
forall (b_pre: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> b_pre)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> b_pre)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> b_pre)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> b_pre)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> b_pre)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> b_pre)
.

Module Type VC_Correct.


Axiom proof_of_vdupq_n_f32_return_wit_1 : vdupq_n_f32_return_wit_1.
Axiom proof_of_vdupq_n_f32_partial_solve_wit_1 : vdupq_n_f32_partial_solve_wit_1.

End VC_Correct.
