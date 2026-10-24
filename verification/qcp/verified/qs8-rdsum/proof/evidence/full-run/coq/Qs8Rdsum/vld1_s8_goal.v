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
Require Import Qs8Rdsum.Model.
Require Import Qs8Rdsum.Types.
Require Import Qs8Rdsum.MemoryModel.
Require Import Qs8Rdsum.LoadModel.
Local Open Scope sac.

(*----- Function vld1_s8 -----*)

Definition vld1_s8_safety_wit_1 := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 8 )) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (rd_mem M )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1_s8_safety_wit_2 := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 8 )) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (rd_mem M )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_3 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 8 )) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (rd_mem M )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vld1_s8_safety_wit_4 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 8 )) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (rd_mem M )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_5 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH2 : ((-128) <= retval_2)) (PreH3 : (retval_2 <= 127)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vld1_s8_safety_wit_6 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH2 : ((-128) <= retval_2)) (PreH3 : (retval_2 <= 127)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_7 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH2 : ((-128) <= retval_3)) (PreH3 : (retval_3 <= 127)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH5 : ((-128) <= retval_2)) (PreH6 : (retval_2 <= 127)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH8 : ((-128) <= retval)) (PreH9 : (retval <= 127)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vld1_s8_safety_wit_8 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH2 : ((-128) <= retval_3)) (PreH3 : (retval_3 <= 127)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH5 : ((-128) <= retval_2)) (PreH6 : (retval_2 <= 127)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH8 : ((-128) <= retval)) (PreH9 : (retval <= 127)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_9 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH2 : ((-128) <= retval_4)) (PreH3 : (retval_4 <= 127)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH5 : ((-128) <= retval_3)) (PreH6 : (retval_3 <= 127)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH11 : ((-128) <= retval)) (PreH12 : (retval <= 127)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition vld1_s8_safety_wit_10 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH2 : ((-128) <= retval_4)) (PreH3 : (retval_4 <= 127)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH5 : ((-128) <= retval_3)) (PreH6 : (retval_3 <= 127)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH11 : ((-128) <= retval)) (PreH12 : (retval <= 127)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_11 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH2 : ((-128) <= retval_5)) (PreH3 : (retval_5 <= 127)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH5 : ((-128) <= retval_4)) (PreH6 : (retval_4 <= 127)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH8 : ((-128) <= retval_3)) (PreH9 : (retval_3 <= 127)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH14 : ((-128) <= retval)) (PreH15 : (retval <= 127)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition vld1_s8_safety_wit_12 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH2 : ((-128) <= retval_5)) (PreH3 : (retval_5 <= 127)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH5 : ((-128) <= retval_4)) (PreH6 : (retval_4 <= 127)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH8 : ((-128) <= retval_3)) (PreH9 : (retval_3 <= 127)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH14 : ((-128) <= retval)) (PreH15 : (retval <= 127)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_13 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH2 : ((-128) <= retval_6)) (PreH3 : (retval_6 <= 127)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH5 : ((-128) <= retval_5)) (PreH6 : (retval_5 <= 127)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH8 : ((-128) <= retval_4)) (PreH9 : (retval_4 <= 127)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH11 : ((-128) <= retval_3)) (PreH12 : (retval_3 <= 127)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH14 : ((-128) <= retval_2)) (PreH15 : (retval_2 <= 127)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH17 : ((-128) <= retval)) (PreH18 : (retval <= 127)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition vld1_s8_safety_wit_14 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH2 : ((-128) <= retval_6)) (PreH3 : (retval_6 <= 127)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH5 : ((-128) <= retval_5)) (PreH6 : (retval_5 <= 127)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH8 : ((-128) <= retval_4)) (PreH9 : (retval_4 <= 127)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH11 : ((-128) <= retval_3)) (PreH12 : (retval_3 <= 127)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH14 : ((-128) <= retval_2)) (PreH15 : (retval_2 <= 127)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH17 : ((-128) <= retval)) (PreH18 : (retval <= 127)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_15 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (8)))) (PreH2 : ((-128) <= retval_7)) (PreH3 : (retval_7 <= 127)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH5 : ((-128) <= retval_6)) (PreH6 : (retval_6 <= 127)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH8 : ((-128) <= retval_5)) (PreH9 : (retval_5 <= 127)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH11 : ((-128) <= retval_4)) (PreH12 : (retval_4 <= 127)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH14 : ((-128) <= retval_3)) (PreH15 : (retval_3 <= 127)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH17 : ((-128) <= retval_2)) (PreH18 : (retval_2 <= 127)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH20 : ((-128) <= retval)) (PreH21 : (retval <= 127)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition vld1_s8_safety_wit_16 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (8)))) (PreH2 : ((-128) <= retval_7)) (PreH3 : (retval_7 <= 127)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH5 : ((-128) <= retval_6)) (PreH6 : (retval_6 <= 127)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH8 : ((-128) <= retval_5)) (PreH9 : (retval_5 <= 127)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH11 : ((-128) <= retval_4)) (PreH12 : (retval_4 <= 127)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH14 : ((-128) <= retval_3)) (PreH15 : (retval_3 <= 127)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH17 : ((-128) <= retval_2)) (PreH18 : (retval_2 <= 127)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH20 : ((-128) <= retval)) (PreH21 : (retval <= 127)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_return_wit_1 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (8)))) (PreH2 : ((-128) <= retval_8)) (PreH3 : (retval_8 <= 127)) (PreH4 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (8)))) (PreH5 : ((-128) <= retval_7)) (PreH6 : (retval_7 <= 127)) (PreH7 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH8 : ((-128) <= retval_6)) (PreH9 : (retval_6 <= 127)) (PreH10 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH11 : ((-128) <= retval_5)) (PreH12 : (retval_5 <= 127)) (PreH13 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH14 : ((-128) <= retval_4)) (PreH15 : (retval_4 <= 127)) (PreH16 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH17 : ((-128) <= retval_3)) (PreH18 : (retval_3 <= 127)) (PreH19 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH20 : ((-128) <= retval_2)) (PreH21 : (retval_2 <= 127)) (PreH22 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH23 : ((-128) <= retval)) (PreH24 : (retval <= 127)) (PreH25 : (0 < p_pre)) (PreH26 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH27 : (rd_window M p_pre 8 )) ,
  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> retval)
  **  (rd_mem M )
