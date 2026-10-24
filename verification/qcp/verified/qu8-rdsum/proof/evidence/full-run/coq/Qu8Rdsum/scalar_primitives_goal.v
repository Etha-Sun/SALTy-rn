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
Local Open Scope sac.

(*----- Function rsum_narrow16 -----*)

Definition rsum_narrow16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (16)) = (rs_s16 (x_pre))) ” 
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
  &&  “ ((signed_last_nbits (x_pre) (16)) = (rs_s16 (x_pre))) ”
  &&  emp
).

Definition rsum_narrow16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) <= 32767)
.

Definition rsum_narrow16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-32768) <= (signed_last_nbits (x_pre) (16)))
.

Definition rsum_narrow16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) = (rs_s16 (x_pre)))
.

(*----- Function rsum_unarrow16 -----*)

Definition rsum_unarrow16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) = (rs_u16 (x_pre))) ” 
  &&  “ (0 <= (unsigned_last_nbits (x_pre) (16))) ” 
  &&  “ ((unsigned_last_nbits (x_pre) (16)) <= 65535) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) <= 65535) ” 
  &&  “ (0 <= (unsigned_last_nbits (x_pre) (16))) ” 
  &&  “ ((unsigned_last_nbits (x_pre) (16)) = (rs_u16 (x_pre))) ”
  &&  emp
).

Definition rsum_unarrow16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((unsigned_last_nbits (x_pre) (16)) <= 65535)
.

Definition rsum_unarrow16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  (0 <= (unsigned_last_nbits (x_pre) (16)))
.

Definition rsum_unarrow16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((unsigned_last_nbits (x_pre) (16)) = (rs_u16 (x_pre)))
.

(*----- Function rsum_narrow32 -----*)

Definition rsum_narrow32_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT64_MIN) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (32)) = (rs_s32 (x_pre))) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (x_pre) (32))) ” 
  &&  “ ((signed_last_nbits (x_pre) (32)) <= INT_MAX) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT64_MIN) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (32)) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (signed_last_nbits (x_pre) (32))) ” 
  &&  “ ((signed_last_nbits (x_pre) (32)) = (rs_s32 (x_pre))) ”
  &&  emp
).

Definition rsum_narrow32_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT64_MIN) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((signed_last_nbits (x_pre) (32)) <= INT_MAX)
.

Definition rsum_narrow32_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT64_MIN) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((INT_MIN) <= (signed_last_nbits (x_pre) (32)))
.

Definition rsum_narrow32_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT64_MIN) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((signed_last_nbits (x_pre) (32)) = (rs_s32 (x_pre)))
.

(*----- Function rsum_add_s32 -----*)

Definition rsum_add_s32_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |->_)
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + b_pre )) ”
.

