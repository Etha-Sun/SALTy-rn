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

(*----- Function vreinterpretq_s16_u16 -----*)

Definition vreinterpretq_s16_u16_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (cvt_s16 (a7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (cvt_s16 (a6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (cvt_s16 (a5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (cvt_s16 (a4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (cvt_s16 (a3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (cvt_s16 (a2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (cvt_s16 (a1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (cvt_s16 (a0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 65535)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 65535)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 65535)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 65535)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 65535)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 65535)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 65535)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 65535)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> retval)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (cvt_s16 (a0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (cvt_s16 (a1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (cvt_s16 (a2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (cvt_s16 (a3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (cvt_s16 (a4)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (cvt_s16 (a5)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (cvt_s16 (a6)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (cvt_s16 (a7)))
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 (a0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 65535)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 65535)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 65535)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 65535)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 65535)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 65535)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 65535)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 65535)) ,
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 (a0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= 65535)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= 65535)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= 65535)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= 65535)) (PreH12 : (0 <= a4)) (PreH13 : (a4 <= 65535)) (PreH14 : (0 <= a5)) (PreH15 : (a5 <= 65535)) (PreH16 : (0 <= a6)) (PreH17 : (a6 <= 65535)) (PreH18 : (0 <= a7)) (PreH19 : (a7 <= 65535)) ,
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
  &&  “ (retval = (cvt_s16 (a0))) ” 
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_s16 (a1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (cvt_s16 (a0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 65535)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 65535)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 65535)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 65535)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 65535)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 65535)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 65535)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 65535)) ,
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_s16 (a1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (cvt_s16 (a0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= 65535)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= 65535)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= 65535)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= 65535)) (PreH15 : (0 <= a4)) (PreH16 : (a4 <= 65535)) (PreH17 : (0 <= a5)) (PreH18 : (a5 <= 65535)) (PreH19 : (0 <= a6)) (PreH20 : (a6 <= 65535)) (PreH21 : (0 <= a7)) (PreH22 : (a7 <= 65535)) ,
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
  &&  “ (retval_2 = (cvt_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (cvt_s16 (a0))) ” 
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_s16 (a2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (cvt_s16 (a1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (cvt_s16 (a0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 65535)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 65535)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 65535)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 65535)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 65535)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 65535)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 65535)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 65535)) ,
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_s16 (a2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (cvt_s16 (a1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (cvt_s16 (a0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= 65535)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= 65535)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= 65535)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= 65535)) (PreH18 : (0 <= a4)) (PreH19 : (a4 <= 65535)) (PreH20 : (0 <= a5)) (PreH21 : (a5 <= 65535)) (PreH22 : (0 <= a6)) (PreH23 : (a6 <= 65535)) (PreH24 : (0 <= a7)) (PreH25 : (a7 <= 65535)) ,
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
  &&  “ (retval_3 = (cvt_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (cvt_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (cvt_s16 (a0))) ” 
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_s16 (a3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (cvt_s16 (a2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (cvt_s16 (a1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (cvt_s16 (a0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 65535)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 65535)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 65535)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 65535)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 65535)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 65535)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 65535)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 65535)) ,
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_s16 (a3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (cvt_s16 (a2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (cvt_s16 (a1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (cvt_s16 (a0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= 65535)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= 65535)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= 65535)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= 65535)) (PreH21 : (0 <= a4)) (PreH22 : (a4 <= 65535)) (PreH23 : (0 <= a5)) (PreH24 : (a5 <= 65535)) (PreH25 : (0 <= a6)) (PreH26 : (a6 <= 65535)) (PreH27 : (0 <= a7)) (PreH28 : (a7 <= 65535)) ,
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
  &&  “ (retval_4 = (cvt_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (cvt_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (cvt_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (cvt_s16 (a0))) ” 
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_s16 (a4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (cvt_s16 (a3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (cvt_s16 (a2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (cvt_s16 (a1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (cvt_s16 (a0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 65535)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 65535)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 65535)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 65535)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 65535)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 65535)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 65535)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 65535)) ,
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_s16 (a4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (cvt_s16 (a3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (cvt_s16 (a2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (cvt_s16 (a1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (cvt_s16 (a0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= a0)) (PreH17 : (a0 <= 65535)) (PreH18 : (0 <= a1)) (PreH19 : (a1 <= 65535)) (PreH20 : (0 <= a2)) (PreH21 : (a2 <= 65535)) (PreH22 : (0 <= a3)) (PreH23 : (a3 <= 65535)) (PreH24 : (0 <= a4)) (PreH25 : (a4 <= 65535)) (PreH26 : (0 <= a5)) (PreH27 : (a5 <= 65535)) (PreH28 : (0 <= a6)) (PreH29 : (a6 <= 65535)) (PreH30 : (0 <= a7)) (PreH31 : (a7 <= 65535)) ,
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
  &&  “ (retval_5 = (cvt_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (cvt_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (cvt_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (cvt_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (cvt_s16 (a0))) ” 
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_s16 (a5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (cvt_s16 (a4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (cvt_s16 (a3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (cvt_s16 (a2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (cvt_s16 (a1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (cvt_s16 (a0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 65535)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 65535)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 65535)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 65535)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 65535)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 65535)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 65535)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 65535)) ,
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_s16 (a5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (cvt_s16 (a4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (cvt_s16 (a3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (cvt_s16 (a2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (cvt_s16 (a1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (cvt_s16 (a0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= a0)) (PreH20 : (a0 <= 65535)) (PreH21 : (0 <= a1)) (PreH22 : (a1 <= 65535)) (PreH23 : (0 <= a2)) (PreH24 : (a2 <= 65535)) (PreH25 : (0 <= a3)) (PreH26 : (a3 <= 65535)) (PreH27 : (0 <= a4)) (PreH28 : (a4 <= 65535)) (PreH29 : (0 <= a5)) (PreH30 : (a5 <= 65535)) (PreH31 : (0 <= a6)) (PreH32 : (a6 <= 65535)) (PreH33 : (0 <= a7)) (PreH34 : (a7 <= 65535)) ,
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
  &&  “ (retval_6 = (cvt_s16 (a5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (cvt_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (cvt_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (cvt_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (cvt_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (cvt_s16 (a0))) ” 
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_s16 (a6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (cvt_s16 (a5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (cvt_s16 (a4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (cvt_s16 (a3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (cvt_s16 (a2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (cvt_s16 (a1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (cvt_s16 (a0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 65535)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 65535)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 65535)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 65535)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 65535)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 65535)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 65535)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 65535)) ,
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_s16 (a6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (cvt_s16 (a5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (cvt_s16 (a4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (cvt_s16 (a3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (cvt_s16 (a2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (cvt_s16 (a1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (cvt_s16 (a0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= a0)) (PreH23 : (a0 <= 65535)) (PreH24 : (0 <= a1)) (PreH25 : (a1 <= 65535)) (PreH26 : (0 <= a2)) (PreH27 : (a2 <= 65535)) (PreH28 : (0 <= a3)) (PreH29 : (a3 <= 65535)) (PreH30 : (0 <= a4)) (PreH31 : (a4 <= 65535)) (PreH32 : (0 <= a5)) (PreH33 : (a5 <= 65535)) (PreH34 : (0 <= a6)) (PreH35 : (a6 <= 65535)) (PreH36 : (0 <= a7)) (PreH37 : (a7 <= 65535)) ,
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
  &&  “ (retval_7 = (cvt_s16 (a6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (cvt_s16 (a5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (cvt_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (cvt_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (cvt_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (cvt_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (cvt_s16 (a0))) ” 
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
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (cvt_s16 (a7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (cvt_s16 (a6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (cvt_s16 (a5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (cvt_s16 (a4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (cvt_s16 (a3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (cvt_s16 (a2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (cvt_s16 (a1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (cvt_s16 (a0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= a0)) (PreH26 : (a0 <= 65535)) (PreH27 : (0 <= a1)) (PreH28 : (a1 <= 65535)) (PreH29 : (0 <= a2)) (PreH30 : (a2 <= 65535)) (PreH31 : (0 <= a3)) (PreH32 : (a3 <= 65535)) (PreH33 : (0 <= a4)) (PreH34 : (a4 <= 65535)) (PreH35 : (0 <= a5)) (PreH36 : (a5 <= 65535)) (PreH37 : (0 <= a6)) (PreH38 : (a6 <= 65535)) (PreH39 : (0 <= a7)) (PreH40 : (a7 <= 65535)) ,
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
  “ (retval_8 = (cvt_s16 (a7))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (cvt_s16 (a6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (cvt_s16 (a5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (cvt_s16 (a4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (cvt_s16 (a3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (cvt_s16 (a2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (cvt_s16 (a1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (cvt_s16 (a0))) ” 
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

Module Type VC_Correct.


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

End VC_Correct.
