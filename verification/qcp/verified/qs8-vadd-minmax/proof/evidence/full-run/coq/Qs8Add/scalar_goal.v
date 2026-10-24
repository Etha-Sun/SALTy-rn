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
Require Import Qs8Add.Model.
Local Open Scope sac.

(*----- Function qcp_qa_s8 -----*)

Definition qcp_qa_s8_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (8)) = (qa_s8 (x_pre))) ” 
  &&  “ ((-128) <= (signed_last_nbits (x_pre) (8))) ” 
  &&  “ ((signed_last_nbits (x_pre) (8)) <= 127) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (8)) <= 127) ” 
  &&  “ ((-128) <= (signed_last_nbits (x_pre) (8))) ” 
  &&  “ ((signed_last_nbits (x_pre) (8)) = (qa_s8 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_s8_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (8)) <= 127)
.

Definition qcp_qa_s8_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-128) <= (signed_last_nbits (x_pre) (8)))
.

Definition qcp_qa_s8_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (8)) = (qa_s8 (x_pre)))
.

(*----- Function qcp_qa_s16 -----*)

Definition qcp_qa_s16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (16)) = (qa_s16 (x_pre))) ” 
  &&  “ ((-32768) <= (signed_last_nbits (x_pre) (16))) ” 
  &&  “ ((signed_last_nbits (x_pre) (16)) <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (16)) <= 32767) ” 
  &&  “ ((-32768) <= (signed_last_nbits (x_pre) (16))) ” 
  &&  “ ((signed_last_nbits (x_pre) (16)) = (qa_s16 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_s16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) <= 32767)
.

Definition qcp_qa_s16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-32768) <= (signed_last_nbits (x_pre) (16)))
.

Definition qcp_qa_s16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) = (qa_s16 (x_pre)))
.

(*----- Function qcp_qa_s32 -----*)

Definition qcp_qa_s32_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (32)) = (qa_s32 (x_pre))) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (x_pre) (32))) ” 
  &&  “ ((signed_last_nbits (x_pre) (32)) <= INT_MAX) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (x_pre) (32))) ” 
  &&  “ ((signed_last_nbits (x_pre) (32)) = (qa_s32 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_s32_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((signed_last_nbits (x_pre) (32)) <= INT_MAX)
.

Definition qcp_qa_s32_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((INT_MIN) <= (signed_last_nbits (x_pre) (32)))
.

Definition qcp_qa_s32_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((signed_last_nbits (x_pre) (32)) = (qa_s32 (x_pre)))
.

(*----- Function qcp_qa_pow2 -----*)

Definition qcp_qa_pow2_safety_wit_1 := 
forall (d_pre: Z) (PreH1 : (0 <= d_pre)) (PreH2 : (d_pre <= 31)) ,
  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ (d_pre <= 31) ” 
  &&  “ (0 <= d_pre) ”
.

Definition qcp_qa_pow2_return_wit_1 := 
(
forall (d_pre: Z) (PreH1 : (0 <= d_pre)) (PreH2 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32)) = (qa_pow2 (d_pre))) ” 
  &&  “ (1 <= (unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32))) ” 
  &&  “ ((unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32)) <= 2147483648) ”
  &&  emp
) \/
(
forall (d_pre: Z) (PreH1 : (0 <= d_pre)) (PreH2 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32)) <= 2147483648) ” 
  &&  “ (1 <= (unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32))) ” 
  &&  “ ((unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32)) = (qa_pow2 (d_pre))) ”
  &&  emp
).

Definition qcp_qa_pow2_return_wit_1_split_goal_1 := 
forall (d_pre: Z) (PreH1 : (0 <= d_pre)) (PreH2 : (d_pre <= 31)) ,
  ((unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32)) <= 2147483648)
.

Definition qcp_qa_pow2_return_wit_1_split_goal_2 := 
forall (d_pre: Z) (PreH1 : (0 <= d_pre)) (PreH2 : (d_pre <= 31)) ,
  (1 <= (unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32)))
.

Definition qcp_qa_pow2_return_wit_1_split_goal_3 := 
forall (d_pre: Z) (PreH1 : (0 <= d_pre)) (PreH2 : (d_pre <= 31)) ,
  ((unsigned_last_nbits ((Z.shiftl 1 d_pre)) (32)) = (qa_pow2 (d_pre)))
.

(*----- Function qcp_qa_floor -----*)

Definition qcp_qa_floor_safety_wit_1 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : ((-4294967296) <= x_pre)) (PreH2 : (x_pre <= 4294967296)) (PreH3 : (1 <= p_pre)) (PreH4 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qa_floor_safety_wit_2 := 
(
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (((((-x_pre) + p_pre ) - 1 ) ÷ p_pre ) <> (INT64_MIN)) ”
) \/
(
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (((((-x_pre) + p_pre ) - 1 ) ÷ p_pre ) <> (INT64_MIN)) ”
).

Definition qcp_qa_floor_safety_wit_2_split_goal_1 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (((((-x_pre) + p_pre ) - 1 ) ÷ p_pre ) <> (INT64_MIN)) ”
.

Definition qcp_qa_floor_safety_wit_3 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (((((-x_pre) + p_pre ) - 1 ) <> (INT64_MIN)) \/ (p_pre <> (-1))) ” 
  &&  “ (p_pre <> 0) ”
.

Definition qcp_qa_floor_safety_wit_4 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ ((((-x_pre) + p_pre ) - 1 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (((-x_pre) + p_pre ) - 1 )) ”
.

Definition qcp_qa_floor_safety_wit_5 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (((-x_pre) + p_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((-x_pre) + p_pre )) ”
.

Definition qcp_qa_floor_safety_wit_6 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (x_pre <> (INT64_MIN)) ”
.

Definition qcp_qa_floor_safety_wit_7 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_qa_floor_safety_wit_8 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
  **  ((( &( "p" ) )) # Int64  |-> p_pre)
|--
  “ ((x_pre <> (INT64_MIN)) \/ (p_pre <> (-1))) ” 
  &&  “ (p_pre <> 0) ”
.

Definition qcp_qa_floor_return_wit_1 := 
(
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  TT && emp 
|--
  “ ((x_pre ÷ p_pre ) = (qa_floor (x_pre) (p_pre))) ”
  &&  emp
) \/
(
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  TT && emp 
|--
  “ ((x_pre ÷ p_pre ) = (qa_floor (x_pre) (p_pre))) ”
  &&  emp
).

Definition qcp_qa_floor_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((x_pre ÷ p_pre ) = (qa_floor (x_pre) (p_pre)))
.

Definition qcp_qa_floor_return_wit_2 := 
(
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  TT && emp 
|--
  “ ((-((((-x_pre) + p_pre ) - 1 ) ÷ p_pre )) = (qa_floor (x_pre) (p_pre))) ”
  &&  emp
) \/
(
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  TT && emp 
|--
  “ ((-((((-x_pre) + p_pre ) - 1 ) ÷ p_pre )) = (qa_floor (x_pre) (p_pre))) ”
  &&  emp
).

Definition qcp_qa_floor_return_wit_2_split_goal_1 := 
forall (p_pre: Z) (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) (PreH4 : (1 <= p_pre)) (PreH5 : (p_pre <= 2147483648)) ,
  ((-((((-x_pre) + p_pre ) - 1 ) ÷ p_pre )) = (qa_floor (x_pre) (p_pre)))
.

(*----- Function qcp_qa_sat16 -----*)

Definition qcp_qa_sat16_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <> (INT_MIN)) ”
.

Definition qcp_qa_sat16_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32768) ”
.

Definition qcp_qa_sat16_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <> (INT_MIN)) ”
.

Definition qcp_qa_sat16_safety_wit_4 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32768) ”
.

