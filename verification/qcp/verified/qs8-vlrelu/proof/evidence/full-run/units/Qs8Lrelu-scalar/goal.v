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
Local Open Scope sac.

(*----- Function qcp_qcv_narrow16 -----*)

Definition qcp_qcv_narrow16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (16)) = (qcv_s16 (x_pre))) ” 
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
  &&  “ ((signed_last_nbits (x_pre) (16)) = (qcv_s16 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_narrow16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) <= 32767)
.

Definition qcp_qcv_narrow16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-32768) <= (signed_last_nbits (x_pre) (16)))
.

Definition qcp_qcv_narrow16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) = (qcv_s16 (x_pre)))
.

(*----- Function qcp_qcv_asr15 -----*)

Definition qcp_qcv_asr15_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-4294967296) <= x_pre)) (PreH2 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_asr15_safety_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 32767 ) ÷ 32768 ) <> (INT64_MIN)) ”
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 32767 ) ÷ 32768 ) <> (INT64_MIN)) ”
).

Definition qcp_qcv_asr15_safety_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 32767 ) ÷ 32768 ) <> (INT64_MIN)) ”
.

Definition qcp_qcv_asr15_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 32767 ) <> (INT64_MIN)) \/ (32768 <> (-1))) ” 
  &&  “ (32768 <> 0) ”
.

Definition qcp_qcv_asr15_safety_wit_4 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (((-x_pre) + 32767 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((-x_pre) + 32767 )) ”
.

Definition qcp_qcv_asr15_safety_wit_5 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (x_pre <> (INT64_MIN)) ”
.

Definition qcp_qcv_asr15_safety_wit_6 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32767 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32767) ”
.

Definition qcp_qcv_asr15_safety_wit_7 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32768) ”
.

Definition qcp_qcv_asr15_safety_wit_8 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((x_pre <> (INT64_MIN)) \/ (32768 <> (-1))) ” 
  &&  “ (32768 <> 0) ”
.

Definition qcp_qcv_asr15_safety_wit_9 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32768) ”
.

Definition qcp_qcv_asr15_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((x_pre ÷ 32768 ) = (qcv_asr15 (x_pre))) ” 
  &&  “ ((-131072) <= (x_pre ÷ 32768 )) ” 
  &&  “ ((x_pre ÷ 32768 ) <= 131072) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((x_pre ÷ 32768 ) <= 131072) ” 
  &&  “ ((-131072) <= (x_pre ÷ 32768 )) ” 
  &&  “ ((x_pre ÷ 32768 ) = (qcv_asr15 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_asr15_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((x_pre ÷ 32768 ) <= 131072)
.

Definition qcp_qcv_asr15_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-131072) <= (x_pre ÷ 32768 ))
.

Definition qcp_qcv_asr15_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((x_pre ÷ 32768 ) = (qcv_asr15 (x_pre)))
.

Definition qcp_qcv_asr15_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((-(((-x_pre) + 32767 ) ÷ 32768 )) = (qcv_asr15 (x_pre))) ” 
  &&  “ ((-131072) <= (-(((-x_pre) + 32767 ) ÷ 32768 ))) ” 
  &&  “ ((-(((-x_pre) + 32767 ) ÷ 32768 )) <= 131072) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((-(((-x_pre) + 32767 ) ÷ 32768 )) <= 131072) ” 
  &&  “ ((-131072) <= (-(((-x_pre) + 32767 ) ÷ 32768 ))) ” 
  &&  “ ((-(((-x_pre) + 32767 ) ÷ 32768 )) = (qcv_asr15 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_asr15_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-(((-x_pre) + 32767 ) ÷ 32768 )) <= 131072)
.

Definition qcp_qcv_asr15_return_wit_2_split_goal_2 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-131072) <= (-(((-x_pre) + 32767 ) ÷ 32768 )))
.

Definition qcp_qcv_asr15_return_wit_2_split_goal_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-(((-x_pre) + 32767 ) ÷ 32768 )) = (qcv_asr15 (x_pre)))
.

(*----- Function qcp_qcv_asr16 -----*)

Definition qcp_qcv_asr16_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-4294967296) <= x_pre)) (PreH2 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_asr16_safety_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 65535 ) ÷ 65536 ) <> (INT64_MIN)) ”
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 65535 ) ÷ 65536 ) <> (INT64_MIN)) ”
).

Definition qcp_qcv_asr16_safety_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 65535 ) ÷ 65536 ) <> (INT64_MIN)) ”
.

