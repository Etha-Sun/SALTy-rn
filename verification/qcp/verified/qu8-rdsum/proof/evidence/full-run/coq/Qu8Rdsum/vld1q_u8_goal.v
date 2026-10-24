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
Require Import Qu8Rdsum.Model.
Require Import Qu8Rdsum.Types.
Require Import Qu8Rdsum.MemoryModel.
Require Import Qu8Rdsum.LoadModel.
Local Open Scope sac.

(*----- Function vld1q_u8 -----*)

Definition vld1q_u8_safety_wit_1 := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 16 )) ,
  (UndefStructPreduint8x16_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (rd_mem M )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1q_u8_safety_wit_2 := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 16 )) ,
  (UndefStructPreduint8x16_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (rd_mem M )
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_3 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 16 )) ,
  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  (rd_mem M )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vld1q_u8_safety_wit_4 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 16 )) ,
  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  (rd_mem M )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_5 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vld1q_u8_safety_wit_6 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_7 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vld1q_u8_safety_wit_8 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_9 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition vld1q_u8_safety_wit_10 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_11 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition vld1q_u8_safety_wit_12 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_13 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition vld1q_u8_safety_wit_14 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_15 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition vld1q_u8_safety_wit_16 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_17 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 < p_pre)) (PreH26 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH27 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1q_u8_safety_wit_18 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 < p_pre)) (PreH26 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH27 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_19 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= 255)) (PreH4 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= 255)) (PreH10 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= 255)) (PreH13 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= 255)) (PreH16 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= 255)) (PreH19 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= 255)) (PreH22 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= 255)) (PreH25 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= 255)) (PreH28 : (0 < p_pre)) (PreH29 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH30 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition vld1q_u8_safety_wit_20 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= 255)) (PreH4 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= 255)) (PreH10 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= 255)) (PreH13 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= 255)) (PreH16 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= 255)) (PreH19 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= 255)) (PreH22 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= 255)) (PreH25 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= 255)) (PreH28 : (0 < p_pre)) (PreH29 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH30 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_21 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= 255)) (PreH4 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= 255)) (PreH31 : (0 < p_pre)) (PreH32 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH33 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition vld1q_u8_safety_wit_22 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= 255)) (PreH4 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= 255)) (PreH31 : (0 < p_pre)) (PreH32 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH33 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_23 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= 255)) (PreH4 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= 255)) (PreH7 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= 255)) (PreH10 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= 255)) (PreH13 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= 255)) (PreH16 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= 255)) (PreH22 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= 255)) (PreH25 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= 255)) (PreH28 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= 255)) (PreH31 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= 255)) (PreH34 : (0 < p_pre)) (PreH35 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH36 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition vld1q_u8_safety_wit_24 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= 255)) (PreH4 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= 255)) (PreH7 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= 255)) (PreH10 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= 255)) (PreH13 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= 255)) (PreH16 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= 255)) (PreH22 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= 255)) (PreH25 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= 255)) (PreH28 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= 255)) (PreH31 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= 255)) (PreH34 : (0 < p_pre)) (PreH35 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH36 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_25 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= 255)) (PreH4 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= 255)) (PreH7 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= 255)) (PreH10 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= 255)) (PreH13 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= 255)) (PreH16 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= 255)) (PreH19 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= 255)) (PreH22 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= 255)) (PreH28 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= 255)) (PreH31 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= 255)) (PreH34 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= 255)) (PreH37 : (0 < p_pre)) (PreH38 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH39 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition vld1q_u8_safety_wit_26 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= 255)) (PreH4 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= 255)) (PreH7 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= 255)) (PreH10 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= 255)) (PreH13 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= 255)) (PreH16 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= 255)) (PreH19 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= 255)) (PreH22 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= 255)) (PreH28 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= 255)) (PreH31 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= 255)) (PreH34 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= 255)) (PreH37 : (0 < p_pre)) (PreH38 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH39 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_27 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= 255)) (PreH4 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= 255)) (PreH7 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= 255)) (PreH10 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= 255)) (PreH13 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= 255)) (PreH16 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= 255)) (PreH19 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= 255)) (PreH22 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= 255)) (PreH25 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= 255)) (PreH28 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= 255)) (PreH31 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= 255)) (PreH34 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= 255)) (PreH37 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= 255)) (PreH40 : (0 < p_pre)) (PreH41 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH42 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition vld1q_u8_safety_wit_28 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= 255)) (PreH4 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= 255)) (PreH7 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= 255)) (PreH10 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= 255)) (PreH13 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= 255)) (PreH16 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= 255)) (PreH19 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= 255)) (PreH22 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= 255)) (PreH25 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= 255)) (PreH28 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= 255)) (PreH31 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= 255)) (PreH34 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= 255)) (PreH37 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= 255)) (PreH40 : (0 < p_pre)) (PreH41 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH42 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_29 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= 255)) (PreH4 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= 255)) (PreH7 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= 255)) (PreH10 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= 255)) (PreH13 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= 255)) (PreH16 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= 255)) (PreH19 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= 255)) (PreH22 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= 255)) (PreH25 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= 255)) (PreH28 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= 255)) (PreH31 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= 255)) (PreH34 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= 255)) (PreH37 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= 255)) (PreH40 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= 255)) (PreH43 : (0 < p_pre)) (PreH44 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH45 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition vld1q_u8_safety_wit_30 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= 255)) (PreH4 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= 255)) (PreH7 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= 255)) (PreH10 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= 255)) (PreH13 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= 255)) (PreH16 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= 255)) (PreH19 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= 255)) (PreH22 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= 255)) (PreH25 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= 255)) (PreH28 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= 255)) (PreH31 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= 255)) (PreH34 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= 255)) (PreH37 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= 255)) (PreH40 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= 255)) (PreH43 : (0 < p_pre)) (PreH44 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH45 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_safety_wit_31 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rd_read_lane (M) (p_pre) (14) (16)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= 255)) (PreH4 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= 255)) (PreH7 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= 255)) (PreH10 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= 255)) (PreH13 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= 255)) (PreH16 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= 255)) (PreH19 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= 255)) (PreH22 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= 255)) (PreH25 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= 255)) (PreH28 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= 255)) (PreH31 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= 255)) (PreH34 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= 255)) (PreH37 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= 255)) (PreH40 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= 255)) (PreH43 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= 255)) (PreH46 : (0 < p_pre)) (PreH47 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH48 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition vld1q_u8_safety_wit_32 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rd_read_lane (M) (p_pre) (14) (16)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= 255)) (PreH4 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= 255)) (PreH7 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= 255)) (PreH10 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= 255)) (PreH13 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= 255)) (PreH16 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= 255)) (PreH19 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= 255)) (PreH22 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= 255)) (PreH25 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= 255)) (PreH28 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= 255)) (PreH31 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= 255)) (PreH34 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= 255)) (PreH37 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= 255)) (PreH40 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= 255)) (PreH43 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= 255)) (PreH46 : (0 < p_pre)) (PreH47 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH48 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_u8_return_wit_1 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (record_return: Z) (PreH1 : (retval_16 = (rd_read_lane (M) (p_pre) (15) (16)))) (PreH2 : (0 <= retval_16)) (PreH3 : (retval_16 <= 255)) (PreH4 : (retval_15 = (rd_read_lane (M) (p_pre) (14) (16)))) (PreH5 : (0 <= retval_15)) (PreH6 : (retval_15 <= 255)) (PreH7 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH8 : (0 <= retval_14)) (PreH9 : (retval_14 <= 255)) (PreH10 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH11 : (0 <= retval_13)) (PreH12 : (retval_13 <= 255)) (PreH13 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH14 : (0 <= retval_12)) (PreH15 : (retval_12 <= 255)) (PreH16 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH17 : (0 <= retval_11)) (PreH18 : (retval_11 <= 255)) (PreH19 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH20 : (0 <= retval_10)) (PreH21 : (retval_10 <= 255)) (PreH22 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH23 : (0 <= retval_9)) (PreH24 : (retval_9 <= 255)) (PreH25 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH26 : (0 <= retval_8)) (PreH27 : (retval_8 <= 255)) (PreH28 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH29 : (0 <= retval_7)) (PreH30 : (retval_7 <= 255)) (PreH31 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH32 : (0 <= retval_6)) (PreH33 : (retval_6 <= 255)) (PreH34 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH35 : (0 <= retval_5)) (PreH36 : (retval_5 <= 255)) (PreH37 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH38 : (0 <= retval_4)) (PreH39 : (retval_4 <= 255)) (PreH40 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH41 : (0 <= retval_3)) (PreH42 : (retval_3 <= 255)) (PreH43 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH44 : (0 <= retval_2)) (PreH45 : (retval_2 <= 255)) (PreH46 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH47 : (0 <= retval)) (PreH48 : (retval <= 255)) (PreH49 : (0 < p_pre)) (PreH50 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH51 : (rd_window M p_pre 16 )) ,
  ((&((record_return)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> retval_16)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> retval)
  **  (rd_mem M )
|--
  (rd_mem M )
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> (rd_read_lane (M) (p_pre) (0) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> (rd_read_lane (M) (p_pre) (1) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> (rd_read_lane (M) (p_pre) (2) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> (rd_read_lane (M) (p_pre) (3) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> (rd_read_lane (M) (p_pre) (4) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> (rd_read_lane (M) (p_pre) (5) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> (rd_read_lane (M) (p_pre) (6) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> (rd_read_lane (M) (p_pre) (7) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> (rd_read_lane (M) (p_pre) (8) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> (rd_read_lane (M) (p_pre) (9) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> (rd_read_lane (M) (p_pre) (10) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> (rd_read_lane (M) (p_pre) (11) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> (rd_read_lane (M) (p_pre) (12) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> (rd_read_lane (M) (p_pre) (13) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> (rd_read_lane (M) (p_pre) (14) (16)))
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> (rd_read_lane (M) (p_pre) (15) (16)))
.

Definition vld1q_u8_partial_solve_wit_1_pure := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 16 )) ,
  (UndefStructPreduint8x16_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (rd_mem M )
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_1_aux := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 16 )) ,
  (UndefStructPreduint8x16_t ( &( "r" ) ) )
  **  (rd_mem M )
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  (UndefStructPreduint8x16_t ( &( "r" ) ) )
.

Definition vld1q_u8_partial_solve_wit_1 := vld1q_u8_partial_solve_wit_1_pure -> vld1q_u8_partial_solve_wit_1_aux.

Definition vld1q_u8_partial_solve_wit_2_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 16 )) ,
  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  (rd_mem M )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_2_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 16 )) ,
  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  (rd_mem M )
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_2 := vld1q_u8_partial_solve_wit_2_pure -> vld1q_u8_partial_solve_wit_2_aux.

Definition vld1q_u8_partial_solve_wit_3_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_3_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_3 := vld1q_u8_partial_solve_wit_3_pure -> vld1q_u8_partial_solve_wit_3_aux.

Definition vld1q_u8_partial_solve_wit_4_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_4_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_4 := vld1q_u8_partial_solve_wit_4_pure -> vld1q_u8_partial_solve_wit_4_aux.

Definition vld1q_u8_partial_solve_wit_5_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_5_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_5 := vld1q_u8_partial_solve_wit_5_pure -> vld1q_u8_partial_solve_wit_5_aux.

Definition vld1q_u8_partial_solve_wit_6_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_6_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_6 := vld1q_u8_partial_solve_wit_6_pure -> vld1q_u8_partial_solve_wit_6_aux.

Definition vld1q_u8_partial_solve_wit_7_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_7_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_7 := vld1q_u8_partial_solve_wit_7_pure -> vld1q_u8_partial_solve_wit_7_aux.

Definition vld1q_u8_partial_solve_wit_8_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_8_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_8 := vld1q_u8_partial_solve_wit_8_pure -> vld1q_u8_partial_solve_wit_8_aux.

Definition vld1q_u8_partial_solve_wit_9_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 < p_pre)) (PreH26 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH27 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_9_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 255)) (PreH4 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 255)) (PreH25 : (0 < p_pre)) (PreH26 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH27 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_9 := vld1q_u8_partial_solve_wit_9_pure -> vld1q_u8_partial_solve_wit_9_aux.

Definition vld1q_u8_partial_solve_wit_10_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= 255)) (PreH4 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= 255)) (PreH10 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= 255)) (PreH13 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= 255)) (PreH16 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= 255)) (PreH19 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= 255)) (PreH22 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= 255)) (PreH25 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= 255)) (PreH28 : (0 < p_pre)) (PreH29 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH30 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_10_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= 255)) (PreH4 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= 255)) (PreH10 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= 255)) (PreH13 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= 255)) (PreH16 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= 255)) (PreH19 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= 255)) (PreH22 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= 255)) (PreH25 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= 255)) (PreH28 : (0 < p_pre)) (PreH29 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH30 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_10 := vld1q_u8_partial_solve_wit_10_pure -> vld1q_u8_partial_solve_wit_10_aux.

Definition vld1q_u8_partial_solve_wit_11_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= 255)) (PreH4 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= 255)) (PreH31 : (0 < p_pre)) (PreH32 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH33 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_11_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= 255)) (PreH4 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= 255)) (PreH31 : (0 < p_pre)) (PreH32 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH33 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_10 = (rd_read_lane (M) (p_pre) (9) (16))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 255) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_11 := vld1q_u8_partial_solve_wit_11_pure -> vld1q_u8_partial_solve_wit_11_aux.