Definition qcp_qa_sat16_safety_wit_5 := 
forall (x_pre: Z) (PreH1 : (x_pre >= (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32767 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32767) ”
.

Definition qcp_qa_sat16_safety_wit_6 := 
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32767 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32767) ”
.

Definition qcp_qa_sat16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (qa_sat16 (x_pre))) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (qa_sat16 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_sat16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  (x_pre = (qa_sat16 (x_pre)))
.

Definition qcp_qa_sat16_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (32767 = (qa_sat16 (x_pre))) ” 
  &&  “ ((-32768) <= 32767) ” 
  &&  “ (32767 <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (32767 = (qa_sat16 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_sat16_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  (32767 = (qa_sat16 (x_pre)))
.

Definition qcp_qa_sat16_return_wit_3 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((-32768) = (qa_sat16 (x_pre))) ” 
  &&  “ ((-32768) <= (-32768)) ” 
  &&  “ ((-32768) <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((-32768) = (qa_sat16 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_sat16_return_wit_3_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((-32768) = (qa_sat16 (x_pre)))
.

(*----- Function qcp_qa_sat8 -----*)

Definition qcp_qa_sat8_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <> (INT_MIN)) ”
.

Definition qcp_qa_sat8_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition qcp_qa_sat8_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <> (INT_MIN)) ”
.

Definition qcp_qa_sat8_safety_wit_4 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition qcp_qa_sat8_safety_wit_5 := 
forall (x_pre: Z) (PreH1 : (x_pre >= (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (127 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 127) ”
.

Definition qcp_qa_sat8_safety_wit_6 := 
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (127 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 127) ”
.

Definition qcp_qa_sat8_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre <= 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qa_sat8 (x_pre))) ” 
  &&  “ ((-128) <= x_pre) ” 
  &&  “ (x_pre <= 127) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre <= 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qa_sat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_sat8_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre <= 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  (x_pre = (qa_sat8 (x_pre)))
.

Definition qcp_qa_sat8_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (127 = (qa_sat8 (x_pre))) ” 
  &&  “ ((-128) <= 127) ” 
  &&  “ (127 <= 127) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (127 = (qa_sat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_sat8_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  (127 = (qa_sat8 (x_pre)))
.

Definition qcp_qa_sat8_return_wit_3 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ ((-128) = (qa_sat8 (x_pre))) ” 
  &&  “ ((-128) <= (-128)) ” 
  &&  “ ((-128) <= 127) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ ((-128) = (qa_sat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qa_sat8_return_wit_3_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((-128) = (qa_sat8 (x_pre)))
.

(*----- Function qcp_qa_neon_mul -----*)

Definition qcp_qa_neon_mul_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre * b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre * b_pre )) ”
.

Definition qcp_qa_neon_mul_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * b_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_mul (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * b_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_mul (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_neon_mul_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * b_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  (retval = (qa_neon_mul (a_pre) (b_pre)))
.

Definition qcp_qa_neon_mul_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * b_pre )) ” 
  &&  “ ((a_pre * b_pre ) <= INT64_MAX) ”
.

Definition qcp_qa_neon_mul_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * b_pre )) ” 
  &&  “ ((a_pre * b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_mul_partial_solve_wit_1 := qcp_qa_neon_mul_partial_solve_wit_1_pure -> qcp_qa_neon_mul_partial_solve_wit_1_aux.

(*----- Function qcp_qa_rvv_mul -----*)

Definition qcp_qa_rvv_mul_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre * b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre * b_pre )) ”
.

Definition qcp_qa_rvv_mul_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * b_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_mul (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * b_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_mul (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_mul_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * b_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  (retval = (qa_rvv_mul (a_pre) (b_pre)))
.

Definition qcp_qa_rvv_mul_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * b_pre )) ” 
  &&  “ ((a_pre * b_pre ) <= INT64_MAX) ”
.

Definition qcp_qa_rvv_mul_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * b_pre )) ” 
  &&  “ ((a_pre * b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_rvv_mul_partial_solve_wit_1 := qcp_qa_rvv_mul_partial_solve_wit_1_pure -> qcp_qa_rvv_mul_partial_solve_wit_1_aux.

(*----- Function qcp_qa_neon_mla -----*)

Definition qcp_qa_neon_mla_safety_wit_1 := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= c_pre)) (PreH6 : (c_pre <= INT_MAX)) ,
  ((( &( "low" ) )) # Int  |->_)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
|--
  “ ((b_pre * c_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (b_pre * c_pre )) ”
.

Definition qcp_qa_neon_mla_safety_wit_2 := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((b_pre * c_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) ,
  ((( &( "low" ) )) # Int  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
|--
  “ ((a_pre + retval ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + retval )) ”
.

Definition qcp_qa_neon_mla_return_wit_1 := 
(
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre + retval_2 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (qa_s32 ((b_pre * c_pre ))))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= c_pre)) (PreH12 : (c_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_mla (a_pre) (b_pre) (c_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre + retval_2 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (qa_s32 ((b_pre * c_pre ))))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= c_pre)) (PreH12 : (c_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_mla (a_pre) (b_pre) (c_pre))) ”
  &&  emp
).

Definition qcp_qa_neon_mla_return_wit_1_split_goal_1 := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre + retval_2 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (qa_s32 ((b_pre * c_pre ))))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= c_pre)) (PreH12 : (c_pre <= INT_MAX)) ,
  (retval = (qa_neon_mla (a_pre) (b_pre) (c_pre)))
.

Definition qcp_qa_neon_mla_partial_solve_wit_1_pure := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= c_pre)) (PreH6 : (c_pre <= INT_MAX)) ,
  ((( &( "low" ) )) # Int  |->_)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (b_pre * c_pre )) ” 
  &&  “ ((b_pre * c_pre ) <= INT64_MAX) ”
.

Definition qcp_qa_neon_mla_partial_solve_wit_1_aux := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= c_pre)) (PreH6 : (c_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (b_pre * c_pre )) ” 
  &&  “ ((b_pre * c_pre ) <= INT64_MAX) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c_pre) ” 
  &&  “ (c_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_mla_partial_solve_wit_1 := qcp_qa_neon_mla_partial_solve_wit_1_pure -> qcp_qa_neon_mla_partial_solve_wit_1_aux.

Definition qcp_qa_neon_mla_partial_solve_wit_2_pure := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((b_pre * c_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) ,
  ((( &( "low" ) )) # Int  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + retval )) ” 
  &&  “ ((a_pre + retval ) <= INT64_MAX) ”
.

Definition qcp_qa_neon_mla_partial_solve_wit_2_aux := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((b_pre * c_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + retval )) ” 
  &&  “ ((a_pre + retval ) <= INT64_MAX) ” 
  &&  “ (retval = (qa_s32 ((b_pre * c_pre )))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c_pre) ” 
  &&  “ (c_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_mla_partial_solve_wit_2 := qcp_qa_neon_mla_partial_solve_wit_2_pure -> qcp_qa_neon_mla_partial_solve_wit_2_aux.

(*----- Function qcp_qa_rvv_macc -----*)

Definition qcp_qa_rvv_macc_safety_wit_1 := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= c_pre)) (PreH6 : (c_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
|--
  “ ((a_pre + (b_pre * c_pre ) ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + (b_pre * c_pre ) )) ”
.

Definition qcp_qa_rvv_macc_safety_wit_2 := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= c_pre)) (PreH6 : (c_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
|--
  “ ((b_pre * c_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (b_pre * c_pre )) ”
.

Definition qcp_qa_rvv_macc_return_wit_1 := 
(
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre + (b_pre * c_pre ) ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_macc (a_pre) (b_pre) (c_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre + (b_pre * c_pre ) ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_macc (a_pre) (b_pre) (c_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_macc_return_wit_1_split_goal_1 := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre + (b_pre * c_pre ) ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) ,
  (retval = (qa_rvv_macc (a_pre) (b_pre) (c_pre)))
.

Definition qcp_qa_rvv_macc_partial_solve_wit_1_pure := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= c_pre)) (PreH6 : (c_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + (b_pre * c_pre ) )) ” 
  &&  “ ((a_pre + (b_pre * c_pre ) ) <= INT64_MAX) ”
.

Definition qcp_qa_rvv_macc_partial_solve_wit_1_aux := 
forall (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= c_pre)) (PreH6 : (c_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + (b_pre * c_pre ) )) ” 
  &&  “ ((a_pre + (b_pre * c_pre ) ) <= INT64_MAX) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c_pre) ” 
  &&  “ (c_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_rvv_macc_partial_solve_wit_1 := qcp_qa_rvv_macc_partial_solve_wit_1_pure -> qcp_qa_rvv_macc_partial_solve_wit_1_aux.

(*----- Function qcp_qa_neon_shift -----*)

Definition qcp_qa_neon_shift_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s8 (b_pre)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (32 <> (INT_MIN)) ”
.

Definition qcp_qa_neon_shift_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s8 (b_pre)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition qcp_qa_neon_shift_safety_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval > (-32))) (PreH2 : (retval = (qa_s8 (b_pre)))) (PreH3 : ((-128) <= retval)) (PreH4 : (retval <= 127)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) ,
  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition qcp_qa_neon_shift_safety_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <= (-32))) (PreH2 : (retval = (qa_s8 (b_pre)))) (PreH3 : ((-128) <= retval)) (PreH4 : (retval <= 127)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) ,
  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qa_neon_shift_safety_wit_5 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval >= 32)) (PreH2 : (retval > (-32))) (PreH3 : (retval = (qa_s8 (b_pre)))) (PreH4 : ((-128) <= retval)) (PreH5 : (retval <= 127)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qa_neon_shift_safety_wit_6 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval < 32)) (PreH2 : (retval > (-32))) (PreH3 : (retval = (qa_s8 (b_pre)))) (PreH4 : ((-128) <= retval)) (PreH5 : (retval <= 127)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qa_neon_shift_safety_wit_7 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval < 32)) (PreH3 : (retval > (-32))) (PreH4 : (retval = (qa_s8 (b_pre)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) ,
  ((( &( "p" ) )) # Int64  |->_)
  **  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (retval <> (INT_MIN)) ”
.

Definition qcp_qa_neon_shift_safety_wit_8 := 
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 ((-retval_2))))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 < 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + (retval ÷ 2 ) )) ”
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 ((-retval_2))))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 < 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + (retval ÷ 2 ) )) ”
).

