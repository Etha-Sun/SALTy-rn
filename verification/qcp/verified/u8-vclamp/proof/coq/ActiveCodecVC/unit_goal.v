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
Require Import FullU8.U8Logic FullU8.Packed32Model.
Local Open Scope sac.

(*----- Function qcp_u8_min -----*)

Definition qcp_u8_min_return_wit_1 := 
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= y_pre)) ,
  TT && emp 
|--
  “ (y_pre = (u8_min (x_pre) (y_pre))) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= y_pre)) ,
  TT && emp 
|--
  “ (y_pre = (u8_min (x_pre) (y_pre))) ”
  &&  emp
).

Definition qcp_u8_min_return_wit_1_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= y_pre)) ,
  (y_pre = (u8_min (x_pre) (y_pre)))
.

Definition qcp_u8_min_return_wit_2 := 
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre < y_pre)) ,
  TT && emp 
|--
  “ (x_pre = (u8_min (x_pre) (y_pre))) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre < y_pre)) ,
  TT && emp 
|--
  “ (x_pre = (u8_min (x_pre) (y_pre))) ”
  &&  emp
).

Definition qcp_u8_min_return_wit_2_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre < y_pre)) ,
  (x_pre = (u8_min (x_pre) (y_pre)))
.

(*----- Function qcp_u8_max -----*)

Definition qcp_u8_max_return_wit_1 := 
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= y_pre)) ,
  TT && emp 
|--
  “ (x_pre = (u8_max (x_pre) (y_pre))) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= y_pre)) ,
  TT && emp 
|--
  “ (x_pre = (u8_max (x_pre) (y_pre))) ”
  &&  emp
).

Definition qcp_u8_max_return_wit_1_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre >= y_pre)) ,
  (x_pre = (u8_max (x_pre) (y_pre)))
.

Definition qcp_u8_max_return_wit_2 := 
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre < y_pre)) ,
  TT && emp 
|--
  “ (y_pre = (u8_max (x_pre) (y_pre))) ”
  &&  emp
) \/
(
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre < y_pre)) ,
  TT && emp 
|--
  “ (y_pre = (u8_max (x_pre) (y_pre))) ”
  &&  emp
).

Definition qcp_u8_max_return_wit_2_split_goal_1 := 
forall (y_pre: Z) (x_pre: Z) (PreH1 : (x_pre < y_pre)) ,
  (y_pre = (u8_max (x_pre) (y_pre)))
.

(*----- Function qcp_active_min -----*)

Definition qcp_active_min_return_wit_1 := 
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (x_pre = (active_min (x_pre) (y_pre) (vl_pre) (i_pre))) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  emp
) \/
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (x_pre = (active_min (x_pre) (y_pre) (vl_pre) (i_pre))) ”
  &&  emp
).

Definition qcp_active_min_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  (x_pre = (active_min (x_pre) (y_pre) (vl_pre) (i_pre)))
.