Definition rsum_add_s32_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((INT_MIN) <= b_pre)) (PreH4 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (INT_MAX <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= INT_MAX) ”
.

Definition rsum_add_s32_safety_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (((a_pre + b_pre ) - 4294967296 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((a_pre + b_pre ) - 4294967296 )) ”
.

Definition rsum_add_s32_safety_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (4294967296 <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= 4294967296) ”
.

Definition rsum_add_s32_safety_wit_5 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) <= INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (((-INT_MAX) - 1 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((-INT_MAX) - 1 )) ”
.

Definition rsum_add_s32_safety_wit_6 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> ((a_pre + b_pre ) - 4294967296 ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (((-INT_MAX) - 1 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((-INT_MAX) - 1 )) ”
.

Definition rsum_add_s32_safety_wit_7 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) <= INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (INT_MAX <> (INT64_MIN)) ”
.

Definition rsum_add_s32_safety_wit_8 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> ((a_pre + b_pre ) - 4294967296 ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (INT_MAX <> (INT64_MIN)) ”
.

Definition rsum_add_s32_safety_wit_9 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> ((a_pre + b_pre ) - 4294967296 ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (INT_MAX <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= INT_MAX) ”
.

Definition rsum_add_s32_safety_wit_10 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) <= INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (INT_MAX <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= INT_MAX) ”
.

Definition rsum_add_s32_safety_wit_11 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> ((a_pre + b_pre ) - 4294967296 ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (1 <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= 1) ”
.

Definition rsum_add_s32_safety_wit_12 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) <= INT_MAX)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (1 <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= 1) ”
.

Definition rsum_add_s32_safety_wit_13 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (((a_pre + b_pre ) - 4294967296 ) < ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) > INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> ((a_pre + b_pre ) - 4294967296 ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ False ”
.

Definition rsum_add_s32_safety_wit_14 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) < ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (((a_pre + b_pre ) + 4294967296 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((a_pre + b_pre ) + 4294967296 )) ”
.

Definition rsum_add_s32_safety_wit_15 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) < ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  ((( &( "s" ) )) # Int64  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
|--
  “ (4294967296 <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= 4294967296) ”
.

Definition rsum_add_s32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) < ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((a_pre + b_pre ) + 4294967296 ) = (rs_add_s32 (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= ((a_pre + b_pre ) + 4294967296 )) ” 
  &&  “ (((a_pre + b_pre ) + 4294967296 ) <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) < ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((a_pre + b_pre ) + 4294967296 ) = (rs_add_s32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rsum_add_s32_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) < ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  (((a_pre + b_pre ) + 4294967296 ) = (rs_add_s32 (a_pre) (b_pre)))
.

Definition rsum_add_s32_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (((a_pre + b_pre ) - 4294967296 ) >= ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) > INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((a_pre + b_pre ) - 4294967296 ) = (rs_add_s32 (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= ((a_pre + b_pre ) - 4294967296 )) ” 
  &&  “ (((a_pre + b_pre ) - 4294967296 ) <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (((a_pre + b_pre ) - 4294967296 ) >= ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) > INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((a_pre + b_pre ) - 4294967296 ) = (rs_add_s32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rsum_add_s32_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (((a_pre + b_pre ) - 4294967296 ) >= ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) > INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  (((a_pre + b_pre ) - 4294967296 ) = (rs_add_s32 (a_pre) (b_pre)))
.

Definition rsum_add_s32_return_wit_3 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) >= ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((a_pre + b_pre ) = (rs_add_s32 (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) >= ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((a_pre + b_pre ) = (rs_add_s32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rsum_add_s32_return_wit_3_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) >= ((-INT_MAX) - 1 ))) (PreH2 : ((a_pre + b_pre ) <= INT_MAX)) (PreH3 : ((INT_MIN) <= a_pre)) (PreH4 : (a_pre <= INT_MAX)) (PreH5 : ((INT_MIN) <= b_pre)) (PreH6 : (b_pre <= INT_MAX)) ,
  ((a_pre + b_pre ) = (rs_add_s32 (a_pre) (b_pre)))
.

(*----- Function rsum_add_u32 -----*)

Definition rsum_add_u32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > UINT_MAX)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ (((a_pre + b_pre ) - 4294967296 ) = (rs_add_u32 (a_pre) (b_pre))) ” 
  &&  “ (0 <= ((a_pre + b_pre ) - 4294967296 )) ” 
  &&  “ (((a_pre + b_pre ) - 4294967296 ) <= UINT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > UINT_MAX)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ (((a_pre + b_pre ) - 4294967296 ) = (rs_add_u32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rsum_add_u32_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) > UINT_MAX)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) ,
  (((a_pre + b_pre ) - 4294967296 ) = (rs_add_u32 (a_pre) (b_pre)))
.

Definition rsum_add_u32_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) <= UINT_MAX)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ ((a_pre + b_pre ) = (rs_add_u32 (a_pre) (b_pre))) ” 
  &&  “ (0 <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= UINT_MAX) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) <= UINT_MAX)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ ((a_pre + b_pre ) = (rs_add_u32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rsum_add_u32_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((a_pre + b_pre ) <= UINT_MAX)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) ,
  ((a_pre + b_pre ) = (rs_add_u32 (a_pre) (b_pre)))
.

(*----- Function rsum_pair_s8 -----*)

Definition rsum_pair_s8_safety_wit_1 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-128) <= x_pre)) (PreH4 : (x_pre <= 127)) (PreH5 : ((-128) <= y_pre)) (PreH6 : (y_pre <= 127)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "x" ) )) # Char  |-> x_pre)
  **  ((( &( "y" ) )) # Char  |-> y_pre)
|--
  “ (((a_pre + x_pre ) + y_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= ((a_pre + x_pre ) + y_pre )) ”
.

Definition rsum_pair_s8_safety_wit_2 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-128) <= x_pre)) (PreH4 : (x_pre <= 127)) (PreH5 : ((-128) <= y_pre)) (PreH6 : (y_pre <= 127)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "x" ) )) # Char  |-> x_pre)
  **  ((( &( "y" ) )) # Char  |-> y_pre)
|--
  “ ((a_pre + x_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre + x_pre )) ”
.

Definition rsum_pair_s8_return_wit_1 := 
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_s16 (((a_pre + x_pre ) + y_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-128) <= x_pre)) (PreH7 : (x_pre <= 127)) (PreH8 : ((-128) <= y_pre)) (PreH9 : (y_pre <= 127)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_s8 (a_pre) (x_pre) (y_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_s16 (((a_pre + x_pre ) + y_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-128) <= x_pre)) (PreH7 : (x_pre <= 127)) (PreH8 : ((-128) <= y_pre)) (PreH9 : (y_pre <= 127)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_s8 (a_pre) (x_pre) (y_pre))) ”
  &&  emp
).