Definition qcp_qa_neon_shift_safety_wit_8_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 ((-retval_2))))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 < 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX) ”
.

Definition qcp_qa_neon_shift_safety_wit_8_split_goal_2 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 ((-retval_2))))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 < 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((INT64_MIN) <= (a_pre + (retval ÷ 2 ) )) ”
.

Definition qcp_qa_neon_shift_safety_wit_9 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 ((-retval_2))))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 < 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((retval <> (INT64_MIN)) \/ (2 <> (-1))) ” 
  &&  “ (2 <> 0) ”
.

Definition qcp_qa_neon_shift_safety_wit_10 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qa_pow2 ((-retval))))) (PreH2 : (1 <= retval_2)) (PreH3 : (retval_2 <= 2147483648)) (PreH4 : (retval < 0)) (PreH5 : (retval < 32)) (PreH6 : (retval > (-32))) (PreH7 : (retval = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval)) (PreH9 : (retval <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval_2)
  **  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_qa_neon_shift_safety_wit_11 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (retval_2)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 >= 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre * retval ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre * retval )) ”
.

Definition qcp_qa_neon_shift_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * retval_3 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_3 = (qa_pow2 (retval_2)))) (PreH5 : (1 <= retval_3)) (PreH6 : (retval_3 <= 2147483648)) (PreH7 : (retval_2 >= 0)) (PreH8 : (retval_2 < 32)) (PreH9 : (retval_2 > (-32))) (PreH10 : (retval_2 = (qa_s8 (b_pre)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : ((INT_MIN) <= a_pre)) (PreH14 : (a_pre <= INT_MAX)) (PreH15 : ((INT_MIN) <= b_pre)) (PreH16 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_shift (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * retval_3 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_3 = (qa_pow2 (retval_2)))) (PreH5 : (1 <= retval_3)) (PreH6 : (retval_3 <= 2147483648)) (PreH7 : (retval_2 >= 0)) (PreH8 : (retval_2 < 32)) (PreH9 : (retval_2 > (-32))) (PreH10 : (retval_2 = (qa_s8 (b_pre)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : ((INT_MIN) <= a_pre)) (PreH14 : (a_pre <= INT_MAX)) (PreH15 : ((INT_MIN) <= b_pre)) (PreH16 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_shift (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_neon_shift_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * retval_3 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_3 = (qa_pow2 (retval_2)))) (PreH5 : (1 <= retval_3)) (PreH6 : (retval_3 <= 2147483648)) (PreH7 : (retval_2 >= 0)) (PreH8 : (retval_2 < 32)) (PreH9 : (retval_2 > (-32))) (PreH10 : (retval_2 = (qa_s8 (b_pre)))) (PreH11 : ((-128) <= retval_2)) (PreH12 : (retval_2 <= 127)) (PreH13 : ((INT_MIN) <= a_pre)) (PreH14 : (a_pre <= INT_MAX)) (PreH15 : ((INT_MIN) <= b_pre)) (PreH16 : (b_pre <= INT_MAX)) ,
  (retval = (qa_neon_shift (a_pre) (b_pre)))
.

Definition qcp_qa_neon_shift_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_3 ÷ 2 ) )) (retval_3)))) (PreH2 : (retval_3 = (qa_pow2 ((-retval_2))))) (PreH3 : (1 <= retval_3)) (PreH4 : (retval_3 <= 2147483648)) (PreH5 : (retval_2 < 0)) (PreH6 : (retval_2 < 32)) (PreH7 : (retval_2 > (-32))) (PreH8 : (retval_2 = (qa_s8 (b_pre)))) (PreH9 : ((-128) <= retval_2)) (PreH10 : (retval_2 <= 127)) (PreH11 : ((INT_MIN) <= a_pre)) (PreH12 : (a_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (retval) (32)) = (qa_neon_shift (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (retval) (32))) ” 
  &&  “ ((signed_last_nbits (retval) (32)) <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_3 ÷ 2 ) )) (retval_3)))) (PreH2 : (retval_3 = (qa_pow2 ((-retval_2))))) (PreH3 : (1 <= retval_3)) (PreH4 : (retval_3 <= 2147483648)) (PreH5 : (retval_2 < 0)) (PreH6 : (retval_2 < 32)) (PreH7 : (retval_2 > (-32))) (PreH8 : (retval_2 = (qa_s8 (b_pre)))) (PreH9 : ((-128) <= retval_2)) (PreH10 : (retval_2 <= 127)) (PreH11 : ((INT_MIN) <= a_pre)) (PreH12 : (a_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (retval) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (retval) (32))) ” 
  &&  “ ((signed_last_nbits (retval) (32)) = (qa_neon_shift (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_neon_shift_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_3 ÷ 2 ) )) (retval_3)))) (PreH2 : (retval_3 = (qa_pow2 ((-retval_2))))) (PreH3 : (1 <= retval_3)) (PreH4 : (retval_3 <= 2147483648)) (PreH5 : (retval_2 < 0)) (PreH6 : (retval_2 < 32)) (PreH7 : (retval_2 > (-32))) (PreH8 : (retval_2 = (qa_s8 (b_pre)))) (PreH9 : ((-128) <= retval_2)) (PreH10 : (retval_2 <= 127)) (PreH11 : ((INT_MIN) <= a_pre)) (PreH12 : (a_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  ((signed_last_nbits (retval) (32)) <= INT_MAX)
.

Definition qcp_qa_neon_shift_return_wit_2_split_goal_2 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_3 ÷ 2 ) )) (retval_3)))) (PreH2 : (retval_3 = (qa_pow2 ((-retval_2))))) (PreH3 : (1 <= retval_3)) (PreH4 : (retval_3 <= 2147483648)) (PreH5 : (retval_2 < 0)) (PreH6 : (retval_2 < 32)) (PreH7 : (retval_2 > (-32))) (PreH8 : (retval_2 = (qa_s8 (b_pre)))) (PreH9 : ((-128) <= retval_2)) (PreH10 : (retval_2 <= 127)) (PreH11 : ((INT_MIN) <= a_pre)) (PreH12 : (a_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  ((INT_MIN) <= (signed_last_nbits (retval) (32)))
.

Definition qcp_qa_neon_shift_return_wit_2_split_goal_3 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_3 ÷ 2 ) )) (retval_3)))) (PreH2 : (retval_3 = (qa_pow2 ((-retval_2))))) (PreH3 : (1 <= retval_3)) (PreH4 : (retval_3 <= 2147483648)) (PreH5 : (retval_2 < 0)) (PreH6 : (retval_2 < 32)) (PreH7 : (retval_2 > (-32))) (PreH8 : (retval_2 = (qa_s8 (b_pre)))) (PreH9 : ((-128) <= retval_2)) (PreH10 : (retval_2 <= 127)) (PreH11 : ((INT_MIN) <= a_pre)) (PreH12 : (a_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  ((signed_last_nbits (retval) (32)) = (qa_neon_shift (a_pre) (b_pre)))
.

Definition qcp_qa_neon_shift_return_wit_3 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <= (-32))) (PreH2 : (retval = (qa_s8 (b_pre)))) (PreH3 : ((-128) <= retval)) (PreH4 : (retval <= 127)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qa_neon_shift (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <= (-32))) (PreH2 : (retval = (qa_s8 (b_pre)))) (PreH3 : ((-128) <= retval)) (PreH4 : (retval <= 127)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qa_neon_shift (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_neon_shift_return_wit_3_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <= (-32))) (PreH2 : (retval = (qa_s8 (b_pre)))) (PreH3 : ((-128) <= retval)) (PreH4 : (retval <= 127)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) ,
  (0 = (qa_neon_shift (a_pre) (b_pre)))
