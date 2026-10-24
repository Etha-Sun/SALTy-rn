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

(*----- Function vandq_u16 -----*)

Definition vandq_u16_return_wit_1 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (f16_and16 (x7) (y7)))) (PreH2 : (retval_7 = (f16_and16 (x6) (y6)))) (PreH3 : (retval_6 = (f16_and16 (x5) (y5)))) (PreH4 : (retval_5 = (f16_and16 (x4) (y4)))) (PreH5 : (retval_4 = (f16_and16 (x3) (y3)))) (PreH6 : (retval_3 = (f16_and16 (x2) (y2)))) (PreH7 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH8 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> retval)
|--
  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> (f16_and16 (x0) (y0)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> (f16_and16 (x1) (y1)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> (f16_and16 (x2) (y2)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> (f16_and16 (x3) (y3)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> (f16_and16 (x4) (y4)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> (f16_and16 (x5) (y5)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> (f16_and16 (x6) (y6)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> (f16_and16 (x7) (y7)))
.

Definition vandq_u16_partial_solve_wit_1 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  (UndefStructPreduint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_2 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_3 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH2 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval_2 = (f16_and16 (x1) (y1))) ” 
  &&  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_4 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (f16_and16 (x2) (y2)))) (PreH2 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH3 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval_3 = (f16_and16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_and16 (x1) (y1))) ” 
  &&  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_5 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (f16_and16 (x3) (y3)))) (PreH2 : (retval_3 = (f16_and16 (x2) (y2)))) (PreH3 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH4 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval_4 = (f16_and16 (x3) (y3))) ” 
  &&  “ (retval_3 = (f16_and16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_and16 (x1) (y1))) ” 
  &&  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_6 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (f16_and16 (x4) (y4)))) (PreH2 : (retval_4 = (f16_and16 (x3) (y3)))) (PreH3 : (retval_3 = (f16_and16 (x2) (y2)))) (PreH4 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH5 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval_5 = (f16_and16 (x4) (y4))) ” 
  &&  “ (retval_4 = (f16_and16 (x3) (y3))) ” 
  &&  “ (retval_3 = (f16_and16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_and16 (x1) (y1))) ” 
  &&  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_7 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (f16_and16 (x5) (y5)))) (PreH2 : (retval_5 = (f16_and16 (x4) (y4)))) (PreH3 : (retval_4 = (f16_and16 (x3) (y3)))) (PreH4 : (retval_3 = (f16_and16 (x2) (y2)))) (PreH5 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH6 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval_6 = (f16_and16 (x5) (y5))) ” 
  &&  “ (retval_5 = (f16_and16 (x4) (y4))) ” 
  &&  “ (retval_4 = (f16_and16 (x3) (y3))) ” 
  &&  “ (retval_3 = (f16_and16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_and16 (x1) (y1))) ” 
  &&  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_8 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (f16_and16 (x6) (y6)))) (PreH2 : (retval_6 = (f16_and16 (x5) (y5)))) (PreH3 : (retval_5 = (f16_and16 (x4) (y4)))) (PreH4 : (retval_4 = (f16_and16 (x3) (y3)))) (PreH5 : (retval_3 = (f16_and16 (x2) (y2)))) (PreH6 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH7 : (retval = (f16_and16 (x0) (y0)))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval_7 = (f16_and16 (x6) (y6))) ” 
  &&  “ (retval_6 = (f16_and16 (x5) (y5))) ” 
  &&  “ (retval_5 = (f16_and16 (x4) (y4))) ” 
  &&  “ (retval_4 = (f16_and16 (x3) (y3))) ” 
  &&  “ (retval_3 = (f16_and16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_and16 (x1) (y1))) ” 
  &&  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Definition vandq_u16_partial_solve_wit_9 := 
forall (y7: Z) (y6: Z) (y5: Z) (y4: Z) (y3: Z) (y2: Z) (y1: Z) (y0: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (f16_and16 (x7) (y7)))) (PreH2 : (retval_7 = (f16_and16 (x6) (y6)))) (PreH3 : (retval_6 = (f16_and16 (x5) (y5)))) (PreH4 : (retval_5 = (f16_and16 (x4) (y4)))) (PreH5 : (retval_4 = (f16_and16 (x3) (y3)))) (PreH6 : (retval_3 = (f16_and16 (x2) (y2)))) (PreH7 : (retval_2 = (f16_and16 (x1) (y1)))) (PreH8 : (retval = (f16_and16 (x0) (y0)))) ,
  (UndefStructPreduint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
|--
  “ (retval_8 = (f16_and16 (x7) (y7))) ” 
  &&  “ (retval_7 = (f16_and16 (x6) (y6))) ” 
  &&  “ (retval_6 = (f16_and16 (x5) (y5))) ” 
  &&  “ (retval_5 = (f16_and16 (x4) (y4))) ” 
  &&  “ (retval_4 = (f16_and16 (x3) (y3))) ” 
  &&  “ (retval_3 = (f16_and16 (x2) (y2))) ” 
  &&  “ (retval_2 = (f16_and16 (x1) (y1))) ” 
  &&  “ (retval = (f16_and16 (x0) (y0))) ”
  &&  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> x7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UShort  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UShort  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UShort  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UShort  |-> y3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UShort  |-> y4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UShort  |-> y5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UShort  |-> y6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UShort  |-> y7)
.

Module Type VC_Correct.


Axiom proof_of_vandq_u16_return_wit_1 : vandq_u16_return_wit_1.
Axiom proof_of_vandq_u16_partial_solve_wit_1 : vandq_u16_partial_solve_wit_1.
Axiom proof_of_vandq_u16_partial_solve_wit_2 : vandq_u16_partial_solve_wit_2.
Axiom proof_of_vandq_u16_partial_solve_wit_3 : vandq_u16_partial_solve_wit_3.
Axiom proof_of_vandq_u16_partial_solve_wit_4 : vandq_u16_partial_solve_wit_4.
Axiom proof_of_vandq_u16_partial_solve_wit_5 : vandq_u16_partial_solve_wit_5.
Axiom proof_of_vandq_u16_partial_solve_wit_6 : vandq_u16_partial_solve_wit_6.
Axiom proof_of_vandq_u16_partial_solve_wit_7 : vandq_u16_partial_solve_wit_7.
Axiom proof_of_vandq_u16_partial_solve_wit_8 : vandq_u16_partial_solve_wit_8.
Axiom proof_of_vandq_u16_partial_solve_wit_9 : vandq_u16_partial_solve_wit_9.

End VC_Correct.