Definition vld1q_u8_partial_solve_wit_12_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= 255)) (PreH4 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= 255)) (PreH7 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= 255)) (PreH10 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= 255)) (PreH13 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= 255)) (PreH16 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= 255)) (PreH22 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= 255)) (PreH25 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= 255)) (PreH28 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= 255)) (PreH31 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= 255)) (PreH34 : (0 < p_pre)) (PreH35 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH36 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_12_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= 255)) (PreH4 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= 255)) (PreH7 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= 255)) (PreH10 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= 255)) (PreH13 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= 255)) (PreH16 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= 255)) (PreH22 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= 255)) (PreH25 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= 255)) (PreH28 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= 255)) (PreH31 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= 255)) (PreH34 : (0 < p_pre)) (PreH35 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH36 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_11 = (rd_read_lane (M) (p_pre) (10) (16))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 255) ” 
  &&  “ (retval_10 = (rd_read_lane (M) (p_pre) (9) (16))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 255) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_12 := vld1q_u8_partial_solve_wit_12_pure -> vld1q_u8_partial_solve_wit_12_aux.

Definition vld1q_u8_partial_solve_wit_13_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= 255)) (PreH4 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= 255)) (PreH7 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= 255)) (PreH10 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= 255)) (PreH13 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= 255)) (PreH16 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= 255)) (PreH19 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= 255)) (PreH22 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= 255)) (PreH28 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= 255)) (PreH31 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= 255)) (PreH34 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= 255)) (PreH37 : (0 < p_pre)) (PreH38 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH39 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_13_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= 255)) (PreH4 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= 255)) (PreH7 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= 255)) (PreH10 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= 255)) (PreH13 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= 255)) (PreH16 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= 255)) (PreH19 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= 255)) (PreH22 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= 255)) (PreH28 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= 255)) (PreH31 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= 255)) (PreH34 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= 255)) (PreH37 : (0 < p_pre)) (PreH38 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH39 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_12 = (rd_read_lane (M) (p_pre) (11) (16))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 255) ” 
  &&  “ (retval_11 = (rd_read_lane (M) (p_pre) (10) (16))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 255) ” 
  &&  “ (retval_10 = (rd_read_lane (M) (p_pre) (9) (16))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 255) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_13 := vld1q_u8_partial_solve_wit_13_pure -> vld1q_u8_partial_solve_wit_13_aux.

