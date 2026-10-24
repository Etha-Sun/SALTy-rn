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
Require Import Qs8Rdsum.Model.
Require Import Qs8Rdsum.Types.
Require Import Qs8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function rdsum_selfext2 -----*)

Definition rdsum_selfext2_return_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a1)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a0)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a2)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a0)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a1)
.

Definition rdsum_selfext2_partial_solve_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> a1)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> a0)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> a3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> a1)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> a0)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> a3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Module Type VC_Correct.


Axiom proof_of_rdsum_selfext2_return_wit_1 : rdsum_selfext2_return_wit_1.
Axiom proof_of_rdsum_selfext2_partial_solve_wit_1 : rdsum_selfext2_partial_solve_wit_1.

End VC_Correct.