|--
  (rd_mem M )
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> (rd_read_lane (M) (p_pre) (0) (8)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> (rd_read_lane (M) (p_pre) (1) (8)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> (rd_read_lane (M) (p_pre) (2) (8)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> (rd_read_lane (M) (p_pre) (3) (8)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> (rd_read_lane (M) (p_pre) (4) (8)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> (rd_read_lane (M) (p_pre) (5) (8)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> (rd_read_lane (M) (p_pre) (6) (8)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> (rd_read_lane (M) (p_pre) (7) (8)))
.

Definition vld1_s8_partial_solve_wit_1_pure := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 8 )) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (rd_mem M )
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_1_aux := 
forall (p_pre: Z) (M: RDMap) (PreH1 : (0 < p_pre)) (PreH2 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH3 : (rd_window M p_pre 8 )) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  (rd_mem M )
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  (UndefStructPredint8x8_t ( &( "r" ) ) )
.

Definition vld1_s8_partial_solve_wit_1 := vld1_s8_partial_solve_wit_1_pure -> vld1_s8_partial_solve_wit_1_aux.

Definition vld1_s8_partial_solve_wit_2_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 8 )) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (rd_mem M )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_2_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (0 < p_pre)) (PreH5 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH6 : (rd_window M p_pre 8 )) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (rd_mem M )
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_2 := vld1_s8_partial_solve_wit_2_pure -> vld1_s8_partial_solve_wit_2_aux.

Definition vld1_s8_partial_solve_wit_3_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH2 : ((-128) <= retval_2)) (PreH3 : (retval_2 <= 127)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_3_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH2 : ((-128) <= retval_2)) (PreH3 : (retval_2 <= 127)) (PreH4 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : (0 < p_pre)) (PreH8 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH9 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (8))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_3 := vld1_s8_partial_solve_wit_3_pure -> vld1_s8_partial_solve_wit_3_aux.