Definition vld1q_u8_partial_solve_wit_14_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= 255)) (PreH4 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= 255)) (PreH7 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= 255)) (PreH10 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= 255)) (PreH13 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= 255)) (PreH16 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= 255)) (PreH19 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= 255)) (PreH22 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= 255)) (PreH25 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= 255)) (PreH28 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= 255)) (PreH31 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= 255)) (PreH34 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= 255)) (PreH37 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= 255)) (PreH40 : (0 < p_pre)) (PreH41 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH42 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_14_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= 255)) (PreH4 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= 255)) (PreH7 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= 255)) (PreH10 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= 255)) (PreH13 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= 255)) (PreH16 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= 255)) (PreH19 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= 255)) (PreH22 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= 255)) (PreH25 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= 255)) (PreH28 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= 255)) (PreH31 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= 255)) (PreH34 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= 255)) (PreH37 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= 255)) (PreH40 : (0 < p_pre)) (PreH41 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH42 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_13 = (rd_read_lane (M) (p_pre) (12) (16))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 255) ” 
  &&  “ (retval_12 = (rd_read_lane (M) (p_pre) (11) (16))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 255) ” 
  &&  “ (retval_11 = (rd_read_lane (M) (p_pre) (10) (16))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 255) ” 
  &&  “ (retval_10 = (rd_read_lane (M) (p_pre) (9) (16))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 255) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_14 := vld1q_u8_partial_solve_wit_14_pure -> vld1q_u8_partial_solve_wit_14_aux.

