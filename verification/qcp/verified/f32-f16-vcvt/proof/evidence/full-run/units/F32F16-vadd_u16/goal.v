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

(*----- Function vadd_u16 -----*)

Definition vadd_u16_return_wit_1 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (f16_add16 (x3) (y3)))) (PreH2 : (retval_3 = (f16_add16 (x2) (y2)))) (PreH3 : (retval_2 = (f16_add16 (x1) (y1)))) (PreH4 : (retval = (f16_add16 (x0) (y0)))) ,
  ((&((record_return)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> retval)
|--
  ((&((record_return)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> (f16_add16 (x0) (y0)))
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> (f16_add16 (x1) (y1)))
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> (f16_add16 (x2) (y2)))
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> (f16_add16 (x3) (y3)))
.

Definition vadd_u16_partial_solve_wit_1 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint16x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
|--
  (UndefStructPreduint16x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
.

Definition vadd_u16_partial_solve_wit_2 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (f16_add16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
|--
  “ (retval = (f16_add16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
.

Definition vadd_u16_partial_solve_wit_3 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_add16 (x1) (y1)))) (PreH2 : (retval = (f16_add16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
|--
  “ (retval_2 = (f16_add16 (x1) (y1))) ” 
  &&  “ (retval = (f16_add16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
.

Definition vadd_u16_partial_solve_wit_4 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_add16 (x2) (y2)))) (PreH2 : (retval_2 = (f16_add16 (x1) (y1)))) (PreH3 : (retval = (f16_add16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
|--
  “ (retval_3 = (f16_add16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_add16 (x1) (y1))) ” 
  &&  “ (retval = (f16_add16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
.

Definition vadd_u16_partial_solve_wit_5 := 
forall (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (f16_add16 (x3) (y3)))) (PreH2 : (retval_3 = (f16_add16 (x2) (y2)))) (PreH3 : (retval_2 = (f16_add16 (x1) (y1)))) (PreH4 : (retval = (f16_add16 (x0) (y0)))) ,
  (UndefStructPreduint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
|--
  “ (retval_4 = (f16_add16 (x3) (y3))) ” 
  &&  “ (retval_3 = (f16_add16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_add16 (x1) (y1))) ” 
  &&  “ (retval = (f16_add16 (x0) (y0))) ”
  &&  ((&((record_return)  # "uint16x4_t" ->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x4_t" ->ₛ "s0")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
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


Axiom proof_of_vadd_u16_return_wit_1 : vadd_u16_return_wit_1.
Axiom proof_of_vadd_u16_partial_solve_wit_1 : vadd_u16_partial_solve_wit_1.
Axiom proof_of_vadd_u16_partial_solve_wit_2 : vadd_u16_partial_solve_wit_2.
Axiom proof_of_vadd_u16_partial_solve_wit_3 : vadd_u16_partial_solve_wit_3.
Axiom proof_of_vadd_u16_partial_solve_wit_4 : vadd_u16_partial_solve_wit_4.
Axiom proof_of_vadd_u16_partial_solve_wit_5 : vadd_u16_partial_solve_wit_5.

End VC_Correct.
