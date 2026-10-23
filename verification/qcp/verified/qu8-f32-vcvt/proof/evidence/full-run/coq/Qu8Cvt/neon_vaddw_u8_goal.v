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
Require Import Qu8Cvt.Model.
Require Import Qu8Cvt.Types.
Require Import Qu8Cvt.UnsignedModel.
Local Open Scope sac.

(*----- Function vaddw_u8 -----*)

Definition vaddw_u8_return_wit_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (cvt_add_u16 (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 65535)) (PreH4 : (retval_7 = (cvt_add_u16 (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 65535)) (PreH7 : (retval_6 = (cvt_add_u16 (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 65535)) (PreH10 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 65535)) (PreH13 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 65535)) (PreH16 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 65535)) (PreH19 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 65535)) (PreH22 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 65535)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 65535)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 65535)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 65535)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 65535)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 65535)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 65535)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 65535)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 65535)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> retval)
|--
  ((&((record_return)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> (cvt_add_u16 (a0) (b0)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> (cvt_add_u16 (a1) (b1)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> (cvt_add_u16 (a2) (b2)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> (cvt_add_u16 (a3) (b3)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> (cvt_add_u16 (a4) (b4)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> (cvt_add_u16 (a5) (b5)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> (cvt_add_u16 (a6) (b6)))
  **  ((&((record_return)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> (cvt_add_u16 (a7) (b7)))
.

Definition vaddw_u8_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 65535)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 65535)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 65535)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 65535)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 65535)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 65535)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 65535)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 65535)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= 65535)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= 65535)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= 65535)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= 65535)) (PreH9 : (0 <= a4)) (PreH10 : (a4 <= 65535)) (PreH11 : (0 <= a5)) (PreH12 : (a5 <= 65535)) (PreH13 : (0 <= a6)) (PreH14 : (a6 <= 65535)) (PreH15 : (0 <= a7)) (PreH16 : (a7 <= 65535)) (PreH17 : (0 <= b0)) (PreH18 : (b0 <= 255)) (PreH19 : (0 <= b1)) (PreH20 : (b1 <= 255)) (PreH21 : (0 <= b2)) (PreH22 : (b2 <= 255)) (PreH23 : (0 <= b3)) (PreH24 : (b3 <= 255)) (PreH25 : (0 <= b4)) (PreH26 : (b4 <= 255)) (PreH27 : (0 <= b5)) (PreH28 : (b5 <= 255)) (PreH29 : (0 <= b6)) (PreH30 : (b6 <= 255)) (PreH31 : (0 <= b7)) (PreH32 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a0 <= 65535) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_1 := vaddw_u8_partial_solve_wit_1_pure -> vaddw_u8_partial_solve_wit_1_aux.

Definition vaddw_u8_partial_solve_wit_2_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 65535)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 65535)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 65535)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 65535)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 65535)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 65535)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 65535)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 65535)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_2_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 65535)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 65535)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 65535)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 65535)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 65535)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 65535)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 65535)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 65535)) (PreH20 : (0 <= b0)) (PreH21 : (b0 <= 255)) (PreH22 : (0 <= b1)) (PreH23 : (b1 <= 255)) (PreH24 : (0 <= b2)) (PreH25 : (b2 <= 255)) (PreH26 : (0 <= b3)) (PreH27 : (b3 <= 255)) (PreH28 : (0 <= b4)) (PreH29 : (b4 <= 255)) (PreH30 : (0 <= b5)) (PreH31 : (b5 <= 255)) (PreH32 : (0 <= b6)) (PreH33 : (b6 <= 255)) (PreH34 : (0 <= b7)) (PreH35 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a1 <= 65535) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_2 := vaddw_u8_partial_solve_wit_2_pure -> vaddw_u8_partial_solve_wit_2_aux.