Definition rsum_pair_s8_return_wit_1_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_s16 (((a_pre + x_pre ) + y_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-128) <= x_pre)) (PreH7 : (x_pre <= 127)) (PreH8 : ((-128) <= y_pre)) (PreH9 : (y_pre <= 127)) ,
  (retval = (rs_pair_s8 (a_pre) (x_pre) (y_pre)))
.

Definition rsum_pair_s8_partial_solve_wit_1_pure := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-128) <= x_pre)) (PreH4 : (x_pre <= 127)) (PreH5 : ((-128) <= y_pre)) (PreH6 : (y_pre <= 127)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "x" ) )) # Char  |-> x_pre)
  **  ((( &( "y" ) )) # Char  |-> y_pre)
|--
  “ ((INT_MIN) <= ((a_pre + x_pre ) + y_pre )) ” 
  &&  “ (((a_pre + x_pre ) + y_pre ) <= INT_MAX) ”
.

Definition rsum_pair_s8_partial_solve_wit_1_aux := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-128) <= x_pre)) (PreH4 : (x_pre <= 127)) (PreH5 : ((-128) <= y_pre)) (PreH6 : (y_pre <= 127)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= ((a_pre + x_pre ) + y_pre )) ” 
  &&  “ (((a_pre + x_pre ) + y_pre ) <= INT_MAX) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-128) <= x_pre) ” 
  &&  “ (x_pre <= 127) ” 
  &&  “ ((-128) <= y_pre) ” 
  &&  “ (y_pre <= 127) ”
  &&  emp
.

Definition rsum_pair_s8_partial_solve_wit_1 := rsum_pair_s8_partial_solve_wit_1_pure -> rsum_pair_s8_partial_solve_wit_1_aux.

(*----- Function rsum_pair_u8 -----*)

Definition rsum_pair_u8_safety_wit_1 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
|--
  “ (((a_pre + x_pre ) + y_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= ((a_pre + x_pre ) + y_pre )) ”
.

Definition rsum_pair_u8_safety_wit_2 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
|--
  “ ((a_pre + x_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre + x_pre )) ”
.

Definition rsum_pair_u8_return_wit_1 := 
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_u16 (((a_pre + x_pre ) + y_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 255)) (PreH8 : (0 <= y_pre)) (PreH9 : (y_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_u8 (a_pre) (x_pre) (y_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_u16 (((a_pre + x_pre ) + y_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 255)) (PreH8 : (0 <= y_pre)) (PreH9 : (y_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_u8 (a_pre) (x_pre) (y_pre))) ”
  &&  emp
).

Definition rsum_pair_u8_return_wit_1_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_u16 (((a_pre + x_pre ) + y_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 255)) (PreH8 : (0 <= y_pre)) (PreH9 : (y_pre <= 255)) ,
  (retval = (rs_pair_u8 (a_pre) (x_pre) (y_pre)))
.

Definition rsum_pair_u8_partial_solve_wit_1_pure := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
|--
  “ ((INT_MIN) <= ((a_pre + x_pre ) + y_pre )) ” 
  &&  “ (((a_pre + x_pre ) + y_pre ) <= INT_MAX) ”
.

Definition rsum_pair_u8_partial_solve_wit_1_aux := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= ((a_pre + x_pre ) + y_pre )) ” 
  &&  “ (((a_pre + x_pre ) + y_pre ) <= INT_MAX) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ”
  &&  emp
.

Definition rsum_pair_u8_partial_solve_wit_1 := rsum_pair_u8_partial_solve_wit_1_pure -> rsum_pair_u8_partial_solve_wit_1_aux.

(*----- Function rsum_pair_s16 -----*)

Definition rsum_pair_s16_safety_wit_1 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) (PreH5 : ((-32768) <= y_pre)) (PreH6 : (y_pre <= 32767)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "x" ) )) # Short  |-> x_pre)
  **  ((( &( "y" ) )) # Short  |-> y_pre)
|--
  “ ((x_pre + y_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (x_pre + y_pre )) ”
.

Definition rsum_pair_s16_return_wit_1 := 
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) ((x_pre + y_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((-32768) <= x_pre)) (PreH7 : (x_pre <= 32767)) (PreH8 : ((-32768) <= y_pre)) (PreH9 : (y_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_s16 (a_pre) (x_pre) (y_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) ((x_pre + y_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((-32768) <= x_pre)) (PreH7 : (x_pre <= 32767)) (PreH8 : ((-32768) <= y_pre)) (PreH9 : (y_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_s16 (a_pre) (x_pre) (y_pre))) ”
  &&  emp
).

Definition rsum_pair_s16_return_wit_1_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) ((x_pre + y_pre ))))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a_pre)) (PreH5 : (a_pre <= INT_MAX)) (PreH6 : ((-32768) <= x_pre)) (PreH7 : (x_pre <= 32767)) (PreH8 : ((-32768) <= y_pre)) (PreH9 : (y_pre <= 32767)) ,
  (retval = (rs_pair_s16 (a_pre) (x_pre) (y_pre)))
