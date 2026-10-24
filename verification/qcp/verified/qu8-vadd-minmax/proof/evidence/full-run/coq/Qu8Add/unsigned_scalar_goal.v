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
Require Import Qu8Add.Model.
Require Import Qu8Add.UnsignedScalarModel.
Local Open Scope sac.

(*----- Function qcp_qu_u16 -----*)

Definition qcp_qu_u16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) = (qu_u16 (x_pre))) ” 
  &&  “ (0 <= (unsigned_last_nbits (x_pre) (16))) ” 
  &&  “ ((unsigned_last_nbits (x_pre) (16)) <= 65535) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) <= 65535) ” 
  &&  “ (0 <= (unsigned_last_nbits (x_pre) (16))) ” 
  &&  “ ((unsigned_last_nbits (x_pre) (16)) = (qu_u16 (x_pre))) ”
  &&  emp
).

Definition qcp_qu_u16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((unsigned_last_nbits (x_pre) (16)) <= 65535)
.

Definition qcp_qu_u16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  (0 <= (unsigned_last_nbits (x_pre) (16)))
.

Definition qcp_qu_u16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : (((-INT_MAX) - 1 ) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((unsigned_last_nbits (x_pre) (16)) = (qu_u16 (x_pre)))
.

(*----- Function qcp_qu_subu8 -----*)

Definition qcp_qu_subu8_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ ((a_pre - b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre - b_pre )) ”
.

Definition qcp_qu_subu8_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_u16 ((a_pre - b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 255)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_udiff (a_pre) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_u16 ((a_pre - b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 255)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_udiff (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_subu8_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_u16 ((a_pre - b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 255)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  (retval = (qu_udiff (a_pre) (b_pre)))
.

Definition qcp_qu_subu8_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ (((-INT_MAX) - 1 ) <= (a_pre - b_pre )) ” 
  &&  “ ((a_pre - b_pre ) <= INT_MAX) ”
.

Definition qcp_qu_subu8_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (((-INT_MAX) - 1 ) <= (a_pre - b_pre )) ” 
  &&  “ ((a_pre - b_pre ) <= INT_MAX) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
.

Definition qcp_qu_subu8_partial_solve_wit_1 := qcp_qu_subu8_partial_solve_wit_1_pure -> qcp_qu_subu8_partial_solve_wit_1_aux.

(*----- Function qcp_qu_from_u16 -----*)

Definition qcp_qu_from_u16_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 65535)) ,
  ((( &( "x" ) )) # UShort  |-> x_pre)
|--
  “ (32767 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32767) ”
.

Definition qcp_qu_from_u16_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  ((( &( "x" ) )) # UShort  |-> x_pre)
|--
  “ ((x_pre - 65536 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (x_pre - 65536 )) ”
.

Definition qcp_qu_from_u16_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  ((( &( "x" ) )) # UShort  |-> x_pre)
|--
  “ (65536 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 65536) ”
.

Definition qcp_qu_from_u16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ ((x_pre - 65536 ) = (qu_s16 (x_pre))) ” 
  &&  “ ((-32768) <= (x_pre - 65536 )) ” 
  &&  “ ((x_pre - 65536 ) <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ ((x_pre - 65536 ) = (qu_s16 (x_pre))) ”
  &&  emp
).

Definition qcp_qu_from_u16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre > 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  ((x_pre - 65536 ) = (qu_s16 (x_pre)))
.

Definition qcp_qu_from_u16_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ (x_pre = (qu_s16 (x_pre))) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ (x_pre = (qu_s16 (x_pre))) ”
  &&  emp
).

Definition qcp_qu_from_u16_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre <= 32767)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) ,
  (x_pre = (qu_s16 (x_pre)))
.

(*----- Function qcp_qu_usat8 -----*)

Definition qcp_qu_usat8_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_usat8_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_usat8_safety_wit_3 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (255 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 255) ”
.

Definition qcp_qu_usat8_safety_wit_4 := 
forall (x_pre: Z) (PreH1 : (x_pre > 255)) (PreH2 : (x_pre >= 0)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (255 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 255) ”
.

Definition qcp_qu_usat8_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre <= 255)) (PreH2 : (x_pre >= 0)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qu_usat8 (x_pre))) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre <= 255)) (PreH2 : (x_pre >= 0)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qu_usat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qu_usat8_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre <= 255)) (PreH2 : (x_pre >= 0)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  (x_pre = (qu_usat8 (x_pre)))
.

Definition qcp_qu_usat8_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre > 255)) (PreH2 : (x_pre >= 0)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (255 = (qu_usat8 (x_pre))) ” 
  &&  “ (0 <= 255) ” 
  &&  “ (255 <= 255) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre > 255)) (PreH2 : (x_pre >= 0)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (255 = (qu_usat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qu_usat8_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre > 255)) (PreH2 : (x_pre >= 0)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) ,
  (255 = (qu_usat8 (x_pre)))
.

Definition qcp_qu_usat8_return_wit_3 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_usat8 (x_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 255) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_usat8 (x_pre))) ”
  &&  emp
).

