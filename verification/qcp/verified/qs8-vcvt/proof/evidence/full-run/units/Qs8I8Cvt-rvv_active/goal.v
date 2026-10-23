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
Require Import Qs8I8Cvt.Model.
Require Import Qs8I8Cvt.Types.
Require Import Qs8I8Cvt.RvvModel.
Local Open Scope sac.

(*----- Function qcp_qcv_active_sext -----*)

Definition qcp_qcv_active_sext_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-128) <= x_pre)) (PreH3 : (x_pre <= 127)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Char  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_active_sext_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-128) <= x_pre)) (PreH3 : (x_pre <= 127)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_sext (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ ((-128) <= 0) ” 
  &&  “ (0 <= 127) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-128) <= x_pre)) (PreH3 : (x_pre <= 127)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_sext (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_sext_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-128) <= x_pre)) (PreH3 : (x_pre <= 127)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (qcv_active_sext (i_pre) (vl_pre) (x_pre)))
.

Definition qcp_qcv_active_sext_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-128) <= x_pre)) (PreH3 : (x_pre <= 127)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (x_pre = (qcv_active_sext (i_pre) (vl_pre) (x_pre))) ” 
  &&  “ ((-128) <= x_pre) ” 
  &&  “ (x_pre <= 127) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-128) <= x_pre)) (PreH3 : (x_pre <= 127)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (x_pre = (qcv_active_sext (i_pre) (vl_pre) (x_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_sext_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-128) <= x_pre)) (PreH3 : (x_pre <= 127)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (x_pre = (qcv_active_sext (i_pre) (vl_pre) (x_pre)))
.

(*----- Function qcp_qcv_active_rsub -----*)

Definition qcp_qcv_active_rsub_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((b_pre - a_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (b_pre - a_pre )) ”
.

Definition qcp_qcv_active_rsub_safety_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_active_rsub_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_rsub (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_rsub (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_rsub_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  (0 = (qcv_active_rsub (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qcv_active_rsub_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_s16 ((b_pre - a_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_rsub (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_s16 ((b_pre - a_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_rsub (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_rsub_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_s16 ((b_pre - a_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  (retval = (qcv_active_rsub (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qcv_active_rsub_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= (b_pre - a_pre )) ” 
  &&  “ ((b_pre - a_pre ) <= INT_MAX) ”
.

Definition qcp_qcv_active_rsub_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (b_pre - a_pre )) ” 
  &&  “ ((b_pre - a_pre ) <= INT_MAX) ” 
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

Definition qcp_qcv_active_rsub_partial_solve_wit_1 := qcp_qcv_active_rsub_partial_solve_wit_1_pure -> qcp_qcv_active_rsub_partial_solve_wit_1_aux.

(*----- Function qcp_qcv_active_shl7 -----*)

Definition qcp_qcv_active_shl7_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_active_shl7_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_shl7 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_shl7 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_shl7_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (qcv_active_shl7 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qcv_active_shl7_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_shl7 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_shl7 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_shl7 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_shl7 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_shl7_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_shl7 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  (retval = (qcv_active_shl7 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qcv_active_shl7_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ”
.

Definition qcp_qcv_active_shl7_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_qcv_active_shl7_partial_solve_wit_1 := qcp_qcv_active_shl7_partial_solve_wit_1_pure -> qcp_qcv_active_shl7_partial_solve_wit_1_aux.

(*----- Function qcp_qcv_active_mul -----*)

Definition qcp_qcv_active_mul_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_active_mul_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_mul_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  (0 = (qcv_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qcv_active_mul_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_mul (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= a_pre)) (PreH4 : (a_pre <= 32767)) (PreH5 : ((-32768) <= b_pre)) (PreH6 : (b_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_mul (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= a_pre)) (PreH4 : (a_pre <= 32767)) (PreH5 : ((-32768) <= b_pre)) (PreH6 : (b_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (qcv_active_mul (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_mul_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_mul (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= a_pre)) (PreH4 : (a_pre <= 32767)) (PreH5 : ((-32768) <= b_pre)) (PreH6 : (b_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  (retval <= INT_MAX)
.

Definition qcp_qcv_active_mul_return_wit_2_split_goal_2 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_mul (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= a_pre)) (PreH4 : (a_pre <= 32767)) (PreH5 : ((-32768) <= b_pre)) (PreH6 : (b_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  ((INT_MIN) <= retval)
.

Definition qcp_qcv_active_mul_return_wit_2_split_goal_3 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_mul (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : ((-32768) <= a_pre)) (PreH4 : (a_pre <= 32767)) (PreH5 : ((-32768) <= b_pre)) (PreH6 : (b_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  (retval = (qcv_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qcv_active_mul_partial_solve_wit_1_pure := 
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

Definition qcp_qcv_active_mul_partial_solve_wit_1_aux := 
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

Definition qcp_qcv_active_mul_partial_solve_wit_1 := qcp_qcv_active_mul_partial_solve_wit_1_pure -> qcp_qcv_active_mul_partial_solve_wit_1_aux.

(*----- Function qcp_qcv_active_clip15 -----*)

Definition qcp_qcv_active_clip15_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_active_clip15_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_clip15 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_clip15 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_clip15_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (qcv_active_clip15 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qcv_active_clip15_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_clip15 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_clip15 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_clip15 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_clip15 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_clip15_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_clip15 (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  (retval = (qcv_active_clip15 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qcv_active_clip15_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ”
.

Definition qcp_qcv_active_clip15_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_qcv_active_clip15_partial_solve_wit_1 := qcp_qcv_active_clip15_partial_solve_wit_1_pure -> qcp_qcv_active_clip15_partial_solve_wit_1_aux.

(*----- Function qcp_qcv_active_add -----*)

Definition qcp_qcv_active_add_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_active_add_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_add_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  (0 = (qcv_active_add (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qcv_active_add_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_add (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_add (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_add (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_add_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_rvv_add (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  (retval = (qcv_active_add (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_qcv_active_add_partial_solve_wit_1_pure := 
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

Definition qcp_qcv_active_add_partial_solve_wit_1_aux := 
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

Definition qcp_qcv_active_add_partial_solve_wit_1 := qcp_qcv_active_add_partial_solve_wit_1_pure -> qcp_qcv_active_add_partial_solve_wit_1_aux.

(*----- Function qcp_qcv_active_clip8 -----*)

Definition qcp_qcv_active_clip8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qcv_active_clip8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_clip8 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-128) <= 0) ” 
  &&  “ (0 <= 127) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qcv_active_clip8 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_clip8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (qcv_active_clip8 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qcv_active_clip8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat8 (a_pre)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_clip8 (i_pre) (vl_pre) (a_pre))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat8 (a_pre)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qcv_active_clip8 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_qcv_active_clip8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qcv_sat8 (a_pre)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) ,
  (retval = (qcv_active_clip8 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_qcv_active_clip8_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ”
.

Definition qcp_qcv_active_clip8_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_qcv_active_clip8_partial_solve_wit_1 := qcp_qcv_active_clip8_partial_solve_wit_1_pure -> qcp_qcv_active_clip8_partial_solve_wit_1_aux.

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
  “ (32 = (qcv_vl (n_pre))) ” 
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
  “ (32 = (qcv_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e8m2_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  (32 = (qcv_vl (n_pre)))
.

Definition __riscv_vsetvl_e8m2_return_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre < 32)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  (“ (n_pre = (qcv_vl (n_pre))) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= 32) ” 
  &&  “ (n_pre <= n_pre) ” 
  &&  “ (n_pre = 0) ”
  &&  emp)
  ||
  (“ (n_pre = (qcv_vl (n_pre))) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= 32) ” 
  &&  “ (n_pre <= n_pre) ” 
  &&  “ (0 < n_pre) ”
  &&  emp)
.

Module Type VC_Correct.


Axiom proof_of_qcp_qcv_active_sext_safety_wit_1 : qcp_qcv_active_sext_safety_wit_1.
Axiom proof_of_qcp_qcv_active_sext_return_wit_1 : qcp_qcv_active_sext_return_wit_1.
Axiom proof_of_qcp_qcv_active_sext_return_wit_2 : qcp_qcv_active_sext_return_wit_2.
Axiom proof_of_qcp_qcv_active_rsub_safety_wit_1 : qcp_qcv_active_rsub_safety_wit_1.
Axiom proof_of_qcp_qcv_active_rsub_safety_wit_2 : qcp_qcv_active_rsub_safety_wit_2.
Axiom proof_of_qcp_qcv_active_rsub_return_wit_1 : qcp_qcv_active_rsub_return_wit_1.
Axiom proof_of_qcp_qcv_active_rsub_return_wit_2 : qcp_qcv_active_rsub_return_wit_2.
Axiom proof_of_qcp_qcv_active_rsub_partial_solve_wit_1_pure : qcp_qcv_active_rsub_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_active_rsub_partial_solve_wit_1 : qcp_qcv_active_rsub_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_active_shl7_safety_wit_1 : qcp_qcv_active_shl7_safety_wit_1.
Axiom proof_of_qcp_qcv_active_shl7_return_wit_1 : qcp_qcv_active_shl7_return_wit_1.
Axiom proof_of_qcp_qcv_active_shl7_return_wit_2 : qcp_qcv_active_shl7_return_wit_2.
Axiom proof_of_qcp_qcv_active_shl7_partial_solve_wit_1_pure : qcp_qcv_active_shl7_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_active_shl7_partial_solve_wit_1 : qcp_qcv_active_shl7_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_active_mul_safety_wit_1 : qcp_qcv_active_mul_safety_wit_1.
Axiom proof_of_qcp_qcv_active_mul_return_wit_1 : qcp_qcv_active_mul_return_wit_1.
Axiom proof_of_qcp_qcv_active_mul_return_wit_2 : qcp_qcv_active_mul_return_wit_2.
Axiom proof_of_qcp_qcv_active_mul_partial_solve_wit_1_pure : qcp_qcv_active_mul_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_active_mul_partial_solve_wit_1 : qcp_qcv_active_mul_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_active_clip15_safety_wit_1 : qcp_qcv_active_clip15_safety_wit_1.
Axiom proof_of_qcp_qcv_active_clip15_return_wit_1 : qcp_qcv_active_clip15_return_wit_1.
Axiom proof_of_qcp_qcv_active_clip15_return_wit_2 : qcp_qcv_active_clip15_return_wit_2.
Axiom proof_of_qcp_qcv_active_clip15_partial_solve_wit_1_pure : qcp_qcv_active_clip15_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_active_clip15_partial_solve_wit_1 : qcp_qcv_active_clip15_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_active_add_safety_wit_1 : qcp_qcv_active_add_safety_wit_1.
Axiom proof_of_qcp_qcv_active_add_return_wit_1 : qcp_qcv_active_add_return_wit_1.
Axiom proof_of_qcp_qcv_active_add_return_wit_2 : qcp_qcv_active_add_return_wit_2.
Axiom proof_of_qcp_qcv_active_add_partial_solve_wit_1_pure : qcp_qcv_active_add_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_active_add_partial_solve_wit_1 : qcp_qcv_active_add_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_active_clip8_safety_wit_1 : qcp_qcv_active_clip8_safety_wit_1.
Axiom proof_of_qcp_qcv_active_clip8_return_wit_1 : qcp_qcv_active_clip8_return_wit_1.
Axiom proof_of_qcp_qcv_active_clip8_return_wit_2 : qcp_qcv_active_clip8_return_wit_2.
Axiom proof_of_qcp_qcv_active_clip8_partial_solve_wit_1_pure : qcp_qcv_active_clip8_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qcv_active_clip8_partial_solve_wit_1 : qcp_qcv_active_clip8_partial_solve_wit_1.
Axiom proof_of___riscv_vsetvl_e8m2_safety_wit_1 : __riscv_vsetvl_e8m2_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e8m2_safety_wit_2 : __riscv_vsetvl_e8m2_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e8m2_return_wit_1 : __riscv_vsetvl_e8m2_return_wit_1.
Axiom proof_of___riscv_vsetvl_e8m2_return_wit_2 : __riscv_vsetvl_e8m2_return_wit_2.

End VC_Correct.