.

Definition rsum_pair_s16_partial_solve_wit_1_pure := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) (PreH5 : ((-32768) <= y_pre)) (PreH6 : (y_pre <= 32767)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "x" ) )) # Short  |-> x_pre)
  **  ((( &( "y" ) )) # Short  |-> y_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (x_pre + y_pre )) ” 
  &&  “ ((x_pre + y_pre ) <= INT_MAX) ”
.

Definition rsum_pair_s16_partial_solve_wit_1_aux := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : ((INT_MIN) <= a_pre)) (PreH2 : (a_pre <= INT_MAX)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) (PreH5 : ((-32768) <= y_pre)) (PreH6 : (y_pre <= 32767)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (x_pre + y_pre )) ” 
  &&  “ ((x_pre + y_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ” 
  &&  “ ((-32768) <= y_pre) ” 
  &&  “ (y_pre <= 32767) ”
  &&  emp
.

Definition rsum_pair_s16_partial_solve_wit_1 := rsum_pair_s16_partial_solve_wit_1_pure -> rsum_pair_s16_partial_solve_wit_1_aux.

(*----- Function rsum_pair_u16 -----*)

Definition rsum_pair_u16_return_wit_1 := 
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) ((x_pre + y_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= UINT_MAX)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 65535)) (PreH8 : (0 <= y_pre)) (PreH9 : (y_pre <= 65535)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_u16 (a_pre) (x_pre) (y_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) ((x_pre + y_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= UINT_MAX)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 65535)) (PreH8 : (0 <= y_pre)) (PreH9 : (y_pre <= 65535)) ,
  TT && emp 
|--
  “ (retval = (rs_pair_u16 (a_pre) (x_pre) (y_pre))) ”
  &&  emp
).

Definition rsum_pair_u16_return_wit_1_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) ((x_pre + y_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= UINT_MAX)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 65535)) (PreH8 : (0 <= y_pre)) (PreH9 : (y_pre <= 65535)) ,
  (retval = (rs_pair_u16 (a_pre) (x_pre) (y_pre)))
.

Definition rsum_pair_u16_partial_solve_wit_1_pure := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= UINT_MAX)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 65535)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 65535)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "x" ) )) # UShort  |-> x_pre)
  **  ((( &( "y" ) )) # UShort  |-> y_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= (x_pre + y_pre )) ” 
  &&  “ ((x_pre + y_pre ) <= UINT_MAX) ”
.

Definition rsum_pair_u16_partial_solve_wit_1_aux := 
forall (y_pre: Z) (x_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= UINT_MAX)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 65535)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 65535)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= (x_pre + y_pre )) ” 
  &&  “ ((x_pre + y_pre ) <= UINT_MAX) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 65535) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 65535) ”
  &&  emp
.

