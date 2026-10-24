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
Require Import Qu8Add.Model.
Require Import Qu8Add.Types.
Require Import Qu8Add.UnsignedScalarModel.
Local Open Scope sac.

(*----- Function vdup_n_u8 -----*)

Definition vdup_n_u8_return_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 255)) ,
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x_pre)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x_pre)
.

Definition vdup_n_u8_partial_solve_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 255)) ,
  (UndefStructPreduint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> x_pre)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> x_pre)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> x_pre)
.

(*----- Function vdupq_n_s16 -----*)

Definition vdupq_n_s16_return_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> x_pre)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> x_pre)
.

Definition vdupq_n_s16_partial_solve_wit_1 := 
forall (x_pre: Z) (record_return: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x_pre)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x_pre)
|--
  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> x_pre)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> x_pre)
.

(*----- Function vdupq_n_s32 -----*)

Definition vdupq_n_s32_return_wit_1 := 
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

Definition vdupq_n_s32_partial_solve_wit_1 := 
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

(*----- Function vsubl_u8 -----*)

Definition vsubl_u8_return_wit_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_udiff (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 65535)) (PreH4 : (retval_7 = (qu_udiff (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 65535)) (PreH7 : (retval_6 = (qu_udiff (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 65535)) (PreH10 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 65535)) (PreH13 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 65535)) (PreH16 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 65535)) (PreH19 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 65535)) (PreH22 : (retval = (qu_udiff (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 65535)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 255)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 255)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 255)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 255)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 255)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 255)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 255)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 255)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> retval)
|--
  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> (qu_udiff (a0) (b0)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> (qu_udiff (a1) (b1)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> (qu_udiff (a2) (b2)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> (qu_udiff (a3) (b3)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> (qu_udiff (a4) (b4)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> (qu_udiff (a5) (b5)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> (qu_udiff (a6) (b6)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> (qu_udiff (a7) (b7)))
.

Definition vsubl_u8_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 255)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 255)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 255)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 255)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 255)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 255)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 255)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 255)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 255)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 255)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 255)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 255)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 255)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 255)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 255)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 255)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  (UndefStructPreduint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_1 := vsubl_u8_partial_solve_wit_1_pure -> vsubl_u8_partial_solve_wit_1_aux.

Definition vsubl_u8_partial_solve_wit_2_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_udiff (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 255)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 255)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 255)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 255)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 255)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 255)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 255)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 255)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_2_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_udiff (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 255)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 255)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 255)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 255)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 255)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 255)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 255)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 255)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_2 := vsubl_u8_partial_solve_wit_2_pure -> vsubl_u8_partial_solve_wit_2_aux.

Definition vsubl_u8_partial_solve_wit_3_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 65535)) (PreH4 : (retval = (qu_udiff (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 65535)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 255)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 255)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 255)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 255)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 255)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 255)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 255)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 255)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 65535)) (PreH4 : (retval = (qu_udiff (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 65535)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 255)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 255)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 255)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 255)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 255)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 255)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 255)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 255)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (retval_2 = (qu_udiff (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_3 := vsubl_u8_partial_solve_wit_3_pure -> vsubl_u8_partial_solve_wit_3_aux.

Definition vsubl_u8_partial_solve_wit_4_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 65535)) (PreH4 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 65535)) (PreH7 : (retval = (qu_udiff (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 65535)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 255)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 255)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 255)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 255)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 255)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 255)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 255)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 255)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_4_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 65535)) (PreH4 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 65535)) (PreH7 : (retval = (qu_udiff (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 65535)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 255)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 255)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 255)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 255)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 255)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 255)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 255)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 255)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (retval_3 = (qu_udiff (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_udiff (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_4 := vsubl_u8_partial_solve_wit_4_pure -> vsubl_u8_partial_solve_wit_4_aux.

Definition vsubl_u8_partial_solve_wit_5_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 65535)) (PreH4 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 65535)) (PreH7 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 65535)) (PreH10 : (retval = (qu_udiff (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 65535)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 255)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 255)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 255)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 255)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 255)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 255)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 255)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 255)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_5_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 65535)) (PreH4 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 65535)) (PreH7 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 65535)) (PreH10 : (retval = (qu_udiff (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 65535)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 255)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 255)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 255)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 255)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 255)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 255)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 255)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 255)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (retval_4 = (qu_udiff (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_udiff (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_udiff (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_5 := vsubl_u8_partial_solve_wit_5_pure -> vsubl_u8_partial_solve_wit_5_aux.

Definition vsubl_u8_partial_solve_wit_6_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 65535)) (PreH4 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 65535)) (PreH7 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 65535)) (PreH10 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 65535)) (PreH13 : (retval = (qu_udiff (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 65535)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 255)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 255)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 255)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 255)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 255)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 255)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 255)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 255)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_6_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 65535)) (PreH4 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 65535)) (PreH7 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 65535)) (PreH10 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 65535)) (PreH13 : (retval = (qu_udiff (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 65535)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 255)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 255)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 255)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 255)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 255)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 255)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 255)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 255)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (retval_5 = (qu_udiff (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_udiff (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_udiff (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_udiff (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_6 := vsubl_u8_partial_solve_wit_6_pure -> vsubl_u8_partial_solve_wit_6_aux.

Definition vsubl_u8_partial_solve_wit_7_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_udiff (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 65535)) (PreH4 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 65535)) (PreH7 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 65535)) (PreH10 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 65535)) (PreH13 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 65535)) (PreH16 : (retval = (qu_udiff (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 65535)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 255)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 255)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 255)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 255)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 255)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 255)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 255)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 255)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_7_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_udiff (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 65535)) (PreH4 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 65535)) (PreH7 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 65535)) (PreH10 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 65535)) (PreH13 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 65535)) (PreH16 : (retval = (qu_udiff (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 65535)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 255)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 255)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 255)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 255)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 255)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 255)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 255)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 255)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (retval_6 = (qu_udiff (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_udiff (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_udiff (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_udiff (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_udiff (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_7 := vsubl_u8_partial_solve_wit_7_pure -> vsubl_u8_partial_solve_wit_7_aux.

Definition vsubl_u8_partial_solve_wit_8_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_udiff (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 65535)) (PreH4 : (retval_6 = (qu_udiff (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 65535)) (PreH7 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 65535)) (PreH10 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 65535)) (PreH13 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 65535)) (PreH16 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 65535)) (PreH19 : (retval = (qu_udiff (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 65535)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 255)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 255)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 255)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 255)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 255)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 255)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 255)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 255)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
.

Definition vsubl_u8_partial_solve_wit_8_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_udiff (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 65535)) (PreH4 : (retval_6 = (qu_udiff (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 65535)) (PreH7 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 65535)) (PreH10 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 65535)) (PreH13 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 65535)) (PreH16 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 65535)) (PreH19 : (retval = (qu_udiff (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 65535)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 255)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 255)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 255)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 255)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 255)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 255)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 255)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 255)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ” 
  &&  “ (retval_7 = (qu_udiff (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_udiff (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_udiff (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_udiff (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_udiff (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_udiff (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vsubl_u8_partial_solve_wit_8 := vsubl_u8_partial_solve_wit_8_pure -> vsubl_u8_partial_solve_wit_8_aux.

Definition vsubl_u8_partial_solve_wit_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_udiff (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 65535)) (PreH4 : (retval_7 = (qu_udiff (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 65535)) (PreH7 : (retval_6 = (qu_udiff (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 65535)) (PreH10 : (retval_5 = (qu_udiff (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 65535)) (PreH13 : (retval_4 = (qu_udiff (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 65535)) (PreH16 : (retval_3 = (qu_udiff (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 65535)) (PreH19 : (retval_2 = (qu_udiff (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 65535)) (PreH22 : (retval = (qu_udiff (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 65535)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 255)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 255)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 255)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 255)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 255)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 255)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 255)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 255)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (retval_8 = (qu_udiff (a7) (b7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_udiff (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_udiff (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_udiff (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_udiff (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_udiff (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_udiff (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_udiff (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

(*----- Function vreinterpretq_s16_u16 -----*)

Definition vreinterpretq_s16_u16_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_s16 (a7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qu_s16 (a6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qu_s16 (a5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qu_s16 (a4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qu_s16 (a3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qu_s16 (a2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qu_s16 (a1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qu_s16 (a0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 65535)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 65535)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 65535)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 65535)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 65535)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 65535)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 65535)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 65535)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> retval)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (qu_s16 (a0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (qu_s16 (a1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (qu_s16 (a2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (qu_s16 (a3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (qu_s16 (a4)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (qu_s16 (a5)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (qu_s16 (a6)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (qu_s16 (a7)))
.

Definition vreinterpretq_s16_u16_partial_solve_wit_1_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 65535)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 65535)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 65535)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 65535)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 65535)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 65535)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 65535)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 65535)) ,
  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_1_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 65535)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 65535)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 65535)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 65535)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 65535)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 65535)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 65535)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 65535)) ,
  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_1 := vreinterpretq_s16_u16_partial_solve_wit_1_pure -> vreinterpretq_s16_u16_partial_solve_wit_1_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_2_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_s16 (a0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 65535)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 65535)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 65535)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 65535)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 65535)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 65535)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 65535)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_2_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_s16 (a0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 65535)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 65535)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 65535)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 65535)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 65535)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 65535)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 65535)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_2 := vreinterpretq_s16_u16_partial_solve_wit_2_pure -> vreinterpretq_s16_u16_partial_solve_wit_2_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_3_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_s16 (a1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qu_s16 (a0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 65535)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 65535)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 65535)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 65535)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 65535)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 65535)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 65535)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_3_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_s16 (a1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qu_s16 (a0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 65535)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 65535)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 65535)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 65535)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 65535)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 65535)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 65535)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (retval_2 = (qu_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_3 := vreinterpretq_s16_u16_partial_solve_wit_3_pure -> vreinterpretq_s16_u16_partial_solve_wit_3_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_4_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_s16 (a2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qu_s16 (a1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qu_s16 (a0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 65535)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 65535)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 65535)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 65535)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 65535)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 65535)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 65535)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_4_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_s16 (a2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qu_s16 (a1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qu_s16 (a0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 65535)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 65535)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 65535)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 65535)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 65535)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 65535)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 65535)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (retval_3 = (qu_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_4 := vreinterpretq_s16_u16_partial_solve_wit_4_pure -> vreinterpretq_s16_u16_partial_solve_wit_4_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_5_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_s16 (a3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qu_s16 (a2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qu_s16 (a1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qu_s16 (a0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 65535)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 65535)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 65535)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 65535)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 65535)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 65535)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 65535)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_5_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_s16 (a3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qu_s16 (a2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qu_s16 (a1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qu_s16 (a0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 65535)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 65535)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 65535)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 65535)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 65535)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 65535)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 65535)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (retval_4 = (qu_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_5 := vreinterpretq_s16_u16_partial_solve_wit_5_pure -> vreinterpretq_s16_u16_partial_solve_wit_5_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_6_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_s16 (a4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qu_s16 (a3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qu_s16 (a2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qu_s16 (a1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qu_s16 (a0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 65535)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 65535)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 65535)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 65535)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 65535)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 65535)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 65535)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_6_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_s16 (a4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qu_s16 (a3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qu_s16 (a2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qu_s16 (a1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qu_s16 (a0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 65535)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 65535)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 65535)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 65535)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 65535)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 65535)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 65535)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (retval_5 = (qu_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_6 := vreinterpretq_s16_u16_partial_solve_wit_6_pure -> vreinterpretq_s16_u16_partial_solve_wit_6_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_7_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_s16 (a5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qu_s16 (a4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qu_s16 (a3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qu_s16 (a2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qu_s16 (a1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qu_s16 (a0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 65535)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 65535)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 65535)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 65535)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 65535)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 65535)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 65535)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_7_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_s16 (a5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qu_s16 (a4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qu_s16 (a3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qu_s16 (a2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qu_s16 (a1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qu_s16 (a0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 65535)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 65535)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 65535)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 65535)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 65535)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 65535)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 65535)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (retval_6 = (qu_s16 (a5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qu_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_7 := vreinterpretq_s16_u16_partial_solve_wit_7_pure -> vreinterpretq_s16_u16_partial_solve_wit_7_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_8_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_s16 (a6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qu_s16 (a5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qu_s16 (a4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qu_s16 (a3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qu_s16 (a2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qu_s16 (a1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qu_s16 (a0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 65535)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 65535)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 65535)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 65535)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 65535)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 65535)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 65535)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
.

Definition vreinterpretq_s16_u16_partial_solve_wit_8_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_s16 (a6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qu_s16 (a5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qu_s16 (a4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qu_s16 (a3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qu_s16 (a2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qu_s16 (a1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qu_s16 (a0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 65535)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 65535)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 65535)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 65535)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 65535)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 65535)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 65535)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 65535)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ” 
  &&  “ (retval_7 = (qu_s16 (a6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qu_s16 (a5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qu_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

Definition vreinterpretq_s16_u16_partial_solve_wit_8 := vreinterpretq_s16_u16_partial_solve_wit_8_pure -> vreinterpretq_s16_u16_partial_solve_wit_8_aux.

Definition vreinterpretq_s16_u16_partial_solve_wit_9 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_s16 (a7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qu_s16 (a6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qu_s16 (a5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qu_s16 (a4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qu_s16 (a3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qu_s16 (a2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qu_s16 (a1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qu_s16 (a0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 65535)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 65535)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 65535)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 65535)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 65535)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 65535)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 65535)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 65535)) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
|--
  “ (retval_8 = (qu_s16 (a7))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qu_s16 (a6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qu_s16 (a5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qu_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_s16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 65535) ”
  &&  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
.

(*----- Function vget_low_s16 -----*)

Definition vget_low_s16_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a3)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a1)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a0)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a0)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a1)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a3)
.

Definition vget_low_s16_partial_solve_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

(*----- Function vget_high_s16 -----*)

Definition vget_high_s16_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a7)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a4)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a4)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a7)
.

