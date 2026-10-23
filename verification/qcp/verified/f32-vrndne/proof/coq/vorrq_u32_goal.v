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

(*----- Function vorrq_u32 -----*)

Definition vorrq_u32_return_wit_1 := 
(
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (Z.lor x3 y3))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (Z.lor x2 y2))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (Z.lor x1 y1))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (Z.lor x0 y0))
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (rndne_or (x0) (y0)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (rndne_or (x1) (y1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (rndne_or (x2) (y2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (rndne_or (x3) (y3)))
) \/
(
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  TT && emp 
|--
  “ ((Z.lor x3 y3) = (rndne_or (x3) (y3))) ” 
  &&  “ ((Z.lor x2 y2) = (rndne_or (x2) (y2))) ” 
  &&  “ ((Z.lor x1 y1) = (rndne_or (x1) (y1))) ” 
  &&  “ ((Z.lor x0 y0) = (rndne_or (x0) (y0))) ”
  &&  emp
).

Definition vorrq_u32_return_wit_1_split_goal_1 := 
forall (y3: Z) (x3: Z) ,
  ((Z.lor x3 y3) = (rndne_or (x3) (y3)))
.

Definition vorrq_u32_return_wit_1_split_goal_2 := 
forall (y2: Z) (x2: Z) ,
  ((Z.lor x2 y2) = (rndne_or (x2) (y2)))
.

Definition vorrq_u32_return_wit_1_split_goal_3 := 
forall (y1: Z) (x1: Z) ,
  ((Z.lor x1 y1) = (rndne_or (x1) (y1)))
.

Definition vorrq_u32_return_wit_1_split_goal_4 := 
forall (y0: Z) (x0: Z) ,
  ((Z.lor x0 y0) = (rndne_or (x0) (y0)))
.

Definition vorrq_u32_partial_solve_wit_1 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> (Z.lor x3 y3))
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> (Z.lor x2 y2))
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> (Z.lor x1 y1))
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> (Z.lor x0 y0))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> y3)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> (Z.lor x3 y3))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> (Z.lor x2 y2))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> (Z.lor x1 y1))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> (Z.lor x0 y0))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> y3)
.

Module Type VC_Correct.


Axiom proof_of_vorrq_u32_return_wit_1 : vorrq_u32_return_wit_1.
Axiom proof_of_vorrq_u32_partial_solve_wit_1 : vorrq_u32_partial_solve_wit_1.

End VC_Correct.
