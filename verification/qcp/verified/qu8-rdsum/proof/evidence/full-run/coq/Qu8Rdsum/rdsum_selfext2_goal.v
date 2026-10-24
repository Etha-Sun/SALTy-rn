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
Require Import Qu8Rdsum.Model.
Require Import Qu8Rdsum.Types.
Require Import Qu8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function rdsum_selfext2 -----*)

Definition rdsum_selfext2_return_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= UINT_MAX)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= UINT_MAX)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= UINT_MAX)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= UINT_MAX)) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a1)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a0)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a2)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a2)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a0)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a1)
.

Definition rdsum_selfext2_partial_solve_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= UINT_MAX)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= UINT_MAX)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= UINT_MAX)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= UINT_MAX)) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> a1)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> a0)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> a3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ”
  &&  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> a1)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> a0)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> a3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
.

Module Type VC_Correct.


Axiom proof_of_rdsum_selfext2_return_wit_1 : rdsum_selfext2_return_wit_1.
Axiom proof_of_rdsum_selfext2_partial_solve_wit_1 : rdsum_selfext2_partial_solve_wit_1.

End VC_Correct.
