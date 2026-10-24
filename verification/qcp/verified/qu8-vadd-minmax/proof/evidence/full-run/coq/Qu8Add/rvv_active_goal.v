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
Require Import Qu8Add.Types.
Require Import Qu8Add.UnsignedScalarModel.
Require Import Qu8Add.RvvActiveModel.
Local Open Scope sac.

(*----- Function qcp_qu_rvv_usat16 -----*)

Definition qcp_qu_rvv_usat16_safety_wit_1 := 
forall (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
|--
  “ (255 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 255) ”
.

Definition qcp_qu_rvv_usat16_safety_wit_2 := 
forall (a_pre: Z) (PreH1 : (a_pre > 255)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
|--
  “ (255 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 255) ”
.

Definition qcp_qu_rvv_usat16_return_wit_1 := 
(
forall (a_pre: Z) (PreH1 : (a_pre <= 255)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (a_pre = (qu_uclip8 (a_pre))) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ”
  &&  emp
) \/
(
forall (a_pre: Z) (PreH1 : (a_pre <= 255)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (a_pre = (qu_uclip8 (a_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_usat16_return_wit_1_split_goal_1 := 
forall (a_pre: Z) (PreH1 : (a_pre <= 255)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) ,
  (a_pre = (qu_uclip8 (a_pre)))
.

Definition qcp_qu_rvv_usat16_return_wit_2 := 
(
forall (a_pre: Z) (PreH1 : (a_pre > 255)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (255 = (qu_uclip8 (a_pre))) ” 
  &&  “ (0 <= 255) ” 
  &&  “ (255 <= 255) ”
  &&  emp
) \/
(
forall (a_pre: Z) (PreH1 : (a_pre > 255)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (255 = (qu_uclip8 (a_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_usat16_return_wit_2_split_goal_1 := 
forall (a_pre: Z) (PreH1 : (a_pre > 255)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) ,
  (255 = (qu_uclip8 (a_pre)))
.

(*----- Function qcp_qu_active_subu -----*)

Definition qcp_qu_active_subu_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_subu_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 = (qu_active_subu (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 = (qu_active_subu (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_subu_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  (0 = (qu_active_subu (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_subu_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_udiff (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_active_subu (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_udiff (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_active_subu (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_subu_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_udiff (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  (retval = (qu_active_subu (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_subu_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
.

Definition qcp_qu_active_subu_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
.

Definition qcp_qu_active_subu_partial_solve_wit_1 := qcp_qu_active_subu_partial_solve_wit_1_pure -> qcp_qu_active_subu_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_sext -----*)

Definition qcp_qu_active_sext_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_sext_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_active_sext (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_active_sext (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_sext_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  (0 = (qu_active_sext (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qu_active_sext_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (a_pre = (qu_active_sext (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (a_pre = (qu_active_sext (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_sext_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  (a_pre = (qu_active_sext (i_pre) (vl_pre) (a_pre)))
.

(*----- Function qcp_qu_active_mul -----*)

Definition qcp_qu_active_mul_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_mul_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_mul_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  (0 = (qu_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_mul_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_mul (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= b_pre)) (PreH12 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qu_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_mul (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= b_pre)) (PreH12 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qu_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_mul_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_mul (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= b_pre)) (PreH12 : (b_pre <= INT_MAX)) ,
  (retval = (qu_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_mul_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
.

Definition qcp_qu_active_mul_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= b_pre)) (PreH9 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qu_active_mul_partial_solve_wit_1 := qcp_qu_active_mul_partial_solve_wit_1_pure -> qcp_qu_active_mul_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_macc -----*)

Definition qcp_qu_active_macc_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) (PreH10 : ((INT_MIN) <= b_pre)) (PreH11 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_macc_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) (PreH10 : ((INT_MIN) <= b_pre)) (PreH11 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_macc (i_pre) (vl_pre) (a_pre) (c_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) (PreH10 : ((INT_MIN) <= b_pre)) (PreH11 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_macc (i_pre) (vl_pre) (a_pre) (c_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_macc_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) (PreH10 : ((INT_MIN) <= b_pre)) (PreH11 : (b_pre <= INT_MAX)) ,
  (0 = (qu_active_macc (i_pre) (vl_pre) (a_pre) (c_pre) (b_pre)))
.

Definition qcp_qu_active_macc_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_macc (a_pre) (b_pre) (c_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= c_pre)) (PreH12 : (c_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qu_active_macc (i_pre) (vl_pre) (a_pre) (c_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_macc (a_pre) (b_pre) (c_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= c_pre)) (PreH12 : (c_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qu_active_macc (i_pre) (vl_pre) (a_pre) (c_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_macc_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_macc (a_pre) (b_pre) (c_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : ((INT_MIN) <= c_pre)) (PreH12 : (c_pre <= INT_MAX)) (PreH13 : ((INT_MIN) <= b_pre)) (PreH14 : (b_pre <= INT_MAX)) ,
  (retval = (qu_active_macc (i_pre) (vl_pre) (a_pre) (c_pre) (b_pre)))
.

Definition qcp_qu_active_macc_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) (PreH10 : ((INT_MIN) <= b_pre)) (PreH11 : (b_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "c" ) )) # Int  |-> c_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c_pre) ” 
  &&  “ (c_pre <= INT_MAX) ”
.

Definition qcp_qu_active_macc_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (c_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : ((INT_MIN) <= c_pre)) (PreH9 : (c_pre <= INT_MAX)) (PreH10 : ((INT_MIN) <= b_pre)) (PreH11 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c_pre) ” 
  &&  “ (c_pre <= INT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= c_pre) ” 
  &&  “ (c_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qu_active_macc_partial_solve_wit_1 := qcp_qu_active_macc_partial_solve_wit_1_pure -> qcp_qu_active_macc_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_mov -----*)

Definition qcp_qu_active_mov_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_mov_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_mov (i_pre) (vl_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_mov (i_pre) (vl_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_mov_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  (0 = (qu_active_mov (i_pre) (vl_pre) (b_pre)))
.

Definition qcp_qu_active_mov_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (b_pre = (qu_active_mov (i_pre) (vl_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (b_pre = (qu_active_mov (i_pre) (vl_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_mov_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= b_pre)) (PreH7 : (b_pre <= INT_MAX)) ,
  (b_pre = (qu_active_mov (i_pre) (vl_pre) (b_pre)))
.

(*----- Function qcp_qu_active_rnu -----*)

Definition qcp_qu_active_rnu_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # UInt64  |-> d_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_rnu_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (0 = (qu_active_rnu (i_pre) (vl_pre) (a_pre) (d_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (0 = (qu_active_rnu (i_pre) (vl_pre) (a_pre) (d_pre))) ”
  &&  emp
).

Definition qcp_qu_active_rnu_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  (0 = (qu_active_rnu (i_pre) (vl_pre) (a_pre) (d_pre)))
.

Definition qcp_qu_active_rnu_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_rnu (a_pre) (d_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : (0 <= d_pre)) (PreH12 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (retval = (qu_active_rnu (i_pre) (vl_pre) (a_pre) (d_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_rnu (a_pre) (d_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : (0 <= d_pre)) (PreH12 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (retval = (qu_active_rnu (i_pre) (vl_pre) (a_pre) (d_pre))) ”
  &&  emp
).

Definition qcp_qu_active_rnu_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_rnu (a_pre) (d_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : (0 <= d_pre)) (PreH12 : (d_pre <= 31)) ,
  (retval = (qu_active_rnu (i_pre) (vl_pre) (a_pre) (d_pre)))
.

Definition qcp_qu_active_rnu_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # UInt64  |-> d_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
.

Definition qcp_qu_active_rnu_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
  &&  emp
.

Definition qcp_qu_active_rnu_partial_solve_wit_1 := qcp_qu_active_rnu_partial_solve_wit_1_pure -> qcp_qu_active_rnu_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_sll -----*)

Definition qcp_qu_active_sll_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # UInt64  |-> d_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_sll_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (0 = (qu_active_sll (i_pre) (vl_pre) (a_pre) (d_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (0 = (qu_active_sll (i_pre) (vl_pre) (a_pre) (d_pre))) ”
  &&  emp
).

Definition qcp_qu_active_sll_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  (0 = (qu_active_sll (i_pre) (vl_pre) (a_pre) (d_pre)))
.

Definition qcp_qu_active_sll_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_sll (a_pre) (d_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : (0 <= d_pre)) (PreH12 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (retval = (qu_active_sll (i_pre) (vl_pre) (a_pre) (d_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_sll (a_pre) (d_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : (0 <= d_pre)) (PreH12 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ (retval = (qu_active_sll (i_pre) (vl_pre) (a_pre) (d_pre))) ”
  &&  emp
).

Definition qcp_qu_active_sll_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_sll (a_pre) (d_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) (PreH11 : (0 <= d_pre)) (PreH12 : (d_pre <= 31)) ,
  (retval = (qu_active_sll (i_pre) (vl_pre) (a_pre) (d_pre)))
.

Definition qcp_qu_active_sll_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "d" ) )) # UInt64  |-> d_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
.

Definition qcp_qu_active_sll_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (d_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) (PreH8 : (0 <= d_pre)) (PreH9 : (d_pre <= 31)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= d_pre) ” 
  &&  “ (d_pre <= 31) ”
  &&  emp
.

Definition qcp_qu_active_sll_partial_solve_wit_1 := qcp_qu_active_sll_partial_solve_wit_1_pure -> qcp_qu_active_sll_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_clip16 -----*)

Definition qcp_qu_active_clip16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_clip16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_clip16 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (qu_active_clip16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_clip16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) ,
  (0 = (qu_active_clip16 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qu_active_clip16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_sat16 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qu_active_clip16 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_sat16 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (qu_active_clip16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_clip16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_sat16 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((INT_MIN) <= a_pre)) (PreH10 : (a_pre <= INT_MAX)) ,
  (retval = (qu_active_clip16 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qu_active_clip16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (((-INT64_MAX) - 1 ) <= a_pre) ” 
  &&  “ (a_pre <= INT64_MAX) ”
.

Definition qcp_qu_active_clip16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((INT_MIN) <= a_pre)) (PreH7 : (a_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (((-INT64_MAX) - 1 ) <= a_pre) ” 
  &&  “ (a_pre <= INT64_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ”
  &&  emp
.

Definition qcp_qu_active_clip16_partial_solve_wit_1 := qcp_qu_active_clip16_partial_solve_wit_1_pure -> qcp_qu_active_clip16_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_add -----*)

Definition qcp_qu_active_add_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) (PreH8 : ((-32768) <= b_pre)) (PreH9 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_add_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) (PreH8 : ((-32768) <= b_pre)) (PreH9 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) (PreH8 : ((-32768) <= b_pre)) (PreH9 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_add_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) (PreH8 : ((-32768) <= b_pre)) (PreH9 : (b_pre <= 32767)) ,
  (0 = (qu_active_add (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_add_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_add16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= a_pre)) (PreH10 : (a_pre <= 32767)) (PreH11 : ((-32768) <= b_pre)) (PreH12 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qu_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_add16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= a_pre)) (PreH10 : (a_pre <= 32767)) (PreH11 : ((-32768) <= b_pre)) (PreH12 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qu_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_add_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_rvv_add16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= a_pre)) (PreH10 : (a_pre <= 32767)) (PreH11 : ((-32768) <= b_pre)) (PreH12 : (b_pre <= 32767)) ,
  (retval = (qu_active_add (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_add_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) (PreH8 : ((-32768) <= b_pre)) (PreH9 : (b_pre <= 32767)) ,
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

Definition qcp_qu_active_add_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) (PreH8 : ((-32768) <= b_pre)) (PreH9 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
.

Definition qcp_qu_active_add_partial_solve_wit_1 := qcp_qu_active_add_partial_solve_wit_1_pure -> qcp_qu_active_add_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_max16 -----*)

Definition qcp_qu_active_max16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_max16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_active_max16 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qu_active_max16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_max16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  (0 = (qu_active_max16 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qu_active_max16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_max16zero (a_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= a_pre)) (PreH10 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qu_active_max16 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_max16zero (a_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= a_pre)) (PreH10 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (qu_active_max16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_max16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_max16zero (a_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= a_pre)) (PreH10 : (a_pre <= 32767)) ,
  (retval = (qu_active_max16 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qu_active_max16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ”
.

Definition qcp_qu_active_max16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= a_pre)) (PreH7 : (a_pre <= 32767)) ,
  TT && emp 
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ”
  &&  emp
.

Definition qcp_qu_active_max16_partial_solve_wit_1 := qcp_qu_active_max16_partial_solve_wit_1_pure -> qcp_qu_active_max16_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_clipu8 -----*)

Definition qcp_qu_active_clipu8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 65535)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_clipu8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (0 = (qu_active_clipu8 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 255) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (0 = (qu_active_clipu8 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_clipu8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 65535)) ,
  (0 = (qu_active_clipu8 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qu_active_clipu8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_uclip8 (a_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (retval = (qu_active_clipu8 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_uclip8 (a_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (retval = (qu_active_clipu8 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qu_active_clipu8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_uclip8 (a_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 65535)) ,
  (retval = (qu_active_clipu8 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qu_active_clipu8_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 65535)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ”
.

Definition qcp_qu_active_clipu8_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 65535)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ”
  &&  emp
.

Definition qcp_qu_active_clipu8_partial_solve_wit_1 := qcp_qu_active_clipu8_partial_solve_wit_1_pure -> qcp_qu_active_clipu8_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_max -----*)

Definition qcp_qu_active_max_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_max_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 = (qu_active_max (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 255) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 = (qu_active_max (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_max_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  (0 = (qu_active_max (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_max_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_umax (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_active_max (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_umax (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_active_max (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_max_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_umax (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  (retval = (qu_active_max (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_max_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
.

Definition qcp_qu_active_max_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
.

Definition qcp_qu_active_max_partial_solve_wit_1 := qcp_qu_active_max_partial_solve_wit_1_pure -> qcp_qu_active_max_partial_solve_wit_1_aux.

(*----- Function qcp_qu_active_min -----*)

Definition qcp_qu_active_min_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_active_min_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 = (qu_active_min (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 255) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 = (qu_active_min (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_min_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  (0 = (qu_active_min (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_min_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_umin (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_active_min (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_umin (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (qu_active_min (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qu_active_min_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qu_umin (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= a_pre)) (PreH10 : (a_pre <= 255)) (PreH11 : (0 <= b_pre)) (PreH12 : (b_pre <= 255)) ,
  (retval = (qu_active_min (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qu_active_min_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # UChar  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
.

Definition qcp_qu_active_min_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= a_pre)) (PreH7 : (a_pre <= 255)) (PreH8 : (0 <= b_pre)) (PreH9 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 255) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
.

Definition qcp_qu_active_min_partial_solve_wit_1 := qcp_qu_active_min_partial_solve_wit_1_pure -> qcp_qu_active_min_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_qcp_qu_rvv_usat16_safety_wit_1 : qcp_qu_rvv_usat16_safety_wit_1.
Axiom proof_of_qcp_qu_rvv_usat16_safety_wit_2 : qcp_qu_rvv_usat16_safety_wit_2.
Axiom proof_of_qcp_qu_rvv_usat16_return_wit_1 : qcp_qu_rvv_usat16_return_wit_1.
Axiom proof_of_qcp_qu_rvv_usat16_return_wit_2 : qcp_qu_rvv_usat16_return_wit_2.
Axiom proof_of_qcp_qu_active_subu_safety_wit_1 : qcp_qu_active_subu_safety_wit_1.
Axiom proof_of_qcp_qu_active_subu_return_wit_1 : qcp_qu_active_subu_return_wit_1.
Axiom proof_of_qcp_qu_active_subu_return_wit_2 : qcp_qu_active_subu_return_wit_2.
Axiom proof_of_qcp_qu_active_subu_partial_solve_wit_1_pure : qcp_qu_active_subu_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_subu_partial_solve_wit_1 : qcp_qu_active_subu_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_sext_safety_wit_1 : qcp_qu_active_sext_safety_wit_1.
Axiom proof_of_qcp_qu_active_sext_return_wit_1 : qcp_qu_active_sext_return_wit_1.
Axiom proof_of_qcp_qu_active_sext_return_wit_2 : qcp_qu_active_sext_return_wit_2.
Axiom proof_of_qcp_qu_active_mul_safety_wit_1 : qcp_qu_active_mul_safety_wit_1.
Axiom proof_of_qcp_qu_active_mul_return_wit_1 : qcp_qu_active_mul_return_wit_1.
Axiom proof_of_qcp_qu_active_mul_return_wit_2 : qcp_qu_active_mul_return_wit_2.
Axiom proof_of_qcp_qu_active_mul_partial_solve_wit_1_pure : qcp_qu_active_mul_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_mul_partial_solve_wit_1 : qcp_qu_active_mul_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_macc_safety_wit_1 : qcp_qu_active_macc_safety_wit_1.
Axiom proof_of_qcp_qu_active_macc_return_wit_1 : qcp_qu_active_macc_return_wit_1.
Axiom proof_of_qcp_qu_active_macc_return_wit_2 : qcp_qu_active_macc_return_wit_2.
Axiom proof_of_qcp_qu_active_macc_partial_solve_wit_1_pure : qcp_qu_active_macc_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_macc_partial_solve_wit_1 : qcp_qu_active_macc_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_mov_safety_wit_1 : qcp_qu_active_mov_safety_wit_1.
Axiom proof_of_qcp_qu_active_mov_return_wit_1 : qcp_qu_active_mov_return_wit_1.
Axiom proof_of_qcp_qu_active_mov_return_wit_2 : qcp_qu_active_mov_return_wit_2.
Axiom proof_of_qcp_qu_active_rnu_safety_wit_1 : qcp_qu_active_rnu_safety_wit_1.
Axiom proof_of_qcp_qu_active_rnu_return_wit_1 : qcp_qu_active_rnu_return_wit_1.
Axiom proof_of_qcp_qu_active_rnu_return_wit_2 : qcp_qu_active_rnu_return_wit_2.
Axiom proof_of_qcp_qu_active_rnu_partial_solve_wit_1_pure : qcp_qu_active_rnu_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_rnu_partial_solve_wit_1 : qcp_qu_active_rnu_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_sll_safety_wit_1 : qcp_qu_active_sll_safety_wit_1.
Axiom proof_of_qcp_qu_active_sll_return_wit_1 : qcp_qu_active_sll_return_wit_1.
Axiom proof_of_qcp_qu_active_sll_return_wit_2 : qcp_qu_active_sll_return_wit_2.
Axiom proof_of_qcp_qu_active_sll_partial_solve_wit_1_pure : qcp_qu_active_sll_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_sll_partial_solve_wit_1 : qcp_qu_active_sll_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_clip16_safety_wit_1 : qcp_qu_active_clip16_safety_wit_1.
Axiom proof_of_qcp_qu_active_clip16_return_wit_1 : qcp_qu_active_clip16_return_wit_1.
Axiom proof_of_qcp_qu_active_clip16_return_wit_2 : qcp_qu_active_clip16_return_wit_2.
Axiom proof_of_qcp_qu_active_clip16_partial_solve_wit_1_pure : qcp_qu_active_clip16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_clip16_partial_solve_wit_1 : qcp_qu_active_clip16_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_add_safety_wit_1 : qcp_qu_active_add_safety_wit_1.
Axiom proof_of_qcp_qu_active_add_return_wit_1 : qcp_qu_active_add_return_wit_1.
Axiom proof_of_qcp_qu_active_add_return_wit_2 : qcp_qu_active_add_return_wit_2.
Axiom proof_of_qcp_qu_active_add_partial_solve_wit_1_pure : qcp_qu_active_add_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_add_partial_solve_wit_1 : qcp_qu_active_add_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_max16_safety_wit_1 : qcp_qu_active_max16_safety_wit_1.
Axiom proof_of_qcp_qu_active_max16_return_wit_1 : qcp_qu_active_max16_return_wit_1.
Axiom proof_of_qcp_qu_active_max16_return_wit_2 : qcp_qu_active_max16_return_wit_2.
Axiom proof_of_qcp_qu_active_max16_partial_solve_wit_1_pure : qcp_qu_active_max16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_max16_partial_solve_wit_1 : qcp_qu_active_max16_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_clipu8_safety_wit_1 : qcp_qu_active_clipu8_safety_wit_1.
Axiom proof_of_qcp_qu_active_clipu8_return_wit_1 : qcp_qu_active_clipu8_return_wit_1.
Axiom proof_of_qcp_qu_active_clipu8_return_wit_2 : qcp_qu_active_clipu8_return_wit_2.
Axiom proof_of_qcp_qu_active_clipu8_partial_solve_wit_1_pure : qcp_qu_active_clipu8_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_clipu8_partial_solve_wit_1 : qcp_qu_active_clipu8_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_max_safety_wit_1 : qcp_qu_active_max_safety_wit_1.
Axiom proof_of_qcp_qu_active_max_return_wit_1 : qcp_qu_active_max_return_wit_1.
Axiom proof_of_qcp_qu_active_max_return_wit_2 : qcp_qu_active_max_return_wit_2.
Axiom proof_of_qcp_qu_active_max_partial_solve_wit_1_pure : qcp_qu_active_max_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_max_partial_solve_wit_1 : qcp_qu_active_max_partial_solve_wit_1.
Axiom proof_of_qcp_qu_active_min_safety_wit_1 : qcp_qu_active_min_safety_wit_1.
Axiom proof_of_qcp_qu_active_min_return_wit_1 : qcp_qu_active_min_return_wit_1.
Axiom proof_of_qcp_qu_active_min_return_wit_2 : qcp_qu_active_min_return_wit_2.
Axiom proof_of_qcp_qu_active_min_partial_solve_wit_1_pure : qcp_qu_active_min_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_active_min_partial_solve_wit_1 : qcp_qu_active_min_partial_solve_wit_1.

End VC_Correct.