Definition vld1_s8_partial_solve_wit_4_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH2 : ((-128) <= retval_3)) (PreH3 : (retval_3 <= 127)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH5 : ((-128) <= retval_2)) (PreH6 : (retval_2 <= 127)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH8 : ((-128) <= retval)) (PreH9 : (retval <= 127)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_4_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH2 : ((-128) <= retval_3)) (PreH3 : (retval_3 <= 127)) (PreH4 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH5 : ((-128) <= retval_2)) (PreH6 : (retval_2 <= 127)) (PreH7 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH8 : ((-128) <= retval)) (PreH9 : (retval <= 127)) (PreH10 : (0 < p_pre)) (PreH11 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (8))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (8))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_4 := vld1_s8_partial_solve_wit_4_pure -> vld1_s8_partial_solve_wit_4_aux.

Definition vld1_s8_partial_solve_wit_5_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH2 : ((-128) <= retval_4)) (PreH3 : (retval_4 <= 127)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH5 : ((-128) <= retval_3)) (PreH6 : (retval_3 <= 127)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH11 : ((-128) <= retval)) (PreH12 : (retval <= 127)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_5_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH2 : ((-128) <= retval_4)) (PreH3 : (retval_4 <= 127)) (PreH4 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH5 : ((-128) <= retval_3)) (PreH6 : (retval_3 <= 127)) (PreH7 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH11 : ((-128) <= retval)) (PreH12 : (retval <= 127)) (PreH13 : (0 < p_pre)) (PreH14 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH15 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (8))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (8))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (8))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_5 := vld1_s8_partial_solve_wit_5_pure -> vld1_s8_partial_solve_wit_5_aux.

Definition vld1_s8_partial_solve_wit_6_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH2 : ((-128) <= retval_5)) (PreH3 : (retval_5 <= 127)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH5 : ((-128) <= retval_4)) (PreH6 : (retval_4 <= 127)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH8 : ((-128) <= retval_3)) (PreH9 : (retval_3 <= 127)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH14 : ((-128) <= retval)) (PreH15 : (retval <= 127)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_6_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH2 : ((-128) <= retval_5)) (PreH3 : (retval_5 <= 127)) (PreH4 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH5 : ((-128) <= retval_4)) (PreH6 : (retval_4 <= 127)) (PreH7 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH8 : ((-128) <= retval_3)) (PreH9 : (retval_3 <= 127)) (PreH10 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH14 : ((-128) <= retval)) (PreH15 : (retval <= 127)) (PreH16 : (0 < p_pre)) (PreH17 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH18 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (8))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (8))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (8))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (8))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_6 := vld1_s8_partial_solve_wit_6_pure -> vld1_s8_partial_solve_wit_6_aux.

Definition vld1_s8_partial_solve_wit_7_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH2 : ((-128) <= retval_6)) (PreH3 : (retval_6 <= 127)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH5 : ((-128) <= retval_5)) (PreH6 : (retval_5 <= 127)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH8 : ((-128) <= retval_4)) (PreH9 : (retval_4 <= 127)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH11 : ((-128) <= retval_3)) (PreH12 : (retval_3 <= 127)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH14 : ((-128) <= retval_2)) (PreH15 : (retval_2 <= 127)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH17 : ((-128) <= retval)) (PreH18 : (retval <= 127)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_7_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH2 : ((-128) <= retval_6)) (PreH3 : (retval_6 <= 127)) (PreH4 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH5 : ((-128) <= retval_5)) (PreH6 : (retval_5 <= 127)) (PreH7 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH8 : ((-128) <= retval_4)) (PreH9 : (retval_4 <= 127)) (PreH10 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH11 : ((-128) <= retval_3)) (PreH12 : (retval_3 <= 127)) (PreH13 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH14 : ((-128) <= retval_2)) (PreH15 : (retval_2 <= 127)) (PreH16 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH17 : ((-128) <= retval)) (PreH18 : (retval <= 127)) (PreH19 : (0 < p_pre)) (PreH20 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH21 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (8))) ” 
  &&  “ ((-128) <= retval_6) ” 
  &&  “ (retval_6 <= 127) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (8))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (8))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (8))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (8))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_7 := vld1_s8_partial_solve_wit_7_pure -> vld1_s8_partial_solve_wit_7_aux.

