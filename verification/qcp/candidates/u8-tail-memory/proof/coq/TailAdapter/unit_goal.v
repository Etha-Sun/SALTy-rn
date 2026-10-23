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
Require Import TailAdapter.Layout.
Require Import U8Tail.LEModel.
Local Open Scope sac.
From TailAdapter Require Import u8_copy_strategy_goal.
From TailAdapter Require Import u8_copy_strategy_proof.

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

(*----- Function qcp_u8_pack16 -----*)

Definition qcp_u8_pack16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ ((a_pre + (256 * b_pre ) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre + (256 * b_pre ) )) ”
.

Definition qcp_u8_pack16_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ ((256 * b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (256 * b_pre )) ”
.

Definition qcp_u8_pack16_safety_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ (256 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 256) ”
.

Definition qcp_u8_pack16_return_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ ((a_pre + (256 * b_pre ) ) = (a_pre + (256 * b_pre ) )) ”
  &&  emp
.

(*----- Function qcp_u8_pack32 -----*)

Definition qcp_u8_pack32_return_wit_1 := 
forall (d_pre: Z) (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) (PreH5 : (0 <= c_pre)) (PreH6 : (c_pre <= 255)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 255)) ,
  TT && emp 
|--
  “ ((((a_pre + (256 * b_pre ) ) + (65536 * c_pre ) ) + (16777216 * d_pre ) ) = (((a_pre + (256 * b_pre ) ) + (65536 * c_pre ) ) + (16777216 * d_pre ) )) ”
  &&  emp
.

(*----- Function vreinterpret_u32_u8 -----*)

Definition vreinterpret_u32_u8_return_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
.

Definition vreinterpret_u32_u8_partial_solve_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPreduint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> x7)
.

(*----- Function qcp_store_u32_0 -----*)

Definition qcp_store_u32_0_return_wit_1 := 
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (le_byte0 (retval)))
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (le_byte1 (retval)))
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (le_byte2 (retval)))
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (le_byte3 (retval)))
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
) \/
(
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  TT && emp 
|--
  “ ((le_byte0 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x0) ” 
  &&  “ ((le_byte1 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x1) ” 
  &&  “ ((le_byte2 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x2) ” 
  &&  “ ((le_byte3 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x3) ”
  &&  emp
).

Definition qcp_store_u32_0_return_wit_1_split_goal_1 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((le_byte0 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x0)
.

Definition qcp_store_u32_0_return_wit_1_split_goal_2 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((le_byte1 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x1)
.

Definition qcp_store_u32_0_return_wit_1_split_goal_3 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((le_byte2 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x2)
.

Definition qcp_store_u32_0_return_wit_1_split_goal_4 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((le_byte3 ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) = x3)
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure := 
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x3 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x0) ”
) \/
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ”
).

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_1 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x0) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_2 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x0 <= 255) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_3 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x1) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_4 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x1 <= 255) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_5 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x2) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_6 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x2 <= 255) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_7 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x3) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_pure_split_goal_8 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x3 <= 255) ”
.

Definition qcp_store_u32_0_partial_solve_wit_1_aux := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x3 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x0) ”
  &&  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
.

Definition qcp_store_u32_0_partial_solve_wit_1 := qcp_store_u32_0_partial_solve_wit_1_pure -> qcp_store_u32_0_partial_solve_wit_1_aux.

Definition qcp_store_u32_0_partial_solve_wit_2_pure := 
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ) <= UINT_MAX) ” 
  &&  “ (0 <= (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) )) ”
) \/
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) )) ” 
  &&  “ ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ) <= UINT_MAX) ” 
  &&  “ ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ) <= UINT_MAX) ” 
  &&  “ (0 <= (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) )) ”
).

Definition qcp_store_u32_0_partial_solve_wit_2_pure_split_goal_1 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) )) ”
.

Definition qcp_store_u32_0_partial_solve_wit_2_pure_split_goal_2 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ) <= UINT_MAX) ”
.

Definition qcp_store_u32_0_partial_solve_wit_2_pure_split_goal_3 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ) <= UINT_MAX) ”
.

Definition qcp_store_u32_0_partial_solve_wit_2_pure_split_goal_4 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) )) ”
.

Definition qcp_store_u32_0_partial_solve_wit_2_aux := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ))) ,
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ ((((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) ) <= UINT_MAX) ” 
  &&  “ (0 <= (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) )) ” 
  &&  “ (retval = (((x0 + (256 * x1 ) ) + (65536 * x2 ) ) + (16777216 * x3 ) )) ”
  &&  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
