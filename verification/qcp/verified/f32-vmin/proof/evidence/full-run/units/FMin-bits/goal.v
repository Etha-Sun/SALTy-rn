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
Require Import FMin.Bits.
Local Open Scope sac.

(*----- Function qcp_float_bits_at -----*)

Definition qcp_float_bits_at_safety_wit_1 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((( &( "c1" ) )) # UInt  |->_)
  **  ((( &( "c0" ) )) # UInt  |-> b0)
  **  ((( &( "p" ) )) # Ptr  |-> x_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_float_bits_at_safety_wit_2 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((( &( "c2" ) )) # UInt  |->_)
  **  ((( &( "c1" ) )) # UInt  |-> b1)
  **  ((( &( "c0" ) )) # UInt  |-> b0)
  **  ((( &( "p" ) )) # Ptr  |-> x_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_float_bits_at_safety_wit_3 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((( &( "c3" ) )) # UInt  |->_)
  **  ((( &( "c2" ) )) # UInt  |-> b2)
  **  ((( &( "c1" ) )) # UInt  |-> b1)
  **  ((( &( "c0" ) )) # UInt  |-> b0)
  **  ((( &( "p" ) )) # Ptr  |-> x_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_float_bits_at_entail_wit_1 := 
(
forall (x_pre: Z) (v: fp32) ,
  ((x_pre) # Float  |-> v)
|--
  EX (b0: Z)  (b1: Z)  (b2: Z)  (b3: Z) ,
  “ (aligned_4 x_pre ) ” 
  &&  “ (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 ) ”
  &&  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
) \/
(
forall (x_pre: Z) (v: fp32) ,
  ((x_pre) # Float  |-> v)
|--
  EX (b0: Z)  (b1: Z)  (b2: Z)  (b3: Z) ,
  “ (aligned_4 x_pre ) ” 
  &&  “ (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 ) ”
  &&  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
).

Definition qcp_float_bits_at_entail_wit_2 := 
(
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (aligned_4 x_pre ) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits ((b0 + (unsigned_last_nbits ((256 * b1 )) (32)) )) (32)) + (unsigned_last_nbits ((65536 * b2 )) (32)) )) (32)) + (unsigned_last_nbits ((16777216 * b3 )) (32)) )) (32)) = (bits_of_fp32 (v))) ” 
  &&  “ (x_pre = x_pre) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= 255) ”
  &&  ((x_pre) # Float  |-> v)
) \/
(
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (b3 <= 255) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b2 <= 255) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b1 <= 255) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b0 <= 255) ” 
  &&  “ (0 <= b0) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits ((b0 + (unsigned_last_nbits ((256 * b1 )) (32)) )) (32)) + (unsigned_last_nbits ((65536 * b2 )) (32)) )) (32)) + (unsigned_last_nbits ((16777216 * b3 )) (32)) )) (32)) = (bits_of_fp32 (v))) ”
  &&  ((x_pre) # Float  |-> v)
).

Definition qcp_float_bits_at_entail_wit_2_split_goal_1 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (b3 <= 255) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_2 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (0 <= b3) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_3 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (b2 <= 255) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_4 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (0 <= b2) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_5 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (b1 <= 255) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_6 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (0 <= b1) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_7 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (b0 <= 255) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_8 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (0 <= b0) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_9 := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits ((b0 + (unsigned_last_nbits ((256 * b1 )) (32)) )) (32)) + (unsigned_last_nbits ((65536 * b2 )) (32)) )) (32)) + (unsigned_last_nbits ((16777216 * b3 )) (32)) )) (32)) = (bits_of_fp32 (v))) ”
.