Definition rsum_pair_u16_partial_solve_wit_1 := rsum_pair_u16_partial_solve_wit_1_pure -> rsum_pair_u16_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_rsum_narrow16_return_wit_1 : rsum_narrow16_return_wit_1.
Axiom proof_of_rsum_unarrow16_return_wit_1 : rsum_unarrow16_return_wit_1.
Axiom proof_of_rsum_narrow32_return_wit_1 : rsum_narrow32_return_wit_1.
Axiom proof_of_rsum_add_s32_safety_wit_1 : rsum_add_s32_safety_wit_1.
Axiom proof_of_rsum_add_s32_safety_wit_2 : rsum_add_s32_safety_wit_2.
Axiom proof_of_rsum_add_s32_safety_wit_3 : rsum_add_s32_safety_wit_3.
Axiom proof_of_rsum_add_s32_safety_wit_4 : rsum_add_s32_safety_wit_4.
Axiom proof_of_rsum_add_s32_safety_wit_5 : rsum_add_s32_safety_wit_5.
Axiom proof_of_rsum_add_s32_safety_wit_6 : rsum_add_s32_safety_wit_6.
Axiom proof_of_rsum_add_s32_safety_wit_7 : rsum_add_s32_safety_wit_7.
Axiom proof_of_rsum_add_s32_safety_wit_8 : rsum_add_s32_safety_wit_8.
Axiom proof_of_rsum_add_s32_safety_wit_9 : rsum_add_s32_safety_wit_9.
Axiom proof_of_rsum_add_s32_safety_wit_10 : rsum_add_s32_safety_wit_10.
Axiom proof_of_rsum_add_s32_safety_wit_11 : rsum_add_s32_safety_wit_11.
Axiom proof_of_rsum_add_s32_safety_wit_12 : rsum_add_s32_safety_wit_12.
Axiom proof_of_rsum_add_s32_safety_wit_13 : rsum_add_s32_safety_wit_13.
Axiom proof_of_rsum_add_s32_safety_wit_14 : rsum_add_s32_safety_wit_14.
Axiom proof_of_rsum_add_s32_safety_wit_15 : rsum_add_s32_safety_wit_15.
Axiom proof_of_rsum_add_s32_return_wit_1 : rsum_add_s32_return_wit_1.
Axiom proof_of_rsum_add_s32_return_wit_2 : rsum_add_s32_return_wit_2.
Axiom proof_of_rsum_add_s32_return_wit_3 : rsum_add_s32_return_wit_3.
Axiom proof_of_rsum_add_u32_return_wit_1 : rsum_add_u32_return_wit_1.
Axiom proof_of_rsum_add_u32_return_wit_2 : rsum_add_u32_return_wit_2.
Axiom proof_of_rsum_pair_s8_safety_wit_1 : rsum_pair_s8_safety_wit_1.
Axiom proof_of_rsum_pair_s8_safety_wit_2 : rsum_pair_s8_safety_wit_2.
Axiom proof_of_rsum_pair_s8_return_wit_1 : rsum_pair_s8_return_wit_1.
Axiom proof_of_rsum_pair_s8_partial_solve_wit_1_pure : rsum_pair_s8_partial_solve_wit_1_pure.
Axiom proof_of_rsum_pair_s8_partial_solve_wit_1 : rsum_pair_s8_partial_solve_wit_1.
Axiom proof_of_rsum_pair_u8_safety_wit_1 : rsum_pair_u8_safety_wit_1.
Axiom proof_of_rsum_pair_u8_safety_wit_2 : rsum_pair_u8_safety_wit_2.
Axiom proof_of_rsum_pair_u8_return_wit_1 : rsum_pair_u8_return_wit_1.
Axiom proof_of_rsum_pair_u8_partial_solve_wit_1_pure : rsum_pair_u8_partial_solve_wit_1_pure.
Axiom proof_of_rsum_pair_u8_partial_solve_wit_1 : rsum_pair_u8_partial_solve_wit_1.
Axiom proof_of_rsum_pair_s16_safety_wit_1 : rsum_pair_s16_safety_wit_1.
Axiom proof_of_rsum_pair_s16_return_wit_1 : rsum_pair_s16_return_wit_1.
Axiom proof_of_rsum_pair_s16_partial_solve_wit_1_pure : rsum_pair_s16_partial_solve_wit_1_pure.
Axiom proof_of_rsum_pair_s16_partial_solve_wit_1 : rsum_pair_s16_partial_solve_wit_1.
Axiom proof_of_rsum_pair_u16_return_wit_1 : rsum_pair_u16_return_wit_1.
Axiom proof_of_rsum_pair_u16_partial_solve_wit_1_pure : rsum_pair_u16_partial_solve_wit_1_pure.
Axiom proof_of_rsum_pair_u16_partial_solve_wit_1 : rsum_pair_u16_partial_solve_wit_1.

End VC_Correct.