.

Definition qcp_qa_neon_shift_return_wit_4 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval >= 32)) (PreH2 : (retval > (-32))) (PreH3 : (retval = (qa_s8 (b_pre)))) (PreH4 : ((-128) <= retval)) (PreH5 : (retval <= 127)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qa_neon_shift (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval >= 32)) (PreH2 : (retval > (-32))) (PreH3 : (retval = (qa_s8 (b_pre)))) (PreH4 : ((-128) <= retval)) (PreH5 : (retval <= 127)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qa_neon_shift (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_neon_shift_return_wit_4_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval >= 32)) (PreH2 : (retval > (-32))) (PreH3 : (retval = (qa_s8 (b_pre)))) (PreH4 : ((-128) <= retval)) (PreH5 : (retval <= 127)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  (0 = (qa_neon_shift (a_pre) (b_pre)))
.

Definition qcp_qa_neon_shift_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  ((( &( "d" ) )) # Char  |->_)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
.

Definition qcp_qa_neon_shift_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_shift_partial_solve_wit_1 := qcp_qa_neon_shift_partial_solve_wit_1_pure -> qcp_qa_neon_shift_partial_solve_wit_1_aux.

Definition qcp_qa_neon_shift_partial_solve_wit_2_pure := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval < 32)) (PreH3 : (retval > (-32))) (PreH4 : (retval = (qa_s8 (b_pre)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) ,
  ((( &( "p" ) )) # Int64  |->_)
  **  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (0 <= (-retval)) ” 
  &&  “ ((-retval) <= 31) ”
.

Definition qcp_qa_neon_shift_partial_solve_wit_2_aux := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (retval < 32)) (PreH3 : (retval > (-32))) (PreH4 : (retval = (qa_s8 (b_pre)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 <= (-retval)) ” 
  &&  “ ((-retval) <= 31) ” 
  &&  “ (retval < 0) ” 
  &&  “ (retval < 32) ” 
  &&  “ (retval > (-32)) ” 
  &&  “ (retval = (qa_s8 (b_pre))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_shift_partial_solve_wit_2 := qcp_qa_neon_shift_partial_solve_wit_2_pure -> qcp_qa_neon_shift_partial_solve_wit_2_aux.

Definition qcp_qa_neon_shift_partial_solve_wit_3_pure := 
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 ((-retval_2))))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 < 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ” 
  &&  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ”
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval <= INT64_MAX)) (PreH2 : ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX)) (PreH3 : (retval >= INT64_MIN)) (PreH4 : ((a_pre + (retval ÷ 2 ) ) >= INT64_MIN)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (b_pre >= INT_MIN)) (PreH8 : (a_pre >= INT_MIN)) (PreH9 : (retval = (qa_pow2 ((-retval_2))))) (PreH10 : (1 <= retval)) (PreH11 : (retval <= 2147483648)) (PreH12 : (retval_2 < 0)) (PreH13 : (retval_2 < 32)) (PreH14 : (retval_2 > (-32))) (PreH15 : (retval_2 = (qa_s8 (b_pre)))) (PreH16 : ((-128) <= retval_2)) (PreH17 : (retval_2 <= 127)) (PreH18 : ((INT_MIN) <= a_pre)) (PreH19 : (a_pre <= INT_MAX)) (PreH20 : ((INT_MIN) <= b_pre)) (PreH21 : (b_pre <= INT_MAX)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ” 
  &&  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ”
).