Definition vaddw_u8_partial_solve_wit_3_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 65535)) (PreH4 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 65535)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 65535)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 65535)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 65535)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 65535)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 65535)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 65535)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 65535)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 65535)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 65535)) (PreH4 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 65535)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 65535)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 65535)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 65535)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 65535)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 65535)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 65535)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 65535)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 65535)) (PreH23 : (0 <= b0)) (PreH24 : (b0 <= 255)) (PreH25 : (0 <= b1)) (PreH26 : (b1 <= 255)) (PreH27 : (0 <= b2)) (PreH28 : (b2 <= 255)) (PreH29 : (0 <= b3)) (PreH30 : (b3 <= 255)) (PreH31 : (0 <= b4)) (PreH32 : (b4 <= 255)) (PreH33 : (0 <= b5)) (PreH34 : (b5 <= 255)) (PreH35 : (0 <= b6)) (PreH36 : (b6 <= 255)) (PreH37 : (0 <= b7)) (PreH38 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a2 <= 65535) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 65535) ” 
  &&  “ (retval_2 = (cvt_add_u16 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_3 := vaddw_u8_partial_solve_wit_3_pure -> vaddw_u8_partial_solve_wit_3_aux.

Definition vaddw_u8_partial_solve_wit_4_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 65535)) (PreH4 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 65535)) (PreH7 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 65535)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 65535)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 65535)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 65535)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 65535)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 65535)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 65535)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 65535)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 65535)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_4_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 65535)) (PreH4 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 65535)) (PreH7 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 65535)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 65535)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 65535)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 65535)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 65535)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 65535)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 65535)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 65535)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 65535)) (PreH26 : (0 <= b0)) (PreH27 : (b0 <= 255)) (PreH28 : (0 <= b1)) (PreH29 : (b1 <= 255)) (PreH30 : (0 <= b2)) (PreH31 : (b2 <= 255)) (PreH32 : (0 <= b3)) (PreH33 : (b3 <= 255)) (PreH34 : (0 <= b4)) (PreH35 : (b4 <= 255)) (PreH36 : (0 <= b5)) (PreH37 : (b5 <= 255)) (PreH38 : (0 <= b6)) (PreH39 : (b6 <= 255)) (PreH40 : (0 <= b7)) (PreH41 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a3 <= 65535) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 65535) ” 
  &&  “ (retval_3 = (cvt_add_u16 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (cvt_add_u16 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_4 := vaddw_u8_partial_solve_wit_4_pure -> vaddw_u8_partial_solve_wit_4_aux.

Definition vaddw_u8_partial_solve_wit_5_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 65535)) (PreH4 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 65535)) (PreH7 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 65535)) (PreH10 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 65535)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 65535)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 65535)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 65535)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 65535)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 65535)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 65535)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 65535)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 65535)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_5_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 65535)) (PreH4 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 65535)) (PreH7 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 65535)) (PreH10 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 65535)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 65535)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 65535)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 65535)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 65535)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 65535)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 65535)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 65535)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 65535)) (PreH29 : (0 <= b0)) (PreH30 : (b0 <= 255)) (PreH31 : (0 <= b1)) (PreH32 : (b1 <= 255)) (PreH33 : (0 <= b2)) (PreH34 : (b2 <= 255)) (PreH35 : (0 <= b3)) (PreH36 : (b3 <= 255)) (PreH37 : (0 <= b4)) (PreH38 : (b4 <= 255)) (PreH39 : (0 <= b5)) (PreH40 : (b5 <= 255)) (PreH41 : (0 <= b6)) (PreH42 : (b6 <= 255)) (PreH43 : (0 <= b7)) (PreH44 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a4 <= 65535) ” 
  &&  “ (0 <= b4) ” 
  &&  “ (b4 <= 65535) ” 
  &&  “ (retval_4 = (cvt_add_u16 (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (cvt_add_u16 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (cvt_add_u16 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_5 := vaddw_u8_partial_solve_wit_5_pure -> vaddw_u8_partial_solve_wit_5_aux.

Definition vaddw_u8_partial_solve_wit_6_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 65535)) (PreH4 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 65535)) (PreH7 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 65535)) (PreH10 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 65535)) (PreH13 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 65535)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 65535)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 65535)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 65535)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 65535)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 65535)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 65535)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 65535)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 65535)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_6_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 65535)) (PreH4 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 65535)) (PreH7 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 65535)) (PreH10 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 65535)) (PreH13 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 65535)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 65535)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 65535)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 65535)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 65535)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 65535)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 65535)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 65535)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 65535)) (PreH32 : (0 <= b0)) (PreH33 : (b0 <= 255)) (PreH34 : (0 <= b1)) (PreH35 : (b1 <= 255)) (PreH36 : (0 <= b2)) (PreH37 : (b2 <= 255)) (PreH38 : (0 <= b3)) (PreH39 : (b3 <= 255)) (PreH40 : (0 <= b4)) (PreH41 : (b4 <= 255)) (PreH42 : (0 <= b5)) (PreH43 : (b5 <= 255)) (PreH44 : (0 <= b6)) (PreH45 : (b6 <= 255)) (PreH46 : (0 <= b7)) (PreH47 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a5 <= 65535) ” 
  &&  “ (0 <= b5) ” 
  &&  “ (b5 <= 65535) ” 
  &&  “ (retval_5 = (cvt_add_u16 (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (cvt_add_u16 (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (cvt_add_u16 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (cvt_add_u16 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_6 := vaddw_u8_partial_solve_wit_6_pure -> vaddw_u8_partial_solve_wit_6_aux.

Definition vaddw_u8_partial_solve_wit_7_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_add_u16 (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 65535)) (PreH4 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 65535)) (PreH7 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 65535)) (PreH10 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 65535)) (PreH13 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 65535)) (PreH16 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 65535)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 65535)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 65535)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 65535)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 65535)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 65535)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 65535)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 65535)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 65535)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_7_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_add_u16 (a5) (b5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 65535)) (PreH4 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 65535)) (PreH7 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 65535)) (PreH10 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 65535)) (PreH13 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 65535)) (PreH16 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 65535)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 65535)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 65535)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 65535)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 65535)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 65535)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 65535)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 65535)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 65535)) (PreH35 : (0 <= b0)) (PreH36 : (b0 <= 255)) (PreH37 : (0 <= b1)) (PreH38 : (b1 <= 255)) (PreH39 : (0 <= b2)) (PreH40 : (b2 <= 255)) (PreH41 : (0 <= b3)) (PreH42 : (b3 <= 255)) (PreH43 : (0 <= b4)) (PreH44 : (b4 <= 255)) (PreH45 : (0 <= b5)) (PreH46 : (b5 <= 255)) (PreH47 : (0 <= b6)) (PreH48 : (b6 <= 255)) (PreH49 : (0 <= b7)) (PreH50 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a6 <= 65535) ” 
  &&  “ (0 <= b6) ” 
  &&  “ (b6 <= 65535) ” 
  &&  “ (retval_6 = (cvt_add_u16 (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (cvt_add_u16 (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (cvt_add_u16 (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (cvt_add_u16 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (cvt_add_u16 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_7 := vaddw_u8_partial_solve_wit_7_pure -> vaddw_u8_partial_solve_wit_7_aux.

Definition vaddw_u8_partial_solve_wit_8_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_add_u16 (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 65535)) (PreH4 : (retval_6 = (cvt_add_u16 (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 65535)) (PreH7 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 65535)) (PreH10 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 65535)) (PreH13 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 65535)) (PreH16 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 65535)) (PreH19 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 65535)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 65535)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 65535)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 65535)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 65535)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 65535)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 65535)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 65535)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 65535)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a7 <= 65535) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 65535) ”
.

