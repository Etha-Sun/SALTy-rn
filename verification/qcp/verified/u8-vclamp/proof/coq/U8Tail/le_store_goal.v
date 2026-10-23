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
Require Import U8Tail.LEModel.
Local Open Scope sac.

(*----- Function qcp_u8_store_word32 -----*)

Definition qcp_u8_store_word32_safety_wit_1 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UInt  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_u8_store_word32_safety_wit_2 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UInt  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_u8_store_word32_safety_wit_3 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UInt  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (256 <> 0) ”
.

Definition qcp_u8_store_word32_safety_wit_4 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UInt  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 256 )) (8)))
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_u8_store_word32_safety_wit_5 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UInt  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 256 )) (8)))
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (65536 <> 0) ”
.

Definition qcp_u8_store_word32_safety_wit_6 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UInt  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 256 )) (8)))
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 65536 )) (8)))
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_u8_store_word32_safety_wit_7 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UInt  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 256 )) (8)))
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 65536 )) (8)))
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (16777216 <> 0) ”
.

Definition qcp_u8_store_word32_return_wit_1 := 
(
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 256 )) (8)))
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 65536 )) (8)))
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 16777216 )) (8)))
|--
  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (le_byte0 (word_pre)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (le_byte1 (word_pre)))
  **  (((out_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (le_byte2 (word_pre)))
  **  (((out_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (le_byte3 (word_pre)))
) \/
(
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (word_pre) (8)) = (le_byte0 (word_pre))) ” 
  &&  “ ((unsigned_last_nbits ((word_pre ÷ 256 )) (8)) = (le_byte1 (word_pre))) ” 
  &&  “ ((unsigned_last_nbits ((word_pre ÷ 65536 )) (8)) = (le_byte2 (word_pre))) ” 
  &&  “ ((unsigned_last_nbits ((word_pre ÷ 16777216 )) (8)) = (le_byte3 (word_pre))) ”
  &&  emp
).

Definition qcp_u8_store_word32_return_wit_1_split_goal_1 := 
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((unsigned_last_nbits (word_pre) (8)) = (le_byte0 (word_pre)))
.

Definition qcp_u8_store_word32_return_wit_1_split_goal_2 := 
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((unsigned_last_nbits ((word_pre ÷ 256 )) (8)) = (le_byte1 (word_pre)))
.

Definition qcp_u8_store_word32_return_wit_1_split_goal_3 := 
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((unsigned_last_nbits ((word_pre ÷ 65536 )) (8)) = (le_byte2 (word_pre)))
.

Definition qcp_u8_store_word32_return_wit_1_split_goal_4 := 
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= UINT_MAX)) ,
  ((unsigned_last_nbits ((word_pre ÷ 16777216 )) (8)) = (le_byte3 (word_pre)))
.

(*----- Function qcp_u8_store_word16 -----*)

Definition qcp_u8_store_word16_safety_wit_1 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= 65535)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UShort  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_u8_store_word16_safety_wit_2 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= 65535)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UShort  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_u8_store_word16_safety_wit_3 := 
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= 65535)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "word" ) )) # UShort  |-> word_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (256 <> 0) ”
.

Definition qcp_u8_store_word16_return_wit_1 := 
(
forall (word_pre: Z) (out_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= 65535)) ,
  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (word_pre) (8)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits ((word_pre ÷ 256 )) (8)))
|--
  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (le_byte0 (word_pre)))
  **  (((out_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (le_byte1 (word_pre)))
) \/
(
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= 65535)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (word_pre) (8)) = (le_byte0 (word_pre))) ” 
  &&  “ ((unsigned_last_nbits ((word_pre ÷ 256 )) (8)) = (le_byte1 (word_pre))) ”
  &&  emp
).

Definition qcp_u8_store_word16_return_wit_1_split_goal_1 := 
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= 65535)) ,
  ((unsigned_last_nbits (word_pre) (8)) = (le_byte0 (word_pre)))
.

Definition qcp_u8_store_word16_return_wit_1_split_goal_2 := 
forall (word_pre: Z) (PreH1 : (0 <= word_pre)) (PreH2 : (word_pre <= 65535)) ,
  ((unsigned_last_nbits ((word_pre ÷ 256 )) (8)) = (le_byte1 (word_pre)))
.

(*----- Function qcp_u8_store_byte -----*)

Definition qcp_u8_store_byte_safety_wit_1 := 
forall (value_pre: Z) (out_pre: Z) (PreH1 : (0 <= value_pre)) (PreH2 : (value_pre <= 255)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "value" ) )) # UChar  |-> value_pre)
  **  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_u8_store_byte_return_wit_1 := 
forall (value_pre: Z) (out_pre: Z) (PreH1 : (0 <= value_pre)) (PreH2 : (value_pre <= 255)) ,
  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> value_pre)
|--
  (((out_pre + (0 * sizeof(UCHAR)))) # UChar  |-> value_pre)
.

Module Type VC_Correct.


Axiom proof_of_qcp_u8_store_word32_safety_wit_1 : qcp_u8_store_word32_safety_wit_1.
Axiom proof_of_qcp_u8_store_word32_safety_wit_2 : qcp_u8_store_word32_safety_wit_2.
Axiom proof_of_qcp_u8_store_word32_safety_wit_3 : qcp_u8_store_word32_safety_wit_3.
Axiom proof_of_qcp_u8_store_word32_safety_wit_4 : qcp_u8_store_word32_safety_wit_4.
Axiom proof_of_qcp_u8_store_word32_safety_wit_5 : qcp_u8_store_word32_safety_wit_5.
Axiom proof_of_qcp_u8_store_word32_safety_wit_6 : qcp_u8_store_word32_safety_wit_6.
Axiom proof_of_qcp_u8_store_word32_safety_wit_7 : qcp_u8_store_word32_safety_wit_7.
Axiom proof_of_qcp_u8_store_word32_return_wit_1 : qcp_u8_store_word32_return_wit_1.
Axiom proof_of_qcp_u8_store_word16_safety_wit_1 : qcp_u8_store_word16_safety_wit_1.
Axiom proof_of_qcp_u8_store_word16_safety_wit_2 : qcp_u8_store_word16_safety_wit_2.
Axiom proof_of_qcp_u8_store_word16_safety_wit_3 : qcp_u8_store_word16_safety_wit_3.
Axiom proof_of_qcp_u8_store_word16_return_wit_1 : qcp_u8_store_word16_return_wit_1.
Axiom proof_of_qcp_u8_store_byte_safety_wit_1 : qcp_u8_store_byte_safety_wit_1.
Axiom proof_of_qcp_u8_store_byte_return_wit_1 : qcp_u8_store_byte_return_wit_1.

End VC_Correct.