Definition qcp_qcv_asr16_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((((-x_pre) + 65535 ) <> (INT64_MIN)) \/ (65536 <> (-1))) ” 
  &&  “ (65536 <> 0) ”
.

Definition qcp_qcv_asr16_safety_wit_4 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (((-x_pre) + 65535 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((-x_pre) + 65535 )) ”
.

Definition qcp_qcv_asr16_safety_wit_5 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (x_pre <> (INT64_MIN)) ”
.

Definition qcp_qcv_asr16_safety_wit_6 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (65535 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 65535) ”
.

Definition qcp_qcv_asr16_safety_wit_7 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (65536 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 65536) ”
.

Definition qcp_qcv_asr16_safety_wit_8 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ ((x_pre <> (INT64_MIN)) \/ (65536 <> (-1))) ” 
  &&  “ (65536 <> 0) ”
.

Definition qcp_qcv_asr16_safety_wit_9 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (65536 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 65536) ”
.

Definition qcp_qcv_asr16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((x_pre ÷ 65536 ) = (qcv_asr16 (x_pre))) ” 
  &&  “ ((-65536) <= (x_pre ÷ 65536 )) ” 
  &&  “ ((x_pre ÷ 65536 ) <= 65536) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((x_pre ÷ 65536 ) <= 65536) ” 
  &&  “ ((-65536) <= (x_pre ÷ 65536 )) ” 
  &&  “ ((x_pre ÷ 65536 ) = (qcv_asr16 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_asr16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((x_pre ÷ 65536 ) <= 65536)
.

Definition qcp_qcv_asr16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-65536) <= (x_pre ÷ 65536 ))
.

Definition qcp_qcv_asr16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((x_pre ÷ 65536 ) = (qcv_asr16 (x_pre)))
.

Definition qcp_qcv_asr16_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((-(((-x_pre) + 65535 ) ÷ 65536 )) = (qcv_asr16 (x_pre))) ” 
  &&  “ ((-65536) <= (-(((-x_pre) + 65535 ) ÷ 65536 ))) ” 
  &&  “ ((-(((-x_pre) + 65535 ) ÷ 65536 )) <= 65536) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  TT && emp 
|--
  “ ((-(((-x_pre) + 65535 ) ÷ 65536 )) <= 65536) ” 
  &&  “ ((-65536) <= (-(((-x_pre) + 65535 ) ÷ 65536 ))) ” 
  &&  “ ((-(((-x_pre) + 65535 ) ÷ 65536 )) = (qcv_asr16 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_asr16_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-(((-x_pre) + 65535 ) ÷ 65536 )) <= 65536)
.

Definition qcp_qcv_asr16_return_wit_2_split_goal_2 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-65536) <= (-(((-x_pre) + 65535 ) ÷ 65536 )))
.

Definition qcp_qcv_asr16_return_wit_2_split_goal_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-4294967296) <= x_pre)) (PreH3 : (x_pre <= 4294967296)) ,
  ((-(((-x_pre) + 65535 ) ÷ 65536 )) = (qcv_asr16 (x_pre)))
.

(*----- Function qcp_qcv_sat16 -----*)

Definition qcp_qcv_sat16_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <> (INT_MIN)) ”
.

Definition qcp_qcv_sat16_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32768) ”
.

Definition qcp_qcv_sat16_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <> (INT_MIN)) ”
.

Definition qcp_qcv_sat16_safety_wit_4 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32768 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32768) ”
.