Definition vld1_s8_partial_solve_wit_8_pure := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (8)))) (PreH2 : ((-128) <= retval_7)) (PreH3 : (retval_7 <= 127)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH5 : ((-128) <= retval_6)) (PreH6 : (retval_6 <= 127)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH8 : ((-128) <= retval_5)) (PreH9 : (retval_5 <= 127)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH11 : ((-128) <= retval_4)) (PreH12 : (retval_4 <= 127)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH14 : ((-128) <= retval_3)) (PreH15 : (retval_3 <= 127)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH17 : ((-128) <= retval_2)) (PreH18 : (retval_2 <= 127)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH20 : ((-128) <= retval)) (PreH21 : (retval <= 127)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
.

Definition vld1_s8_partial_solve_wit_8_aux := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (8)))) (PreH2 : ((-128) <= retval_7)) (PreH3 : (retval_7 <= 127)) (PreH4 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH5 : ((-128) <= retval_6)) (PreH6 : (retval_6 <= 127)) (PreH7 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH8 : ((-128) <= retval_5)) (PreH9 : (retval_5 <= 127)) (PreH10 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH11 : ((-128) <= retval_4)) (PreH12 : (retval_4 <= 127)) (PreH13 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH14 : ((-128) <= retval_3)) (PreH15 : (retval_3 <= 127)) (PreH16 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH17 : ((-128) <= retval_2)) (PreH18 : (retval_2 <= 127)) (PreH19 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH20 : ((-128) <= retval)) (PreH21 : (retval <= 127)) (PreH22 : (0 < p_pre)) (PreH23 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH24 : (rd_window M p_pre 8 )) ,
  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 < p_pre) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (8))) ” 
  &&  “ ((-128) <= retval_7) ” 
  &&  “ (retval_7 <= 127) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (8))) ” 
  &&  “ ((-128) <= retval_6) ” 
  &&  “ (retval_6 <= 127) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (8))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (8))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (8))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (8))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
  &&  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_8 := vld1_s8_partial_solve_wit_8_pure -> vld1_s8_partial_solve_wit_8_aux.

