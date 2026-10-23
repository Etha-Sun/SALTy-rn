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
Require Import Qu8Cvt.Model.
Require Import Qu8Cvt.Types.
Local Open Scope sac.

(*----- Function vdupq_n_s16 -----*)

Definition vdupq_n_s16_return_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> x_pre)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> x_pre)
.

Definition vdupq_n_s16_partial_solve_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x_pre)
|--
  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x_pre)
.

Module Type VC_Correct.


Axiom proof_of_vdupq_n_s16_return_wit_1 : vdupq_n_s16_return_wit_1.
Axiom proof_of_vdupq_n_s16_partial_solve_wit_1 : vdupq_n_s16_partial_solve_wit_1.

End VC_Correct.