Definition vaddw_u8_partial_solve_wit_8_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_add_u16 (a6) (b6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 65535)) (PreH4 : (retval_6 = (cvt_add_u16 (a5) (b5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 65535)) (PreH7 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 65535)) (PreH10 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 65535)) (PreH13 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 65535)) (PreH16 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 65535)) (PreH19 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 65535)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 65535)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 65535)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 65535)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 65535)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 65535)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 65535)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 65535)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 65535)) (PreH38 : (0 <= b0)) (PreH39 : (b0 <= 255)) (PreH40 : (0 <= b1)) (PreH41 : (b1 <= 255)) (PreH42 : (0 <= b2)) (PreH43 : (b2 <= 255)) (PreH44 : (0 <= b3)) (PreH45 : (b3 <= 255)) (PreH46 : (0 <= b4)) (PreH47 : (b4 <= 255)) (PreH48 : (0 <= b5)) (PreH49 : (b5 <= 255)) (PreH50 : (0 <= b6)) (PreH51 : (b6 <= 255)) (PreH52 : (0 <= b7)) (PreH53 : (b7 <= 255)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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
  &&  “ (a7 <= 65535) ” 
  &&  “ (0 <= b7) ” 
  &&  “ (b7 <= 65535) ” 
  &&  “ (retval_7 = (cvt_add_u16 (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (cvt_add_u16 (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (cvt_add_u16 (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (cvt_add_u16 (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (cvt_add_u16 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (cvt_add_u16 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
.

Definition vaddw_u8_partial_solve_wit_8 := vaddw_u8_partial_solve_wit_8_pure -> vaddw_u8_partial_solve_wit_8_aux.

Definition vaddw_u8_partial_solve_wit_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (cvt_add_u16 (a7) (b7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 65535)) (PreH4 : (retval_7 = (cvt_add_u16 (a6) (b6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 65535)) (PreH7 : (retval_6 = (cvt_add_u16 (a5) (b5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 65535)) (PreH10 : (retval_5 = (cvt_add_u16 (a4) (b4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 65535)) (PreH13 : (retval_4 = (cvt_add_u16 (a3) (b3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 65535)) (PreH16 : (retval_3 = (cvt_add_u16 (a2) (b2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 65535)) (PreH19 : (retval_2 = (cvt_add_u16 (a1) (b1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 65535)) (PreH22 : (retval = (cvt_add_u16 (a0) (b0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 65535)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 65535)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 65535)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 65535)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 65535)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 65535)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 65535)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 65535)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 65535)) (PreH41 : (0 <= b0)) (PreH42 : (b0 <= 255)) (PreH43 : (0 <= b1)) (PreH44 : (b1 <= 255)) (PreH45 : (0 <= b2)) (PreH46 : (b2 <= 255)) (PreH47 : (0 <= b3)) (PreH48 : (b3 <= 255)) (PreH49 : (0 <= b4)) (PreH50 : (b4 <= 255)) (PreH51 : (0 <= b5)) (PreH52 : (b5 <= 255)) (PreH53 : (0 <= b6)) (PreH54 : (b6 <= 255)) (PreH55 : (0 <= b7)) (PreH56 : (b7 <= 255)) ,
  (UndefStructPreduint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UChar  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UChar  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UChar  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UChar  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UChar  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UChar  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UChar  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UChar  |-> b7)
|--
  “ (retval_8 = (cvt_add_u16 (a7) (b7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (cvt_add_u16 (a6) (b6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (cvt_add_u16 (a5) (b5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (cvt_add_u16 (a4) (b4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (cvt_add_u16 (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (cvt_add_u16 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (cvt_add_u16 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (cvt_add_u16 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
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
  **  ((&(( &( "a" ) )->ₛ "s0")) # UShort  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UShort  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UShort  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UShort  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UShort  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UShort  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UShort  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UShort  |-> a7)
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


Axiom proof_of_vaddw_u8_return_wit_1 : vaddw_u8_return_wit_1.
Axiom proof_of_vaddw_u8_partial_solve_wit_1_pure : vaddw_u8_partial_solve_wit_1_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_1 : vaddw_u8_partial_solve_wit_1.
Axiom proof_of_vaddw_u8_partial_solve_wit_2_pure : vaddw_u8_partial_solve_wit_2_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_2 : vaddw_u8_partial_solve_wit_2.
Axiom proof_of_vaddw_u8_partial_solve_wit_3_pure : vaddw_u8_partial_solve_wit_3_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_3 : vaddw_u8_partial_solve_wit_3.
Axiom proof_of_vaddw_u8_partial_solve_wit_4_pure : vaddw_u8_partial_solve_wit_4_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_4 : vaddw_u8_partial_solve_wit_4.
Axiom proof_of_vaddw_u8_partial_solve_wit_5_pure : vaddw_u8_partial_solve_wit_5_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_5 : vaddw_u8_partial_solve_wit_5.
Axiom proof_of_vaddw_u8_partial_solve_wit_6_pure : vaddw_u8_partial_solve_wit_6_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_6 : vaddw_u8_partial_solve_wit_6.
Axiom proof_of_vaddw_u8_partial_solve_wit_7_pure : vaddw_u8_partial_solve_wit_7_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_7 : vaddw_u8_partial_solve_wit_7.
Axiom proof_of_vaddw_u8_partial_solve_wit_8_pure : vaddw_u8_partial_solve_wit_8_pure.
Axiom proof_of_vaddw_u8_partial_solve_wit_8 : vaddw_u8_partial_solve_wit_8.
Axiom proof_of_vaddw_u8_partial_solve_wit_9 : vaddw_u8_partial_solve_wit_9.

End VC_Correct.
