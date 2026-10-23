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
Require Import Qu8Cvt.Model.
Require Import Qu8Cvt.Types.
Require Import Qu8Cvt.RvvModel.
Require Import Qu8Cvt.UnsignedModel.
Local Open Scope sac.

(*----- Function qcp_cvt_active_sext8 -----*)

Definition qcp_cvt_active_sext8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_active_sext8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_sext8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre)))
.

Definition qcp_cvt_active_sext8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= x_pre)) (PreH6 : (x_pre <= 255)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= x_pre)) (PreH6 : (x_pre <= 255)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (x_pre = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_sext8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= x_pre)) (PreH6 : (x_pre <= 255)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  (x_pre = (cvt_active_int (i_pre) (vl_pre) (x_pre)))
.

Definition qcp_cvt_active_sext8_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
.

Definition qcp_cvt_active_sext8_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_sext8_partial_solve_wit_1 := qcp_cvt_active_sext8_partial_solve_wit_1_pure -> qcp_cvt_active_sext8_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_active_sext16 -----*)

Definition qcp_cvt_active_sext16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_active_sext16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_sext16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre)))
.

Definition qcp_cvt_active_sext16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (x_pre = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_sext16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= x_pre)) (PreH4 : (x_pre <= 32767)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  (x_pre = (cvt_active_int (i_pre) (vl_pre) (x_pre)))
.

Definition qcp_cvt_active_sext16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
.

Definition qcp_cvt_active_sext16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_sext16_partial_solve_wit_1 := qcp_cvt_active_sext16_partial_solve_wit_1_pure -> qcp_cvt_active_sext16_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_active_sub16 -----*)

