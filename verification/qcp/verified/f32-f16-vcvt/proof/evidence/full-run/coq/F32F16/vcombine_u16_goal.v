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

(*----- Function vcombine_u16 -----*)

Definition vcombine_u16_return_wit_1 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> y3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> y2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> y1)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> y0)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
|--
  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> y0)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> y1)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> y2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> y3)
.

Definition vcombine_u16_partial_solve_wit_1 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPreduint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> y3)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> y2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> y1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> y0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
|--
  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> y3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> y2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> y1)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> y0)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
.

Module Type VC_Correct.


Axiom proof_of_vcombine_u16_return_wit_1 : vcombine_u16_return_wit_1.
Axiom proof_of_vcombine_u16_partial_solve_wit_1 : vcombine_u16_partial_solve_wit_1.

End VC_Correct.
