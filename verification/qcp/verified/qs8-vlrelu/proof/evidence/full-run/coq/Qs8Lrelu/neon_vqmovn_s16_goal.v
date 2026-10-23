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
Require Import Qs8Lrelu.Model.
Require Import Qs8Lrelu.Types.
Local Open Scope sac.

(*----- Function vqmovn_s16 -----*)

Definition vqmovn_s16_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qcv_sat8 (a7)))) (PreH2 : ((-128) <= retval_8)) (PreH3 : (retval_8 <= 127)) (PreH4 : (retval_7 = (qcv_sat8 (a6)))) (PreH5 : ((-128) <= retval_7)) (PreH6 : (retval_7 <= 127)) (PreH7 : (retval_6 = (qcv_sat8 (a5)))) (PreH8 : ((-128) <= retval_6)) (PreH9 : (retval_6 <= 127)) (PreH10 : (retval_5 = (qcv_sat8 (a4)))) (PreH11 : ((-128) <= retval_5)) (PreH12 : (retval_5 <= 127)) (PreH13 : (retval_4 = (qcv_sat8 (a3)))) (PreH14 : ((-128) <= retval_4)) (PreH15 : (retval_4 <= 127)) (PreH16 : (retval_3 = (qcv_sat8 (a2)))) (PreH17 : ((-128) <= retval_3)) (PreH18 : (retval_3 <= 127)) (PreH19 : (retval_2 = (qcv_sat8 (a1)))) (PreH20 : ((-128) <= retval_2)) (PreH21 : (retval_2 <= 127)) (PreH22 : (retval = (qcv_sat8 (a0)))) (PreH23 : ((-128) <= retval)) (PreH24 : (retval <= 127)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) ,
  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> retval)