Definition qcp_cvt_active_sub16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_active_sub16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_sub16 (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_sub16 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_sub16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  (0 = (cvt_active_sub16 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_cvt_active_sub16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_sub16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (cvt_active_sub16 (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_sub16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (cvt_active_sub16 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_sub16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_sub16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  (retval = (cvt_active_sub16 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_cvt_active_sub16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
.

Definition qcp_cvt_active_sub16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_sub16_partial_solve_wit_1 := qcp_cvt_active_sub16_partial_solve_wit_1_pure -> qcp_cvt_active_sub16_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_active_float -----*)

Definition qcp_cvt_active_float_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_active_float_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_float (i_pre) (vl_pre) (x_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_float (i_pre) (vl_pre) (x_pre)) ) ”
  &&  emp
).

Definition qcp_cvt_active_float_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  (cvt_same retval (cvt_active_float (i_pre) (vl_pre) (x_pre)) )
.

Definition qcp_cvt_active_float_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (x_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_float (i_pre) (vl_pre) (x_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (x_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_float (i_pre) (vl_pre) (x_pre)) ) ”
  &&  emp
).

Definition qcp_cvt_active_float_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (x_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) ,
  (cvt_same retval (cvt_active_float (i_pre) (vl_pre) (x_pre)) )
.

Definition qcp_cvt_active_float_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ”
.

Definition qcp_cvt_active_float_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_float_partial_solve_wit_1 := qcp_cvt_active_float_partial_solve_wit_1_pure -> qcp_cvt_active_float_partial_solve_wit_1_aux.

Definition qcp_cvt_active_float_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
.

Definition qcp_cvt_active_float_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ” 
  &&  “ (i_pre >= vl_pre) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_float_partial_solve_wit_2 := qcp_cvt_active_float_partial_solve_wit_2_pure -> qcp_cvt_active_float_partial_solve_wit_2_aux.

(*----- Function qcp_cvt_active_mul -----*)

Definition qcp_cvt_active_mul_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "scale" ) )) # Float  |-> scale_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_active_mul_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_mul (i_pre) (vl_pre) (x_pre) (scale_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_mul (i_pre) (vl_pre) (x_pre) (scale_pre)) ) ”
  &&  emp
).

Definition qcp_cvt_active_mul_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (cvt_same retval (cvt_active_mul (i_pre) (vl_pre) (x_pre) (scale_pre)) )
.

Definition qcp_cvt_active_mul_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (cvt_same retval (fp32_mul (x_pre) (scale_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_mul (i_pre) (vl_pre) (x_pre) (scale_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (cvt_same retval (fp32_mul (x_pre) (scale_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (cvt_same retval (cvt_active_mul (i_pre) (vl_pre) (x_pre) (scale_pre)) ) ”
  &&  emp
).

Definition qcp_cvt_active_mul_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (cvt_same retval (fp32_mul (x_pre) (scale_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (cvt_same retval (cvt_active_mul (i_pre) (vl_pre) (x_pre) (scale_pre)) )
.

Definition qcp_cvt_active_mul_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_mul_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (i_pre: Z) (scale_pre: fp32) (x_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "scale" ) )) # Float  |-> scale_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
.

Definition qcp_cvt_active_mul_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ” 
  &&  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_mul_partial_solve_wit_2 := qcp_cvt_active_mul_partial_solve_wit_2_pure -> qcp_cvt_active_mul_partial_solve_wit_2_aux.

(*----- Function __riscv_vsetvl_e8m2 -----*)

Definition __riscv_vsetvl_e8m2_safety_wit_1 := 
forall (n_pre: Z) (PreH1 : (0 <= n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e8m2_safety_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e8m2_return_wit_1 := 
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (32 = (cvt_vl (n_pre))) ” 
  &&  “ (0 <= 32) ” 
  &&  “ (32 <= 32) ” 
  &&  “ (32 <= n_pre) ” 
  &&  “ (0 < 32) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (32 = (cvt_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e8m2_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  (32 = (cvt_vl (n_pre)))
.

Definition __riscv_vsetvl_e8m2_return_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre < 32)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  (“ (n_pre = (cvt_vl (n_pre))) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= 32) ” 
  &&  “ (n_pre <= n_pre) ” 
  &&  “ (n_pre = 0) ”
  &&  emp)
  ||
  (“ (n_pre = (cvt_vl (n_pre))) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= 32) ” 
  &&  “ (n_pre <= n_pre) ” 
  &&  “ (0 < n_pre) ”
  &&  emp)
.

(*----- Function qcp_cvt_active_zext8 -----*)

Definition qcp_cvt_active_zext8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_active_zext8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_zext8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (cvt_active_int (i_pre) (vl_pre) (x_pre)))
.

Definition qcp_cvt_active_zext8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= x_pre)) (PreH6 : (x_pre <= 255)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= x_pre)) (PreH6 : (x_pre <= 255)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (x_pre = (cvt_active_int (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_zext8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = x_pre)) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= x_pre)) (PreH6 : (x_pre <= 255)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  (x_pre = (cvt_active_int (i_pre) (vl_pre) (x_pre)))
.

Definition qcp_cvt_active_zext8_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
.

Definition qcp_cvt_active_zext8_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_zext8_partial_solve_wit_1 := qcp_cvt_active_zext8_partial_solve_wit_1_pure -> qcp_cvt_active_zext8_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_active_add_u16 -----*)

Definition qcp_cvt_active_add_u16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_active_add_u16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_add_u16 (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (cvt_active_add_u16 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_add_u16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  (0 = (cvt_active_add_u16 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_cvt_active_add_u16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_add_u16 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= 65535)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 65535)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (cvt_active_add_u16 (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_add_u16 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= 65535)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 65535)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (cvt_active_add_u16 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_cvt_active_add_u16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_add_u16 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= 65535)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 65535)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  (retval = (cvt_active_add_u16 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_cvt_active_add_u16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 65535) ”
.

Definition qcp_cvt_active_add_u16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 65535) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 65535) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_cvt_active_add_u16_partial_solve_wit_1 := qcp_cvt_active_add_u16_partial_solve_wit_1_pure -> qcp_cvt_active_add_u16_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_qcp_cvt_active_sext8_safety_wit_1 : qcp_cvt_active_sext8_safety_wit_1.
Axiom proof_of_qcp_cvt_active_sext8_return_wit_1 : qcp_cvt_active_sext8_return_wit_1.
Axiom proof_of_qcp_cvt_active_sext8_return_wit_2 : qcp_cvt_active_sext8_return_wit_2.
Axiom proof_of_qcp_cvt_active_sext8_partial_solve_wit_1_pure : qcp_cvt_active_sext8_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_active_sext8_partial_solve_wit_1 : qcp_cvt_active_sext8_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_active_sext16_safety_wit_1 : qcp_cvt_active_sext16_safety_wit_1.
Axiom proof_of_qcp_cvt_active_sext16_return_wit_1 : qcp_cvt_active_sext16_return_wit_1.
Axiom proof_of_qcp_cvt_active_sext16_return_wit_2 : qcp_cvt_active_sext16_return_wit_2.
Axiom proof_of_qcp_cvt_active_sext16_partial_solve_wit_1_pure : qcp_cvt_active_sext16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_active_sext16_partial_solve_wit_1 : qcp_cvt_active_sext16_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_active_sub16_safety_wit_1 : qcp_cvt_active_sub16_safety_wit_1.
Axiom proof_of_qcp_cvt_active_sub16_return_wit_1 : qcp_cvt_active_sub16_return_wit_1.
Axiom proof_of_qcp_cvt_active_sub16_return_wit_2 : qcp_cvt_active_sub16_return_wit_2.
Axiom proof_of_qcp_cvt_active_sub16_partial_solve_wit_1_pure : qcp_cvt_active_sub16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_active_sub16_partial_solve_wit_1 : qcp_cvt_active_sub16_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_active_float_safety_wit_1 : qcp_cvt_active_float_safety_wit_1.
Axiom proof_of_qcp_cvt_active_float_return_wit_1 : qcp_cvt_active_float_return_wit_1.
Axiom proof_of_qcp_cvt_active_float_return_wit_2 : qcp_cvt_active_float_return_wit_2.
Axiom proof_of_qcp_cvt_active_float_partial_solve_wit_1_pure : qcp_cvt_active_float_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_active_float_partial_solve_wit_1 : qcp_cvt_active_float_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_active_float_partial_solve_wit_2_pure : qcp_cvt_active_float_partial_solve_wit_2_pure.
Axiom proof_of_qcp_cvt_active_float_partial_solve_wit_2 : qcp_cvt_active_float_partial_solve_wit_2.
Axiom proof_of_qcp_cvt_active_mul_safety_wit_1 : qcp_cvt_active_mul_safety_wit_1.
Axiom proof_of_qcp_cvt_active_mul_return_wit_1 : qcp_cvt_active_mul_return_wit_1.
Axiom proof_of_qcp_cvt_active_mul_return_wit_2 : qcp_cvt_active_mul_return_wit_2.
Axiom proof_of_qcp_cvt_active_mul_partial_solve_wit_1 : qcp_cvt_active_mul_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_active_mul_partial_solve_wit_2_pure : qcp_cvt_active_mul_partial_solve_wit_2_pure.
Axiom proof_of_qcp_cvt_active_mul_partial_solve_wit_2 : qcp_cvt_active_mul_partial_solve_wit_2.
Axiom proof_of___riscv_vsetvl_e8m2_safety_wit_1 : __riscv_vsetvl_e8m2_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e8m2_safety_wit_2 : __riscv_vsetvl_e8m2_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e8m2_return_wit_1 : __riscv_vsetvl_e8m2_return_wit_1.
Axiom proof_of___riscv_vsetvl_e8m2_return_wit_2 : __riscv_vsetvl_e8m2_return_wit_2.
Axiom proof_of_qcp_cvt_active_zext8_safety_wit_1 : qcp_cvt_active_zext8_safety_wit_1.
Axiom proof_of_qcp_cvt_active_zext8_return_wit_1 : qcp_cvt_active_zext8_return_wit_1.
Axiom proof_of_qcp_cvt_active_zext8_return_wit_2 : qcp_cvt_active_zext8_return_wit_2.
Axiom proof_of_qcp_cvt_active_zext8_partial_solve_wit_1_pure : qcp_cvt_active_zext8_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_active_zext8_partial_solve_wit_1 : qcp_cvt_active_zext8_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_active_add_u16_safety_wit_1 : qcp_cvt_active_add_u16_safety_wit_1.
Axiom proof_of_qcp_cvt_active_add_u16_return_wit_1 : qcp_cvt_active_add_u16_return_wit_1.
Axiom proof_of_qcp_cvt_active_add_u16_return_wit_2 : qcp_cvt_active_add_u16_return_wit_2.
Axiom proof_of_qcp_cvt_active_add_u16_partial_solve_wit_1_pure : qcp_cvt_active_add_u16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_active_add_u16_partial_solve_wit_1 : qcp_cvt_active_add_u16_partial_solve_wit_1.

End VC_Correct.