Definition vld1q_u8_partial_solve_wit_15_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= 255)) (PreH4 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= 255)) (PreH7 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= 255)) (PreH10 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= 255)) (PreH13 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= 255)) (PreH16 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= 255)) (PreH19 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= 255)) (PreH22 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= 255)) (PreH25 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= 255)) (PreH28 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= 255)) (PreH31 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= 255)) (PreH34 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= 255)) (PreH37 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= 255)) (PreH40 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= 255)) (PreH43 : (0 < p_pre)) (PreH44 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH45 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_15_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= 255)) (PreH4 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= 255)) (PreH7 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= 255)) (PreH10 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= 255)) (PreH13 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= 255)) (PreH16 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= 255)) (PreH19 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= 255)) (PreH22 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= 255)) (PreH25 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= 255)) (PreH28 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= 255)) (PreH31 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= 255)) (PreH34 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= 255)) (PreH37 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= 255)) (PreH40 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= 255)) (PreH43 : (0 < p_pre)) (PreH44 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH45 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_14 = (rd_read_lane (M) (p_pre) (13) (16))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 255) ” 
  &&  “ (retval_13 = (rd_read_lane (M) (p_pre) (12) (16))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 255) ” 
  &&  “ (retval_12 = (rd_read_lane (M) (p_pre) (11) (16))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 255) ” 
  &&  “ (retval_11 = (rd_read_lane (M) (p_pre) (10) (16))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 255) ” 
  &&  “ (retval_10 = (rd_read_lane (M) (p_pre) (9) (16))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 255) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_15 := vld1q_u8_partial_solve_wit_15_pure -> vld1q_u8_partial_solve_wit_15_aux.