Definition qcp_qa_neon_shift_partial_solve_wit_3_pure_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval <= INT64_MAX)) (PreH2 : ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX)) (PreH3 : (retval >= INT64_MIN)) (PreH4 : ((a_pre + (retval ÷ 2 ) ) >= INT64_MIN)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (b_pre >= INT_MIN)) (PreH8 : (a_pre >= INT_MIN)) (PreH9 : (retval = (qa_pow2 ((-retval_2))))) (PreH10 : (1 <= retval)) (PreH11 : (retval <= 2147483648)) (PreH12 : (retval_2 < 0)) (PreH13 : (retval_2 < 32)) (PreH14 : (retval_2 > (-32))) (PreH15 : (retval_2 = (qa_s8 (b_pre)))) (PreH16 : ((-128) <= retval_2)) (PreH17 : (retval_2 <= 127)) (PreH18 : ((INT_MIN) <= a_pre)) (PreH19 : (a_pre <= INT_MAX)) (PreH20 : ((INT_MIN) <= b_pre)) (PreH21 : (b_pre <= INT_MAX)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ”
.

Definition qcp_qa_neon_shift_partial_solve_wit_3_pure_split_goal_2 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval <= INT64_MAX)) (PreH2 : ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX)) (PreH3 : (retval >= INT64_MIN)) (PreH4 : ((a_pre + (retval ÷ 2 ) ) >= INT64_MIN)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (b_pre >= INT_MIN)) (PreH8 : (a_pre >= INT_MIN)) (PreH9 : (retval = (qa_pow2 ((-retval_2))))) (PreH10 : (1 <= retval)) (PreH11 : (retval <= 2147483648)) (PreH12 : (retval_2 < 0)) (PreH13 : (retval_2 < 32)) (PreH14 : (retval_2 > (-32))) (PreH15 : (retval_2 = (qa_s8 (b_pre)))) (PreH16 : ((-128) <= retval_2)) (PreH17 : (retval_2 <= 127)) (PreH18 : ((INT_MIN) <= a_pre)) (PreH19 : (a_pre <= INT_MAX)) (PreH20 : ((INT_MIN) <= b_pre)) (PreH21 : (b_pre <= INT_MAX)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ”
.

Definition qcp_qa_neon_shift_partial_solve_wit_3_aux := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 ((-retval_2))))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 < 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ” 
  &&  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ” 
  &&  “ (retval = (qa_pow2 ((-retval_2)))) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ (retval_2 < 0) ” 
  &&  “ (retval_2 < 32) ” 
  &&  “ (retval_2 > (-32)) ” 
  &&  “ (retval_2 = (qa_s8 (b_pre))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_shift_partial_solve_wit_3 := qcp_qa_neon_shift_partial_solve_wit_3_pure -> qcp_qa_neon_shift_partial_solve_wit_3_aux.

Definition qcp_qa_neon_shift_partial_solve_wit_4_pure := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : (retval < 32)) (PreH3 : (retval > (-32))) (PreH4 : (retval = (qa_s8 (b_pre)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) ,
  ((( &( "p" ) )) # Int64  |->_)
  **  ((( &( "d" ) )) # Char  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 31) ”
.

Definition qcp_qa_neon_shift_partial_solve_wit_4_aux := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : (retval < 32)) (PreH3 : (retval > (-32))) (PreH4 : (retval = (qa_s8 (b_pre)))) (PreH5 : ((-128) <= retval)) (PreH6 : (retval <= 127)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : ((INT_MIN) <= b_pre)) (PreH10 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 31) ” 
  &&  “ (retval >= 0) ” 
  &&  “ (retval < 32) ” 
  &&  “ (retval > (-32)) ” 
  &&  “ (retval = (qa_s8 (b_pre))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_shift_partial_solve_wit_4 := qcp_qa_neon_shift_partial_solve_wit_4_pure -> qcp_qa_neon_shift_partial_solve_wit_4_aux.

Definition qcp_qa_neon_shift_partial_solve_wit_5_pure := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (retval_2)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 >= 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "d" ) )) # Char  |-> retval_2)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * retval )) ” 
  &&  “ ((a_pre * retval ) <= INT64_MAX) ”
.

Definition qcp_qa_neon_shift_partial_solve_wit_5_aux := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (retval_2)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : (retval_2 >= 0)) (PreH5 : (retval_2 < 32)) (PreH6 : (retval_2 > (-32))) (PreH7 : (retval_2 = (qa_s8 (b_pre)))) (PreH8 : ((-128) <= retval_2)) (PreH9 : (retval_2 <= 127)) (PreH10 : ((INT_MIN) <= a_pre)) (PreH11 : (a_pre <= INT_MAX)) (PreH12 : ((INT_MIN) <= b_pre)) (PreH13 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * retval )) ” 
  &&  “ ((a_pre * retval ) <= INT64_MAX) ” 
  &&  “ (retval = (qa_pow2 (retval_2))) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ (retval_2 >= 0) ” 
  &&  “ (retval_2 < 32) ” 
  &&  “ (retval_2 > (-32)) ” 
  &&  “ (retval_2 = (qa_s8 (b_pre))) ” 
  &&  “ ((-128) <= retval_2) ” 
  &&  “ (retval_2 <= 127) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qa_neon_shift_partial_solve_wit_5 := qcp_qa_neon_shift_partial_solve_wit_5_pure -> qcp_qa_neon_shift_partial_solve_wit_5_aux.

(*----- Function qcp_qa_rvv_rnu -----*)

Definition qcp_qa_rvv_rnu_safety_wit_1 := 
(
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + (retval ÷ 2 ) )) ”
) \/
(
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + (retval ÷ 2 ) )) ”
).

Definition qcp_qa_rvv_rnu_safety_wit_1_split_goal_1 := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX) ”
.

Definition qcp_qa_rvv_rnu_safety_wit_1_split_goal_2 := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((INT64_MIN) <= (a_pre + (retval ÷ 2 ) )) ”
.

Definition qcp_qa_rvv_rnu_safety_wit_2 := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((retval <> (INT64_MIN)) \/ (2 <> (-1))) ” 
  &&  “ (2 <> 0) ”
.

Definition qcp_qa_rvv_rnu_safety_wit_3 := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "num" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_qa_rvv_rnu_return_wit_1 := 
(
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_2 ÷ 2 ) )) (retval_2)))) (PreH2 : (retval_2 = (qa_pow2 (d_pre)))) (PreH3 : (1 <= retval_2)) (PreH4 : (retval_2 <= 2147483648)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (retval) (32)) = (qa_rvv_rnu (a_pre) (d_pre))) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (retval) (32))) ” 
  &&  “ ((signed_last_nbits (retval) (32)) <= INT_MAX) ”
  &&  emp
) \/
(
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_2 ÷ 2 ) )) (retval_2)))) (PreH2 : (retval_2 = (qa_pow2 (d_pre)))) (PreH3 : (1 <= retval_2)) (PreH4 : (retval_2 <= 2147483648)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (retval) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (retval) (32))) ” 
  &&  “ ((signed_last_nbits (retval) (32)) = (qa_rvv_rnu (a_pre) (d_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_rnu_return_wit_1_split_goal_1 := 
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_2 ÷ 2 ) )) (retval_2)))) (PreH2 : (retval_2 = (qa_pow2 (d_pre)))) (PreH3 : (1 <= retval_2)) (PreH4 : (retval_2 <= 2147483648)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 31)) ,
  ((signed_last_nbits (retval) (32)) <= INT_MAX)
.

Definition qcp_qa_rvv_rnu_return_wit_1_split_goal_2 := 
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_2 ÷ 2 ) )) (retval_2)))) (PreH2 : (retval_2 = (qa_pow2 (d_pre)))) (PreH3 : (1 <= retval_2)) (PreH4 : (retval_2 <= 2147483648)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 31)) ,
  ((INT_MIN) <= (signed_last_nbits (retval) (32)))
