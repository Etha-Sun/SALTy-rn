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

(*----- Function vmovn_u32 -----*)

Definition vmovn_u32_return_wit_1 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (f16_narrow16 (x3)))) (PreH2 : (retval_3 = (f16_narrow16 (x2)))) (PreH3 : (retval_2 = (f16_narrow16 (x1)))) (PreH4 : (retval = (f16_narrow16 (x0)))) ,
  ((&((record_return)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> retval)
|--
  ((&((record_return)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> (f16_narrow16 (x0)))
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> (f16_narrow16 (x1)))
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> (f16_narrow16 (x2)))
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> (f16_narrow16 (x3)))
.

Definition vmovn_u32_partial_solve_wit_1 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint16x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  (UndefStructPreduint16x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vmovn_u32_partial_solve_wit_2 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 (x0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (retval = (f16_narrow16 (x0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vmovn_u32_partial_solve_wit_3 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_narrow16 (x1)))) (PreH2 : (retval = (f16_narrow16 (x0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (retval_2 = (f16_narrow16 (x1))) ” 
  &&  “ (retval = (f16_narrow16 (x0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vmovn_u32_partial_solve_wit_4 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_narrow16 (x2)))) (PreH2 : (retval_2 = (f16_narrow16 (x1)))) (PreH3 : (retval = (f16_narrow16 (x0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (retval_3 = (f16_narrow16 (x2))) ” 
  &&  “ (retval_2 = (f16_narrow16 (x1))) ” 
  &&  “ (retval = (f16_narrow16 (x0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vmovn_u32_partial_solve_wit_5 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (f16_narrow16 (x3)))) (PreH2 : (retval_3 = (f16_narrow16 (x2)))) (PreH3 : (retval_2 = (f16_narrow16 (x1)))) (PreH4 : (retval = (f16_narrow16 (x0)))) ,
  (UndefStructPreduint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (retval_4 = (f16_narrow16 (x3))) ” 
  &&  “ (retval_3 = (f16_narrow16 (x2))) ” 
  &&  “ (retval_2 = (f16_narrow16 (x1))) ” 
  &&  “ (retval = (f16_narrow16 (x0))) ”
  &&  ((&((record_return)  # "uint16x4_t" ->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s0")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Module Type VC_Correct.


Axiom proof_of_vmovn_u32_return_wit_1 : vmovn_u32_return_wit_1.
Axiom proof_of_vmovn_u32_partial_solve_wit_1 : vmovn_u32_partial_solve_wit_1.
Axiom proof_of_vmovn_u32_partial_solve_wit_2 : vmovn_u32_partial_solve_wit_2.
Axiom proof_of_vmovn_u32_partial_solve_wit_3 : vmovn_u32_partial_solve_wit_3.
Axiom proof_of_vmovn_u32_partial_solve_wit_4 : vmovn_u32_partial_solve_wit_4.
Axiom proof_of_vmovn_u32_partial_solve_wit_5 : vmovn_u32_partial_solve_wit_5.

End VC_Correct.