Definition vget_high_s16_partial_solve_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a7)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

(*----- Function vmovl_s16 -----*)

Definition vmovl_s16_return_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a1)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a0)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a0)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a1)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a3)
.

Definition vmovl_s16_partial_solve_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
.

(*----- Function vmulq_s32 -----*)

Definition vmulq_s32_return_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_neon_mul (a3) (b3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (qu_neon_mul (a2) (b2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (qu_neon_mul (a1) (b1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (qu_neon_mul (a0) (b0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b0)) (PreH22 : (b0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= b1)) (PreH24 : (b1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= b2)) (PreH26 : (b2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= b3)) (PreH28 : (b3 <= INT_MAX)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> retval)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qu_neon_mul (a0) (b0)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qu_neon_mul (a1) (b1)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qu_neon_mul (a2) (b2)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qu_neon_mul (a3) (b3)))
.

Definition vmulq_s32_partial_solve_wit_1_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b0)) (PreH10 : (b0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b1)) (PreH12 : (b1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b2)) (PreH14 : (b2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b3)) (PreH16 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ”
.

Definition vmulq_s32_partial_solve_wit_1_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b0)) (PreH10 : (b0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b1)) (PreH12 : (b1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b2)) (PreH14 : (b2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b3)) (PreH16 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vmulq_s32_partial_solve_wit_1 := vmulq_s32_partial_solve_wit_1_pure -> vmulq_s32_partial_solve_wit_1_aux.

Definition vmulq_s32_partial_solve_wit_2_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_mul (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b0)) (PreH13 : (b0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b1)) (PreH15 : (b1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= b2)) (PreH17 : (b2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b3)) (PreH19 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ”
.

Definition vmulq_s32_partial_solve_wit_2_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_mul (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b0)) (PreH13 : (b0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b1)) (PreH15 : (b1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= b2)) (PreH17 : (b2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b3)) (PreH19 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mul (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vmulq_s32_partial_solve_wit_2 := vmulq_s32_partial_solve_wit_2_pure -> vmulq_s32_partial_solve_wit_2_aux.

Definition vmulq_s32_partial_solve_wit_3_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_mul (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (qu_neon_mul (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b0)) (PreH16 : (b0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b1)) (PreH18 : (b1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= b2)) (PreH20 : (b2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b3)) (PreH22 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ”
.

Definition vmulq_s32_partial_solve_wit_3_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_mul (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (qu_neon_mul (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b0)) (PreH16 : (b0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b1)) (PreH18 : (b1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= b2)) (PreH20 : (b2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b3)) (PreH22 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_mul (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mul (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vmulq_s32_partial_solve_wit_3 := vmulq_s32_partial_solve_wit_3_pure -> vmulq_s32_partial_solve_wit_3_aux.

Definition vmulq_s32_partial_solve_wit_4_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_mul (a2) (b2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (qu_neon_mul (a1) (b1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (qu_neon_mul (a0) (b0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b0)) (PreH19 : (b0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= b1)) (PreH21 : (b1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= b2)) (PreH23 : (b2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= b3)) (PreH25 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
.

Definition vmulq_s32_partial_solve_wit_4_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_mul (a2) (b2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (qu_neon_mul (a1) (b1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (qu_neon_mul (a0) (b0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b0)) (PreH19 : (b0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= b1)) (PreH21 : (b1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= b2)) (PreH23 : (b2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= b3)) (PreH25 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ (retval_3 = (qu_neon_mul (a2) (b2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_mul (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mul (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vmulq_s32_partial_solve_wit_4 := vmulq_s32_partial_solve_wit_4_pure -> vmulq_s32_partial_solve_wit_4_aux.

Definition vmulq_s32_partial_solve_wit_5 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_neon_mul (a3) (b3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (qu_neon_mul (a2) (b2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (qu_neon_mul (a1) (b1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (qu_neon_mul (a0) (b0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b0)) (PreH22 : (b0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= b1)) (PreH24 : (b1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= b2)) (PreH26 : (b2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= b3)) (PreH28 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ (retval_4 = (qu_neon_mul (a3) (b3))) ” 
  &&  “ ((INT_MIN) <= retval_4) ” 
  &&  “ (retval_4 <= INT_MAX) ” 
  &&  “ (retval_3 = (qu_neon_mul (a2) (b2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_mul (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mul (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

(*----- Function vrshlq_s32 -----*)

Definition vrshlq_s32_return_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_neon_shift (a3) (b3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (qu_neon_shift (a2) (b2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (qu_neon_shift (a1) (b1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (qu_neon_shift (a0) (b0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b0)) (PreH22 : (b0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= b1)) (PreH24 : (b1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= b2)) (PreH26 : (b2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= b3)) (PreH28 : (b3 <= INT_MAX)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> retval)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qu_neon_shift (a0) (b0)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qu_neon_shift (a1) (b1)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qu_neon_shift (a2) (b2)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qu_neon_shift (a3) (b3)))
.

Definition vrshlq_s32_partial_solve_wit_1_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b0)) (PreH10 : (b0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b1)) (PreH12 : (b1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b2)) (PreH14 : (b2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b3)) (PreH16 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ”
.

Definition vrshlq_s32_partial_solve_wit_1_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b0)) (PreH10 : (b0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b1)) (PreH12 : (b1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b2)) (PreH14 : (b2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b3)) (PreH16 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vrshlq_s32_partial_solve_wit_1 := vrshlq_s32_partial_solve_wit_1_pure -> vrshlq_s32_partial_solve_wit_1_aux.

Definition vrshlq_s32_partial_solve_wit_2_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_shift (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b0)) (PreH13 : (b0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b1)) (PreH15 : (b1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= b2)) (PreH17 : (b2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b3)) (PreH19 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ”
.

Definition vrshlq_s32_partial_solve_wit_2_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_shift (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b0)) (PreH13 : (b0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b1)) (PreH15 : (b1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= b2)) (PreH17 : (b2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b3)) (PreH19 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_shift (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vrshlq_s32_partial_solve_wit_2 := vrshlq_s32_partial_solve_wit_2_pure -> vrshlq_s32_partial_solve_wit_2_aux.

Definition vrshlq_s32_partial_solve_wit_3_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_shift (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (qu_neon_shift (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b0)) (PreH16 : (b0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b1)) (PreH18 : (b1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= b2)) (PreH20 : (b2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b3)) (PreH22 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ”
.

Definition vrshlq_s32_partial_solve_wit_3_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_shift (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (qu_neon_shift (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b0)) (PreH16 : (b0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b1)) (PreH18 : (b1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= b2)) (PreH20 : (b2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b3)) (PreH22 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_shift (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_shift (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vrshlq_s32_partial_solve_wit_3 := vrshlq_s32_partial_solve_wit_3_pure -> vrshlq_s32_partial_solve_wit_3_aux.

Definition vrshlq_s32_partial_solve_wit_4_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_shift (a2) (b2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (qu_neon_shift (a1) (b1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (qu_neon_shift (a0) (b0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b0)) (PreH19 : (b0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= b1)) (PreH21 : (b1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= b2)) (PreH23 : (b2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= b3)) (PreH25 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
.

Definition vrshlq_s32_partial_solve_wit_4_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_shift (a2) (b2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (qu_neon_shift (a1) (b1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (qu_neon_shift (a0) (b0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b0)) (PreH19 : (b0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= b1)) (PreH21 : (b1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= b2)) (PreH23 : (b2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= b3)) (PreH25 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ (retval_3 = (qu_neon_shift (a2) (b2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_shift (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_shift (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition vrshlq_s32_partial_solve_wit_4 := vrshlq_s32_partial_solve_wit_4_pure -> vrshlq_s32_partial_solve_wit_4_aux.

Definition vrshlq_s32_partial_solve_wit_5 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_neon_shift (a3) (b3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (qu_neon_shift (a2) (b2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (qu_neon_shift (a1) (b1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (qu_neon_shift (a0) (b0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b0)) (PreH22 : (b0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= b1)) (PreH24 : (b1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= b2)) (PreH26 : (b2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= b3)) (PreH28 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ (retval_4 = (qu_neon_shift (a3) (b3))) ” 
  &&  “ ((INT_MIN) <= retval_4) ” 
  &&  “ (retval_4 <= INT_MAX) ” 
  &&  “ (retval_3 = (qu_neon_shift (a2) (b2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_shift (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_shift (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

(*----- Function vmlaq_s32 -----*)

Definition vmlaq_s32_return_wit_1 := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_neon_mla (a3) (b3) (c3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (qu_neon_mla (a2) (b2) (c2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (qu_neon_mla (a1) (b1) (c1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b0)) (PreH22 : (b0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= b1)) (PreH24 : (b1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= b2)) (PreH26 : (b2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= b3)) (PreH28 : (b3 <= INT_MAX)) (PreH29 : ((INT_MIN) <= c0)) (PreH30 : (c0 <= INT_MAX)) (PreH31 : ((INT_MIN) <= c1)) (PreH32 : (c1 <= INT_MAX)) (PreH33 : ((INT_MIN) <= c2)) (PreH34 : (c2 <= INT_MAX)) (PreH35 : ((INT_MIN) <= c3)) (PreH36 : (c3 <= INT_MAX)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> retval)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qu_neon_mla (a0) (b0) (c0)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qu_neon_mla (a1) (b1) (c1)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qu_neon_mla (a2) (b2) (c2)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qu_neon_mla (a3) (b3) (c3)))
.

Definition vmlaq_s32_partial_solve_wit_1_pure := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b0)) (PreH10 : (b0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b1)) (PreH12 : (b1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b2)) (PreH14 : (b2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b3)) (PreH16 : (b3 <= INT_MAX)) (PreH17 : ((INT_MIN) <= c0)) (PreH18 : (c0 <= INT_MAX)) (PreH19 : ((INT_MIN) <= c1)) (PreH20 : (c1 <= INT_MAX)) (PreH21 : ((INT_MIN) <= c2)) (PreH22 : (c2 <= INT_MAX)) (PreH23 : ((INT_MIN) <= c3)) (PreH24 : (c3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((( &( "c" ) )) # Ptr  |-> ( &( "c" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c0) ” 
  &&  “ (c0 <= INT_MAX) ”
.

Definition vmlaq_s32_partial_solve_wit_1_aux := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b0)) (PreH10 : (b0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b1)) (PreH12 : (b1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b2)) (PreH14 : (b2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b3)) (PreH16 : (b3 <= INT_MAX)) (PreH17 : ((INT_MIN) <= c0)) (PreH18 : (c0 <= INT_MAX)) (PreH19 : ((INT_MIN) <= c1)) (PreH20 : (c1 <= INT_MAX)) (PreH21 : ((INT_MIN) <= c2)) (PreH22 : (c2 <= INT_MAX)) (PreH23 : ((INT_MIN) <= c3)) (PreH24 : (c3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c0) ” 
  &&  “ (c0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c0) ” 
  &&  “ (c0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c1) ” 
  &&  “ (c1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c2) ” 
  &&  “ (c2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c3) ” 
  &&  “ (c3 <= INT_MAX) ”
  &&  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
.

Definition vmlaq_s32_partial_solve_wit_1 := vmlaq_s32_partial_solve_wit_1_pure -> vmlaq_s32_partial_solve_wit_1_aux.

Definition vmlaq_s32_partial_solve_wit_2_pure := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b0)) (PreH13 : (b0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b1)) (PreH15 : (b1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= b2)) (PreH17 : (b2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b3)) (PreH19 : (b3 <= INT_MAX)) (PreH20 : ((INT_MIN) <= c0)) (PreH21 : (c0 <= INT_MAX)) (PreH22 : ((INT_MIN) <= c1)) (PreH23 : (c1 <= INT_MAX)) (PreH24 : ((INT_MIN) <= c2)) (PreH25 : (c2 <= INT_MAX)) (PreH26 : ((INT_MIN) <= c3)) (PreH27 : (c3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((( &( "c" ) )) # Ptr  |-> ( &( "c" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c1) ” 
  &&  “ (c1 <= INT_MAX) ”
.

Definition vmlaq_s32_partial_solve_wit_2_aux := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b0)) (PreH13 : (b0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b1)) (PreH15 : (b1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= b2)) (PreH17 : (b2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b3)) (PreH19 : (b3 <= INT_MAX)) (PreH20 : ((INT_MIN) <= c0)) (PreH21 : (c0 <= INT_MAX)) (PreH22 : ((INT_MIN) <= c1)) (PreH23 : (c1 <= INT_MAX)) (PreH24 : ((INT_MIN) <= c2)) (PreH25 : (c2 <= INT_MAX)) (PreH26 : ((INT_MIN) <= c3)) (PreH27 : (c3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c1) ” 
  &&  “ (c1 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mla (a0) (b0) (c0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c0) ” 
  &&  “ (c0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c1) ” 
  &&  “ (c1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c2) ” 
  &&  “ (c2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c3) ” 
  &&  “ (c3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
.

Definition vmlaq_s32_partial_solve_wit_2 := vmlaq_s32_partial_solve_wit_2_pure -> vmlaq_s32_partial_solve_wit_2_aux.

Definition vmlaq_s32_partial_solve_wit_3_pure := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_mla (a1) (b1) (c1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b0)) (PreH16 : (b0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b1)) (PreH18 : (b1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= b2)) (PreH20 : (b2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b3)) (PreH22 : (b3 <= INT_MAX)) (PreH23 : ((INT_MIN) <= c0)) (PreH24 : (c0 <= INT_MAX)) (PreH25 : ((INT_MIN) <= c1)) (PreH26 : (c1 <= INT_MAX)) (PreH27 : ((INT_MIN) <= c2)) (PreH28 : (c2 <= INT_MAX)) (PreH29 : ((INT_MIN) <= c3)) (PreH30 : (c3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((( &( "c" ) )) # Ptr  |-> ( &( "c" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c2) ” 
  &&  “ (c2 <= INT_MAX) ”
.

Definition vmlaq_s32_partial_solve_wit_3_aux := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_mla (a1) (b1) (c1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b0)) (PreH16 : (b0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b1)) (PreH18 : (b1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= b2)) (PreH20 : (b2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b3)) (PreH22 : (b3 <= INT_MAX)) (PreH23 : ((INT_MIN) <= c0)) (PreH24 : (c0 <= INT_MAX)) (PreH25 : ((INT_MIN) <= c1)) (PreH26 : (c1 <= INT_MAX)) (PreH27 : ((INT_MIN) <= c2)) (PreH28 : (c2 <= INT_MAX)) (PreH29 : ((INT_MIN) <= c3)) (PreH30 : (c3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c2) ” 
  &&  “ (c2 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_mla (a1) (b1) (c1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mla (a0) (b0) (c0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c0) ” 
  &&  “ (c0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c1) ” 
  &&  “ (c1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c2) ” 
  &&  “ (c2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c3) ” 
  &&  “ (c3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
.

Definition vmlaq_s32_partial_solve_wit_3 := vmlaq_s32_partial_solve_wit_3_pure -> vmlaq_s32_partial_solve_wit_3_aux.

Definition vmlaq_s32_partial_solve_wit_4_pure := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_mla (a2) (b2) (c2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (qu_neon_mla (a1) (b1) (c1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b0)) (PreH19 : (b0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= b1)) (PreH21 : (b1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= b2)) (PreH23 : (b2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= b3)) (PreH25 : (b3 <= INT_MAX)) (PreH26 : ((INT_MIN) <= c0)) (PreH27 : (c0 <= INT_MAX)) (PreH28 : ((INT_MIN) <= c1)) (PreH29 : (c1 <= INT_MAX)) (PreH30 : ((INT_MIN) <= c2)) (PreH31 : (c2 <= INT_MAX)) (PreH32 : ((INT_MIN) <= c3)) (PreH33 : (c3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((( &( "c" ) )) # Ptr  |-> ( &( "c" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c3) ” 
  &&  “ (c3 <= INT_MAX) ”
.

Definition vmlaq_s32_partial_solve_wit_4_aux := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_mla (a2) (b2) (c2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (qu_neon_mla (a1) (b1) (c1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= b0)) (PreH19 : (b0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= b1)) (PreH21 : (b1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= b2)) (PreH23 : (b2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= b3)) (PreH25 : (b3 <= INT_MAX)) (PreH26 : ((INT_MIN) <= c0)) (PreH27 : (c0 <= INT_MAX)) (PreH28 : ((INT_MIN) <= c1)) (PreH29 : (c1 <= INT_MAX)) (PreH30 : ((INT_MIN) <= c2)) (PreH31 : (c2 <= INT_MAX)) (PreH32 : ((INT_MIN) <= c3)) (PreH33 : (c3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c3) ” 
  &&  “ (c3 <= INT_MAX) ” 
  &&  “ (retval_3 = (qu_neon_mla (a2) (b2) (c2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_mla (a1) (b1) (c1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mla (a0) (b0) (c0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c0) ” 
  &&  “ (c0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c1) ” 
  &&  “ (c1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c2) ” 
  &&  “ (c2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c3) ” 
  &&  “ (c3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
.

Definition vmlaq_s32_partial_solve_wit_4 := vmlaq_s32_partial_solve_wit_4_pure -> vmlaq_s32_partial_solve_wit_4_aux.

Definition vmlaq_s32_partial_solve_wit_5 := 
forall (c3: Z) (c2: Z) (c1: Z) (c0: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_neon_mla (a3) (b3) (c3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (qu_neon_mla (a2) (b2) (c2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (qu_neon_mla (a1) (b1) (c1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (qu_neon_mla (a0) (b0) (c0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= b0)) (PreH22 : (b0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= b1)) (PreH24 : (b1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= b2)) (PreH26 : (b2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= b3)) (PreH28 : (b3 <= INT_MAX)) (PreH29 : ((INT_MIN) <= c0)) (PreH30 : (c0 <= INT_MAX)) (PreH31 : ((INT_MIN) <= c1)) (PreH32 : (c1 <= INT_MAX)) (PreH33 : ((INT_MIN) <= c2)) (PreH34 : (c2 <= INT_MAX)) (PreH35 : ((INT_MIN) <= c3)) (PreH36 : (c3 <= INT_MAX)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
|--
  “ (retval_4 = (qu_neon_mla (a3) (b3) (c3))) ” 
  &&  “ ((INT_MIN) <= retval_4) ” 
  &&  “ (retval_4 <= INT_MAX) ” 
  &&  “ (retval_3 = (qu_neon_mla (a2) (b2) (c2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_neon_mla (a1) (b1) (c1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (qu_neon_mla (a0) (b0) (c0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c0) ” 
  &&  “ (c0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c1) ” 
  &&  “ (c1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c2) ” 
  &&  “ (c2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c3) ” 
  &&  “ (c3 <= INT_MAX) ”
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Int  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Int  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Int  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Int  |-> c3)
.

(*----- Function vqmovn_s32 -----*)

Definition vqmovn_s32_return_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_sat16 (a3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qu_sat16 (a2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qu_sat16 (a1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qu_sat16 (a0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) ,
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> retval)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> (qu_sat16 (a0)))
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> (qu_sat16 (a1)))
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> (qu_sat16 (a2)))
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> (qu_sat16 (a3)))
.

Definition vqmovn_s32_partial_solve_wit_1_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  (UndefStructPredint16x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a0) ” 
  &&  “ (a0 <= INT64_MAX) ”
.

Definition vqmovn_s32_partial_solve_wit_1_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  (UndefStructPredint16x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a0) ” 
  &&  “ (a0 <= INT64_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  (UndefStructPredint16x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vqmovn_s32_partial_solve_wit_1 := vqmovn_s32_partial_solve_wit_1_pure -> vqmovn_s32_partial_solve_wit_1_aux.

Definition vqmovn_s32_partial_solve_wit_2_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_sat16 (a0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a1) ” 
  &&  “ (a1 <= INT64_MAX) ”
.

Definition vqmovn_s32_partial_solve_wit_2_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_sat16 (a0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a1) ” 
  &&  “ (a1 <= INT64_MAX) ” 
  &&  “ (retval = (qu_sat16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vqmovn_s32_partial_solve_wit_2 := vqmovn_s32_partial_solve_wit_2_pure -> vqmovn_s32_partial_solve_wit_2_aux.

Definition vqmovn_s32_partial_solve_wit_3_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_sat16 (a1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qu_sat16 (a0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a2) ” 
  &&  “ (a2 <= INT64_MAX) ”
.

Definition vqmovn_s32_partial_solve_wit_3_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_sat16 (a1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qu_sat16 (a0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a2) ” 
  &&  “ (a2 <= INT64_MAX) ” 
  &&  “ (retval_2 = (qu_sat16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_sat16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vqmovn_s32_partial_solve_wit_3 := vqmovn_s32_partial_solve_wit_3_pure -> vqmovn_s32_partial_solve_wit_3_aux.

Definition vqmovn_s32_partial_solve_wit_4_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_sat16 (a2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qu_sat16 (a1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qu_sat16 (a0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a3) ” 
  &&  “ (a3 <= INT64_MAX) ”
.

Definition vqmovn_s32_partial_solve_wit_4_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_sat16 (a2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qu_sat16 (a1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qu_sat16 (a0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (((-INT64_MAX) - 1 ) <= a3) ” 
  &&  “ (a3 <= INT64_MAX) ” 
  &&  “ (retval_3 = (qu_sat16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_sat16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_sat16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vqmovn_s32_partial_solve_wit_4 := vqmovn_s32_partial_solve_wit_4_pure -> vqmovn_s32_partial_solve_wit_4_aux.

Definition vqmovn_s32_partial_solve_wit_5 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (qu_sat16 (a3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qu_sat16 (a2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qu_sat16 (a1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qu_sat16 (a0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) ,
  (UndefStructPredint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (retval_4 = (qu_sat16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_sat16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_sat16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_sat16 (a0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

(*----- Function vcombine_s16 -----*)

Definition vcombine_s16_return_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= b0)) (PreH10 : (b0 <= 32767)) (PreH11 : ((-32768) <= b1)) (PreH12 : (b1 <= 32767)) (PreH13 : ((-32768) <= b2)) (PreH14 : (b2 <= 32767)) (PreH15 : ((-32768) <= b3)) (PreH16 : (b3 <= 32767)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> b3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> b2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> b1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> b0)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> a3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> a2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> a1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> a0)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> a0)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> a1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> a2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> a3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> b0)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> b1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> b2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> b3)
.

Definition vcombine_s16_partial_solve_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= b0)) (PreH10 : (b0 <= 32767)) (PreH11 : ((-32768) <= b1)) (PreH12 : (b1 <= 32767)) (PreH13 : ((-32768) <= b2)) (PreH14 : (b2 <= 32767)) (PreH15 : ((-32768) <= b3)) (PreH16 : (b3 <= 32767)) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> b3)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> b2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> b1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> b0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ”
  &&  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> b3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> b2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> b1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> b0)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
.

(*----- Function vqaddq_s16 -----*)

Definition vqaddq_s16_return_wit_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_neon_add16 (a7) (b7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qu_neon_add16 (a6) (b6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qu_neon_add16 (a5) (b5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) (PreH41 : ((-32768) <= b0)) (PreH42 : (b0 <= 32767)) (PreH43 : ((-32768) <= b1)) (PreH44 : (b1 <= 32767)) (PreH45 : ((-32768) <= b2)) (PreH46 : (b2 <= 32767)) (PreH47 : ((-32768) <= b3)) (PreH48 : (b3 <= 32767)) (PreH49 : ((-32768) <= b4)) (PreH50 : (b4 <= 32767)) (PreH51 : ((-32768) <= b5)) (PreH52 : (b5 <= 32767)) (PreH53 : ((-32768) <= b6)) (PreH54 : (b6 <= 32767)) (PreH55 : ((-32768) <= b7)) (PreH56 : (b7 <= 32767)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> retval)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (qu_neon_add16 (a0) (b0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (qu_neon_add16 (a1) (b1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (qu_neon_add16 (a2) (b2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (qu_neon_add16 (a3) (b3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (qu_neon_add16 (a4) (b4)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (qu_neon_add16 (a5) (b5)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (qu_neon_add16 (a6) (b6)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (qu_neon_add16 (a7) (b7)))
.

Definition vqaddq_s16_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : ((-32768) <= b0)) (PreH18 : (b0 <= 32767)) (PreH19 : ((-32768) <= b1)) (PreH20 : (b1 <= 32767)) (PreH21 : ((-32768) <= b2)) (PreH22 : (b2 <= 32767)) (PreH23 : ((-32768) <= b3)) (PreH24 : (b3 <= 32767)) (PreH25 : ((-32768) <= b4)) (PreH26 : (b4 <= 32767)) (PreH27 : ((-32768) <= b5)) (PreH28 : (b5 <= 32767)) (PreH29 : ((-32768) <= b6)) (PreH30 : (b6 <= 32767)) (PreH31 : ((-32768) <= b7)) (PreH32 : (b7 <= 32767)) ,
  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : ((-32768) <= b0)) (PreH18 : (b0 <= 32767)) (PreH19 : ((-32768) <= b1)) (PreH20 : (b1 <= 32767)) (PreH21 : ((-32768) <= b2)) (PreH22 : (b2 <= 32767)) (PreH23 : ((-32768) <= b3)) (PreH24 : (b3 <= 32767)) (PreH25 : ((-32768) <= b4)) (PreH26 : (b4 <= 32767)) (PreH27 : ((-32768) <= b5)) (PreH28 : (b5 <= 32767)) (PreH29 : ((-32768) <= b6)) (PreH30 : (b6 <= 32767)) (PreH31 : ((-32768) <= b7)) (PreH32 : (b7 <= 32767)) ,
  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_1 := vqaddq_s16_partial_solve_wit_1_pure -> vqaddq_s16_partial_solve_wit_1_aux.

Definition vqaddq_s16_partial_solve_wit_2_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) (PreH20 : ((-32768) <= b0)) (PreH21 : (b0 <= 32767)) (PreH22 : ((-32768) <= b1)) (PreH23 : (b1 <= 32767)) (PreH24 : ((-32768) <= b2)) (PreH25 : (b2 <= 32767)) (PreH26 : ((-32768) <= b3)) (PreH27 : (b3 <= 32767)) (PreH28 : ((-32768) <= b4)) (PreH29 : (b4 <= 32767)) (PreH30 : ((-32768) <= b5)) (PreH31 : (b5 <= 32767)) (PreH32 : ((-32768) <= b6)) (PreH33 : (b6 <= 32767)) (PreH34 : ((-32768) <= b7)) (PreH35 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_2_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) (PreH20 : ((-32768) <= b0)) (PreH21 : (b0 <= 32767)) (PreH22 : ((-32768) <= b1)) (PreH23 : (b1 <= 32767)) (PreH24 : ((-32768) <= b2)) (PreH25 : (b2 <= 32767)) (PreH26 : ((-32768) <= b3)) (PreH27 : (b3 <= 32767)) (PreH28 : ((-32768) <= b4)) (PreH29 : (b4 <= 32767)) (PreH30 : ((-32768) <= b5)) (PreH31 : (b5 <= 32767)) (PreH32 : ((-32768) <= b6)) (PreH33 : (b6 <= 32767)) (PreH34 : ((-32768) <= b7)) (PreH35 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_2 := vqaddq_s16_partial_solve_wit_2_pure -> vqaddq_s16_partial_solve_wit_2_aux.

Definition vqaddq_s16_partial_solve_wit_3_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) (PreH23 : ((-32768) <= b0)) (PreH24 : (b0 <= 32767)) (PreH25 : ((-32768) <= b1)) (PreH26 : (b1 <= 32767)) (PreH27 : ((-32768) <= b2)) (PreH28 : (b2 <= 32767)) (PreH29 : ((-32768) <= b3)) (PreH30 : (b3 <= 32767)) (PreH31 : ((-32768) <= b4)) (PreH32 : (b4 <= 32767)) (PreH33 : ((-32768) <= b5)) (PreH34 : (b5 <= 32767)) (PreH35 : ((-32768) <= b6)) (PreH36 : (b6 <= 32767)) (PreH37 : ((-32768) <= b7)) (PreH38 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) (PreH23 : ((-32768) <= b0)) (PreH24 : (b0 <= 32767)) (PreH25 : ((-32768) <= b1)) (PreH26 : (b1 <= 32767)) (PreH27 : ((-32768) <= b2)) (PreH28 : (b2 <= 32767)) (PreH29 : ((-32768) <= b3)) (PreH30 : (b3 <= 32767)) (PreH31 : ((-32768) <= b4)) (PreH32 : (b4 <= 32767)) (PreH33 : ((-32768) <= b5)) (PreH34 : (b5 <= 32767)) (PreH35 : ((-32768) <= b6)) (PreH36 : (b6 <= 32767)) (PreH37 : ((-32768) <= b7)) (PreH38 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ (retval_2 = (qu_neon_add16 (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_3 := vqaddq_s16_partial_solve_wit_3_pure -> vqaddq_s16_partial_solve_wit_3_aux.

Definition vqaddq_s16_partial_solve_wit_4_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) (PreH26 : ((-32768) <= b0)) (PreH27 : (b0 <= 32767)) (PreH28 : ((-32768) <= b1)) (PreH29 : (b1 <= 32767)) (PreH30 : ((-32768) <= b2)) (PreH31 : (b2 <= 32767)) (PreH32 : ((-32768) <= b3)) (PreH33 : (b3 <= 32767)) (PreH34 : ((-32768) <= b4)) (PreH35 : (b4 <= 32767)) (PreH36 : ((-32768) <= b5)) (PreH37 : (b5 <= 32767)) (PreH38 : ((-32768) <= b6)) (PreH39 : (b6 <= 32767)) (PreH40 : ((-32768) <= b7)) (PreH41 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_4_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) (PreH26 : ((-32768) <= b0)) (PreH27 : (b0 <= 32767)) (PreH28 : ((-32768) <= b1)) (PreH29 : (b1 <= 32767)) (PreH30 : ((-32768) <= b2)) (PreH31 : (b2 <= 32767)) (PreH32 : ((-32768) <= b3)) (PreH33 : (b3 <= 32767)) (PreH34 : ((-32768) <= b4)) (PreH35 : (b4 <= 32767)) (PreH36 : ((-32768) <= b5)) (PreH37 : (b5 <= 32767)) (PreH38 : ((-32768) <= b6)) (PreH39 : (b6 <= 32767)) (PreH40 : ((-32768) <= b7)) (PreH41 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ (retval_3 = (qu_neon_add16 (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_neon_add16 (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_4 := vqaddq_s16_partial_solve_wit_4_pure -> vqaddq_s16_partial_solve_wit_4_aux.

Definition vqaddq_s16_partial_solve_wit_5_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) (PreH29 : ((-32768) <= b0)) (PreH30 : (b0 <= 32767)) (PreH31 : ((-32768) <= b1)) (PreH32 : (b1 <= 32767)) (PreH33 : ((-32768) <= b2)) (PreH34 : (b2 <= 32767)) (PreH35 : ((-32768) <= b3)) (PreH36 : (b3 <= 32767)) (PreH37 : ((-32768) <= b4)) (PreH38 : (b4 <= 32767)) (PreH39 : ((-32768) <= b5)) (PreH40 : (b5 <= 32767)) (PreH41 : ((-32768) <= b6)) (PreH42 : (b6 <= 32767)) (PreH43 : ((-32768) <= b7)) (PreH44 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_5_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) (PreH29 : ((-32768) <= b0)) (PreH30 : (b0 <= 32767)) (PreH31 : ((-32768) <= b1)) (PreH32 : (b1 <= 32767)) (PreH33 : ((-32768) <= b2)) (PreH34 : (b2 <= 32767)) (PreH35 : ((-32768) <= b3)) (PreH36 : (b3 <= 32767)) (PreH37 : ((-32768) <= b4)) (PreH38 : (b4 <= 32767)) (PreH39 : ((-32768) <= b5)) (PreH40 : (b5 <= 32767)) (PreH41 : ((-32768) <= b6)) (PreH42 : (b6 <= 32767)) (PreH43 : ((-32768) <= b7)) (PreH44 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ (retval_4 = (qu_neon_add16 (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_neon_add16 (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_neon_add16 (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_5 := vqaddq_s16_partial_solve_wit_5_pure -> vqaddq_s16_partial_solve_wit_5_aux.

Definition vqaddq_s16_partial_solve_wit_6_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) (PreH32 : ((-32768) <= b0)) (PreH33 : (b0 <= 32767)) (PreH34 : ((-32768) <= b1)) (PreH35 : (b1 <= 32767)) (PreH36 : ((-32768) <= b2)) (PreH37 : (b2 <= 32767)) (PreH38 : ((-32768) <= b3)) (PreH39 : (b3 <= 32767)) (PreH40 : ((-32768) <= b4)) (PreH41 : (b4 <= 32767)) (PreH42 : ((-32768) <= b5)) (PreH43 : (b5 <= 32767)) (PreH44 : ((-32768) <= b6)) (PreH45 : (b6 <= 32767)) (PreH46 : ((-32768) <= b7)) (PreH47 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_6_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) (PreH32 : ((-32768) <= b0)) (PreH33 : (b0 <= 32767)) (PreH34 : ((-32768) <= b1)) (PreH35 : (b1 <= 32767)) (PreH36 : ((-32768) <= b2)) (PreH37 : (b2 <= 32767)) (PreH38 : ((-32768) <= b3)) (PreH39 : (b3 <= 32767)) (PreH40 : ((-32768) <= b4)) (PreH41 : (b4 <= 32767)) (PreH42 : ((-32768) <= b5)) (PreH43 : (b5 <= 32767)) (PreH44 : ((-32768) <= b6)) (PreH45 : (b6 <= 32767)) (PreH46 : ((-32768) <= b7)) (PreH47 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ (retval_5 = (qu_neon_add16 (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_neon_add16 (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_neon_add16 (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_neon_add16 (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_6 := vqaddq_s16_partial_solve_wit_6_pure -> vqaddq_s16_partial_solve_wit_6_aux.

Definition vqaddq_s16_partial_solve_wit_7_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_neon_add16 (a5) (b5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) (PreH35 : ((-32768) <= b0)) (PreH36 : (b0 <= 32767)) (PreH37 : ((-32768) <= b1)) (PreH38 : (b1 <= 32767)) (PreH39 : ((-32768) <= b2)) (PreH40 : (b2 <= 32767)) (PreH41 : ((-32768) <= b3)) (PreH42 : (b3 <= 32767)) (PreH43 : ((-32768) <= b4)) (PreH44 : (b4 <= 32767)) (PreH45 : ((-32768) <= b5)) (PreH46 : (b5 <= 32767)) (PreH47 : ((-32768) <= b6)) (PreH48 : (b6 <= 32767)) (PreH49 : ((-32768) <= b7)) (PreH50 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_7_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_neon_add16 (a5) (b5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) (PreH35 : ((-32768) <= b0)) (PreH36 : (b0 <= 32767)) (PreH37 : ((-32768) <= b1)) (PreH38 : (b1 <= 32767)) (PreH39 : ((-32768) <= b2)) (PreH40 : (b2 <= 32767)) (PreH41 : ((-32768) <= b3)) (PreH42 : (b3 <= 32767)) (PreH43 : ((-32768) <= b4)) (PreH44 : (b4 <= 32767)) (PreH45 : ((-32768) <= b5)) (PreH46 : (b5 <= 32767)) (PreH47 : ((-32768) <= b6)) (PreH48 : (b6 <= 32767)) (PreH49 : ((-32768) <= b7)) (PreH50 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ (retval_6 = (qu_neon_add16 (a5) (b5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qu_neon_add16 (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_neon_add16 (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_neon_add16 (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_neon_add16 (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_7 := vqaddq_s16_partial_solve_wit_7_pure -> vqaddq_s16_partial_solve_wit_7_aux.

Definition vqaddq_s16_partial_solve_wit_8_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_neon_add16 (a6) (b6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qu_neon_add16 (a5) (b5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) (PreH38 : ((-32768) <= b0)) (PreH39 : (b0 <= 32767)) (PreH40 : ((-32768) <= b1)) (PreH41 : (b1 <= 32767)) (PreH42 : ((-32768) <= b2)) (PreH43 : (b2 <= 32767)) (PreH44 : ((-32768) <= b3)) (PreH45 : (b3 <= 32767)) (PreH46 : ((-32768) <= b4)) (PreH47 : (b4 <= 32767)) (PreH48 : ((-32768) <= b5)) (PreH49 : (b5 <= 32767)) (PreH50 : ((-32768) <= b6)) (PreH51 : (b6 <= 32767)) (PreH52 : ((-32768) <= b7)) (PreH53 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
.

Definition vqaddq_s16_partial_solve_wit_8_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_neon_add16 (a6) (b6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qu_neon_add16 (a5) (b5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) (PreH38 : ((-32768) <= b0)) (PreH39 : (b0 <= 32767)) (PreH40 : ((-32768) <= b1)) (PreH41 : (b1 <= 32767)) (PreH42 : ((-32768) <= b2)) (PreH43 : (b2 <= 32767)) (PreH44 : ((-32768) <= b3)) (PreH45 : (b3 <= 32767)) (PreH46 : ((-32768) <= b4)) (PreH47 : (b4 <= 32767)) (PreH48 : ((-32768) <= b5)) (PreH49 : (b5 <= 32767)) (PreH50 : ((-32768) <= b6)) (PreH51 : (b6 <= 32767)) (PreH52 : ((-32768) <= b7)) (PreH53 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ” 
  &&  “ (retval_7 = (qu_neon_add16 (a6) (b6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qu_neon_add16 (a5) (b5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qu_neon_add16 (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_neon_add16 (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_neon_add16 (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_neon_add16 (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vqaddq_s16_partial_solve_wit_8 := vqaddq_s16_partial_solve_wit_8_pure -> vqaddq_s16_partial_solve_wit_8_aux.

Definition vqaddq_s16_partial_solve_wit_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_neon_add16 (a7) (b7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qu_neon_add16 (a6) (b6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qu_neon_add16 (a5) (b5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qu_neon_add16 (a4) (b4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qu_neon_add16 (a3) (b3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qu_neon_add16 (a2) (b2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qu_neon_add16 (a1) (b1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qu_neon_add16 (a0) (b0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) (PreH41 : ((-32768) <= b0)) (PreH42 : (b0 <= 32767)) (PreH43 : ((-32768) <= b1)) (PreH44 : (b1 <= 32767)) (PreH45 : ((-32768) <= b2)) (PreH46 : (b2 <= 32767)) (PreH47 : ((-32768) <= b3)) (PreH48 : (b3 <= 32767)) (PreH49 : ((-32768) <= b4)) (PreH50 : (b4 <= 32767)) (PreH51 : ((-32768) <= b5)) (PreH52 : (b5 <= 32767)) (PreH53 : ((-32768) <= b6)) (PreH54 : (b6 <= 32767)) (PreH55 : ((-32768) <= b7)) (PreH56 : (b7 <= 32767)) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (retval_8 = (qu_neon_add16 (a7) (b7))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qu_neon_add16 (a6) (b6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qu_neon_add16 (a5) (b5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qu_neon_add16 (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qu_neon_add16 (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qu_neon_add16 (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qu_neon_add16 (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qu_neon_add16 (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

(*----- Function vqmovun_s16 -----*)

Definition vqmovun_s16_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_usat8 (a7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (qu_usat8 (a6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (qu_usat8 (a5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (qu_usat8 (a4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (qu_usat8 (a3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (qu_usat8 (a2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (qu_usat8 (a1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (qu_usat8 (a0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) ,
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> retval)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (qu_usat8 (a0)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (qu_usat8 (a1)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (qu_usat8 (a2)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (qu_usat8 (a3)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (qu_usat8 (a4)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (qu_usat8 (a5)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (qu_usat8 (a6)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (qu_usat8 (a7)))
.

Definition vqmovun_s16_partial_solve_wit_1_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_1_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_1 := vqmovun_s16_partial_solve_wit_1_pure -> vqmovun_s16_partial_solve_wit_1_aux.

Definition vqmovun_s16_partial_solve_wit_2_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_usat8 (a0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_2_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_usat8 (a0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_2 := vqmovun_s16_partial_solve_wit_2_pure -> vqmovun_s16_partial_solve_wit_2_aux.

Definition vqmovun_s16_partial_solve_wit_3_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_usat8 (a1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (qu_usat8 (a0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_3_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_usat8 (a1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (qu_usat8 (a0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ (retval_2 = (qu_usat8 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_3 := vqmovun_s16_partial_solve_wit_3_pure -> vqmovun_s16_partial_solve_wit_3_aux.

Definition vqmovun_s16_partial_solve_wit_4_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_usat8 (a2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (qu_usat8 (a1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (qu_usat8 (a0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_4_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_usat8 (a2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (qu_usat8 (a1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (qu_usat8 (a0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ (retval_3 = (qu_usat8 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_usat8 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_4 := vqmovun_s16_partial_solve_wit_4_pure -> vqmovun_s16_partial_solve_wit_4_aux.

Definition vqmovun_s16_partial_solve_wit_5_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_usat8 (a3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (qu_usat8 (a2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (qu_usat8 (a1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (qu_usat8 (a0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_5_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_usat8 (a3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (qu_usat8 (a2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (qu_usat8 (a1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (qu_usat8 (a0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ (retval_4 = (qu_usat8 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_usat8 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_usat8 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_5 := vqmovun_s16_partial_solve_wit_5_pure -> vqmovun_s16_partial_solve_wit_5_aux.

Definition vqmovun_s16_partial_solve_wit_6_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_usat8 (a4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (qu_usat8 (a3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (qu_usat8 (a2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (qu_usat8 (a1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (qu_usat8 (a0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_6_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_usat8 (a4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (qu_usat8 (a3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (qu_usat8 (a2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (qu_usat8 (a1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (qu_usat8 (a0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ (retval_5 = (qu_usat8 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_usat8 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_usat8 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_usat8 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_6 := vqmovun_s16_partial_solve_wit_6_pure -> vqmovun_s16_partial_solve_wit_6_aux.

Definition vqmovun_s16_partial_solve_wit_7_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_usat8 (a5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (qu_usat8 (a4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (qu_usat8 (a3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (qu_usat8 (a2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (qu_usat8 (a1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (qu_usat8 (a0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_7_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_usat8 (a5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (qu_usat8 (a4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (qu_usat8 (a3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (qu_usat8 (a2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (qu_usat8 (a1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (qu_usat8 (a0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ (retval_6 = (qu_usat8 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_usat8 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_usat8 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_usat8 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_usat8 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_7 := vqmovun_s16_partial_solve_wit_7_pure -> vqmovun_s16_partial_solve_wit_7_aux.

Definition vqmovun_s16_partial_solve_wit_8_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_usat8 (a6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (qu_usat8 (a5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (qu_usat8 (a4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (qu_usat8 (a3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (qu_usat8 (a2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (qu_usat8 (a1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (qu_usat8 (a0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
.

Definition vqmovun_s16_partial_solve_wit_8_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_usat8 (a6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (qu_usat8 (a5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (qu_usat8 (a4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (qu_usat8 (a3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (qu_usat8 (a2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (qu_usat8 (a1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (qu_usat8 (a0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ (retval_7 = (qu_usat8 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (qu_usat8 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_usat8 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_usat8 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_usat8 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_usat8 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovun_s16_partial_solve_wit_8 := vqmovun_s16_partial_solve_wit_8_pure -> vqmovun_s16_partial_solve_wit_8_aux.

Definition vqmovun_s16_partial_solve_wit_9 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_usat8 (a7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (qu_usat8 (a6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (qu_usat8 (a5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (qu_usat8 (a4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (qu_usat8 (a3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (qu_usat8 (a2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (qu_usat8 (a1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (qu_usat8 (a0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) ,
  (UndefStructPreduint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (retval_8 = (qu_usat8 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (qu_usat8 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (qu_usat8 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_usat8 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_usat8 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_usat8 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_usat8 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_usat8 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
  &&  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

(*----- Function vmin_u8 -----*)

Definition vmin_u8_return_wit_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_umin (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (qu_umin (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (qu_umin (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (qu_umin (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (qu_umin (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (qu_umin (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (qu_umin (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (qu_umin (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 255)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 255)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 255)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 255)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 255)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 255)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 255)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 255)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> retval)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (qu_umin (a0) (b0)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (qu_umin (a1) (b1)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (qu_umin (a2) (b2)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (qu_umin (a3) (b3)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (qu_umin (a4) (b4)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (qu_umin (a5) (b5)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (qu_umin (a6) (b6)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (qu_umin (a7) (b7)))
.

Definition vmin_u8_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 255)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 255)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 255)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 255)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 255)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 255)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 255)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 255)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 255)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 255)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 255)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 255)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 255)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 255)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 255)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 255)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_1 := vmin_u8_partial_solve_wit_1_pure -> vmin_u8_partial_solve_wit_1_aux.

Definition vmin_u8_partial_solve_wit_2_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_umin (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 255)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 255)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 255)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 255)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 255)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 255)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 255)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 255)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_2_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_umin (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 255)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 255)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 255)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 255)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 255)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 255)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 255)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 255)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_2 := vmin_u8_partial_solve_wit_2_pure -> vmin_u8_partial_solve_wit_2_aux.

Definition vmin_u8_partial_solve_wit_3_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_umin (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (qu_umin (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 255)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 255)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 255)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 255)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 255)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 255)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 255)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 255)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_umin (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (qu_umin (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 255)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 255)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 255)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 255)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 255)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 255)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 255)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 255)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (retval_2 = (qu_umin (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_3 := vmin_u8_partial_solve_wit_3_pure -> vmin_u8_partial_solve_wit_3_aux.

Definition vmin_u8_partial_solve_wit_4_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_umin (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (qu_umin (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (qu_umin (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 255)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 255)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 255)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 255)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 255)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 255)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 255)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 255)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_4_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_umin (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (qu_umin (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (qu_umin (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 255)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 255)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 255)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 255)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 255)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 255)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 255)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 255)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (retval_3 = (qu_umin (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umin (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_4 := vmin_u8_partial_solve_wit_4_pure -> vmin_u8_partial_solve_wit_4_aux.

Definition vmin_u8_partial_solve_wit_5_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_umin (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (qu_umin (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (qu_umin (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (qu_umin (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 255)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 255)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 255)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 255)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 255)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 255)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 255)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 255)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_5_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_umin (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (qu_umin (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (qu_umin (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (qu_umin (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 255)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 255)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 255)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 255)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 255)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 255)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 255)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 255)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (retval_4 = (qu_umin (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umin (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umin (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_5 := vmin_u8_partial_solve_wit_5_pure -> vmin_u8_partial_solve_wit_5_aux.

Definition vmin_u8_partial_solve_wit_6_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_umin (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (qu_umin (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (qu_umin (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (qu_umin (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (qu_umin (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 255)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 255)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 255)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 255)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 255)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 255)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 255)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 255)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_6_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_umin (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (qu_umin (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (qu_umin (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (qu_umin (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (qu_umin (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 255)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 255)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 255)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 255)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 255)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 255)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 255)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 255)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (retval_5 = (qu_umin (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umin (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umin (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umin (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_6 := vmin_u8_partial_solve_wit_6_pure -> vmin_u8_partial_solve_wit_6_aux.

Definition vmin_u8_partial_solve_wit_7_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_umin (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (qu_umin (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (qu_umin (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (qu_umin (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (qu_umin (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (qu_umin (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 255)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 255)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 255)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 255)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 255)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 255)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 255)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 255)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_7_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_umin (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (qu_umin (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (qu_umin (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (qu_umin (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (qu_umin (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (qu_umin (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 255)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 255)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 255)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 255)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 255)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 255)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 255)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 255)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (retval_6 = (qu_umin (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_umin (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umin (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umin (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umin (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_7 := vmin_u8_partial_solve_wit_7_pure -> vmin_u8_partial_solve_wit_7_aux.

Definition vmin_u8_partial_solve_wit_8_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_umin (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (qu_umin (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (qu_umin (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (qu_umin (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (qu_umin (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (qu_umin (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (qu_umin (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 255)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 255)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 255)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 255)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 255)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 255)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 255)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 255)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
.

Definition vmin_u8_partial_solve_wit_8_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_umin (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (qu_umin (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (qu_umin (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (qu_umin (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (qu_umin (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (qu_umin (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (qu_umin (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 255)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 255)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 255)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 255)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 255)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 255)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 255)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 255)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ” 
  &&  “ (retval_7 = (qu_umin (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (qu_umin (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_umin (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umin (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umin (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umin (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmin_u8_partial_solve_wit_8 := vmin_u8_partial_solve_wit_8_pure -> vmin_u8_partial_solve_wit_8_aux.

Definition vmin_u8_partial_solve_wit_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_umin (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (qu_umin (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (qu_umin (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (qu_umin (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (qu_umin (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (qu_umin (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (qu_umin (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (qu_umin (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 255)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 255)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 255)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 255)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 255)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 255)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 255)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 255)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  (UndefStructPreduint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (retval_8 = (qu_umin (a7) (b7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (qu_umin (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (qu_umin (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_umin (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umin (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umin (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umin (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umin (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

(*----- Function vmax_u8 -----*)

Definition vmax_u8_return_wit_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_umax (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (qu_umax (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (qu_umax (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (qu_umax (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (qu_umax (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (qu_umax (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (qu_umax (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (qu_umax (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 255)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 255)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 255)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 255)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 255)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 255)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 255)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 255)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> retval)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (qu_umax (a0) (b0)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (qu_umax (a1) (b1)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (qu_umax (a2) (b2)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (qu_umax (a3) (b3)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (qu_umax (a4) (b4)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (qu_umax (a5) (b5)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (qu_umax (a6) (b6)))
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (qu_umax (a7) (b7)))
.

Definition vmax_u8_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 255)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 255)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 255)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 255)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 255)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 255)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 255)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 255)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 255)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 255)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 255)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 255)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 255)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 255)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 255)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 255)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  (UndefStructPreduint8x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_1 := vmax_u8_partial_solve_wit_1_pure -> vmax_u8_partial_solve_wit_1_aux.

Definition vmax_u8_partial_solve_wit_2_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_umax (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 255)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 255)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 255)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 255)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 255)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 255)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 255)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 255)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_2_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_umax (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 255)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 255)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 255)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 255)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 255)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 255)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 255)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 255)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_2 := vmax_u8_partial_solve_wit_2_pure -> vmax_u8_partial_solve_wit_2_aux.

Definition vmax_u8_partial_solve_wit_3_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_umax (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (qu_umax (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 255)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 255)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 255)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 255)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 255)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 255)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 255)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 255)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_umax (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (qu_umax (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 255)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 255)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 255)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 255)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 255)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 255)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 255)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 255)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (retval_2 = (qu_umax (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_3 := vmax_u8_partial_solve_wit_3_pure -> vmax_u8_partial_solve_wit_3_aux.

Definition vmax_u8_partial_solve_wit_4_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_umax (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (qu_umax (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (qu_umax (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 255)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 255)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 255)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 255)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 255)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 255)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 255)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 255)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_4_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_umax (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (qu_umax (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (qu_umax (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 255)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 255)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 255)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 255)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 255)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 255)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 255)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 255)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (retval_3 = (qu_umax (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umax (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_4 := vmax_u8_partial_solve_wit_4_pure -> vmax_u8_partial_solve_wit_4_aux.

Definition vmax_u8_partial_solve_wit_5_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_umax (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (qu_umax (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (qu_umax (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (qu_umax (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 255)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 255)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 255)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 255)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 255)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 255)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 255)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 255)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_5_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_umax (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (qu_umax (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (qu_umax (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (qu_umax (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 255)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 255)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 255)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 255)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 255)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 255)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 255)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 255)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (retval_4 = (qu_umax (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umax (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umax (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_5 := vmax_u8_partial_solve_wit_5_pure -> vmax_u8_partial_solve_wit_5_aux.

Definition vmax_u8_partial_solve_wit_6_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_umax (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (qu_umax (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (qu_umax (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (qu_umax (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (qu_umax (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 255)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 255)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 255)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 255)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 255)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 255)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 255)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 255)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_6_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_umax (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (qu_umax (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (qu_umax (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (qu_umax (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (qu_umax (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 255)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 255)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 255)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 255)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 255)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 255)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 255)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 255)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (retval_5 = (qu_umax (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umax (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umax (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umax (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_6 := vmax_u8_partial_solve_wit_6_pure -> vmax_u8_partial_solve_wit_6_aux.

Definition vmax_u8_partial_solve_wit_7_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_umax (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (qu_umax (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (qu_umax (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (qu_umax (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (qu_umax (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (qu_umax (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 255)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 255)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 255)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 255)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 255)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 255)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 255)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 255)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_7_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_umax (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (qu_umax (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (qu_umax (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (qu_umax (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (qu_umax (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (qu_umax (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 255)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 255)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 255)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 255)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 255)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 255)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 255)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 255)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (retval_6 = (qu_umax (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_umax (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umax (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umax (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umax (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_7 := vmax_u8_partial_solve_wit_7_pure -> vmax_u8_partial_solve_wit_7_aux.

Definition vmax_u8_partial_solve_wit_8_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_umax (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (qu_umax (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (qu_umax (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (qu_umax (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (qu_umax (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (qu_umax (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (qu_umax (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 255)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 255)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 255)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 255)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 255)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 255)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 255)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 255)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
.

Definition vmax_u8_partial_solve_wit_8_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_umax (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (qu_umax (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (qu_umax (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (qu_umax (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (qu_umax (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (qu_umax (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (qu_umax (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 255)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 255)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 255)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 255)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 255)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 255)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 255)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 255)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ” 
  &&  “ (retval_7 = (qu_umax (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (qu_umax (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_umax (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umax (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umax (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umax (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vmax_u8_partial_solve_wit_8 := vmax_u8_partial_solve_wit_8_pure -> vmax_u8_partial_solve_wit_8_aux.

Definition vmax_u8_partial_solve_wit_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qu_umax (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (qu_umax (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (qu_umax (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (qu_umax (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (qu_umax (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (qu_umax (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (qu_umax (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (qu_umax (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 255)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 255)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 255)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 255)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 255)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 255)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 255)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 255)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  (UndefStructPreduint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (retval_8 = (qu_umax (a7) (b7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (qu_umax (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (qu_umax (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (qu_umax (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (qu_umax (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (qu_umax (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (qu_umax (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (qu_umax (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= 255) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= 255) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= 255) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= 255) ” 
  &&  “ (0 <= a4) ” 
  &&  “ (a4 <= 255) ” 
  &&  “ (0 <= a5) ” 
  &&  “ (a5 <= 255) ” 
  &&  “ (0 <= a6) ” 
  &&  “ (a6 <= 255) ” 
  &&  “ (0 <= a7) ” 
  &&  “ (a7 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 255) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 255) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 255) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 255) ”
  &&  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Module Type VC_Correct.


Axiom proof_of_vdup_n_u8_return_wit_1 : vdup_n_u8_return_wit_1.
Axiom proof_of_vdup_n_u8_partial_solve_wit_1 : vdup_n_u8_partial_solve_wit_1.
Axiom proof_of_vdupq_n_s16_return_wit_1 : vdupq_n_s16_return_wit_1.
Axiom proof_of_vdupq_n_s16_partial_solve_wit_1 : vdupq_n_s16_partial_solve_wit_1.
Axiom proof_of_vdupq_n_s32_return_wit_1 : vdupq_n_s32_return_wit_1.
Axiom proof_of_vdupq_n_s32_partial_solve_wit_1 : vdupq_n_s32_partial_solve_wit_1.
Axiom proof_of_vsubl_u8_return_wit_1 : vsubl_u8_return_wit_1.
Axiom proof_of_vsubl_u8_partial_solve_wit_1_pure : vsubl_u8_partial_solve_wit_1_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_1 : vsubl_u8_partial_solve_wit_1.
Axiom proof_of_vsubl_u8_partial_solve_wit_2_pure : vsubl_u8_partial_solve_wit_2_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_2 : vsubl_u8_partial_solve_wit_2.
Axiom proof_of_vsubl_u8_partial_solve_wit_3_pure : vsubl_u8_partial_solve_wit_3_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_3 : vsubl_u8_partial_solve_wit_3.
Axiom proof_of_vsubl_u8_partial_solve_wit_4_pure : vsubl_u8_partial_solve_wit_4_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_4 : vsubl_u8_partial_solve_wit_4.
Axiom proof_of_vsubl_u8_partial_solve_wit_5_pure : vsubl_u8_partial_solve_wit_5_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_5 : vsubl_u8_partial_solve_wit_5.
Axiom proof_of_vsubl_u8_partial_solve_wit_6_pure : vsubl_u8_partial_solve_wit_6_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_6 : vsubl_u8_partial_solve_wit_6.
Axiom proof_of_vsubl_u8_partial_solve_wit_7_pure : vsubl_u8_partial_solve_wit_7_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_7 : vsubl_u8_partial_solve_wit_7.
Axiom proof_of_vsubl_u8_partial_solve_wit_8_pure : vsubl_u8_partial_solve_wit_8_pure.
Axiom proof_of_vsubl_u8_partial_solve_wit_8 : vsubl_u8_partial_solve_wit_8.
Axiom proof_of_vsubl_u8_partial_solve_wit_9 : vsubl_u8_partial_solve_wit_9.
Axiom proof_of_vreinterpretq_s16_u16_return_wit_1 : vreinterpretq_s16_u16_return_wit_1.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_1_pure : vreinterpretq_s16_u16_partial_solve_wit_1_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_1 : vreinterpretq_s16_u16_partial_solve_wit_1.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_2_pure : vreinterpretq_s16_u16_partial_solve_wit_2_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_2 : vreinterpretq_s16_u16_partial_solve_wit_2.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_3_pure : vreinterpretq_s16_u16_partial_solve_wit_3_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_3 : vreinterpretq_s16_u16_partial_solve_wit_3.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_4_pure : vreinterpretq_s16_u16_partial_solve_wit_4_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_4 : vreinterpretq_s16_u16_partial_solve_wit_4.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_5_pure : vreinterpretq_s16_u16_partial_solve_wit_5_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_5 : vreinterpretq_s16_u16_partial_solve_wit_5.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_6_pure : vreinterpretq_s16_u16_partial_solve_wit_6_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_6 : vreinterpretq_s16_u16_partial_solve_wit_6.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_7_pure : vreinterpretq_s16_u16_partial_solve_wit_7_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_7 : vreinterpretq_s16_u16_partial_solve_wit_7.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_8_pure : vreinterpretq_s16_u16_partial_solve_wit_8_pure.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_8 : vreinterpretq_s16_u16_partial_solve_wit_8.
Axiom proof_of_vreinterpretq_s16_u16_partial_solve_wit_9 : vreinterpretq_s16_u16_partial_solve_wit_9.
Axiom proof_of_vget_low_s16_return_wit_1 : vget_low_s16_return_wit_1.
Axiom proof_of_vget_low_s16_partial_solve_wit_1 : vget_low_s16_partial_solve_wit_1.
Axiom proof_of_vget_high_s16_return_wit_1 : vget_high_s16_return_wit_1.
Axiom proof_of_vget_high_s16_partial_solve_wit_1 : vget_high_s16_partial_solve_wit_1.
Axiom proof_of_vmovl_s16_return_wit_1 : vmovl_s16_return_wit_1.
Axiom proof_of_vmovl_s16_partial_solve_wit_1 : vmovl_s16_partial_solve_wit_1.
Axiom proof_of_vmulq_s32_return_wit_1 : vmulq_s32_return_wit_1.
Axiom proof_of_vmulq_s32_partial_solve_wit_1_pure : vmulq_s32_partial_solve_wit_1_pure.
Axiom proof_of_vmulq_s32_partial_solve_wit_1 : vmulq_s32_partial_solve_wit_1.
Axiom proof_of_vmulq_s32_partial_solve_wit_2_pure : vmulq_s32_partial_solve_wit_2_pure.
Axiom proof_of_vmulq_s32_partial_solve_wit_2 : vmulq_s32_partial_solve_wit_2.
Axiom proof_of_vmulq_s32_partial_solve_wit_3_pure : vmulq_s32_partial_solve_wit_3_pure.
Axiom proof_of_vmulq_s32_partial_solve_wit_3 : vmulq_s32_partial_solve_wit_3.
Axiom proof_of_vmulq_s32_partial_solve_wit_4_pure : vmulq_s32_partial_solve_wit_4_pure.
Axiom proof_of_vmulq_s32_partial_solve_wit_4 : vmulq_s32_partial_solve_wit_4.
Axiom proof_of_vmulq_s32_partial_solve_wit_5 : vmulq_s32_partial_solve_wit_5.
Axiom proof_of_vrshlq_s32_return_wit_1 : vrshlq_s32_return_wit_1.
Axiom proof_of_vrshlq_s32_partial_solve_wit_1_pure : vrshlq_s32_partial_solve_wit_1_pure.
Axiom proof_of_vrshlq_s32_partial_solve_wit_1 : vrshlq_s32_partial_solve_wit_1.
Axiom proof_of_vrshlq_s32_partial_solve_wit_2_pure : vrshlq_s32_partial_solve_wit_2_pure.
Axiom proof_of_vrshlq_s32_partial_solve_wit_2 : vrshlq_s32_partial_solve_wit_2.
Axiom proof_of_vrshlq_s32_partial_solve_wit_3_pure : vrshlq_s32_partial_solve_wit_3_pure.
Axiom proof_of_vrshlq_s32_partial_solve_wit_3 : vrshlq_s32_partial_solve_wit_3.
Axiom proof_of_vrshlq_s32_partial_solve_wit_4_pure : vrshlq_s32_partial_solve_wit_4_pure.
Axiom proof_of_vrshlq_s32_partial_solve_wit_4 : vrshlq_s32_partial_solve_wit_4.
Axiom proof_of_vrshlq_s32_partial_solve_wit_5 : vrshlq_s32_partial_solve_wit_5.
Axiom proof_of_vmlaq_s32_return_wit_1 : vmlaq_s32_return_wit_1.
Axiom proof_of_vmlaq_s32_partial_solve_wit_1_pure : vmlaq_s32_partial_solve_wit_1_pure.
Axiom proof_of_vmlaq_s32_partial_solve_wit_1 : vmlaq_s32_partial_solve_wit_1.
Axiom proof_of_vmlaq_s32_partial_solve_wit_2_pure : vmlaq_s32_partial_solve_wit_2_pure.
Axiom proof_of_vmlaq_s32_partial_solve_wit_2 : vmlaq_s32_partial_solve_wit_2.
Axiom proof_of_vmlaq_s32_partial_solve_wit_3_pure : vmlaq_s32_partial_solve_wit_3_pure.
Axiom proof_of_vmlaq_s32_partial_solve_wit_3 : vmlaq_s32_partial_solve_wit_3.
Axiom proof_of_vmlaq_s32_partial_solve_wit_4_pure : vmlaq_s32_partial_solve_wit_4_pure.
Axiom proof_of_vmlaq_s32_partial_solve_wit_4 : vmlaq_s32_partial_solve_wit_4.
Axiom proof_of_vmlaq_s32_partial_solve_wit_5 : vmlaq_s32_partial_solve_wit_5.
Axiom proof_of_vqmovn_s32_return_wit_1 : vqmovn_s32_return_wit_1.
Axiom proof_of_vqmovn_s32_partial_solve_wit_1_pure : vqmovn_s32_partial_solve_wit_1_pure.
Axiom proof_of_vqmovn_s32_partial_solve_wit_1 : vqmovn_s32_partial_solve_wit_1.
Axiom proof_of_vqmovn_s32_partial_solve_wit_2_pure : vqmovn_s32_partial_solve_wit_2_pure.
Axiom proof_of_vqmovn_s32_partial_solve_wit_2 : vqmovn_s32_partial_solve_wit_2.
Axiom proof_of_vqmovn_s32_partial_solve_wit_3_pure : vqmovn_s32_partial_solve_wit_3_pure.
Axiom proof_of_vqmovn_s32_partial_solve_wit_3 : vqmovn_s32_partial_solve_wit_3.
Axiom proof_of_vqmovn_s32_partial_solve_wit_4_pure : vqmovn_s32_partial_solve_wit_4_pure.
Axiom proof_of_vqmovn_s32_partial_solve_wit_4 : vqmovn_s32_partial_solve_wit_4.
Axiom proof_of_vqmovn_s32_partial_solve_wit_5 : vqmovn_s32_partial_solve_wit_5.
Axiom proof_of_vcombine_s16_return_wit_1 : vcombine_s16_return_wit_1.
Axiom proof_of_vcombine_s16_partial_solve_wit_1 : vcombine_s16_partial_solve_wit_1.
Axiom proof_of_vqaddq_s16_return_wit_1 : vqaddq_s16_return_wit_1.
Axiom proof_of_vqaddq_s16_partial_solve_wit_1_pure : vqaddq_s16_partial_solve_wit_1_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_1 : vqaddq_s16_partial_solve_wit_1.
Axiom proof_of_vqaddq_s16_partial_solve_wit_2_pure : vqaddq_s16_partial_solve_wit_2_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_2 : vqaddq_s16_partial_solve_wit_2.
Axiom proof_of_vqaddq_s16_partial_solve_wit_3_pure : vqaddq_s16_partial_solve_wit_3_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_3 : vqaddq_s16_partial_solve_wit_3.
Axiom proof_of_vqaddq_s16_partial_solve_wit_4_pure : vqaddq_s16_partial_solve_wit_4_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_4 : vqaddq_s16_partial_solve_wit_4.
Axiom proof_of_vqaddq_s16_partial_solve_wit_5_pure : vqaddq_s16_partial_solve_wit_5_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_5 : vqaddq_s16_partial_solve_wit_5.
Axiom proof_of_vqaddq_s16_partial_solve_wit_6_pure : vqaddq_s16_partial_solve_wit_6_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_6 : vqaddq_s16_partial_solve_wit_6.
Axiom proof_of_vqaddq_s16_partial_solve_wit_7_pure : vqaddq_s16_partial_solve_wit_7_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_7 : vqaddq_s16_partial_solve_wit_7.
Axiom proof_of_vqaddq_s16_partial_solve_wit_8_pure : vqaddq_s16_partial_solve_wit_8_pure.
Axiom proof_of_vqaddq_s16_partial_solve_wit_8 : vqaddq_s16_partial_solve_wit_8.
Axiom proof_of_vqaddq_s16_partial_solve_wit_9 : vqaddq_s16_partial_solve_wit_9.
Axiom proof_of_vqmovun_s16_return_wit_1 : vqmovun_s16_return_wit_1.
Axiom proof_of_vqmovun_s16_partial_solve_wit_1_pure : vqmovun_s16_partial_solve_wit_1_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_1 : vqmovun_s16_partial_solve_wit_1.
Axiom proof_of_vqmovun_s16_partial_solve_wit_2_pure : vqmovun_s16_partial_solve_wit_2_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_2 : vqmovun_s16_partial_solve_wit_2.
Axiom proof_of_vqmovun_s16_partial_solve_wit_3_pure : vqmovun_s16_partial_solve_wit_3_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_3 : vqmovun_s16_partial_solve_wit_3.
Axiom proof_of_vqmovun_s16_partial_solve_wit_4_pure : vqmovun_s16_partial_solve_wit_4_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_4 : vqmovun_s16_partial_solve_wit_4.
Axiom proof_of_vqmovun_s16_partial_solve_wit_5_pure : vqmovun_s16_partial_solve_wit_5_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_5 : vqmovun_s16_partial_solve_wit_5.
Axiom proof_of_vqmovun_s16_partial_solve_wit_6_pure : vqmovun_s16_partial_solve_wit_6_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_6 : vqmovun_s16_partial_solve_wit_6.
Axiom proof_of_vqmovun_s16_partial_solve_wit_7_pure : vqmovun_s16_partial_solve_wit_7_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_7 : vqmovun_s16_partial_solve_wit_7.
Axiom proof_of_vqmovun_s16_partial_solve_wit_8_pure : vqmovun_s16_partial_solve_wit_8_pure.
Axiom proof_of_vqmovun_s16_partial_solve_wit_8 : vqmovun_s16_partial_solve_wit_8.
Axiom proof_of_vqmovun_s16_partial_solve_wit_9 : vqmovun_s16_partial_solve_wit_9.
Axiom proof_of_vmin_u8_return_wit_1 : vmin_u8_return_wit_1.
Axiom proof_of_vmin_u8_partial_solve_wit_1_pure : vmin_u8_partial_solve_wit_1_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_1 : vmin_u8_partial_solve_wit_1.
Axiom proof_of_vmin_u8_partial_solve_wit_2_pure : vmin_u8_partial_solve_wit_2_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_2 : vmin_u8_partial_solve_wit_2.
Axiom proof_of_vmin_u8_partial_solve_wit_3_pure : vmin_u8_partial_solve_wit_3_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_3 : vmin_u8_partial_solve_wit_3.
Axiom proof_of_vmin_u8_partial_solve_wit_4_pure : vmin_u8_partial_solve_wit_4_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_4 : vmin_u8_partial_solve_wit_4.
Axiom proof_of_vmin_u8_partial_solve_wit_5_pure : vmin_u8_partial_solve_wit_5_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_5 : vmin_u8_partial_solve_wit_5.
Axiom proof_of_vmin_u8_partial_solve_wit_6_pure : vmin_u8_partial_solve_wit_6_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_6 : vmin_u8_partial_solve_wit_6.
Axiom proof_of_vmin_u8_partial_solve_wit_7_pure : vmin_u8_partial_solve_wit_7_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_7 : vmin_u8_partial_solve_wit_7.
Axiom proof_of_vmin_u8_partial_solve_wit_8_pure : vmin_u8_partial_solve_wit_8_pure.
Axiom proof_of_vmin_u8_partial_solve_wit_8 : vmin_u8_partial_solve_wit_8.
Axiom proof_of_vmin_u8_partial_solve_wit_9 : vmin_u8_partial_solve_wit_9.
Axiom proof_of_vmax_u8_return_wit_1 : vmax_u8_return_wit_1.
Axiom proof_of_vmax_u8_partial_solve_wit_1_pure : vmax_u8_partial_solve_wit_1_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_1 : vmax_u8_partial_solve_wit_1.
Axiom proof_of_vmax_u8_partial_solve_wit_2_pure : vmax_u8_partial_solve_wit_2_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_2 : vmax_u8_partial_solve_wit_2.
Axiom proof_of_vmax_u8_partial_solve_wit_3_pure : vmax_u8_partial_solve_wit_3_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_3 : vmax_u8_partial_solve_wit_3.
Axiom proof_of_vmax_u8_partial_solve_wit_4_pure : vmax_u8_partial_solve_wit_4_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_4 : vmax_u8_partial_solve_wit_4.
Axiom proof_of_vmax_u8_partial_solve_wit_5_pure : vmax_u8_partial_solve_wit_5_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_5 : vmax_u8_partial_solve_wit_5.
Axiom proof_of_vmax_u8_partial_solve_wit_6_pure : vmax_u8_partial_solve_wit_6_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_6 : vmax_u8_partial_solve_wit_6.
Axiom proof_of_vmax_u8_partial_solve_wit_7_pure : vmax_u8_partial_solve_wit_7_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_7 : vmax_u8_partial_solve_wit_7.
Axiom proof_of_vmax_u8_partial_solve_wit_8_pure : vmax_u8_partial_solve_wit_8_pure.
Axiom proof_of_vmax_u8_partial_solve_wit_8 : vmax_u8_partial_solve_wit_8.
Axiom proof_of_vmax_u8_partial_solve_wit_9 : vmax_u8_partial_solve_wit_9.

End VC_Correct.