Definition qcp_qcv_sat16_safety_wit_5 := 
forall (x_pre: Z) (PreH1 : (x_pre >= (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32767 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32767) ”
.

Definition qcp_qcv_sat16_safety_wit_6 := 
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  ((( &( "x" ) )) # Int64  |-> x_pre)
|--
  “ (32767 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32767) ”
.

Definition qcp_qcv_sat16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (qcv_sat16 (x_pre))) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (qcv_sat16 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_sat16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  (x_pre = (qcv_sat16 (x_pre)))
.

Definition qcp_qcv_sat16_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (32767 = (qcv_sat16 (x_pre))) ” 
  &&  “ ((-32768) <= 32767) ” 
  &&  “ (32767 <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ (32767 = (qcv_sat16 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_sat16_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (x_pre >= (-32768))) (PreH3 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH4 : (x_pre <= INT64_MAX)) ,
  (32767 = (qcv_sat16 (x_pre)))
.

Definition qcp_qcv_sat16_return_wit_3 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((-32768) = (qcv_sat16 (x_pre))) ” 
  &&  “ ((-32768) <= (-32768)) ” 
  &&  “ ((-32768) <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  TT && emp 
|--
  “ ((-32768) = (qcv_sat16 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_sat16_return_wit_3_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-32768))) (PreH2 : (((-INT64_MAX) - 1 ) <= x_pre)) (PreH3 : (x_pre <= INT64_MAX)) ,
  ((-32768) = (qcv_sat16 (x_pre)))
.

(*----- Function qcp_qcv_sat8 -----*)

Definition qcp_qcv_sat8_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <> (INT_MIN)) ”
.

Definition qcp_qcv_sat8_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition qcp_qcv_sat8_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <> (INT_MIN)) ”
.

Definition qcp_qcv_sat8_safety_wit_4 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition qcp_qcv_sat8_safety_wit_5 := 
forall (x_pre: Z) (PreH1 : (x_pre >= (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (127 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 127) ”
.

Definition qcp_qcv_sat8_safety_wit_6 := 
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (127 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 127) ”
.

Definition qcp_qcv_sat8_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre <= 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qcv_sat8 (x_pre))) ” 
  &&  “ ((-128) <= x_pre) ” 
  &&  “ (x_pre <= 127) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre <= 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qcv_sat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_sat8_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre <= 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  (x_pre = (qcv_sat8 (x_pre)))
.

Definition qcp_qcv_sat8_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (127 = (qcv_sat8 (x_pre))) ” 
  &&  “ ((-128) <= 127) ” 
  &&  “ (127 <= 127) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (127 = (qcv_sat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_sat8_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre > 127)) (PreH2 : (x_pre >= (-128))) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  (127 = (qcv_sat8 (x_pre)))
.

Definition qcp_qcv_sat8_return_wit_3 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ ((-128) = (qcv_sat8 (x_pre))) ” 
  &&  “ ((-128) <= (-128)) ” 
  &&  “ ((-128) <= 127) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ ((-128) = (qcv_sat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_sat8_return_wit_3_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < (-128))) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((-128) = (qcv_sat8 (x_pre)))
.

(*----- Function qcp_qcv_seed -----*)

Definition qcp_qcv_seed_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16)) = (qcv_seed (x_pre))) ” 
  &&  “ ((-32768) <= (signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16))) ” 
  &&  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16)) <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16)) <= 32767) ” 
  &&  “ ((-32768) <= (signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16))) ” 
  &&  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16)) = (qcv_seed (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_seed_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16)) <= 32767)
.

Definition qcp_qcv_seed_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-32768) <= (signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16)))
.

Definition qcp_qcv_seed_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits ((0 - (unsigned_last_nbits (x_pre) (32)) )) (16)) = (qcv_seed (x_pre)))
.

(*----- Function qcp_qcv_subw -----*)