Definition vld1q_u8_partial_solve_wit_16_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rd_read_lane (M) (p_pre) (14) (16)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= 255)) (PreH4 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= 255)) (PreH7 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= 255)) (PreH10 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= 255)) (PreH13 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= 255)) (PreH16 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= 255)) (PreH19 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= 255)) (PreH22 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= 255)) (PreH25 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= 255)) (PreH28 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= 255)) (PreH31 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= 255)) (PreH34 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= 255)) (PreH37 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= 255)) (PreH40 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= 255)) (PreH43 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= 255)) (PreH46 : (0 < p_pre)) (PreH47 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH48 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
.

Definition vld1q_u8_partial_solve_wit_16_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rd_read_lane (M) (p_pre) (14) (16)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= 255)) (PreH4 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= 255)) (PreH7 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= 255)) (PreH10 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= 255)) (PreH13 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= 255)) (PreH16 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= 255)) (PreH19 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= 255)) (PreH22 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= 255)) (PreH25 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= 255)) (PreH28 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= 255)) (PreH31 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= 255)) (PreH34 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= 255)) (PreH37 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= 255)) (PreH40 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= 255)) (PreH43 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= 255)) (PreH46 : (0 < p_pre)) (PreH47 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH48 : (rd_window M p_pre 16 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 < 32) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 32) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ” 
  &&  “ (retval_15 = (rd_read_lane (M) (p_pre) (14) (16))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 255) ” 
  &&  “ (retval_14 = (rd_read_lane (M) (p_pre) (13) (16))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 255) ” 
  &&  “ (retval_13 = (rd_read_lane (M) (p_pre) (12) (16))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 255) ” 
  &&  “ (retval_12 = (rd_read_lane (M) (p_pre) (11) (16))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 255) ” 
  &&  “ (retval_11 = (rd_read_lane (M) (p_pre) (10) (16))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 255) ” 
  &&  “ (retval_10 = (rd_read_lane (M) (p_pre) (9) (16))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 255) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