.

Definition qcp_qa_rvv_rnu_return_wit_1_split_goal_3 := 
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_floor ((a_pre + (retval_2 ÷ 2 ) )) (retval_2)))) (PreH2 : (retval_2 = (qa_pow2 (d_pre)))) (PreH3 : (1 <= retval_2)) (PreH4 : (retval_2 <= 2147483648)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 31)) ,
  ((signed_last_nbits (retval) (32)) = (qa_rvv_rnu (a_pre) (d_pre)))
.

Definition qcp_qa_rvv_rnu_partial_solve_wit_1_pure := 
forall (d_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : (0 <= d_pre)) (PreH4 : (d_pre <= 31)) ,
  ((( &( "p" ) )) # Int64  |->_)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
.

Definition qcp_qa_rvv_rnu_partial_solve_wit_1_aux := 
forall (d_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : (0 <= d_pre)) (PreH4 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
  &&  emp
.

Definition qcp_qa_rvv_rnu_partial_solve_wit_1 := qcp_qa_rvv_rnu_partial_solve_wit_1_pure -> qcp_qa_rvv_rnu_partial_solve_wit_1_aux.

Definition qcp_qa_rvv_rnu_partial_solve_wit_2_pure := 
(
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ” 
  &&  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ”
) \/
(
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <= INT64_MAX)) (PreH2 : ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX)) (PreH3 : (retval >= INT64_MIN)) (PreH4 : ((a_pre + (retval ÷ 2 ) ) >= INT64_MIN)) (PreH5 : (d_pre <= INT_MAX)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (d_pre >= INT_MIN)) (PreH8 : (a_pre >= INT_MIN)) (PreH9 : (retval = (qa_pow2 (d_pre)))) (PreH10 : (1 <= retval)) (PreH11 : (retval <= 2147483648)) (PreH12 : ((INT_MIN) <= a_pre)) (PreH13 : (a_pre <= INT_MAX)) (PreH14 : (0 <= d_pre)) (PreH15 : (d_pre <= 31)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ” 
  &&  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ”
).

Definition qcp_qa_rvv_rnu_partial_solve_wit_2_pure_split_goal_1 := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <= INT64_MAX)) (PreH2 : ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX)) (PreH3 : (retval >= INT64_MIN)) (PreH4 : ((a_pre + (retval ÷ 2 ) ) >= INT64_MIN)) (PreH5 : (d_pre <= INT_MAX)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (d_pre >= INT_MIN)) (PreH8 : (a_pre >= INT_MIN)) (PreH9 : (retval = (qa_pow2 (d_pre)))) (PreH10 : (1 <= retval)) (PreH11 : (retval <= 2147483648)) (PreH12 : ((INT_MIN) <= a_pre)) (PreH13 : (a_pre <= INT_MAX)) (PreH14 : (0 <= d_pre)) (PreH15 : (d_pre <= 31)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ”
.

Definition qcp_qa_rvv_rnu_partial_solve_wit_2_pure_split_goal_2 := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <= INT64_MAX)) (PreH2 : ((a_pre + (retval ÷ 2 ) ) <= INT64_MAX)) (PreH3 : (retval >= INT64_MIN)) (PreH4 : ((a_pre + (retval ÷ 2 ) ) >= INT64_MIN)) (PreH5 : (d_pre <= INT_MAX)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (d_pre >= INT_MIN)) (PreH8 : (a_pre >= INT_MIN)) (PreH9 : (retval = (qa_pow2 (d_pre)))) (PreH10 : (1 <= retval)) (PreH11 : (retval <= 2147483648)) (PreH12 : ((INT_MIN) <= a_pre)) (PreH13 : (a_pre <= INT_MAX)) (PreH14 : (0 <= d_pre)) (PreH15 : (d_pre <= 31)) ,
  ((( &( "y" ) )) # Int64  |->_)
  **  ((( &( "num" ) )) # Int64  |-> (a_pre + (retval ÷ 2 ) ))
  **  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ”
.

Definition qcp_qa_rvv_rnu_partial_solve_wit_2_aux := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ ((a_pre + (retval ÷ 2 ) ) <= 4294967296) ” 
  &&  “ ((-4294967296) <= (a_pre + (retval ÷ 2 ) )) ” 
  &&  “ (retval = (qa_pow2 (d_pre))) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
  &&  emp
.

Definition qcp_qa_rvv_rnu_partial_solve_wit_2 := qcp_qa_rvv_rnu_partial_solve_wit_2_pure -> qcp_qa_rvv_rnu_partial_solve_wit_2_aux.

(*----- Function qcp_qa_rvv_sll -----*)

Definition qcp_qa_rvv_sll_safety_wit_1 := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ ((a_pre * retval ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre * retval )) ”
.

Definition qcp_qa_rvv_sll_return_wit_1 := 
(
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * retval_2 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (qa_pow2 (d_pre)))) (PreH5 : (1 <= retval_2)) (PreH6 : (retval_2 <= 2147483648)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : (0 <= d_pre)) (PreH10 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_sll (a_pre) (d_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * retval_2 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (qa_pow2 (d_pre)))) (PreH5 : (1 <= retval_2)) (PreH6 : (retval_2 <= 2147483648)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : (0 <= d_pre)) (PreH10 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_sll (a_pre) (d_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_sll_return_wit_1_split_goal_1 := 
forall (d_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qa_s32 ((a_pre * retval_2 ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (qa_pow2 (d_pre)))) (PreH5 : (1 <= retval_2)) (PreH6 : (retval_2 <= 2147483648)) (PreH7 : ((INT_MIN) <= a_pre)) (PreH8 : (a_pre <= INT_MAX)) (PreH9 : (0 <= d_pre)) (PreH10 : (d_pre <= 31)) ,
  (retval = (qa_rvv_sll (a_pre) (d_pre)))
.

Definition qcp_qa_rvv_sll_partial_solve_wit_1_pure := 
forall (d_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : (0 <= d_pre)) (PreH4 : (d_pre <= 31)) ,
  ((( &( "p" ) )) # Int64  |->_)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
.

Definition qcp_qa_rvv_sll_partial_solve_wit_1_aux := 
forall (d_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : (0 <= d_pre)) (PreH4 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
  &&  emp
.

Definition qcp_qa_rvv_sll_partial_solve_wit_1 := qcp_qa_rvv_sll_partial_solve_wit_1_pure -> qcp_qa_rvv_sll_partial_solve_wit_1_aux.

Definition qcp_qa_rvv_sll_partial_solve_wit_2_pure := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  ((( &( "p" ) )) # Int64  |-> retval)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # Int  |-> d_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * retval )) ” 
  &&  “ ((a_pre * retval ) <= INT64_MAX) ”
.

Definition qcp_qa_rvv_sll_partial_solve_wit_2_aux := 
forall (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_pow2 (d_pre)))) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 2147483648)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : (0 <= d_pre)) (PreH7 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre * retval )) ” 
  &&  “ ((a_pre * retval ) <= INT64_MAX) ” 
  &&  “ (retval = (qa_pow2 (d_pre))) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 2147483648) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
  &&  emp
.

Definition qcp_qa_rvv_sll_partial_solve_wit_2 := qcp_qa_rvv_sll_partial_solve_wit_2_pure -> qcp_qa_rvv_sll_partial_solve_wit_2_aux.

(*----- Function qcp_qa_neon_add16 -----*)

Definition qcp_qa_neon_add16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + b_pre )) ”
.