Definition qcp_qcv_subw_safety_wit_1 := 
forall (x_pre: Z) (z_pre: Z) (PreH1 : ((-32768) <= z_pre)) (PreH2 : (z_pre <= 32767)) (PreH3 : ((-128) <= x_pre)) (PreH4 : (x_pre <= 127)) ,
  ((( &( "z" ) )) # Short  |-> z_pre)
  **  ((( &( "x" ) )) # Char  |-> x_pre)
|--
  “ ((z_pre - x_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (z_pre - x_pre )) ”
.

Definition qcp_qcv_subw_return_wit_1 := 
(
forall (x_pre: Z) (z_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_s16 ((z_pre - x_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= z_pre)) (PreH5 : (z_pre <= 32767)) (PreH6 : ((-128) <= x_pre)) (PreH7 : (x_pre <= 127)) ,
  TT && emp 
|--
  “ (retval = (qcv_subw (z_pre) (x_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (z_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_s16 ((z_pre - x_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= z_pre)) (PreH5 : (z_pre <= 32767)) (PreH6 : ((-128) <= x_pre)) (PreH7 : (x_pre <= 127)) ,
  TT && emp 
|--
  “ (retval = (qcv_subw (z_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_subw_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (z_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_s16 ((z_pre - x_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= z_pre)) (PreH5 : (z_pre <= 32767)) (PreH6 : ((-128) <= x_pre)) (PreH7 : (x_pre <= 127)) ,
  (retval = (qcv_subw (z_pre) (x_pre)))
.

Definition qcp_qcv_subw_partial_solve_wit_1_pure := 
forall (x_pre: Z) (z_pre: Z) (PreH1 : ((-32768) <= z_pre)) (PreH2 : (z_pre <= 32767)) (PreH3 : ((-128) <= x_pre)) (PreH4 : (x_pre <= 127)) ,
  ((( &( "z" ) )) # Short  |-> z_pre)
  **  ((( &( "x" ) )) # Char  |-> x_pre)
|--
  “ ((INT_MIN) <= (z_pre - x_pre )) ” 
  &&  “ ((z_pre - x_pre ) <= INT_MAX) ”
.

Definition qcp_qcv_subw_partial_solve_wit_1_aux := 
forall (x_pre: Z) (z_pre: Z) (PreH1 : ((-32768) <= z_pre)) (PreH2 : (z_pre <= 32767)) (PreH3 : ((-128) <= x_pre)) (PreH4 : (x_pre <= 127)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (z_pre - x_pre )) ” 
  &&  “ ((z_pre - x_pre ) <= INT_MAX) ” 
  &&  “ ((-32768) <= z_pre) ” 
  &&  “ (z_pre <= 32767) ” 
  &&  “ ((-128) <= x_pre) ” 
  &&  “ (x_pre <= 127) ”
  &&  emp
.

Definition qcp_qcv_subw_partial_solve_wit_1 := qcp_qcv_subw_partial_solve_wit_1_pure -> qcp_qcv_subw_partial_solve_wit_1_aux.

(*----- Function qcp_qcv_shl7 -----*)

Definition qcp_qcv_shl7_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (7 <= 31) ” 
  &&  “ (0 <= 7) ”
.

Definition qcp_qcv_shl7_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_qcv_shl7_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16)) = (qcv_shl7 (x_pre))) ” 
  &&  “ ((-32768) <= (signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16))) ” 
  &&  “ ((signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16)) <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16)) <= 32767) ” 
  &&  “ ((-32768) <= (signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16))) ” 
  &&  “ ((signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16)) = (qcv_shl7 (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_shl7_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16)) <= 32767)
.

Definition qcp_qcv_shl7_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((-32768) <= (signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16)))
.

Definition qcp_qcv_shl7_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((signed_last_nbits ((Z.shiftl (unsigned_last_nbits (x_pre) (16)) 7)) (16)) = (qcv_shl7 (x_pre)))
.

(*----- Function qcp_qcv_neon_qrdmulh -----*)

Definition qcp_qcv_neon_qrdmulh_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "p" ) )) # Int64  |->_)
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((a_pre * b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre * b_pre )) ”
.

Definition qcp_qcv_neon_qrdmulh_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> (a_pre * b_pre ))
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (((2 * (a_pre * b_pre ) ) + 32768 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= ((2 * (a_pre * b_pre ) ) + 32768 )) ”
.

Definition qcp_qcv_neon_qrdmulh_safety_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> (a_pre * b_pre ))
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((2 * (a_pre * b_pre ) ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (2 * (a_pre * b_pre ) )) ”
.

Definition qcp_qcv_neon_qrdmulh_safety_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> (a_pre * b_pre ))
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_qcv_neon_qrdmulh_safety_wit_5 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> (a_pre * b_pre ))
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (32768 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32768) ”
.