Definition qcp_qu_usat8_return_wit_3_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  (0 = (qu_usat8 (x_pre)))
.

(*----- Function qcp_qu_max16_zero -----*)

Definition qcp_qu_max16_zero_safety_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_max16_zero_safety_wit_2 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_max16_zero_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qu_max16zero (x_pre))) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = (qu_max16zero (x_pre))) ”
  &&  emp
).

Definition qcp_qu_max16_zero_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre >= 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  (x_pre = (qu_max16zero (x_pre)))
.

Definition qcp_qu_max16_zero_return_wit_2 := 
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_max16zero (x_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_max16zero (x_pre))) ”
  &&  emp
).

Definition qcp_qu_max16_zero_return_wit_2_split_goal_1 := 
forall (x_pre: Z) (PreH1 : (x_pre < 0)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) ,
  (0 = (qu_max16zero (x_pre)))
.

(*----- Function qcp_qu_umin8 -----*)

Definition qcp_qu_umin8_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (b_pre = (qu_umin (a_pre) (b_pre))) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (b_pre = (qu_umin (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_umin8_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  (b_pre = (qu_umin (a_pre) (b_pre)))
.

Definition qcp_qu_umin8_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (a_pre = (qu_umin (a_pre) (b_pre))) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (a_pre = (qu_umin (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_umin8_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  (a_pre = (qu_umin (a_pre) (b_pre)))
.

(*----- Function qcp_qu_umax8 -----*)

Definition qcp_qu_umax8_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (b_pre = (qu_umax (a_pre) (b_pre))) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (b_pre = (qu_umax (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_umax8_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  (b_pre = (qu_umax (a_pre) (b_pre)))
.

Definition qcp_qu_umax8_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (a_pre = (qu_umax (a_pre) (b_pre))) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (a_pre = (qu_umax (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_umax8_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 255)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) ,
  (a_pre = (qu_umax (a_pre) (b_pre)))
.

Module Type VC_Correct.


Axiom proof_of_qcp_qu_u16_return_wit_1 : qcp_qu_u16_return_wit_1.
Axiom proof_of_qcp_qu_subu8_safety_wit_1 : qcp_qu_subu8_safety_wit_1.
Axiom proof_of_qcp_qu_subu8_return_wit_1 : qcp_qu_subu8_return_wit_1.
Axiom proof_of_qcp_qu_subu8_partial_solve_wit_1_pure : qcp_qu_subu8_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_subu8_partial_solve_wit_1 : qcp_qu_subu8_partial_solve_wit_1.
Axiom proof_of_qcp_qu_from_u16_safety_wit_1 : qcp_qu_from_u16_safety_wit_1.
Axiom proof_of_qcp_qu_from_u16_safety_wit_2 : qcp_qu_from_u16_safety_wit_2.
Axiom proof_of_qcp_qu_from_u16_safety_wit_3 : qcp_qu_from_u16_safety_wit_3.
Axiom proof_of_qcp_qu_from_u16_return_wit_1 : qcp_qu_from_u16_return_wit_1.
Axiom proof_of_qcp_qu_from_u16_return_wit_2 : qcp_qu_from_u16_return_wit_2.
Axiom proof_of_qcp_qu_usat8_safety_wit_1 : qcp_qu_usat8_safety_wit_1.
Axiom proof_of_qcp_qu_usat8_safety_wit_2 : qcp_qu_usat8_safety_wit_2.
Axiom proof_of_qcp_qu_usat8_safety_wit_3 : qcp_qu_usat8_safety_wit_3.
Axiom proof_of_qcp_qu_usat8_safety_wit_4 : qcp_qu_usat8_safety_wit_4.
Axiom proof_of_qcp_qu_usat8_return_wit_1 : qcp_qu_usat8_return_wit_1.
Axiom proof_of_qcp_qu_usat8_return_wit_2 : qcp_qu_usat8_return_wit_2.
Axiom proof_of_qcp_qu_usat8_return_wit_3 : qcp_qu_usat8_return_wit_3.
Axiom proof_of_qcp_qu_max16_zero_safety_wit_1 : qcp_qu_max16_zero_safety_wit_1.
Axiom proof_of_qcp_qu_max16_zero_safety_wit_2 : qcp_qu_max16_zero_safety_wit_2.
Axiom proof_of_qcp_qu_max16_zero_return_wit_1 : qcp_qu_max16_zero_return_wit_1.
Axiom proof_of_qcp_qu_max16_zero_return_wit_2 : qcp_qu_max16_zero_return_wit_2.
Axiom proof_of_qcp_qu_umin8_return_wit_1 : qcp_qu_umin8_return_wit_1.
Axiom proof_of_qcp_qu_umin8_return_wit_2 : qcp_qu_umin8_return_wit_2.
Axiom proof_of_qcp_qu_umax8_return_wit_1 : qcp_qu_umax8_return_wit_1.
Axiom proof_of_qcp_qu_umax8_return_wit_2 : qcp_qu_umax8_return_wit_2.

End VC_Correct.