Definition qcp_qa_neon_add16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_add16 (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qa_neon_add16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_neon_add16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (retval = (qa_neon_add16 (a_pre) (b_pre)))
.

Definition qcp_qa_neon_add16_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT64_MAX) ”
.

Definition qcp_qa_neon_add16_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT64_MAX) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
.

Definition qcp_qa_neon_add16_partial_solve_wit_1 := qcp_qa_neon_add16_partial_solve_wit_1_pure -> qcp_qa_neon_add16_partial_solve_wit_1_aux.

(*----- Function qcp_qa_rvv_add16 -----*)

Definition qcp_qa_rvv_add16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + b_pre )) ”
.

Definition qcp_qa_rvv_add16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_add16 (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qa_rvv_add16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_add16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (retval = (qa_rvv_add16 (a_pre) (b_pre)))
.

Definition qcp_qa_rvv_add16_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT64_MAX) ”
.

Definition qcp_qa_rvv_add16_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT64_MAX) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
.

Definition qcp_qa_rvv_add16_partial_solve_wit_1 := qcp_qa_rvv_add16_partial_solve_wit_1_pure -> qcp_qa_rvv_add16_partial_solve_wit_1_aux.

(*----- Function qcp_qa_sub8 -----*)

Definition qcp_qa_sub8_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-128) <= a_pre)) (PreH2 : (a_pre <= 127)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  ((( &( "a" ) )) # Char  |-> a_pre)
  **  ((( &( "b" ) )) # Char  |-> b_pre)
|--
  “ ((a_pre - b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre - b_pre )) ”
.

Definition qcp_qa_sub8_return_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qa_s16 ((a_pre - b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-128) <= a_pre)) (PreH5 : (a_pre <= 127)) (PreH6 : ((-128) <= b_pre)) (PreH7 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (retval = (qa_s16 ((a_pre - b_pre )))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
.

Definition qcp_qa_sub8_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-128) <= a_pre)) (PreH2 : (a_pre <= 127)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  ((( &( "a" ) )) # Char  |-> a_pre)
  **  ((( &( "b" ) )) # Char  |-> b_pre)
|--
  “ ((INT_MIN) <= (a_pre - b_pre )) ” 
  &&  “ ((a_pre - b_pre ) <= INT_MAX) ”
.

Definition qcp_qa_sub8_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-128) <= a_pre)) (PreH2 : (a_pre <= 127)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (a_pre - b_pre )) ” 
  &&  “ ((a_pre - b_pre ) <= INT_MAX) ” 
  &&  “ ((-128) <= a_pre) ” 
  &&  “ (a_pre <= 127) ” 
  &&  “ ((-128) <= b_pre) ” 
  &&  “ (b_pre <= 127) ”
  &&  emp
.

Definition qcp_qa_sub8_partial_solve_wit_1 := qcp_qa_sub8_partial_solve_wit_1_pure -> qcp_qa_sub8_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_qcp_qa_s8_return_wit_1 : qcp_qa_s8_return_wit_1.
Axiom proof_of_qcp_qa_s16_return_wit_1 : qcp_qa_s16_return_wit_1.
Axiom proof_of_qcp_qa_s32_return_wit_1 : qcp_qa_s32_return_wit_1.
Axiom proof_of_qcp_qa_pow2_safety_wit_1 : qcp_qa_pow2_safety_wit_1.
Axiom proof_of_qcp_qa_pow2_return_wit_1 : qcp_qa_pow2_return_wit_1.
Axiom proof_of_qcp_qa_floor_safety_wit_1 : qcp_qa_floor_safety_wit_1.
Axiom proof_of_qcp_qa_floor_safety_wit_2 : qcp_qa_floor_safety_wit_2.
Axiom proof_of_qcp_qa_floor_safety_wit_3 : qcp_qa_floor_safety_wit_3.
Axiom proof_of_qcp_qa_floor_safety_wit_4 : qcp_qa_floor_safety_wit_4.
Axiom proof_of_qcp_qa_floor_safety_wit_5 : qcp_qa_floor_safety_wit_5.
Axiom proof_of_qcp_qa_floor_safety_wit_6 : qcp_qa_floor_safety_wit_6.
Axiom proof_of_qcp_qa_floor_safety_wit_7 : qcp_qa_floor_safety_wit_7.
Axiom proof_of_qcp_qa_floor_safety_wit_8 : qcp_qa_floor_safety_wit_8.
Axiom proof_of_qcp_qa_floor_return_wit_1 : qcp_qa_floor_return_wit_1.
Axiom proof_of_qcp_qa_floor_return_wit_2 : qcp_qa_floor_return_wit_2.
Axiom proof_of_qcp_qa_sat16_safety_wit_1 : qcp_qa_sat16_safety_wit_1.
Axiom proof_of_qcp_qa_sat16_safety_wit_2 : qcp_qa_sat16_safety_wit_2.
Axiom proof_of_qcp_qa_sat16_safety_wit_3 : qcp_qa_sat16_safety_wit_3.
Axiom proof_of_qcp_qa_sat16_safety_wit_4 : qcp_qa_sat16_safety_wit_4.
Axiom proof_of_qcp_qa_sat16_safety_wit_5 : qcp_qa_sat16_safety_wit_5.
Axiom proof_of_qcp_qa_sat16_safety_wit_6 : qcp_qa_sat16_safety_wit_6.
Axiom proof_of_qcp_qa_sat16_return_wit_1 : qcp_qa_sat16_return_wit_1.
Axiom proof_of_qcp_qa_sat16_return_wit_2 : qcp_qa_sat16_return_wit_2.
Axiom proof_of_qcp_qa_sat16_return_wit_3 : qcp_qa_sat16_return_wit_3.
Axiom proof_of_qcp_qa_sat8_safety_wit_1 : qcp_qa_sat8_safety_wit_1.
Axiom proof_of_qcp_qa_sat8_safety_wit_2 : qcp_qa_sat8_safety_wit_2.
Axiom proof_of_qcp_qa_sat8_safety_wit_3 : qcp_qa_sat8_safety_wit_3.
Axiom proof_of_qcp_qa_sat8_safety_wit_4 : qcp_qa_sat8_safety_wit_4.
Axiom proof_of_qcp_qa_sat8_safety_wit_5 : qcp_qa_sat8_safety_wit_5.
Axiom proof_of_qcp_qa_sat8_safety_wit_6 : qcp_qa_sat8_safety_wit_6.
Axiom proof_of_qcp_qa_sat8_return_wit_1 : qcp_qa_sat8_return_wit_1.
Axiom proof_of_qcp_qa_sat8_return_wit_2 : qcp_qa_sat8_return_wit_2.
Axiom proof_of_qcp_qa_sat8_return_wit_3 : qcp_qa_sat8_return_wit_3.
Axiom proof_of_qcp_qa_neon_mul_safety_wit_1 : qcp_qa_neon_mul_safety_wit_1.
Axiom proof_of_qcp_qa_neon_mul_return_wit_1 : qcp_qa_neon_mul_return_wit_1.
Axiom proof_of_qcp_qa_neon_mul_partial_solve_wit_1_pure : qcp_qa_neon_mul_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_neon_mul_partial_solve_wit_1 : qcp_qa_neon_mul_partial_solve_wit_1.
Axiom proof_of_qcp_qa_rvv_mul_safety_wit_1 : qcp_qa_rvv_mul_safety_wit_1.
Axiom proof_of_qcp_qa_rvv_mul_return_wit_1 : qcp_qa_rvv_mul_return_wit_1.
Axiom proof_of_qcp_qa_rvv_mul_partial_solve_wit_1_pure : qcp_qa_rvv_mul_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_rvv_mul_partial_solve_wit_1 : qcp_qa_rvv_mul_partial_solve_wit_1.
Axiom proof_of_qcp_qa_neon_mla_safety_wit_1 : qcp_qa_neon_mla_safety_wit_1.
Axiom proof_of_qcp_qa_neon_mla_safety_wit_2 : qcp_qa_neon_mla_safety_wit_2.
Axiom proof_of_qcp_qa_neon_mla_return_wit_1 : qcp_qa_neon_mla_return_wit_1.
Axiom proof_of_qcp_qa_neon_mla_partial_solve_wit_1_pure : qcp_qa_neon_mla_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_neon_mla_partial_solve_wit_1 : qcp_qa_neon_mla_partial_solve_wit_1.
Axiom proof_of_qcp_qa_neon_mla_partial_solve_wit_2_pure : qcp_qa_neon_mla_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qa_neon_mla_partial_solve_wit_2 : qcp_qa_neon_mla_partial_solve_wit_2.
Axiom proof_of_qcp_qa_rvv_macc_safety_wit_1 : qcp_qa_rvv_macc_safety_wit_1.
Axiom proof_of_qcp_qa_rvv_macc_safety_wit_2 : qcp_qa_rvv_macc_safety_wit_2.
Axiom proof_of_qcp_qa_rvv_macc_return_wit_1 : qcp_qa_rvv_macc_return_wit_1.
Axiom proof_of_qcp_qa_rvv_macc_partial_solve_wit_1_pure : qcp_qa_rvv_macc_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_rvv_macc_partial_solve_wit_1 : qcp_qa_rvv_macc_partial_solve_wit_1.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_1 : qcp_qa_neon_shift_safety_wit_1.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_2 : qcp_qa_neon_shift_safety_wit_2.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_3 : qcp_qa_neon_shift_safety_wit_3.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_4 : qcp_qa_neon_shift_safety_wit_4.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_5 : qcp_qa_neon_shift_safety_wit_5.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_6 : qcp_qa_neon_shift_safety_wit_6.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_7 : qcp_qa_neon_shift_safety_wit_7.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_8 : qcp_qa_neon_shift_safety_wit_8.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_9 : qcp_qa_neon_shift_safety_wit_9.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_10 : qcp_qa_neon_shift_safety_wit_10.
Axiom proof_of_qcp_qa_neon_shift_safety_wit_11 : qcp_qa_neon_shift_safety_wit_11.
Axiom proof_of_qcp_qa_neon_shift_return_wit_1 : qcp_qa_neon_shift_return_wit_1.
Axiom proof_of_qcp_qa_neon_shift_return_wit_2 : qcp_qa_neon_shift_return_wit_2.
Axiom proof_of_qcp_qa_neon_shift_return_wit_3 : qcp_qa_neon_shift_return_wit_3.
Axiom proof_of_qcp_qa_neon_shift_return_wit_4 : qcp_qa_neon_shift_return_wit_4.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_1_pure : qcp_qa_neon_shift_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_1 : qcp_qa_neon_shift_partial_solve_wit_1.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_2_pure : qcp_qa_neon_shift_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_2 : qcp_qa_neon_shift_partial_solve_wit_2.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_3_pure : qcp_qa_neon_shift_partial_solve_wit_3_pure.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_3 : qcp_qa_neon_shift_partial_solve_wit_3.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_4_pure : qcp_qa_neon_shift_partial_solve_wit_4_pure.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_4 : qcp_qa_neon_shift_partial_solve_wit_4.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_5_pure : qcp_qa_neon_shift_partial_solve_wit_5_pure.
Axiom proof_of_qcp_qa_neon_shift_partial_solve_wit_5 : qcp_qa_neon_shift_partial_solve_wit_5.
Axiom proof_of_qcp_qa_rvv_rnu_safety_wit_1 : qcp_qa_rvv_rnu_safety_wit_1.
Axiom proof_of_qcp_qa_rvv_rnu_safety_wit_2 : qcp_qa_rvv_rnu_safety_wit_2.
Axiom proof_of_qcp_qa_rvv_rnu_safety_wit_3 : qcp_qa_rvv_rnu_safety_wit_3.
Axiom proof_of_qcp_qa_rvv_rnu_return_wit_1 : qcp_qa_rvv_rnu_return_wit_1.
Axiom proof_of_qcp_qa_rvv_rnu_partial_solve_wit_1_pure : qcp_qa_rvv_rnu_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_rvv_rnu_partial_solve_wit_1 : qcp_qa_rvv_rnu_partial_solve_wit_1.
Axiom proof_of_qcp_qa_rvv_rnu_partial_solve_wit_2_pure : qcp_qa_rvv_rnu_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qa_rvv_rnu_partial_solve_wit_2 : qcp_qa_rvv_rnu_partial_solve_wit_2.
Axiom proof_of_qcp_qa_rvv_sll_safety_wit_1 : qcp_qa_rvv_sll_safety_wit_1.
Axiom proof_of_qcp_qa_rvv_sll_return_wit_1 : qcp_qa_rvv_sll_return_wit_1.
Axiom proof_of_qcp_qa_rvv_sll_partial_solve_wit_1_pure : qcp_qa_rvv_sll_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_rvv_sll_partial_solve_wit_1 : qcp_qa_rvv_sll_partial_solve_wit_1.
Axiom proof_of_qcp_qa_rvv_sll_partial_solve_wit_2_pure : qcp_qa_rvv_sll_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qa_rvv_sll_partial_solve_wit_2 : qcp_qa_rvv_sll_partial_solve_wit_2.
Axiom proof_of_qcp_qa_neon_add16_safety_wit_1 : qcp_qa_neon_add16_safety_wit_1.
Axiom proof_of_qcp_qa_neon_add16_return_wit_1 : qcp_qa_neon_add16_return_wit_1.
Axiom proof_of_qcp_qa_neon_add16_partial_solve_wit_1_pure : qcp_qa_neon_add16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_neon_add16_partial_solve_wit_1 : qcp_qa_neon_add16_partial_solve_wit_1.
Axiom proof_of_qcp_qa_rvv_add16_safety_wit_1 : qcp_qa_rvv_add16_safety_wit_1.
Axiom proof_of_qcp_qa_rvv_add16_return_wit_1 : qcp_qa_rvv_add16_return_wit_1.
Axiom proof_of_qcp_qa_rvv_add16_partial_solve_wit_1_pure : qcp_qa_rvv_add16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_rvv_add16_partial_solve_wit_1 : qcp_qa_rvv_add16_partial_solve_wit_1.
Axiom proof_of_qcp_qa_sub8_safety_wit_1 : qcp_qa_sub8_safety_wit_1.
Axiom proof_of_qcp_qa_sub8_return_wit_1 : qcp_qa_sub8_return_wit_1.
Axiom proof_of_qcp_qa_sub8_partial_solve_wit_1_pure : qcp_qa_sub8_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_sub8_partial_solve_wit_1 : qcp_qa_sub8_partial_solve_wit_1.

End VC_Correct.