.

Definition vld1q_u8_partial_solve_wit_16 := vld1q_u8_partial_solve_wit_16_pure -> vld1q_u8_partial_solve_wit_16_aux.

Definition vld1q_u8_partial_solve_wit_17 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (record_return: Z) (PreH1 : (retval_16 = (rd_read_lane (M) (p_pre) (15) (16)))) (PreH2 : (0 <= retval_16)) (PreH3 : (retval_16 <= 255)) (PreH4 : (retval_15 = (rd_read_lane (M) (p_pre) (14) (16)))) (PreH5 : (0 <= retval_15)) (PreH6 : (retval_15 <= 255)) (PreH7 : (retval_14 = (rd_read_lane (M) (p_pre) (13) (16)))) (PreH8 : (0 <= retval_14)) (PreH9 : (retval_14 <= 255)) (PreH10 : (retval_13 = (rd_read_lane (M) (p_pre) (12) (16)))) (PreH11 : (0 <= retval_13)) (PreH12 : (retval_13 <= 255)) (PreH13 : (retval_12 = (rd_read_lane (M) (p_pre) (11) (16)))) (PreH14 : (0 <= retval_12)) (PreH15 : (retval_12 <= 255)) (PreH16 : (retval_11 = (rd_read_lane (M) (p_pre) (10) (16)))) (PreH17 : (0 <= retval_11)) (PreH18 : (retval_11 <= 255)) (PreH19 : (retval_10 = (rd_read_lane (M) (p_pre) (9) (16)))) (PreH20 : (0 <= retval_10)) (PreH21 : (retval_10 <= 255)) (PreH22 : (retval_9 = (rd_read_lane (M) (p_pre) (8) (16)))) (PreH23 : (0 <= retval_9)) (PreH24 : (retval_9 <= 255)) (PreH25 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (16)))) (PreH26 : (0 <= retval_8)) (PreH27 : (retval_8 <= 255)) (PreH28 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (16)))) (PreH29 : (0 <= retval_7)) (PreH30 : (retval_7 <= 255)) (PreH31 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (16)))) (PreH32 : (0 <= retval_6)) (PreH33 : (retval_6 <= 255)) (PreH34 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (16)))) (PreH35 : (0 <= retval_5)) (PreH36 : (retval_5 <= 255)) (PreH37 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (16)))) (PreH38 : (0 <= retval_4)) (PreH39 : (retval_4 <= 255)) (PreH40 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (16)))) (PreH41 : (0 <= retval_3)) (PreH42 : (retval_3 <= 255)) (PreH43 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (16)))) (PreH44 : (0 <= retval_2)) (PreH45 : (retval_2 <= 255)) (PreH46 : (retval = (rd_read_lane (M) (p_pre) (0) (16)))) (PreH47 : (0 <= retval)) (PreH48 : (retval <= 255)) (PreH49 : (0 < p_pre)) (PreH50 : ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH51 : (rd_window M p_pre 16 )) ,
  (UndefStructPreduint8x16_t record_return )
  **  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