Definition qcp_float_bits_at_entail_wit_2_split_goal_spatial := 
forall (x_pre: Z) (v: fp32) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (word32 (bits_of_fp32 (v)) b0 b1 b2 b3 )) ,
  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  ((x_pre) # Float  |-> v)
.

Definition qcp_float_bits_at_return_wit_1 := 
forall (x_pre: Z) (v: fp32) (r: Z) (p: Z) (c0: Z) (c1: Z) (c2: Z) (c3: Z) (PreH1 : (aligned_4 x_pre )) (PreH2 : (r = (bits_of_fp32 (v)))) (PreH3 : (p = x_pre)) (PreH4 : (0 <= c0)) (PreH5 : (c0 <= 255)) (PreH6 : (0 <= c1)) (PreH7 : (c1 <= 255)) (PreH8 : (0 <= c2)) (PreH9 : (c2 <= 255)) (PreH10 : (0 <= c3)) (PreH11 : (c3 <= 255)) ,
  ((x_pre) # Float  |-> v)
|--
  “ (r = (bits_of_fp32 (v))) ”
  &&  ((x_pre) # Float  |-> v)
.

(*----- Function qcp_float_bits -----*)

Definition qcp_float_bits_return_wit_1 := 
forall (x_pre: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (x_pre)))) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (x_pre))) ”
  &&  emp
.

Definition qcp_float_bits_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_float_from_bits_at -----*)

