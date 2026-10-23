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
Require Import Qs8Cvt.Model.
Require Import Qs8Cvt.Types.
Local Open Scope sac.

(*----- Function vget_high_f32 -----*)

Definition vget_high_f32_return_wit_1 := 
forall (a3: fp32) (a2: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a2)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a2)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a3)
.

Definition vget_high_f32_partial_solve_wit_1 := 
forall (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x2_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> a3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> a3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
.

Module Type VC_Correct.


Axiom proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Axiom proof_of_vget_high_f32_partial_solve_wit_1 : vget_high_f32_partial_solve_wit_1.

End VC_Correct.