|--
  “ (retval_16 = (rd_read_lane (M) (p_pre) (15) (16))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 255) ” 
  &&  “ (retval_15 = (rd_read_lane (M) (p_pre) (14) (16))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 255) ” 
  &&  “ (retval_14 = (rd_read_lane (M) (p_pre) (13) (16))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 255) ” 
  &&  “ (retval_13 = (rd_read_lane (M) (p_pre) (12) (16))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 255) ” 
  &&  “ (retval_12 = (rd_read_lane (M) (p_pre) (11) (16))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 255) ” 
  &&  “ (retval_11 = (rd_read_lane (M) (p_pre) (10) (16))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 255) ” 
  &&  “ (retval_10 = (rd_read_lane (M) (p_pre) (9) (16))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 255) ” 
  &&  “ (retval_9 = (rd_read_lane (M) (p_pre) (8) (16))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 255) ” 
  &&  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (16))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (16))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (16))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (16))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (16))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (16))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (16))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (16))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (16 * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 16 ) ”
  &&  ((&((record_return)  # "uint8x16_t" ->ₛ "s15")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UChar  |-> retval_16)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s14")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UChar  |-> retval_15)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s13")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UChar  |-> retval_14)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s12")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UChar  |-> retval_13)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s11")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UChar  |-> retval_12)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s10")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UChar  |-> retval_11)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s9")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UChar  |-> retval_10)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s8")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UChar  |-> retval_9)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> retval_8)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> retval_7)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> retval_6)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> retval_5)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> retval_4)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> retval_3)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> retval_2)
  **  ((&((record_return)  # "uint8x16_t" ->ₛ "s0")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> retval)
  **  (rd_mem M )
.

Module Type VC_Correct.


Axiom proof_of_vld1q_u8_safety_wit_1 : vld1q_u8_safety_wit_1.
Axiom proof_of_vld1q_u8_safety_wit_2 : vld1q_u8_safety_wit_2.
Axiom proof_of_vld1q_u8_safety_wit_3 : vld1q_u8_safety_wit_3.
Axiom proof_of_vld1q_u8_safety_wit_4 : vld1q_u8_safety_wit_4.
Axiom proof_of_vld1q_u8_safety_wit_5 : vld1q_u8_safety_wit_5.
Axiom proof_of_vld1q_u8_safety_wit_6 : vld1q_u8_safety_wit_6.
Axiom proof_of_vld1q_u8_safety_wit_7 : vld1q_u8_safety_wit_7.
Axiom proof_of_vld1q_u8_safety_wit_8 : vld1q_u8_safety_wit_8.
Axiom proof_of_vld1q_u8_safety_wit_9 : vld1q_u8_safety_wit_9.
Axiom proof_of_vld1q_u8_safety_wit_10 : vld1q_u8_safety_wit_10.
Axiom proof_of_vld1q_u8_safety_wit_11 : vld1q_u8_safety_wit_11.
Axiom proof_of_vld1q_u8_safety_wit_12 : vld1q_u8_safety_wit_12.
Axiom proof_of_vld1q_u8_safety_wit_13 : vld1q_u8_safety_wit_13.
Axiom proof_of_vld1q_u8_safety_wit_14 : vld1q_u8_safety_wit_14.
Axiom proof_of_vld1q_u8_safety_wit_15 : vld1q_u8_safety_wit_15.
Axiom proof_of_vld1q_u8_safety_wit_16 : vld1q_u8_safety_wit_16.
Axiom proof_of_vld1q_u8_safety_wit_17 : vld1q_u8_safety_wit_17.
Axiom proof_of_vld1q_u8_safety_wit_18 : vld1q_u8_safety_wit_18.
Axiom proof_of_vld1q_u8_safety_wit_19 : vld1q_u8_safety_wit_19.
Axiom proof_of_vld1q_u8_safety_wit_20 : vld1q_u8_safety_wit_20.
Axiom proof_of_vld1q_u8_safety_wit_21 : vld1q_u8_safety_wit_21.
Axiom proof_of_vld1q_u8_safety_wit_22 : vld1q_u8_safety_wit_22.
Axiom proof_of_vld1q_u8_safety_wit_23 : vld1q_u8_safety_wit_23.
Axiom proof_of_vld1q_u8_safety_wit_24 : vld1q_u8_safety_wit_24.
Axiom proof_of_vld1q_u8_safety_wit_25 : vld1q_u8_safety_wit_25.
Axiom proof_of_vld1q_u8_safety_wit_26 : vld1q_u8_safety_wit_26.
Axiom proof_of_vld1q_u8_safety_wit_27 : vld1q_u8_safety_wit_27.
Axiom proof_of_vld1q_u8_safety_wit_28 : vld1q_u8_safety_wit_28.
Axiom proof_of_vld1q_u8_safety_wit_29 : vld1q_u8_safety_wit_29.
Axiom proof_of_vld1q_u8_safety_wit_30 : vld1q_u8_safety_wit_30.
Axiom proof_of_vld1q_u8_safety_wit_31 : vld1q_u8_safety_wit_31.
Axiom proof_of_vld1q_u8_safety_wit_32 : vld1q_u8_safety_wit_32.
Axiom proof_of_vld1q_u8_return_wit_1 : vld1q_u8_return_wit_1.
Axiom proof_of_vld1q_u8_partial_solve_wit_1_pure : vld1q_u8_partial_solve_wit_1_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_1 : vld1q_u8_partial_solve_wit_1.
Axiom proof_of_vld1q_u8_partial_solve_wit_2_pure : vld1q_u8_partial_solve_wit_2_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_2 : vld1q_u8_partial_solve_wit_2.
Axiom proof_of_vld1q_u8_partial_solve_wit_3_pure : vld1q_u8_partial_solve_wit_3_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_3 : vld1q_u8_partial_solve_wit_3.
Axiom proof_of_vld1q_u8_partial_solve_wit_4_pure : vld1q_u8_partial_solve_wit_4_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_4 : vld1q_u8_partial_solve_wit_4.
Axiom proof_of_vld1q_u8_partial_solve_wit_5_pure : vld1q_u8_partial_solve_wit_5_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_5 : vld1q_u8_partial_solve_wit_5.
Axiom proof_of_vld1q_u8_partial_solve_wit_6_pure : vld1q_u8_partial_solve_wit_6_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_6 : vld1q_u8_partial_solve_wit_6.
Axiom proof_of_vld1q_u8_partial_solve_wit_7_pure : vld1q_u8_partial_solve_wit_7_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_7 : vld1q_u8_partial_solve_wit_7.
Axiom proof_of_vld1q_u8_partial_solve_wit_8_pure : vld1q_u8_partial_solve_wit_8_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_8 : vld1q_u8_partial_solve_wit_8.
Axiom proof_of_vld1q_u8_partial_solve_wit_9_pure : vld1q_u8_partial_solve_wit_9_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_9 : vld1q_u8_partial_solve_wit_9.
Axiom proof_of_vld1q_u8_partial_solve_wit_10_pure : vld1q_u8_partial_solve_wit_10_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_10 : vld1q_u8_partial_solve_wit_10.
Axiom proof_of_vld1q_u8_partial_solve_wit_11_pure : vld1q_u8_partial_solve_wit_11_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_11 : vld1q_u8_partial_solve_wit_11.
Axiom proof_of_vld1q_u8_partial_solve_wit_12_pure : vld1q_u8_partial_solve_wit_12_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_12 : vld1q_u8_partial_solve_wit_12.
Axiom proof_of_vld1q_u8_partial_solve_wit_13_pure : vld1q_u8_partial_solve_wit_13_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_13 : vld1q_u8_partial_solve_wit_13.
Axiom proof_of_vld1q_u8_partial_solve_wit_14_pure : vld1q_u8_partial_solve_wit_14_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_14 : vld1q_u8_partial_solve_wit_14.
Axiom proof_of_vld1q_u8_partial_solve_wit_15_pure : vld1q_u8_partial_solve_wit_15_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_15 : vld1q_u8_partial_solve_wit_15.
Axiom proof_of_vld1q_u8_partial_solve_wit_16_pure : vld1q_u8_partial_solve_wit_16_pure.
Axiom proof_of_vld1q_u8_partial_solve_wit_16 : vld1q_u8_partial_solve_wit_16.
Axiom proof_of_vld1q_u8_partial_solve_wit_17 : vld1q_u8_partial_solve_wit_17.

End VC_Correct.