Definition qcp_float_from_bits_at_safety_wit_1 := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((( &( "q" ) )) # Ptr  |-> x_pre)
  **  ((( &( "p" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "bits" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_float_from_bits_at_safety_wit_2 := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((( &( "q" ) )) # Ptr  |-> x_pre)
  **  ((( &( "p" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "bits" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_float_from_bits_at_safety_wit_3 := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((( &( "q" ) )) # Ptr  |-> x_pre)
  **  ((( &( "p" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "bits" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_float_from_bits_at_safety_wit_4 := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((( &( "q" ) )) # Ptr  |-> x_pre)
  **  ((( &( "p" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "bits" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_float_from_bits_at_safety_wit_5 := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((( &( "q" ) )) # Ptr  |-> x_pre)
  **  ((( &( "p" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "bits" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_float_from_bits_at_safety_wit_6 := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((( &( "q" ) )) # Ptr  |-> x_pre)
  **  ((( &( "p" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "bits" ) )) # Ptr  |-> bits_pre)
  **  ((( &( "x" ) )) # Ptr  |-> x_pre)
  **  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_float_from_bits_at_entail_wit_1 := 
(
forall (x_pre: Z) (bits_pre: Z) (w: Z) ,
  ((bits_pre) # UInt  |-> w)
  **  ((x_pre) # Float  |->_)
|--
  EX (b0: Z)  (b1: Z)  (b2: Z)  (b3: Z) ,
  “ (aligned_4 bits_pre ) ” 
  &&  “ (aligned_4 x_pre ) ” 
  &&  “ (word32 w b0 b1 b2 b3 ) ”
  &&  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |->_)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
) \/
(
forall (x_pre: Z) (bits_pre: Z) (w: Z) (PreH1 : (w <= UINT_MAX)) (PreH2 : (w >= 0)) ,
  ((bits_pre) # UInt  |-> w)
  **  ((x_pre) # Float  |->_)
|--
  EX (x_4: Z)  (x_3: Z)  (x_2: Z)  (x: Z)  (b0: Z)  (b1: Z)  (b2: Z)  (b3: Z) ,
  “ (aligned_4 bits_pre ) ” 
  &&  “ (aligned_4 x_pre ) ” 
  &&  “ (word32 w b0 b1 b2 b3 ) ”
  &&  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x_4)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x_3)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x_2)
  **  ((x_pre) # UChar  |-> x)
  **  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
).

Definition qcp_float_from_bits_at_entail_wit_2 := 
(
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  “ (bits_pre = bits_pre) ” 
  &&  “ (x_pre = x_pre) ”
  &&  ((bits_pre) # UInt  |-> w)
  **  ((x_pre) # Float  |-> (fp32_of_bits (w)))
) \/
(
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  ((bits_pre) # UInt  |-> w)
  **  ((x_pre) # Float  |-> (fp32_of_bits (w)))
).

Definition qcp_float_from_bits_at_entail_wit_2_split_goal_spatial := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (b0: Z) (b1: Z) (b2: Z) (b3: Z) (PreH1 : (aligned_4 bits_pre )) (PreH2 : (aligned_4 x_pre )) (PreH3 : (word32 w b0 b1 b2 b3 )) ,
  ((bits_pre) # UChar  |-> b0)
  **  (((bits_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((bits_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((bits_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
  **  ((x_pre) # UChar  |-> b0)
  **  (((x_pre + (1 * sizeof(UCHAR)))) # UChar  |-> b1)
  **  (((x_pre + (2 * sizeof(UCHAR)))) # UChar  |-> b2)
  **  (((x_pre + (3 * sizeof(UCHAR)))) # UChar  |-> b3)
|--
  ((bits_pre) # UInt  |-> w)
  **  ((x_pre) # Float  |-> (fp32_of_bits (w)))
.

Definition qcp_float_from_bits_at_return_wit_1 := 
forall (x_pre: Z) (bits_pre: Z) (w: Z) (p: Z) (q: Z) (PreH1 : (p = bits_pre)) (PreH2 : (q = x_pre)) ,
  ((bits_pre) # UInt  |-> w)
  **  ((x_pre) # Float  |-> (fp32_of_bits (w)))
|--
  ((bits_pre) # UInt  |-> w)
  **  ((x_pre) # Float  |-> (fp32_of_bits (w)))
.

(*----- Function qcp_float_from_bits -----*)

Definition qcp_float_from_bits_return_wit_1 := 
(
forall (bits_pre: Z) ,
  TT && emp 
|--
  “ (same_bits (fp32_of_bits (bits_pre)) (fp32_of_bits (bits_pre)) ) ”
  &&  emp
) \/
(
forall (bits_pre: Z) ,
  TT && emp 
|--
  “ (same_bits (fp32_of_bits (bits_pre)) (fp32_of_bits (bits_pre)) ) ”
  &&  emp
).

Definition qcp_float_from_bits_return_wit_1_split_goal_1 := 
forall (bits_pre: Z) ,
  (same_bits (fp32_of_bits (bits_pre)) (fp32_of_bits (bits_pre)) )
.

Definition qcp_float_from_bits_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_qcp_float_bits_at_safety_wit_1 : qcp_float_bits_at_safety_wit_1.
Axiom proof_of_qcp_float_bits_at_safety_wit_2 : qcp_float_bits_at_safety_wit_2.
Axiom proof_of_qcp_float_bits_at_safety_wit_3 : qcp_float_bits_at_safety_wit_3.
Axiom proof_of_qcp_float_bits_at_entail_wit_1 : qcp_float_bits_at_entail_wit_1.
Axiom proof_of_qcp_float_bits_at_entail_wit_2 : qcp_float_bits_at_entail_wit_2.
Axiom proof_of_qcp_float_bits_at_return_wit_1 : qcp_float_bits_at_return_wit_1.
Axiom proof_of_qcp_float_bits_return_wit_1 : qcp_float_bits_return_wit_1.
Axiom proof_of_qcp_float_bits_partial_solve_wit_1 : qcp_float_bits_partial_solve_wit_1.
Axiom proof_of_qcp_float_from_bits_at_safety_wit_1 : qcp_float_from_bits_at_safety_wit_1.
Axiom proof_of_qcp_float_from_bits_at_safety_wit_2 : qcp_float_from_bits_at_safety_wit_2.
Axiom proof_of_qcp_float_from_bits_at_safety_wit_3 : qcp_float_from_bits_at_safety_wit_3.
Axiom proof_of_qcp_float_from_bits_at_safety_wit_4 : qcp_float_from_bits_at_safety_wit_4.
Axiom proof_of_qcp_float_from_bits_at_safety_wit_5 : qcp_float_from_bits_at_safety_wit_5.
Axiom proof_of_qcp_float_from_bits_at_safety_wit_6 : qcp_float_from_bits_at_safety_wit_6.
Axiom proof_of_qcp_float_from_bits_at_entail_wit_1 : qcp_float_from_bits_at_entail_wit_1.
Axiom proof_of_qcp_float_from_bits_at_entail_wit_2 : qcp_float_from_bits_at_entail_wit_2.
Axiom proof_of_qcp_float_from_bits_at_return_wit_1 : qcp_float_from_bits_at_return_wit_1.
Axiom proof_of_qcp_float_from_bits_return_wit_1 : qcp_float_from_bits_return_wit_1.
Axiom proof_of_qcp_float_from_bits_partial_solve_wit_1 : qcp_float_from_bits_partial_solve_wit_1.

End VC_Correct.