|--
  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> (qcv_sat8 (a0)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> (qcv_sat8 (a1)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> (qcv_sat8 (a2)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> (qcv_sat8 (a3)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> (qcv_sat8 (a4)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> (qcv_sat8 (a5)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> (qcv_sat8 (a6)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> (qcv_sat8 (a7)))
.

Definition vqmovn_s16_partial_solve_wit_1_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
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

Definition vqmovn_s16_partial_solve_wit_1_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
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
  &&  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_1 := vqmovn_s16_partial_solve_wit_1_pure -> vqmovn_s16_partial_solve_wit_1_aux.

Definition vqmovn_s16_partial_solve_wit_2_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qcv_sat8 (a0)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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

Definition vqmovn_s16_partial_solve_wit_2_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qcv_sat8 (a0)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_2 := vqmovn_s16_partial_solve_wit_2_pure -> vqmovn_s16_partial_solve_wit_2_aux.

Definition vqmovn_s16_partial_solve_wit_3_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qcv_sat8 (a1)))) (PreH2 : ((-128) <= retval_2)) (PreH3 : (retval_2 <= 127)) (PreH4 : (retval = (qcv_sat8 (a0)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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

Definition vqmovn_s16_partial_solve_wit_3_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qcv_sat8 (a1)))) (PreH2 : ((-128) <= retval_2)) (PreH3 : (retval_2 <= 127)) (PreH4 : (retval = (qcv_sat8 (a0)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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
  &&  “ (retval_2 = (qcv_sat8 (a1))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_3 := vqmovn_s16_partial_solve_wit_3_pure -> vqmovn_s16_partial_solve_wit_3_aux.

Definition vqmovn_s16_partial_solve_wit_4_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qcv_sat8 (a2)))) (PreH2 : ((-128) <= retval_3)) (PreH3 : (retval_3 <= 127)) (PreH4 : (retval_2 = (qcv_sat8 (a1)))) (PreH5 : ((-128) <= retval_2)) (PreH6 : (retval_2 <= 127)) (PreH7 : (retval = (qcv_sat8 (a0)))) (PreH8 : ((-128) <= retval)) (PreH9 : (retval <= 127)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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

Definition vqmovn_s16_partial_solve_wit_4_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qcv_sat8 (a2)))) (PreH2 : ((-128) <= retval_3)) (PreH3 : (retval_3 <= 127)) (PreH4 : (retval_2 = (qcv_sat8 (a1)))) (PreH5 : ((-128) <= retval_2)) (PreH6 : (retval_2 <= 127)) (PreH7 : (retval = (qcv_sat8 (a0)))) (PreH8 : ((-128) <= retval)) (PreH9 : (retval <= 127)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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
  &&  “ (retval_3 = (qcv_sat8 (a2))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (qcv_sat8 (a1))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_4 := vqmovn_s16_partial_solve_wit_4_pure -> vqmovn_s16_partial_solve_wit_4_aux.

Definition vqmovn_s16_partial_solve_wit_5_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qcv_sat8 (a3)))) (PreH2 : ((-128) <= retval_4)) (PreH3 : (retval_4 <= 127)) (PreH4 : (retval_3 = (qcv_sat8 (a2)))) (PreH5 : ((-128) <= retval_3)) (PreH6 : (retval_3 <= 127)) (PreH7 : (retval_2 = (qcv_sat8 (a1)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : (retval = (qcv_sat8 (a0)))) (PreH11 : ((-128) <= retval)) (PreH12 : (retval <= 127)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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

Definition vqmovn_s16_partial_solve_wit_5_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qcv_sat8 (a3)))) (PreH2 : ((-128) <= retval_4)) (PreH3 : (retval_4 <= 127)) (PreH4 : (retval_3 = (qcv_sat8 (a2)))) (PreH5 : ((-128) <= retval_3)) (PreH6 : (retval_3 <= 127)) (PreH7 : (retval_2 = (qcv_sat8 (a1)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : (retval = (qcv_sat8 (a0)))) (PreH11 : ((-128) <= retval)) (PreH12 : (retval <= 127)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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
  &&  “ (retval_4 = (qcv_sat8 (a3))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (qcv_sat8 (a2))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (qcv_sat8 (a1))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_5 := vqmovn_s16_partial_solve_wit_5_pure -> vqmovn_s16_partial_solve_wit_5_aux.

Definition vqmovn_s16_partial_solve_wit_6_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qcv_sat8 (a4)))) (PreH2 : ((-128) <= retval_5)) (PreH3 : (retval_5 <= 127)) (PreH4 : (retval_4 = (qcv_sat8 (a3)))) (PreH5 : ((-128) <= retval_4)) (PreH6 : (retval_4 <= 127)) (PreH7 : (retval_3 = (qcv_sat8 (a2)))) (PreH8 : ((-128) <= retval_3)) (PreH9 : (retval_3 <= 127)) (PreH10 : (retval_2 = (qcv_sat8 (a1)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : (retval = (qcv_sat8 (a0)))) (PreH14 : ((-128) <= retval)) (PreH15 : (retval <= 127)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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

Definition vqmovn_s16_partial_solve_wit_6_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qcv_sat8 (a4)))) (PreH2 : ((-128) <= retval_5)) (PreH3 : (retval_5 <= 127)) (PreH4 : (retval_4 = (qcv_sat8 (a3)))) (PreH5 : ((-128) <= retval_4)) (PreH6 : (retval_4 <= 127)) (PreH7 : (retval_3 = (qcv_sat8 (a2)))) (PreH8 : ((-128) <= retval_3)) (PreH9 : (retval_3 <= 127)) (PreH10 : (retval_2 = (qcv_sat8 (a1)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : (retval = (qcv_sat8 (a0)))) (PreH14 : ((-128) <= retval)) (PreH15 : (retval <= 127)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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
  &&  “ (retval_5 = (qcv_sat8 (a4))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (qcv_sat8 (a3))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (qcv_sat8 (a2))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (qcv_sat8 (a1))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_6 := vqmovn_s16_partial_solve_wit_6_pure -> vqmovn_s16_partial_solve_wit_6_aux.

Definition vqmovn_s16_partial_solve_wit_7_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qcv_sat8 (a5)))) (PreH2 : ((-128) <= retval_6)) (PreH3 : (retval_6 <= 127)) (PreH4 : (retval_5 = (qcv_sat8 (a4)))) (PreH5 : ((-128) <= retval_5)) (PreH6 : (retval_5 <= 127)) (PreH7 : (retval_4 = (qcv_sat8 (a3)))) (PreH8 : ((-128) <= retval_4)) (PreH9 : (retval_4 <= 127)) (PreH10 : (retval_3 = (qcv_sat8 (a2)))) (PreH11 : ((-128) <= retval_3)) (PreH12 : (retval_3 <= 127)) (PreH13 : (retval_2 = (qcv_sat8 (a1)))) (PreH14 : ((-128) <= retval_2)) (PreH15 : (retval_2 <= 127)) (PreH16 : (retval = (qcv_sat8 (a0)))) (PreH17 : ((-128) <= retval)) (PreH18 : (retval <= 127)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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

Definition vqmovn_s16_partial_solve_wit_7_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qcv_sat8 (a5)))) (PreH2 : ((-128) <= retval_6)) (PreH3 : (retval_6 <= 127)) (PreH4 : (retval_5 = (qcv_sat8 (a4)))) (PreH5 : ((-128) <= retval_5)) (PreH6 : (retval_5 <= 127)) (PreH7 : (retval_4 = (qcv_sat8 (a3)))) (PreH8 : ((-128) <= retval_4)) (PreH9 : (retval_4 <= 127)) (PreH10 : (retval_3 = (qcv_sat8 (a2)))) (PreH11 : ((-128) <= retval_3)) (PreH12 : (retval_3 <= 127)) (PreH13 : (retval_2 = (qcv_sat8 (a1)))) (PreH14 : ((-128) <= retval_2)) (PreH15 : (retval_2 <= 127)) (PreH16 : (retval = (qcv_sat8 (a0)))) (PreH17 : ((-128) <= retval)) (PreH18 : (retval <= 127)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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
  &&  “ (retval_6 = (qcv_sat8 (a5))) ” 
  &&  “ ((-128) <= retval_6) ” 
  &&  “ (retval_6 <= 127) ” 
  &&  “ (retval_5 = (qcv_sat8 (a4))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (qcv_sat8 (a3))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (qcv_sat8 (a2))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (qcv_sat8 (a1))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_7 := vqmovn_s16_partial_solve_wit_7_pure -> vqmovn_s16_partial_solve_wit_7_aux.

Definition vqmovn_s16_partial_solve_wit_8_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qcv_sat8 (a6)))) (PreH2 : ((-128) <= retval_7)) (PreH3 : (retval_7 <= 127)) (PreH4 : (retval_6 = (qcv_sat8 (a5)))) (PreH5 : ((-128) <= retval_6)) (PreH6 : (retval_6 <= 127)) (PreH7 : (retval_5 = (qcv_sat8 (a4)))) (PreH8 : ((-128) <= retval_5)) (PreH9 : (retval_5 <= 127)) (PreH10 : (retval_4 = (qcv_sat8 (a3)))) (PreH11 : ((-128) <= retval_4)) (PreH12 : (retval_4 <= 127)) (PreH13 : (retval_3 = (qcv_sat8 (a2)))) (PreH14 : ((-128) <= retval_3)) (PreH15 : (retval_3 <= 127)) (PreH16 : (retval_2 = (qcv_sat8 (a1)))) (PreH17 : ((-128) <= retval_2)) (PreH18 : (retval_2 <= 127)) (PreH19 : (retval = (qcv_sat8 (a0)))) (PreH20 : ((-128) <= retval)) (PreH21 : (retval <= 127)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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

Definition vqmovn_s16_partial_solve_wit_8_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qcv_sat8 (a6)))) (PreH2 : ((-128) <= retval_7)) (PreH3 : (retval_7 <= 127)) (PreH4 : (retval_6 = (qcv_sat8 (a5)))) (PreH5 : ((-128) <= retval_6)) (PreH6 : (retval_6 <= 127)) (PreH7 : (retval_5 = (qcv_sat8 (a4)))) (PreH8 : ((-128) <= retval_5)) (PreH9 : (retval_5 <= 127)) (PreH10 : (retval_4 = (qcv_sat8 (a3)))) (PreH11 : ((-128) <= retval_4)) (PreH12 : (retval_4 <= 127)) (PreH13 : (retval_3 = (qcv_sat8 (a2)))) (PreH14 : ((-128) <= retval_3)) (PreH15 : (retval_3 <= 127)) (PreH16 : (retval_2 = (qcv_sat8 (a1)))) (PreH17 : ((-128) <= retval_2)) (PreH18 : (retval_2 <= 127)) (PreH19 : (retval = (qcv_sat8 (a0)))) (PreH20 : ((-128) <= retval)) (PreH21 : (retval <= 127)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
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
  &&  “ (retval_7 = (qcv_sat8 (a6))) ” 
  &&  “ ((-128) <= retval_7) ” 
  &&  “ (retval_7 <= 127) ” 
  &&  “ (retval_6 = (qcv_sat8 (a5))) ” 
  &&  “ ((-128) <= retval_6) ” 
  &&  “ (retval_6 <= 127) ” 
  &&  “ (retval_5 = (qcv_sat8 (a4))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (qcv_sat8 (a3))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (qcv_sat8 (a2))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (qcv_sat8 (a1))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition vqmovn_s16_partial_solve_wit_8 := vqmovn_s16_partial_solve_wit_8_pure -> vqmovn_s16_partial_solve_wit_8_aux.

Definition vqmovn_s16_partial_solve_wit_9 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qcv_sat8 (a7)))) (PreH2 : ((-128) <= retval_8)) (PreH3 : (retval_8 <= 127)) (PreH4 : (retval_7 = (qcv_sat8 (a6)))) (PreH5 : ((-128) <= retval_7)) (PreH6 : (retval_7 <= 127)) (PreH7 : (retval_6 = (qcv_sat8 (a5)))) (PreH8 : ((-128) <= retval_6)) (PreH9 : (retval_6 <= 127)) (PreH10 : (retval_5 = (qcv_sat8 (a4)))) (PreH11 : ((-128) <= retval_5)) (PreH12 : (retval_5 <= 127)) (PreH13 : (retval_4 = (qcv_sat8 (a3)))) (PreH14 : ((-128) <= retval_4)) (PreH15 : (retval_4 <= 127)) (PreH16 : (retval_3 = (qcv_sat8 (a2)))) (PreH17 : ((-128) <= retval_3)) (PreH18 : (retval_3 <= 127)) (PreH19 : (retval_2 = (qcv_sat8 (a1)))) (PreH20 : ((-128) <= retval_2)) (PreH21 : (retval_2 <= 127)) (PreH22 : (retval = (qcv_sat8 (a0)))) (PreH23 : ((-128) <= retval)) (PreH24 : (retval <= 127)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) ,
  (UndefStructPredint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ (retval_8 = (qcv_sat8 (a7))) ” 
  &&  “ ((-128) <= retval_8) ” 
  &&  “ (retval_8 <= 127) ” 
  &&  “ (retval_7 = (qcv_sat8 (a6))) ” 
  &&  “ ((-128) <= retval_7) ” 
  &&  “ (retval_7 <= 127) ” 
  &&  “ (retval_6 = (qcv_sat8 (a5))) ” 
  &&  “ ((-128) <= retval_6) ” 
  &&  “ (retval_6 <= 127) ” 
  &&  “ (retval_5 = (qcv_sat8 (a4))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (qcv_sat8 (a3))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (qcv_sat8 (a2))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (qcv_sat8 (a1))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (qcv_sat8 (a0))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
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
  &&  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Module Type VC_Correct.


Axiom proof_of_vqmovn_s16_return_wit_1 : vqmovn_s16_return_wit_1.
Axiom proof_of_vqmovn_s16_partial_solve_wit_1_pure : vqmovn_s16_partial_solve_wit_1_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_1 : vqmovn_s16_partial_solve_wit_1.
Axiom proof_of_vqmovn_s16_partial_solve_wit_2_pure : vqmovn_s16_partial_solve_wit_2_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_2 : vqmovn_s16_partial_solve_wit_2.
Axiom proof_of_vqmovn_s16_partial_solve_wit_3_pure : vqmovn_s16_partial_solve_wit_3_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_3 : vqmovn_s16_partial_solve_wit_3.
Axiom proof_of_vqmovn_s16_partial_solve_wit_4_pure : vqmovn_s16_partial_solve_wit_4_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_4 : vqmovn_s16_partial_solve_wit_4.
Axiom proof_of_vqmovn_s16_partial_solve_wit_5_pure : vqmovn_s16_partial_solve_wit_5_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_5 : vqmovn_s16_partial_solve_wit_5.
Axiom proof_of_vqmovn_s16_partial_solve_wit_6_pure : vqmovn_s16_partial_solve_wit_6_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_6 : vqmovn_s16_partial_solve_wit_6.
Axiom proof_of_vqmovn_s16_partial_solve_wit_7_pure : vqmovn_s16_partial_solve_wit_7_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_7 : vqmovn_s16_partial_solve_wit_7.
Axiom proof_of_vqmovn_s16_partial_solve_wit_8_pure : vqmovn_s16_partial_solve_wit_8_pure.
Axiom proof_of_vqmovn_s16_partial_solve_wit_8 : vqmovn_s16_partial_solve_wit_8.
Axiom proof_of_vqmovn_s16_partial_solve_wit_9 : vqmovn_s16_partial_solve_wit_9.

End VC_Correct.