Definition qcp_qcv_neon_qrdmulh_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 (retval_2)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (retval_2 = (qcv_asr16 (((2 * (a_pre * b_pre ) ) + 32768 ))))) (PreH5 : ((-65536) <= retval_2)) (PreH6 : (retval_2 <= 65536)) (PreH7 : ((-32768) <= a_pre)) (PreH8 : (a_pre <= 32767)) (PreH9 : ((-32768) <= b_pre)) (PreH10 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qcv_neon_qrdmulh (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 (retval_2)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (retval_2 = (qcv_asr16 (((2 * (a_pre * b_pre ) ) + 32768 ))))) (PreH5 : ((-65536) <= retval_2)) (PreH6 : (retval_2 <= 65536)) (PreH7 : ((-32768) <= a_pre)) (PreH8 : (a_pre <= 32767)) (PreH9 : ((-32768) <= b_pre)) (PreH10 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qcv_neon_qrdmulh (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_neon_qrdmulh_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 (retval_2)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (retval_2 = (qcv_asr16 (((2 * (a_pre * b_pre ) ) + 32768 ))))) (PreH5 : ((-65536) <= retval_2)) (PreH6 : (retval_2 <= 65536)) (PreH7 : ((-32768) <= a_pre)) (PreH8 : (a_pre <= 32767)) (PreH9 : ((-32768) <= b_pre)) (PreH10 : (b_pre <= 32767)) ,
  (retval = (qcv_neon_qrdmulh (a_pre) (b_pre)))
.

Definition qcp_qcv_neon_qrdmulh_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int64  |-> (a_pre * b_pre ))
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((-4294967296) <= ((2 * (a_pre * b_pre ) ) + 32768 )) ” 
  &&  “ (((2 * (a_pre * b_pre ) ) + 32768 ) <= 4294967296) ”
.

Definition qcp_qcv_neon_qrdmulh_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ ((-4294967296) <= ((2 * (a_pre * b_pre ) ) + 32768 )) ” 
  &&  “ (((2 * (a_pre * b_pre ) ) + 32768 ) <= 4294967296) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
.

Definition qcp_qcv_neon_qrdmulh_partial_solve_wit_1 := qcp_qcv_neon_qrdmulh_partial_solve_wit_1_pure -> qcp_qcv_neon_qrdmulh_partial_solve_wit_1_aux.

Definition qcp_qcv_neon_qrdmulh_partial_solve_wit_2_pure := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_asr16 (((2 * (a_pre * b_pre ) ) + 32768 ))))) (PreH2 : ((-65536) <= retval)) (PreH3 : (retval <= 65536)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  ((( &( "r" ) )) # Int64  |-> retval)
  **  ((( &( "p" ) )) # Int64  |-> (a_pre * b_pre ))
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= retval) ” 
  &&  “ (retval <= INT64_MAX) ”
.

Definition qcp_qcv_neon_qrdmulh_partial_solve_wit_2_aux := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_asr16 (((2 * (a_pre * b_pre ) ) + 32768 ))))) (PreH2 : ((-65536) <= retval)) (PreH3 : (retval <= 65536)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= retval) ” 
  &&  “ (retval <= INT64_MAX) ” 
  &&  “ (retval = (qcv_asr16 (((2 * (a_pre * b_pre ) ) + 32768 )))) ” 
  &&  “ ((-65536) <= retval) ” 
  &&  “ (retval <= 65536) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
.

Definition qcp_qcv_neon_qrdmulh_partial_solve_wit_2 := qcp_qcv_neon_qrdmulh_partial_solve_wit_2_pure -> qcp_qcv_neon_qrdmulh_partial_solve_wit_2_aux.

(*----- Function qcp_qcv_rvv_mul -----*)

Definition qcp_qcv_rvv_mul_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((a_pre * b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre * b_pre )) ”
.