.

Definition qcp_store_u32_0_partial_solve_wit_2 := qcp_store_u32_0_partial_solve_wit_2_pure -> qcp_store_u32_0_partial_solve_wit_2_aux.

(*----- Function original_tail_store32 -----*)

Definition original_tail_store32_return_wit_1 := 
forall (output_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
|--
  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
.

Definition original_tail_store32_partial_solve_wit_1 := 
forall (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
.

Definition original_tail_store32_partial_solve_wit_2 := 
forall (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
.

Definition original_tail_store32_partial_solve_wit_3 := 
forall (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> x0)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
.

(*----- Function vreinterpret_u16_u8 -----*)

Definition vreinterpret_u16_u8_return_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
.

Definition vreinterpret_u16_u8_partial_solve_wit_1 := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) ,
  (UndefStructPreduint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((record_return)  # "uint8x8_t" ->ₛ "s7")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s6")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s5")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s4")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s3")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s2")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s1")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&((record_return)  # "uint8x8_t" ->ₛ "s0")) # UChar  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # UChar  |-> x7)
.

(*----- Function qcp_store_u16_0 -----*)

Definition qcp_store_u16_0_return_wit_1 := 
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (le_byte0 (retval)))
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (le_byte1 (retval)))
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
) \/
(
forall (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  TT && emp 
|--
  “ ((le_byte0 ((x0 + (256 * x1 ) ))) = x0) ” 
  &&  “ ((le_byte1 ((x0 + (256 * x1 ) ))) = x1) ”
  &&  emp
).

Definition qcp_store_u16_0_return_wit_1_split_goal_1 := 
forall (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((le_byte0 ((x0 + (256 * x1 ) ))) = x0)
.

Definition qcp_store_u16_0_return_wit_1_split_goal_2 := 
forall (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((le_byte1 ((x0 + (256 * x1 ) ))) = x1)
.

Definition qcp_store_u16_0_partial_solve_wit_1_pure := 
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x1 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x0) ”
) \/
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ”
).

Definition qcp_store_u16_0_partial_solve_wit_1_pure_split_goal_1 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x0) ”
.

Definition qcp_store_u16_0_partial_solve_wit_1_pure_split_goal_2 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x0 <= 255) ”
.

Definition qcp_store_u16_0_partial_solve_wit_1_pure_split_goal_3 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= x1) ”
.

Definition qcp_store_u16_0_partial_solve_wit_1_pure_split_goal_4 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x1 <= 255) ”
.

Definition qcp_store_u16_0_partial_solve_wit_1_aux := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (x1 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x0) ”
  &&  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
.

Definition qcp_store_u16_0_partial_solve_wit_1 := qcp_store_u16_0_partial_solve_wit_1_pure -> qcp_store_u16_0_partial_solve_wit_1_aux.

Definition qcp_store_u16_0_partial_solve_wit_2_pure := 
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((x0 + (256 * x1 ) ) <= 65535) ” 
  &&  “ (0 <= (x0 + (256 * x1 ) )) ”
) \/
(
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= (x0 + (256 * x1 ) )) ” 
  &&  “ ((x0 + (256 * x1 ) ) <= 65535) ” 
  &&  “ ((x0 + (256 * x1 ) ) <= 65535) ” 
  &&  “ (0 <= (x0 + (256 * x1 ) )) ”
).

Definition qcp_store_u16_0_partial_solve_wit_2_pure_split_goal_1 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= (x0 + (256 * x1 ) )) ”
.

Definition qcp_store_u16_0_partial_solve_wit_2_pure_split_goal_2 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ ((x0 + (256 * x1 ) ) <= 65535) ”
.

Definition qcp_store_u16_0_partial_solve_wit_2_pure_split_goal_3 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ ((x0 + (256 * x1 ) ) <= 65535) ”
.

Definition qcp_store_u16_0_partial_solve_wit_2_pure_split_goal_4 := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= (x0 + (256 * x1 ) )) ”
.

Definition qcp_store_u16_0_partial_solve_wit_2_aux := 
forall (a_pre: Z) (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (x0 + (256 * x1 ) ))) ,
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((x0 + (256 * x1 ) ) <= 65535) ” 
  &&  “ (0 <= (x0 + (256 * x1 ) )) ” 
  &&  “ (retval = (x0 + (256 * x1 ) )) ”
  &&  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