Definition vld1_s8_partial_solve_wit_9 := 
forall (p_pre: Z) (M: RDMap) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (rd_read_lane (M) (p_pre) (7) (8)))) (PreH2 : ((-128) <= retval_8)) (PreH3 : (retval_8 <= 127)) (PreH4 : (retval_7 = (rd_read_lane (M) (p_pre) (6) (8)))) (PreH5 : ((-128) <= retval_7)) (PreH6 : (retval_7 <= 127)) (PreH7 : (retval_6 = (rd_read_lane (M) (p_pre) (5) (8)))) (PreH8 : ((-128) <= retval_6)) (PreH9 : (retval_6 <= 127)) (PreH10 : (retval_5 = (rd_read_lane (M) (p_pre) (4) (8)))) (PreH11 : ((-128) <= retval_5)) (PreH12 : (retval_5 <= 127)) (PreH13 : (retval_4 = (rd_read_lane (M) (p_pre) (3) (8)))) (PreH14 : ((-128) <= retval_4)) (PreH15 : (retval_4 <= 127)) (PreH16 : (retval_3 = (rd_read_lane (M) (p_pre) (2) (8)))) (PreH17 : ((-128) <= retval_3)) (PreH18 : (retval_3 <= 127)) (PreH19 : (retval_2 = (rd_read_lane (M) (p_pre) (1) (8)))) (PreH20 : ((-128) <= retval_2)) (PreH21 : (retval_2 <= 127)) (PreH22 : (retval = (rd_read_lane (M) (p_pre) (0) (8)))) (PreH23 : ((-128) <= retval)) (PreH24 : (retval <= 127)) (PreH25 : (0 < p_pre)) (PreH26 : ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 ))) (PreH27 : (rd_window M p_pre 8 )) ,
  (UndefStructPredint8x8_t record_return )
  **  (rd_mem M )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (retval_8 = (rd_read_lane (M) (p_pre) (7) (8))) ” 
  &&  “ ((-128) <= retval_8) ” 
  &&  “ (retval_8 <= 127) ” 
  &&  “ (retval_7 = (rd_read_lane (M) (p_pre) (6) (8))) ” 
  &&  “ ((-128) <= retval_7) ” 
  &&  “ (retval_7 <= 127) ” 
  &&  “ (retval_6 = (rd_read_lane (M) (p_pre) (5) (8))) ” 
  &&  “ ((-128) <= retval_6) ” 
  &&  “ (retval_6 <= 127) ” 
  &&  “ (retval_5 = (rd_read_lane (M) (p_pre) (4) (8))) ” 
  &&  “ ((-128) <= retval_5) ” 
  &&  “ (retval_5 <= 127) ” 
  &&  “ (retval_4 = (rd_read_lane (M) (p_pre) (3) (8))) ” 
  &&  “ ((-128) <= retval_4) ” 
  &&  “ (retval_4 <= 127) ” 
  &&  “ (retval_3 = (rd_read_lane (M) (p_pre) (2) (8))) ” 
  &&  “ ((-128) <= retval_3) ” 
  &&  “ (retval_3 <= 127) ” 
  &&  “ (retval_2 = (rd_read_lane (M) (p_pre) (1) (8))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ (retval = (rd_read_lane (M) (p_pre) (0) (8))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ ((p_pre + (8 * sizeof(CHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre 8 ) ”
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
  **  (rd_mem M )
.

Module Type VC_Correct.


Axiom proof_of_vld1_s8_safety_wit_1 : vld1_s8_safety_wit_1.
Axiom proof_of_vld1_s8_safety_wit_2 : vld1_s8_safety_wit_2.
Axiom proof_of_vld1_s8_safety_wit_3 : vld1_s8_safety_wit_3.
Axiom proof_of_vld1_s8_safety_wit_4 : vld1_s8_safety_wit_4.
Axiom proof_of_vld1_s8_safety_wit_5 : vld1_s8_safety_wit_5.
Axiom proof_of_vld1_s8_safety_wit_6 : vld1_s8_safety_wit_6.
Axiom proof_of_vld1_s8_safety_wit_7 : vld1_s8_safety_wit_7.
Axiom proof_of_vld1_s8_safety_wit_8 : vld1_s8_safety_wit_8.
Axiom proof_of_vld1_s8_safety_wit_9 : vld1_s8_safety_wit_9.
Axiom proof_of_vld1_s8_safety_wit_10 : vld1_s8_safety_wit_10.
Axiom proof_of_vld1_s8_safety_wit_11 : vld1_s8_safety_wit_11.
Axiom proof_of_vld1_s8_safety_wit_12 : vld1_s8_safety_wit_12.
Axiom proof_of_vld1_s8_safety_wit_13 : vld1_s8_safety_wit_13.
Axiom proof_of_vld1_s8_safety_wit_14 : vld1_s8_safety_wit_14.
Axiom proof_of_vld1_s8_safety_wit_15 : vld1_s8_safety_wit_15.
Axiom proof_of_vld1_s8_safety_wit_16 : vld1_s8_safety_wit_16.
Axiom proof_of_vld1_s8_return_wit_1 : vld1_s8_return_wit_1.
Axiom proof_of_vld1_s8_partial_solve_wit_1_pure : vld1_s8_partial_solve_wit_1_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_1 : vld1_s8_partial_solve_wit_1.
Axiom proof_of_vld1_s8_partial_solve_wit_2_pure : vld1_s8_partial_solve_wit_2_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_2 : vld1_s8_partial_solve_wit_2.
Axiom proof_of_vld1_s8_partial_solve_wit_3_pure : vld1_s8_partial_solve_wit_3_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_3 : vld1_s8_partial_solve_wit_3.
Axiom proof_of_vld1_s8_partial_solve_wit_4_pure : vld1_s8_partial_solve_wit_4_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_4 : vld1_s8_partial_solve_wit_4.
Axiom proof_of_vld1_s8_partial_solve_wit_5_pure : vld1_s8_partial_solve_wit_5_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_5 : vld1_s8_partial_solve_wit_5.
Axiom proof_of_vld1_s8_partial_solve_wit_6_pure : vld1_s8_partial_solve_wit_6_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_6 : vld1_s8_partial_solve_wit_6.
Axiom proof_of_vld1_s8_partial_solve_wit_7_pure : vld1_s8_partial_solve_wit_7_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_7 : vld1_s8_partial_solve_wit_7.
Axiom proof_of_vld1_s8_partial_solve_wit_8_pure : vld1_s8_partial_solve_wit_8_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_8 : vld1_s8_partial_solve_wit_8.
Axiom proof_of_vld1_s8_partial_solve_wit_9 : vld1_s8_partial_solve_wit_9.

End VC_Correct.
