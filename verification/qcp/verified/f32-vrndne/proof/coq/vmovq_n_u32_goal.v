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
Require Import Rndne.Types.
Require Import Rndne.Bits.
Require Import Rndne.Model.
Require Import Rndne.VectorModel.
Require Import Rndne.VectorModel.
Local Open Scope sac.

(*----- Function vmovq_n_u32 -----*)

Definition vmovq_n_u32_return_wit_1 := 
forall (u_pre: Z) (record_return: Z) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> u_pre)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> u_pre)
.

Definition vmovq_n_u32_partial_solve_wit_1 := 
forall (u_pre: Z) (record_return: Z) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> u_pre)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> u_pre)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> u_pre)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> u_pre)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> u_pre)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> u_pre)
.

Module Type VC_Correct.


Axiom proof_of_vmovq_n_u32_return_wit_1 : vmovq_n_u32_return_wit_1.
Axiom proof_of_vmovq_n_u32_partial_solve_wit_1 : vmovq_n_u32_partial_solve_wit_1.

End VC_Correct.