.

Definition qcp_store_u16_0_partial_solve_wit_2 := qcp_store_u16_0_partial_solve_wit_2_pure -> qcp_store_u16_0_partial_solve_wit_2_aux.

(*----- Function original_tail_store16 -----*)

Definition original_tail_store16_return_wit_1 := 
forall (output_pre: Z) (x1: Z) (x0: Z) ,
  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
|--
  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
.

Definition original_tail_store16_partial_solve_wit_1 := 
forall (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
.

Definition original_tail_store16_partial_solve_wit_2 := 
forall (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
.

Definition original_tail_store16_partial_solve_wit_3 := 
forall (output_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> x0)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (((output_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((output_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # UChar  |-> x7)
.

Module Type VC_Correct.

Include u8_copy_Strategy_Correct.

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
Axiom proof_of_qcp_u8_pack16_safety_wit_1 : qcp_u8_pack16_safety_wit_1.
Axiom proof_of_qcp_u8_pack16_safety_wit_2 : qcp_u8_pack16_safety_wit_2.
Axiom proof_of_qcp_u8_pack16_safety_wit_3 : qcp_u8_pack16_safety_wit_3.
Axiom proof_of_qcp_u8_pack16_return_wit_1 : qcp_u8_pack16_return_wit_1.
Axiom proof_of_qcp_u8_pack32_return_wit_1 : qcp_u8_pack32_return_wit_1.
Axiom proof_of_vreinterpret_u32_u8_return_wit_1 : vreinterpret_u32_u8_return_wit_1.
Axiom proof_of_vreinterpret_u32_u8_partial_solve_wit_1 : vreinterpret_u32_u8_partial_solve_wit_1.
Axiom proof_of_qcp_store_u32_0_return_wit_1 : qcp_store_u32_0_return_wit_1.
Axiom proof_of_qcp_store_u32_0_partial_solve_wit_1_pure : qcp_store_u32_0_partial_solve_wit_1_pure.
Axiom proof_of_qcp_store_u32_0_partial_solve_wit_1 : qcp_store_u32_0_partial_solve_wit_1.
Axiom proof_of_qcp_store_u32_0_partial_solve_wit_2_pure : qcp_store_u32_0_partial_solve_wit_2_pure.
Axiom proof_of_qcp_store_u32_0_partial_solve_wit_2 : qcp_store_u32_0_partial_solve_wit_2.
Axiom proof_of_original_tail_store32_return_wit_1 : original_tail_store32_return_wit_1.
Axiom proof_of_original_tail_store32_partial_solve_wit_1 : original_tail_store32_partial_solve_wit_1.
Axiom proof_of_original_tail_store32_partial_solve_wit_2 : original_tail_store32_partial_solve_wit_2.
Axiom proof_of_original_tail_store32_partial_solve_wit_3 : original_tail_store32_partial_solve_wit_3.
Axiom proof_of_vreinterpret_u16_u8_return_wit_1 : vreinterpret_u16_u8_return_wit_1.
Axiom proof_of_vreinterpret_u16_u8_partial_solve_wit_1 : vreinterpret_u16_u8_partial_solve_wit_1.
Axiom proof_of_qcp_store_u16_0_return_wit_1 : qcp_store_u16_0_return_wit_1.
Axiom proof_of_qcp_store_u16_0_partial_solve_wit_1_pure : qcp_store_u16_0_partial_solve_wit_1_pure.
Axiom proof_of_qcp_store_u16_0_partial_solve_wit_1 : qcp_store_u16_0_partial_solve_wit_1.
Axiom proof_of_qcp_store_u16_0_partial_solve_wit_2_pure : qcp_store_u16_0_partial_solve_wit_2_pure.
Axiom proof_of_qcp_store_u16_0_partial_solve_wit_2 : qcp_store_u16_0_partial_solve_wit_2.
Axiom proof_of_original_tail_store16_return_wit_1 : original_tail_store16_return_wit_1.
Axiom proof_of_original_tail_store16_partial_solve_wit_1 : original_tail_store16_partial_solve_wit_1.
Axiom proof_of_original_tail_store16_partial_solve_wit_2 : original_tail_store16_partial_solve_wit_2.
Axiom proof_of_original_tail_store16_partial_solve_wit_3 : original_tail_store16_partial_solve_wit_3.

End VC_Correct.