Definition qcp_qcv_rvv_mul_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ ((a_pre * b_pre ) = (qcv_rvv_mul (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ ((a_pre * b_pre ) = (qcv_rvv_mul (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_rvv_mul_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((a_pre * b_pre ) = (qcv_rvv_mul (a_pre) (b_pre)))
.

(*----- Function qcp_qcv_rvv_clip15 -----*)

Definition qcp_qcv_rvv_clip15_safety_wit_1 := 
forall (p_pre: Z) (PreH1 : ((INT_MIN) <= p_pre)) (PreH2 : (p_pre <= INT_MAX)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int  |-> p_pre)
|--
  “ ((p_pre + 16384 ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (p_pre + 16384 )) ”
.

Definition qcp_qcv_rvv_clip15_safety_wit_2 := 
forall (p_pre: Z) (PreH1 : ((INT_MIN) <= p_pre)) (PreH2 : (p_pre <= INT_MAX)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int  |-> p_pre)
|--
  “ (16384 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16384) ”
.

Definition qcp_qcv_rvv_clip15_return_wit_1 := 
(
forall (p_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 (retval_2)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (retval_2 = (qcv_asr15 ((p_pre + 16384 ))))) (PreH5 : ((-131072) <= retval_2)) (PreH6 : (retval_2 <= 131072)) (PreH7 : ((INT_MIN) <= p_pre)) (PreH8 : (p_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qcv_rvv_clip15 (p_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (p_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 (retval_2)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (retval_2 = (qcv_asr15 ((p_pre + 16384 ))))) (PreH5 : ((-131072) <= retval_2)) (PreH6 : (retval_2 <= 131072)) (PreH7 : ((INT_MIN) <= p_pre)) (PreH8 : (p_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qcv_rvv_clip15 (p_pre))) ”
  &&  emp
).

Definition qcp_qcv_rvv_clip15_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 (retval_2)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (retval_2 = (qcv_asr15 ((p_pre + 16384 ))))) (PreH5 : ((-131072) <= retval_2)) (PreH6 : (retval_2 <= 131072)) (PreH7 : ((INT_MIN) <= p_pre)) (PreH8 : (p_pre <= INT_MAX)) ,
  (retval = (qcv_rvv_clip15 (p_pre)))
.

Definition qcp_qcv_rvv_clip15_partial_solve_wit_1_pure := 
forall (p_pre: Z) (PreH1 : ((INT_MIN) <= p_pre)) (PreH2 : (p_pre <= INT_MAX)) ,
  ((( &( "r" ) )) # Int64  |->_)
  **  ((( &( "p" ) )) # Int  |-> p_pre)
|--
  “ ((-4294967296) <= (p_pre + 16384 )) ” 
  &&  “ ((p_pre + 16384 ) <= 4294967296) ”
.

Definition qcp_qcv_rvv_clip15_partial_solve_wit_1_aux := 
forall (p_pre: Z) (PreH1 : ((INT_MIN) <= p_pre)) (PreH2 : (p_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((-4294967296) <= (p_pre + 16384 )) ” 
  &&  “ ((p_pre + 16384 ) <= 4294967296) ” 
  &&  “ ((INT_MIN) <= p_pre) ” 
  &&  “ (p_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qcv_rvv_clip15_partial_solve_wit_1 := qcp_qcv_rvv_clip15_partial_solve_wit_1_pure -> qcp_qcv_rvv_clip15_partial_solve_wit_1_aux.

Definition qcp_qcv_rvv_clip15_partial_solve_wit_2_pure := 
forall (p_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_asr15 ((p_pre + 16384 ))))) (PreH2 : ((-131072) <= retval)) (PreH3 : (retval <= 131072)) (PreH4 : ((INT_MIN) <= p_pre)) (PreH5 : (p_pre <= INT_MAX)) ,
  ((( &( "r" ) )) # Int64  |-> retval)
  **  ((( &( "p" ) )) # Int  |-> p_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= retval) ” 
  &&  “ (retval <= INT64_MAX) ”
.

Definition qcp_qcv_rvv_clip15_partial_solve_wit_2_aux := 
forall (p_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_asr15 ((p_pre + 16384 ))))) (PreH2 : ((-131072) <= retval)) (PreH3 : (retval <= 131072)) (PreH4 : ((INT_MIN) <= p_pre)) (PreH5 : (p_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= retval) ” 
  &&  “ (retval <= INT64_MAX) ” 
  &&  “ (retval = (qcv_asr15 ((p_pre + 16384 )))) ” 
  &&  “ ((-131072) <= retval) ” 
  &&  “ (retval <= 131072) ” 
  &&  “ ((INT_MIN) <= p_pre) ” 
  &&  “ (p_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qcv_rvv_clip15_partial_solve_wit_2 := qcp_qcv_rvv_clip15_partial_solve_wit_2_pure -> qcp_qcv_rvv_clip15_partial_solve_wit_2_aux.

(*----- Function qcp_qcv_neon_add -----*)

Definition qcp_qcv_neon_add_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + b_pre )) ”
.

Definition qcp_qcv_neon_add_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qcv_neon_add (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qcv_neon_add (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_neon_add_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (retval = (qcv_neon_add (a_pre) (b_pre)))
.

Definition qcp_qcv_neon_add_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT64_MAX) ”
.

Definition qcp_qcv_neon_add_partial_solve_wit_1_aux := 
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

Definition qcp_qcv_neon_add_partial_solve_wit_1 := qcp_qcv_neon_add_partial_solve_wit_1_pure -> qcp_qcv_neon_add_partial_solve_wit_1_aux.

(*----- Function qcp_qcv_rvv_add -----*)

Definition qcp_qcv_rvv_add_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT64_MAX) ” 
  &&  “ ((INT64_MIN) <= (a_pre + b_pre )) ”
.

Definition qcp_qcv_rvv_add_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qcv_rvv_add (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qcv_rvv_add (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_rvv_add_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (retval = (qcv_rvv_add (a_pre) (b_pre)))
.

Definition qcp_qcv_rvv_add_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT64_MAX) ”
.

Definition qcp_qcv_rvv_add_partial_solve_wit_1_aux := 
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

Definition qcp_qcv_rvv_add_partial_solve_wit_1 := qcp_qcv_rvv_add_partial_solve_wit_1_pure -> qcp_qcv_rvv_add_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_qcp_qcv_narrow16_return_wit_1 : qcp_qcv_narrow16_return_wit_1.
Axiom proof_of_qcp_qcv_asr15_safety_wit_1 : qcp_qcv_asr15_safety_wit_1.
Axiom proof_of_qcp_qcv_asr15_safety_wit_2 : qcp_qcv_asr15_safety_wit_2.
Axiom proof_of_qcp_qcv_asr15_safety_wit_3 : qcp_qcv_asr15_safety_wit_3.
Axiom proof_of_qcp_qcv_asr15_safety_wit_4 : qcp_qcv_asr15_safety_wit_4.
Axiom proof_of_qcp_qcv_asr15_safety_wit_5 : qcp_qcv_asr15_safety_wit_5.
Axiom proof_of_qcp_qcv_asr15_safety_wit_6 : qcp_qcv_asr15_safety_wit_6.
Axiom proof_of_qcp_qcv_asr15_safety_wit_7 : qcp_qcv_asr15_safety_wit_7.
Axiom proof_of_qcp_qcv_asr15_safety_wit_8 : qcp_qcv_asr15_safety_wit_8.
Axiom proof_of_qcp_qcv_asr15_safety_wit_9 : qcp_qcv_asr15_safety_wit_9.
Axiom proof_of_qcp_qcv_asr15_return_wit_1 : qcp_qcv_asr15_return_wit_1.
Axiom proof_of_qcp_qcv_asr15_return_wit_2 : qcp_qcv_asr15_return_wit_2.
Axiom proof_of_qcp_qcv_asr16_safety_wit_1 : qcp_qcv_asr16_safety_wit_1.
Axiom proof_of_qcp_qcv_asr16_safety_wit_2 : qcp_qcv_asr16_safety_wit_2.
Axiom proof_of_qcp_qcv_asr16_safety_wit_3 : qcp_qcv_asr16_safety_wit_3.
Axiom proof_of_qcp_qcv_asr16_safety_wit_4 : qcp_qcv_asr16_safety_wit_4.
Axiom proof_of_qcp_qcv_asr16_safety_wit_5 : qcp_qcv_asr16_safety_wit_5.
Axiom proof_of_qcp_qcv_asr16_safety_wit_6 : qcp_qcv_asr16_safety_wit_6.
Axiom proof_of_qcp_qcv_asr16_safety_wit_7 : qcp_qcv_asr16_safety_wit_7.
Axiom proof_of_qcp_qcv_asr16_safety_wit_8 : qcp_qcv_asr16_safety_wit_8.
Axiom proof_of_qcp_qcv_asr16_safety_wit_9 : qcp_qcv_asr16_safety_wit_9.
Axiom proof_of_qcp_qcv_asr16_return_wit_1 : qcp_qcv_asr16_return_wit_1.
Axiom proof_of_qcp_qcv_asr16_return_wit_2 : qcp_qcv_asr16_return_wit_2.
Axiom proof_of_qcp_qcv_sat16_safety_wit_1 : qcp_qcv_sat16_safety_wit_1.
Axiom proof_of_qcp_qcv_sat16_safety_wit_2 : qcp_qcv_sat16_safety_wit_2.
Axiom proof_of_qcp_qcv_sat16_safety_wit_3 : qcp_qcv_sat16_safety_wit_3.
Axiom proof_of_qcp_qcv_sat16_safety_wit_4 : qcp_qcv_sat16_safety_wit_4.
Axiom proof_of_qcp_qcv_sat16_safety_wit_5 : qcp_qcv_sat16_safety_wit_5.
Axiom proof_of_qcp_qcv_sat16_safety_wit_6 : qcp_qcv_sat16_safety_wit_6.
Axiom proof_of_qcp_qcv_sat16_return_wit_1 : qcp_qcv_sat16_return_wit_1.
Axiom proof_of_qcp_qcv_sat16_return_wit_2 : qcp_qcv_sat16_return_wit_2.
Axiom proof_of_qcp_qcv_sat16_return_wit_3 : qcp_qcv_sat16_return_wit_3.
Axiom proof_of_qcp_qcv_sat8_safety_wit_1 : qcp_qcv_sat8_safety_wit_1.
Axiom proof_of_qcp_qcv_sat8_safety_wit_2 : qcp_qcv_sat8_safety_wit_2.
Axiom proof_of_qcp_qcv_sat8_safety_wit_3 : qcp_qcv_sat8_safety_wit_3.
Axiom proof_of_qcp_qcv_sat8_safety_wit_4 : qcp_qcv_sat8_safety_wit_4.
Axiom proof_of_qcp_qcv_sat8_safety_wit_5 : qcp_qcv_sat8_safety_wit_5.
Axiom proof_of_qcp_qcv_sat8_safety_wit_6 : qcp_qcv_sat8_safety_wit_6.
Axiom proof_of_qcp_qcv_sat8_return_wit_1 : qcp_qcv_sat8_return_wit_1.
Axiom proof_of_qcp_qcv_sat8_return_wit_2 : qcp_qcv_sat8_return_wit_2.
Axiom proof_of_qcp_qcv_sat8_return_wit_3 : qcp_qcv_sat8_return_wit_3.
Axiom proof_of_qcp_qcv_seed_return_wit_1 : qcp_qcv_seed_return_wit_1.
Axiom proof_of_qcp_qcv_subw_safety_wit_1 : qcp_qcv_subw_safety_wit_1.
Axiom proof_of_qcp_qcv_subw_return_wit_1 : qcp_qcv_subw_return_wit_1.
Axiom proof_of_qcp_qcv_subw_partial_solve_wit_1_pure : qcp_qcv_subw_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_subw_partial_solve_wit_1 : qcp_qcv_subw_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_shl7_safety_wit_1 : qcp_qcv_shl7_safety_wit_1.
Axiom proof_of_qcp_qcv_shl7_safety_wit_2 : qcp_qcv_shl7_safety_wit_2.
Axiom proof_of_qcp_qcv_shl7_return_wit_1 : qcp_qcv_shl7_return_wit_1.
Axiom proof_of_qcp_qcv_neon_qrdmulh_safety_wit_1 : qcp_qcv_neon_qrdmulh_safety_wit_1.
Axiom proof_of_qcp_qcv_neon_qrdmulh_safety_wit_2 : qcp_qcv_neon_qrdmulh_safety_wit_2.
Axiom proof_of_qcp_qcv_neon_qrdmulh_safety_wit_3 : qcp_qcv_neon_qrdmulh_safety_wit_3.
Axiom proof_of_qcp_qcv_neon_qrdmulh_safety_wit_4 : qcp_qcv_neon_qrdmulh_safety_wit_4.
Axiom proof_of_qcp_qcv_neon_qrdmulh_safety_wit_5 : qcp_qcv_neon_qrdmulh_safety_wit_5.
Axiom proof_of_qcp_qcv_neon_qrdmulh_return_wit_1 : qcp_qcv_neon_qrdmulh_return_wit_1.
Axiom proof_of_qcp_qcv_neon_qrdmulh_partial_solve_wit_1_pure : qcp_qcv_neon_qrdmulh_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_neon_qrdmulh_partial_solve_wit_1 : qcp_qcv_neon_qrdmulh_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_neon_qrdmulh_partial_solve_wit_2_pure : qcp_qcv_neon_qrdmulh_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qcv_neon_qrdmulh_partial_solve_wit_2 : qcp_qcv_neon_qrdmulh_partial_solve_wit_2.
Axiom proof_of_qcp_qcv_rvv_mul_safety_wit_1 : qcp_qcv_rvv_mul_safety_wit_1.
Axiom proof_of_qcp_qcv_rvv_mul_return_wit_1 : qcp_qcv_rvv_mul_return_wit_1.
Axiom proof_of_qcp_qcv_rvv_clip15_safety_wit_1 : qcp_qcv_rvv_clip15_safety_wit_1.
Axiom proof_of_qcp_qcv_rvv_clip15_safety_wit_2 : qcp_qcv_rvv_clip15_safety_wit_2.
Axiom proof_of_qcp_qcv_rvv_clip15_return_wit_1 : qcp_qcv_rvv_clip15_return_wit_1.
Axiom proof_of_qcp_qcv_rvv_clip15_partial_solve_wit_1_pure : qcp_qcv_rvv_clip15_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_rvv_clip15_partial_solve_wit_1 : qcp_qcv_rvv_clip15_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_rvv_clip15_partial_solve_wit_2_pure : qcp_qcv_rvv_clip15_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qcv_rvv_clip15_partial_solve_wit_2 : qcp_qcv_rvv_clip15_partial_solve_wit_2.
Axiom proof_of_qcp_qcv_neon_add_safety_wit_1 : qcp_qcv_neon_add_safety_wit_1.
Axiom proof_of_qcp_qcv_neon_add_return_wit_1 : qcp_qcv_neon_add_return_wit_1.
Axiom proof_of_qcp_qcv_neon_add_partial_solve_wit_1_pure : qcp_qcv_neon_add_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_neon_add_partial_solve_wit_1 : qcp_qcv_neon_add_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_rvv_add_safety_wit_1 : qcp_qcv_rvv_add_safety_wit_1.
Axiom proof_of_qcp_qcv_rvv_add_return_wit_1 : qcp_qcv_rvv_add_return_wit_1.
Axiom proof_of_qcp_qcv_rvv_add_partial_solve_wit_1_pure : qcp_qcv_rvv_add_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_rvv_add_partial_solve_wit_1 : qcp_qcv_rvv_add_partial_solve_wit_1.

End VC_Correct.
