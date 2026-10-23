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
Require Import Qs8Rsum.Model.
Require Import Qs8Rsum.Types.
Require Import Qs8Rsum.VectorModel.
Local Open Scope sac.

(*----- Function vmovq_n_s32 -----*)

Definition vmovq_n_s32_return_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> x_pre)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> x_pre)
.

Definition vmovq_n_s32_partial_solve_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> x_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ”
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> x_pre)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> x_pre)
.

Module Type VC_Correct.


Axiom proof_of_vmovq_n_s32_return_wit_1 : vmovq_n_s32_return_wit_1.
Axiom proof_of_vmovq_n_s32_partial_solve_wit_1 : vmovq_n_s32_partial_solve_wit_1.

End VC_Correct.