Definition qcp_active_min_return_wit_2 := 
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_min (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (retval = (active_min (x_pre) (y_pre) (vl_pre) (i_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ”
  &&  emp
) \/
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_min (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (retval <= 255) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval = (active_min (x_pre) (y_pre) (vl_pre) (i_pre))) ”
  &&  emp
).

Definition qcp_active_min_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_min (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  (retval <= 255)
.

Definition qcp_active_min_return_wit_2_split_goal_2 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_min (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  (0 <= retval)
.

Definition qcp_active_min_return_wit_2_split_goal_3 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_min (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  (retval = (active_min (x_pre) (y_pre) (vl_pre) (i_pre)))
.

Definition qcp_active_min_partial_solve_wit_1 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 128) ”
  &&  emp
.

(*----- Function qcp_active_max -----*)

Definition qcp_active_max_return_wit_1 := 
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (x_pre = (active_max (x_pre) (y_pre) (vl_pre) (i_pre))) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  emp
) \/
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (x_pre = (active_max (x_pre) (y_pre) (vl_pre) (i_pre))) ”
  &&  emp
).

Definition qcp_active_max_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  (x_pre = (active_max (x_pre) (y_pre) (vl_pre) (i_pre)))
.

Definition qcp_active_max_return_wit_2 := 
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_max (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (retval = (active_max (x_pre) (y_pre) (vl_pre) (i_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ”
  &&  emp
) \/
(
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_max (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (retval <= 255) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval = (active_max (x_pre) (y_pre) (vl_pre) (i_pre))) ”
  &&  emp
).

Definition qcp_active_max_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_max (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  (retval <= 255)
.

Definition qcp_active_max_return_wit_2_split_goal_2 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_max (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  (0 <= retval)
.

Definition qcp_active_max_return_wit_2_split_goal_3 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (u8_max (x_pre) (y_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) (PreH5 : (0 <= y_pre)) (PreH6 : (y_pre <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 128)) ,
  (retval = (active_max (x_pre) (y_pre) (vl_pre) (i_pre)))
.

Definition qcp_active_max_partial_solve_wit_1 := 
forall (i_pre: Z) (vl_pre: Z) (y_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 128) ”
  &&  emp
.

(*----- Function qcp_word_min -----*)

Definition qcp_word_min_safety_wit_1 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (PreH1 : (0 <= y_pre)) (PreH2 : (y_pre <= 255)) (PreH3 : (0 < vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_word_min_safety_wit_2 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_min_safety_wit_3 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_word_min_safety_wit_4 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (word_byte (w_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= y_pre)) (PreH8 : (y_pre <= 255)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_word_min_safety_wit_5 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_min_safety_wit_6 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_word_min_safety_wit_7 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (word_byte (w_pre) (1)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (word_byte (w_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= y_pre)) (PreH14 : (y_pre <= 255)) (PreH15 : (0 < vl_pre)) (PreH16 : (vl_pre <= 128)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_word_min_safety_wit_8 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_min_safety_wit_9 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_word_min_safety_wit_10 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (word_byte (w_pre) (2)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (word_byte (w_pre) (1)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (word_byte (w_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= y_pre)) (PreH20 : (y_pre <= 255)) (PreH21 : (0 < vl_pre)) (PreH22 : (vl_pre <= 128)) (PreH23 : (0 <= wi_pre)) (PreH24 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_word_min_safety_wit_11 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_min_safety_wit_12 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_word_min_return_wit_1 := 
(
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_3) (retval_5) (retval_7) (retval_9)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_9 = (active_min (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (word_byte (w_pre) (3)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (word_byte (w_pre) (2)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (word_byte (w_pre) (1)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (word_byte (w_pre) (0)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (0 <= y_pre)) (PreH29 : (y_pre <= 255)) (PreH30 : (0 < vl_pre)) (PreH31 : (vl_pre <= 128)) (PreH32 : (0 <= wi_pre)) (PreH33 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (retval = (word_min (w_pre) (y_pre) (vl_pre) (wi_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ”
  &&  emp
) \/
(
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_3) (retval_5) (retval_7) (retval_9)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_9 = (active_min (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (word_byte (w_pre) (3)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (word_byte (w_pre) (2)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (word_byte (w_pre) (1)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (word_byte (w_pre) (0)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (0 <= y_pre)) (PreH29 : (y_pre <= 255)) (PreH30 : (0 < vl_pre)) (PreH31 : (vl_pre <= 128)) (PreH32 : (0 <= wi_pre)) (PreH33 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (retval = (word_min (w_pre) (y_pre) (vl_pre) (wi_pre))) ”
  &&  emp
).

Definition qcp_word_min_return_wit_1_split_goal_1 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_3) (retval_5) (retval_7) (retval_9)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_9 = (active_min (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (word_byte (w_pre) (3)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (word_byte (w_pre) (2)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (word_byte (w_pre) (1)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (word_byte (w_pre) (0)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (0 <= y_pre)) (PreH29 : (y_pre <= 255)) (PreH30 : (0 < vl_pre)) (PreH31 : (vl_pre <= 128)) (PreH32 : (0 <= wi_pre)) (PreH33 : (wi_pre < 32)) ,
  (retval = (word_min (w_pre) (y_pre) (vl_pre) (wi_pre)))
.

Definition qcp_word_min_partial_solve_wit_1_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (PreH1 : (0 <= y_pre)) (PreH2 : (y_pre <= 255)) (PreH3 : (0 < vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 4) ”
.

Definition qcp_word_min_partial_solve_wit_1_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (PreH1 : (0 <= y_pre)) (PreH2 : (y_pre <= 255)) (PreH3 : (0 < vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 4) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_1 := qcp_word_min_partial_solve_wit_1_pure -> qcp_word_min_partial_solve_wit_1_aux.

Definition qcp_word_min_partial_solve_wit_2_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 0 )) ” 
  &&  “ (((4 * wi_pre ) + 0 ) < 128) ”
.

Definition qcp_word_min_partial_solve_wit_2_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 0 )) ” 
  &&  “ (((4 * wi_pre ) + 0 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_2 := qcp_word_min_partial_solve_wit_2_pure -> qcp_word_min_partial_solve_wit_2_aux.

Definition qcp_word_min_partial_solve_wit_3_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (word_byte (w_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= y_pre)) (PreH8 : (y_pre <= 255)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 4) ”
.

Definition qcp_word_min_partial_solve_wit_3_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (word_byte (w_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= y_pre)) (PreH8 : (y_pre <= 255)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 4) ” 
  &&  “ (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_3 := qcp_word_min_partial_solve_wit_3_pure -> qcp_word_min_partial_solve_wit_3_aux.

Definition qcp_word_min_partial_solve_wit_4_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 1 )) ” 
  &&  “ (((4 * wi_pre ) + 1 ) < 128) ”
.

Definition qcp_word_min_partial_solve_wit_4_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 1 )) ” 
  &&  “ (((4 * wi_pre ) + 1 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_4 := qcp_word_min_partial_solve_wit_4_pure -> qcp_word_min_partial_solve_wit_4_aux.

Definition qcp_word_min_partial_solve_wit_5_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (word_byte (w_pre) (1)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (word_byte (w_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= y_pre)) (PreH14 : (y_pre <= 255)) (PreH15 : (0 < vl_pre)) (PreH16 : (vl_pre <= 128)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 4) ”
.

Definition qcp_word_min_partial_solve_wit_5_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (word_byte (w_pre) (1)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (word_byte (w_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= y_pre)) (PreH14 : (y_pre <= 255)) (PreH15 : (0 < vl_pre)) (PreH16 : (vl_pre <= 128)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 4) ” 
  &&  “ (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_5 := qcp_word_min_partial_solve_wit_5_pure -> qcp_word_min_partial_solve_wit_5_aux.

Definition qcp_word_min_partial_solve_wit_6_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 2 )) ” 
  &&  “ (((4 * wi_pre ) + 2 ) < 128) ”
.

Definition qcp_word_min_partial_solve_wit_6_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 2 )) ” 
  &&  “ (((4 * wi_pre ) + 2 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_6 := qcp_word_min_partial_solve_wit_6_pure -> qcp_word_min_partial_solve_wit_6_aux.

Definition qcp_word_min_partial_solve_wit_7_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (word_byte (w_pre) (2)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (word_byte (w_pre) (1)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (word_byte (w_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= y_pre)) (PreH20 : (y_pre <= 255)) (PreH21 : (0 < vl_pre)) (PreH22 : (vl_pre <= 128)) (PreH23 : (0 <= wi_pre)) (PreH24 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 4) ”
.

Definition qcp_word_min_partial_solve_wit_7_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (word_byte (w_pre) (2)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (word_byte (w_pre) (1)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (word_byte (w_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= y_pre)) (PreH20 : (y_pre <= 255)) (PreH21 : (0 < vl_pre)) (PreH22 : (vl_pre <= 128)) (PreH23 : (0 <= wi_pre)) (PreH24 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 4) ” 
  &&  “ (retval_6 = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (active_min (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (active_min (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_7 := qcp_word_min_partial_solve_wit_7_pure -> qcp_word_min_partial_solve_wit_7_aux.

Definition qcp_word_min_partial_solve_wit_8_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_7 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 3 )) ” 
  &&  “ (((4 * wi_pre ) + 3 ) < 128) ”
.

Definition qcp_word_min_partial_solve_wit_8_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_7 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 3 )) ” 
  &&  “ (((4 * wi_pre ) + 3 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (3))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_7 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (active_min (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (active_min (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_8 := qcp_word_min_partial_solve_wit_8_pure -> qcp_word_min_partial_solve_wit_8_aux.

Definition qcp_word_min_partial_solve_wit_9_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_5: Z) (retval: Z) (retval_6: Z) (retval_2: Z) (retval_7: Z) (retval_3: Z) (retval_8: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_min (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_8 = (word_byte (w_pre) (3)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_3 = (active_min (retval_7) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_7 = (word_byte (w_pre) (2)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_2 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval_6 = (word_byte (w_pre) (1)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (retval_5 = (word_byte (w_pre) (0)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (0 <= y_pre)) (PreH26 : (y_pre <= 255)) (PreH27 : (0 < vl_pre)) (PreH28 : (vl_pre <= 128)) (PreH29 : (0 <= wi_pre)) (PreH30 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ”
.

Definition qcp_word_min_partial_solve_wit_9_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_5: Z) (retval: Z) (retval_6: Z) (retval_2: Z) (retval_7: Z) (retval_3: Z) (retval_8: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_min (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_8 = (word_byte (w_pre) (3)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_3 = (active_min (retval_7) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_7 = (word_byte (w_pre) (2)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_2 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval_6 = (word_byte (w_pre) (1)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (retval_5 = (word_byte (w_pre) (0)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (0 <= y_pre)) (PreH26 : (y_pre <= 255)) (PreH27 : (0 < vl_pre)) (PreH28 : (vl_pre <= 128)) (PreH29 : (0 <= wi_pre)) (PreH30 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_4 = (active_min (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 )))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_8 = (word_byte (w_pre) (3))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_3 = (active_min (retval_7) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_7 = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_2 = (active_min (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval_6 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval = (active_min (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_5 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_min_partial_solve_wit_9 := qcp_word_min_partial_solve_wit_9_pure -> qcp_word_min_partial_solve_wit_9_aux.

(*----- Function qcp_word_max -----*)

Definition qcp_word_max_safety_wit_1 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (PreH1 : (0 <= y_pre)) (PreH2 : (y_pre <= 255)) (PreH3 : (0 < vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_word_max_safety_wit_2 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_max_safety_wit_3 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_word_max_safety_wit_4 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (word_byte (w_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= y_pre)) (PreH8 : (y_pre <= 255)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_word_max_safety_wit_5 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_max_safety_wit_6 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_word_max_safety_wit_7 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (word_byte (w_pre) (1)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (word_byte (w_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= y_pre)) (PreH14 : (y_pre <= 255)) (PreH15 : (0 < vl_pre)) (PreH16 : (vl_pre <= 128)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_word_max_safety_wit_8 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_max_safety_wit_9 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 255)) (PreH4 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 255)) (PreH7 : (retval_3 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 255)) (PreH13 : (retval = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_word_max_safety_wit_10 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (word_byte (w_pre) (2)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (word_byte (w_pre) (1)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (word_byte (w_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= y_pre)) (PreH20 : (y_pre <= 255)) (PreH21 : (0 < vl_pre)) (PreH22 : (vl_pre <= 128)) (PreH23 : (0 <= wi_pre)) (PreH24 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_word_max_safety_wit_11 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_word_max_safety_wit_12 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 255)) (PreH4 : (retval_6 = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 255)) (PreH7 : (retval_5 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 255)) (PreH10 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 255)) (PreH13 : (retval_3 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 255)) (PreH16 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 255)) (PreH19 : (retval = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_word_max_return_wit_1 := 
(
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_3) (retval_5) (retval_7) (retval_9)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_9 = (active_max (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (word_byte (w_pre) (3)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (word_byte (w_pre) (2)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (word_byte (w_pre) (1)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (word_byte (w_pre) (0)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (0 <= y_pre)) (PreH29 : (y_pre <= 255)) (PreH30 : (0 < vl_pre)) (PreH31 : (vl_pre <= 128)) (PreH32 : (0 <= wi_pre)) (PreH33 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (retval = (word_max (w_pre) (y_pre) (vl_pre) (wi_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ”
  &&  emp
) \/
(
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_3) (retval_5) (retval_7) (retval_9)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_9 = (active_max (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (word_byte (w_pre) (3)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (word_byte (w_pre) (2)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (word_byte (w_pre) (1)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (word_byte (w_pre) (0)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (0 <= y_pre)) (PreH29 : (y_pre <= 255)) (PreH30 : (0 < vl_pre)) (PreH31 : (vl_pre <= 128)) (PreH32 : (0 <= wi_pre)) (PreH33 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (retval = (word_max (w_pre) (y_pre) (vl_pre) (wi_pre))) ”
  &&  emp
).

Definition qcp_word_max_return_wit_1_split_goal_1 := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_3) (retval_5) (retval_7) (retval_9)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_9 = (active_max (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 255)) (PreH7 : (retval_8 = (word_byte (w_pre) (3)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 255)) (PreH10 : (retval_7 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_6 = (word_byte (w_pre) (2)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 255)) (PreH16 : (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 255)) (PreH19 : (retval_4 = (word_byte (w_pre) (1)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 255)) (PreH22 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 255)) (PreH25 : (retval_2 = (word_byte (w_pre) (0)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 255)) (PreH28 : (0 <= y_pre)) (PreH29 : (y_pre <= 255)) (PreH30 : (0 < vl_pre)) (PreH31 : (vl_pre <= 128)) (PreH32 : (0 <= wi_pre)) (PreH33 : (wi_pre < 32)) ,
  (retval = (word_max (w_pre) (y_pre) (vl_pre) (wi_pre)))
.

Definition qcp_word_max_partial_solve_wit_1_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (PreH1 : (0 <= y_pre)) (PreH2 : (y_pre <= 255)) (PreH3 : (0 < vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 4) ”
.

Definition qcp_word_max_partial_solve_wit_1_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (PreH1 : (0 <= y_pre)) (PreH2 : (y_pre <= 255)) (PreH3 : (0 < vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 4) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_1 := qcp_word_max_partial_solve_wit_1_pure -> qcp_word_max_partial_solve_wit_1_aux.

Definition qcp_word_max_partial_solve_wit_2_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 0 )) ” 
  &&  “ (((4 * wi_pre ) + 0 ) < 128) ”
.

Definition qcp_word_max_partial_solve_wit_2_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 <= y_pre)) (PreH5 : (y_pre <= 255)) (PreH6 : (0 < vl_pre)) (PreH7 : (vl_pre <= 128)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 0 )) ” 
  &&  “ (((4 * wi_pre ) + 0 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_2 := qcp_word_max_partial_solve_wit_2_pure -> qcp_word_max_partial_solve_wit_2_aux.

Definition qcp_word_max_partial_solve_wit_3_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (word_byte (w_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= y_pre)) (PreH8 : (y_pre <= 255)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 4) ”
.

Definition qcp_word_max_partial_solve_wit_3_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (word_byte (w_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 <= y_pre)) (PreH8 : (y_pre <= 255)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 4) ” 
  &&  “ (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_3 := qcp_word_max_partial_solve_wit_3_pure -> qcp_word_max_partial_solve_wit_3_aux.

Definition qcp_word_max_partial_solve_wit_4_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 1 )) ” 
  &&  “ (((4 * wi_pre ) + 1 ) < 128) ”
.

Definition qcp_word_max_partial_solve_wit_4_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (1)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (word_byte (w_pre) (0)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (0 <= y_pre)) (PreH11 : (y_pre <= 255)) (PreH12 : (0 < vl_pre)) (PreH13 : (vl_pre <= 128)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 1 )) ” 
  &&  “ (((4 * wi_pre ) + 1 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_4 := qcp_word_max_partial_solve_wit_4_pure -> qcp_word_max_partial_solve_wit_4_aux.

Definition qcp_word_max_partial_solve_wit_5_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (word_byte (w_pre) (1)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (word_byte (w_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= y_pre)) (PreH14 : (y_pre <= 255)) (PreH15 : (0 < vl_pre)) (PreH16 : (vl_pre <= 128)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 4) ”
.

Definition qcp_word_max_partial_solve_wit_5_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (word_byte (w_pre) (1)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (word_byte (w_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 <= y_pre)) (PreH14 : (y_pre <= 255)) (PreH15 : (0 < vl_pre)) (PreH16 : (vl_pre <= 128)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 4) ” 
  &&  “ (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_5 := qcp_word_max_partial_solve_wit_5_pure -> qcp_word_max_partial_solve_wit_5_aux.

Definition qcp_word_max_partial_solve_wit_6_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 2 )) ” 
  &&  “ (((4 * wi_pre ) + 2 ) < 128) ”
.

Definition qcp_word_max_partial_solve_wit_6_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (2)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (word_byte (w_pre) (1)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (word_byte (w_pre) (0)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (0 <= y_pre)) (PreH17 : (y_pre <= 255)) (PreH18 : (0 < vl_pre)) (PreH19 : (vl_pre <= 128)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 2 )) ” 
  &&  “ (((4 * wi_pre ) + 2 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_6 := qcp_word_max_partial_solve_wit_6_pure -> qcp_word_max_partial_solve_wit_6_aux.

Definition qcp_word_max_partial_solve_wit_7_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (word_byte (w_pre) (2)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (word_byte (w_pre) (1)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (word_byte (w_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= y_pre)) (PreH20 : (y_pre <= 255)) (PreH21 : (0 < vl_pre)) (PreH22 : (vl_pre <= 128)) (PreH23 : (0 <= wi_pre)) (PreH24 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 4) ”
.

Definition qcp_word_max_partial_solve_wit_7_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 255)) (PreH4 : (retval_5 = (word_byte (w_pre) (2)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (word_byte (w_pre) (1)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval = (word_byte (w_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 255)) (PreH19 : (0 <= y_pre)) (PreH20 : (y_pre <= 255)) (PreH21 : (0 < vl_pre)) (PreH22 : (vl_pre <= 128)) (PreH23 : (0 <= wi_pre)) (PreH24 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 4) ” 
  &&  “ (retval_6 = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (active_max (retval_3) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (active_max (retval) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_7 := qcp_word_max_partial_solve_wit_7_pure -> qcp_word_max_partial_solve_wit_7_aux.

Definition qcp_word_max_partial_solve_wit_8_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_7 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 3 )) ” 
  &&  “ (((4 * wi_pre ) + 3 ) < 128) ”
.

Definition qcp_word_max_partial_solve_wit_8_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: Z) (PreH1 : (retval = (word_byte (w_pre) (3)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (retval_7 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 255)) (PreH7 : (retval_6 = (word_byte (w_pre) (2)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 255)) (PreH10 : (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 255)) (PreH13 : (retval_4 = (word_byte (w_pre) (1)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 255)) (PreH16 : (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 255)) (PreH19 : (retval_2 = (word_byte (w_pre) (0)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 255)) (PreH22 : (0 <= y_pre)) (PreH23 : (y_pre <= 255)) (PreH24 : (0 < vl_pre)) (PreH25 : (vl_pre <= 128)) (PreH26 : (0 <= wi_pre)) (PreH27 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 3 )) ” 
  &&  “ (((4 * wi_pre ) + 3 ) < 128) ” 
  &&  “ (retval = (word_byte (w_pre) (3))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_7 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_6 = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval_5 = (active_max (retval_4) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (retval_4 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (active_max (retval_2) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_8 := qcp_word_max_partial_solve_wit_8_pure -> qcp_word_max_partial_solve_wit_8_aux.

Definition qcp_word_max_partial_solve_wit_9_pure := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_5: Z) (retval: Z) (retval_6: Z) (retval_2: Z) (retval_7: Z) (retval_3: Z) (retval_8: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_max (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_8 = (word_byte (w_pre) (3)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_3 = (active_max (retval_7) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_7 = (word_byte (w_pre) (2)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_2 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval_6 = (word_byte (w_pre) (1)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (retval_5 = (word_byte (w_pre) (0)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (0 <= y_pre)) (PreH26 : (y_pre <= 255)) (PreH27 : (0 < vl_pre)) (PreH28 : (vl_pre <= 128)) (PreH29 : (0 <= wi_pre)) (PreH30 : (wi_pre < 32)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "y" ) )) # UChar  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ”
.

Definition qcp_word_max_partial_solve_wit_9_aux := 
forall (wi_pre: Z) (vl_pre: Z) (y_pre: Z) (w_pre: Z) (retval_5: Z) (retval: Z) (retval_6: Z) (retval_2: Z) (retval_7: Z) (retval_3: Z) (retval_8: Z) (retval_4: Z) (PreH1 : (retval_4 = (active_max (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_8 = (word_byte (w_pre) (3)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 255)) (PreH7 : (retval_3 = (active_max (retval_7) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 255)) (PreH10 : (retval_7 = (word_byte (w_pre) (2)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 255)) (PreH13 : (retval_2 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (retval_6 = (word_byte (w_pre) (1)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 255)) (PreH19 : (retval = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 ))))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 255)) (PreH22 : (retval_5 = (word_byte (w_pre) (0)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 255)) (PreH25 : (0 <= y_pre)) (PreH26 : (y_pre <= 255)) (PreH27 : (0 < vl_pre)) (PreH28 : (vl_pre <= 128)) (PreH29 : (0 <= wi_pre)) (PreH30 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_4 = (active_max (retval_8) (y_pre) (vl_pre) (((4 * wi_pre ) + 3 )))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_8 = (word_byte (w_pre) (3))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 255) ” 
  &&  “ (retval_3 = (active_max (retval_7) (y_pre) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_7 = (word_byte (w_pre) (2))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 255) ” 
  &&  “ (retval_2 = (active_max (retval_6) (y_pre) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval_6 = (word_byte (w_pre) (1))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 255) ” 
  &&  “ (retval = (active_max (retval_5) (y_pre) (vl_pre) (((4 * wi_pre ) + 0 )))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval_5 = (word_byte (w_pre) (0))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 255) ” 
  &&  “ (0 <= y_pre) ” 
  &&  “ (y_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  emp
.

Definition qcp_word_max_partial_solve_wit_9 := qcp_word_max_partial_solve_wit_9_pure -> qcp_word_max_partial_solve_wit_9_aux.

Module Type VC_Correct.


Axiom proof_of_qcp_u8_min_return_wit_1 : qcp_u8_min_return_wit_1.
Axiom proof_of_qcp_u8_min_return_wit_2 : qcp_u8_min_return_wit_2.
Axiom proof_of_qcp_u8_max_return_wit_1 : qcp_u8_max_return_wit_1.
Axiom proof_of_qcp_u8_max_return_wit_2 : qcp_u8_max_return_wit_2.
Axiom proof_of_qcp_active_min_return_wit_1 : qcp_active_min_return_wit_1.
Axiom proof_of_qcp_active_min_return_wit_2 : qcp_active_min_return_wit_2.
Axiom proof_of_qcp_active_min_partial_solve_wit_1 : qcp_active_min_partial_solve_wit_1.
Axiom proof_of_qcp_active_max_return_wit_1 : qcp_active_max_return_wit_1.
Axiom proof_of_qcp_active_max_return_wit_2 : qcp_active_max_return_wit_2.
Axiom proof_of_qcp_active_max_partial_solve_wit_1 : qcp_active_max_partial_solve_wit_1.
Axiom proof_of_qcp_word_min_safety_wit_1 : qcp_word_min_safety_wit_1.
Axiom proof_of_qcp_word_min_safety_wit_2 : qcp_word_min_safety_wit_2.
Axiom proof_of_qcp_word_min_safety_wit_3 : qcp_word_min_safety_wit_3.
Axiom proof_of_qcp_word_min_safety_wit_4 : qcp_word_min_safety_wit_4.
Axiom proof_of_qcp_word_min_safety_wit_5 : qcp_word_min_safety_wit_5.
Axiom proof_of_qcp_word_min_safety_wit_6 : qcp_word_min_safety_wit_6.
Axiom proof_of_qcp_word_min_safety_wit_7 : qcp_word_min_safety_wit_7.
Axiom proof_of_qcp_word_min_safety_wit_8 : qcp_word_min_safety_wit_8.
Axiom proof_of_qcp_word_min_safety_wit_9 : qcp_word_min_safety_wit_9.
Axiom proof_of_qcp_word_min_safety_wit_10 : qcp_word_min_safety_wit_10.
Axiom proof_of_qcp_word_min_safety_wit_11 : qcp_word_min_safety_wit_11.
Axiom proof_of_qcp_word_min_safety_wit_12 : qcp_word_min_safety_wit_12.
Axiom proof_of_qcp_word_min_return_wit_1 : qcp_word_min_return_wit_1.
Axiom proof_of_qcp_word_min_partial_solve_wit_1_pure : qcp_word_min_partial_solve_wit_1_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_1 : qcp_word_min_partial_solve_wit_1.
Axiom proof_of_qcp_word_min_partial_solve_wit_2_pure : qcp_word_min_partial_solve_wit_2_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_2 : qcp_word_min_partial_solve_wit_2.
Axiom proof_of_qcp_word_min_partial_solve_wit_3_pure : qcp_word_min_partial_solve_wit_3_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_3 : qcp_word_min_partial_solve_wit_3.
Axiom proof_of_qcp_word_min_partial_solve_wit_4_pure : qcp_word_min_partial_solve_wit_4_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_4 : qcp_word_min_partial_solve_wit_4.
Axiom proof_of_qcp_word_min_partial_solve_wit_5_pure : qcp_word_min_partial_solve_wit_5_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_5 : qcp_word_min_partial_solve_wit_5.
Axiom proof_of_qcp_word_min_partial_solve_wit_6_pure : qcp_word_min_partial_solve_wit_6_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_6 : qcp_word_min_partial_solve_wit_6.
Axiom proof_of_qcp_word_min_partial_solve_wit_7_pure : qcp_word_min_partial_solve_wit_7_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_7 : qcp_word_min_partial_solve_wit_7.
Axiom proof_of_qcp_word_min_partial_solve_wit_8_pure : qcp_word_min_partial_solve_wit_8_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_8 : qcp_word_min_partial_solve_wit_8.
Axiom proof_of_qcp_word_min_partial_solve_wit_9_pure : qcp_word_min_partial_solve_wit_9_pure.
Axiom proof_of_qcp_word_min_partial_solve_wit_9 : qcp_word_min_partial_solve_wit_9.
Axiom proof_of_qcp_word_max_safety_wit_1 : qcp_word_max_safety_wit_1.
Axiom proof_of_qcp_word_max_safety_wit_2 : qcp_word_max_safety_wit_2.
Axiom proof_of_qcp_word_max_safety_wit_3 : qcp_word_max_safety_wit_3.
Axiom proof_of_qcp_word_max_safety_wit_4 : qcp_word_max_safety_wit_4.
Axiom proof_of_qcp_word_max_safety_wit_5 : qcp_word_max_safety_wit_5.
Axiom proof_of_qcp_word_max_safety_wit_6 : qcp_word_max_safety_wit_6.
Axiom proof_of_qcp_word_max_safety_wit_7 : qcp_word_max_safety_wit_7.
Axiom proof_of_qcp_word_max_safety_wit_8 : qcp_word_max_safety_wit_8.
Axiom proof_of_qcp_word_max_safety_wit_9 : qcp_word_max_safety_wit_9.
Axiom proof_of_qcp_word_max_safety_wit_10 : qcp_word_max_safety_wit_10.
Axiom proof_of_qcp_word_max_safety_wit_11 : qcp_word_max_safety_wit_11.
Axiom proof_of_qcp_word_max_safety_wit_12 : qcp_word_max_safety_wit_12.
Axiom proof_of_qcp_word_max_return_wit_1 : qcp_word_max_return_wit_1.
Axiom proof_of_qcp_word_max_partial_solve_wit_1_pure : qcp_word_max_partial_solve_wit_1_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_1 : qcp_word_max_partial_solve_wit_1.
Axiom proof_of_qcp_word_max_partial_solve_wit_2_pure : qcp_word_max_partial_solve_wit_2_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_2 : qcp_word_max_partial_solve_wit_2.
Axiom proof_of_qcp_word_max_partial_solve_wit_3_pure : qcp_word_max_partial_solve_wit_3_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_3 : qcp_word_max_partial_solve_wit_3.
Axiom proof_of_qcp_word_max_partial_solve_wit_4_pure : qcp_word_max_partial_solve_wit_4_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_4 : qcp_word_max_partial_solve_wit_4.
Axiom proof_of_qcp_word_max_partial_solve_wit_5_pure : qcp_word_max_partial_solve_wit_5_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_5 : qcp_word_max_partial_solve_wit_5.
Axiom proof_of_qcp_word_max_partial_solve_wit_6_pure : qcp_word_max_partial_solve_wit_6_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_6 : qcp_word_max_partial_solve_wit_6.
Axiom proof_of_qcp_word_max_partial_solve_wit_7_pure : qcp_word_max_partial_solve_wit_7_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_7 : qcp_word_max_partial_solve_wit_7.
Axiom proof_of_qcp_word_max_partial_solve_wit_8_pure : qcp_word_max_partial_solve_wit_8_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_8 : qcp_word_max_partial_solve_wit_8.
Axiom proof_of_qcp_word_max_partial_solve_wit_9_pure : qcp_word_max_partial_solve_wit_9_pure.
Axiom proof_of_qcp_word_max_partial_solve_wit_9 : qcp_word_max_partial_solve_wit_9.

End VC_Correct.
