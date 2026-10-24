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

(*----- Function vreinterpretq_u32_f32 -----*)

Definition vreinterpretq_u32_f32_return_wit_1 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (bits_of_fp32 (x3)))) (PreH2 : (retval_3 = (bits_of_fp32 (x2)))) (PreH3 : (retval_2 = (bits_of_fp32 (x1)))) (PreH4 : (retval = (bits_of_fp32 (x0)))) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> retval_4)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> retval)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (bits_of_fp32 (x0)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (bits_of_fp32 (x1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (bits_of_fp32 (x2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (bits_of_fp32 (x3)))
.

Definition vreinterpretq_u32_f32_partial_solve_wit_1 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (UndefStructPreduint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
|--
  (UndefStructPreduint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
.

Definition vreinterpretq_u32_f32_partial_solve_wit_2 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (x0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
|--
  “ (retval = (bits_of_fp32 (x0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
.

Definition vreinterpretq_u32_f32_partial_solve_wit_3 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (bits_of_fp32 (x1)))) (PreH2 : (retval = (bits_of_fp32 (x0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
|--
  “ (retval_2 = (bits_of_fp32 (x1))) ” 
  &&  “ (retval = (bits_of_fp32 (x0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
.

Definition vreinterpretq_u32_f32_partial_solve_wit_4 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (bits_of_fp32 (x2)))) (PreH2 : (retval_2 = (bits_of_fp32 (x1)))) (PreH3 : (retval = (bits_of_fp32 (x0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
|--
  “ (retval_3 = (bits_of_fp32 (x2))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (x1))) ” 
  &&  “ (retval = (bits_of_fp32 (x0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
.

Definition vreinterpretq_u32_f32_partial_solve_wit_5 := 
forall (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (bits_of_fp32 (x3)))) (PreH2 : (retval_3 = (bits_of_fp32 (x2)))) (PreH3 : (retval_2 = (bits_of_fp32 (x1)))) (PreH4 : (retval = (bits_of_fp32 (x0)))) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
|--
  “ (retval_4 = (bits_of_fp32 (x3))) ” 
  &&  “ (retval_3 = (bits_of_fp32 (x2))) ” 
  &&  “ (retval_2 = (bits_of_fp32 (x1))) ” 
  &&  “ (retval = (bits_of_fp32 (x0))) ”
  &&  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> retval_4)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
.

Module Type VC_Correct.


Axiom proof_of_vreinterpretq_u32_f32_return_wit_1 : vreinterpretq_u32_f32_return_wit_1.
Axiom proof_of_vreinterpretq_u32_f32_partial_solve_wit_1 : vreinterpretq_u32_f32_partial_solve_wit_1.
Axiom proof_of_vreinterpretq_u32_f32_partial_solve_wit_2 : vreinterpretq_u32_f32_partial_solve_wit_2.
Axiom proof_of_vreinterpretq_u32_f32_partial_solve_wit_3 : vreinterpretq_u32_f32_partial_solve_wit_3.
Axiom proof_of_vreinterpretq_u32_f32_partial_solve_wit_4 : vreinterpretq_u32_f32_partial_solve_wit_4.
Axiom proof_of_vreinterpretq_u32_f32_partial_solve_wit_5 : vreinterpretq_u32_f32_partial_solve_wit_5.

End VC_Correct.
