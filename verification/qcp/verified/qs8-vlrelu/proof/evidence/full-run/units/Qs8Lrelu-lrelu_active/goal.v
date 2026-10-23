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
Require Import Qs8Lrelu.Types.
Require Import Qs8Lrelu.LreluModel.
Require Import Qs8Lrelu.RvvModel.
Require Import Qs8Lrelu.LreluActiveModel.
Local Open Scope sac.

(*----- Function qcp_qlr_active_mask -----*)

Definition qcp_qlr_active_mask_safety_wit_1 := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre <= 31)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qlr_active_mask_return_wit_1 := 
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre <= 31)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qlr_active_mask (a_pre) (b_pre) (k_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 1) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre <= 31)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qlr_active_mask (a_pre) (b_pre) (k_pre) (vl_pre))) ”
  &&  emp
).

Definition qcp_qlr_active_mask_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre <= 31)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  (0 = (qlr_active_mask (a_pre) (b_pre) (k_pre) (vl_pre)))
.

Definition qcp_qlr_active_mask_return_wit_2 := 
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_rvv_mask (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (k_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= k_pre)) (PreH10 : (k_pre <= 31)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qlr_active_mask (a_pre) (b_pre) (k_pre) (vl_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 1) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_rvv_mask (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (k_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= k_pre)) (PreH10 : (k_pre <= 31)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qlr_active_mask (a_pre) (b_pre) (k_pre) (vl_pre))) ”
  &&  emp
).

Definition qcp_qlr_active_mask_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_rvv_mask (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 1)) (PreH4 : (k_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= k_pre)) (PreH10 : (k_pre <= 31)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) ,
  (retval = (qlr_active_mask (a_pre) (b_pre) (k_pre) (vl_pre)))
.

Definition qcp_qlr_active_mask_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre <= 31)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
.

Definition qcp_qlr_active_mask_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre <= 31)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (k_pre < vl_pre) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= k_pre) ” 
  &&  “ (k_pre <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_qlr_active_mask_partial_solve_wit_1 := qcp_qlr_active_mask_partial_solve_wit_1_pure -> qcp_qlr_active_mask_partial_solve_wit_1_aux.

(*----- Function qcp_qlr_active_splat -----*)

Definition qcp_qlr_active_splat_safety_wit_1 := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= b_pre)) (PreH3 : (b_pre <= 32767)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre <= 31)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qlr_active_splat_return_wit_1 := 
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= b_pre)) (PreH3 : (b_pre <= 32767)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre <= 31)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qlr_active_splat (b_pre) (k_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= b_pre)) (PreH3 : (b_pre <= 32767)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre <= 31)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qlr_active_splat (b_pre) (k_pre) (vl_pre))) ”
  &&  emp
).

Definition qcp_qlr_active_splat_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= b_pre)) (PreH3 : (b_pre <= 32767)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre <= 31)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (qlr_active_splat (b_pre) (k_pre) (vl_pre)))
.

Definition qcp_qlr_active_splat_return_wit_2 := 
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (PreH1 : (k_pre < vl_pre)) (PreH2 : ((-32768) <= b_pre)) (PreH3 : (b_pre <= 32767)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre <= 31)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (b_pre = (qlr_active_splat (b_pre) (k_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (PreH1 : (k_pre < vl_pre)) (PreH2 : ((-32768) <= b_pre)) (PreH3 : (b_pre <= 32767)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre <= 31)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (b_pre = (qlr_active_splat (b_pre) (k_pre) (vl_pre))) ”
  &&  emp
).

Definition qcp_qlr_active_splat_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (k_pre: Z) (b_pre: Z) (PreH1 : (k_pre < vl_pre)) (PreH2 : ((-32768) <= b_pre)) (PreH3 : (b_pre <= 32767)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre <= 31)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (b_pre = (qlr_active_splat (b_pre) (k_pre) (vl_pre)))
.

(*----- Function qcp_qlr_active_merge -----*)

Definition qcp_qlr_active_merge_safety_wit_1 := 
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= m_pre)) (PreH7 : (m_pre <= 1)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre <= 31)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qlr_active_merge_return_wit_1 := 
(
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= m_pre)) (PreH7 : (m_pre <= 1)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre <= 31)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qlr_active_merge (a_pre) (b_pre) (m_pre) (k_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= m_pre)) (PreH7 : (m_pre <= 1)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre <= 31)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (qlr_active_merge (a_pre) (b_pre) (m_pre) (k_pre) (vl_pre))) ”
  &&  emp
).

Definition qcp_qlr_active_merge_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= m_pre)) (PreH7 : (m_pre <= 1)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre <= 31)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) ,
  (0 = (qlr_active_merge (a_pre) (b_pre) (m_pre) (k_pre) (vl_pre)))
.

Definition qcp_qlr_active_merge_return_wit_2 := 
(
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_choose_rvv (m_pre) (b_pre) (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (k_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= m_pre)) (PreH10 : (m_pre <= 1)) (PreH11 : (0 <= k_pre)) (PreH12 : (k_pre <= 31)) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qlr_active_merge (a_pre) (b_pre) (m_pre) (k_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_choose_rvv (m_pre) (b_pre) (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (k_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= m_pre)) (PreH10 : (m_pre <= 1)) (PreH11 : (0 <= k_pre)) (PreH12 : (k_pre <= 31)) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (qlr_active_merge (a_pre) (b_pre) (m_pre) (k_pre) (vl_pre))) ”
  &&  emp
).

Definition qcp_qlr_active_merge_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_choose_rvv (m_pre) (b_pre) (a_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (k_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= m_pre)) (PreH10 : (m_pre <= 1)) (PreH11 : (0 <= k_pre)) (PreH12 : (k_pre <= 31)) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) ,
  (retval = (qlr_active_merge (a_pre) (b_pre) (m_pre) (k_pre) (vl_pre)))
.

Definition qcp_qlr_active_merge_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= m_pre)) (PreH7 : (m_pre <= 1)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre <= 31)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= m_pre) ” 
  &&  “ (m_pre <= 1) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ”
.

Definition qcp_qlr_active_merge_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (k_pre: Z) (m_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (k_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= m_pre)) (PreH7 : (m_pre <= 1)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre <= 31)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 <= m_pre) ” 
  &&  “ (m_pre <= 1) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ (k_pre < vl_pre) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= m_pre) ” 
  &&  “ (m_pre <= 1) ” 
  &&  “ (0 <= k_pre) ” 
  &&  “ (k_pre <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_qlr_active_merge_partial_solve_wit_1 := qcp_qlr_active_merge_partial_solve_wit_1_pure -> qcp_qlr_active_merge_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_qcp_qlr_active_mask_safety_wit_1 : qcp_qlr_active_mask_safety_wit_1.
Axiom proof_of_qcp_qlr_active_mask_return_wit_1 : qcp_qlr_active_mask_return_wit_1.
Axiom proof_of_qcp_qlr_active_mask_return_wit_2 : qcp_qlr_active_mask_return_wit_2.
Axiom proof_of_qcp_qlr_active_mask_partial_solve_wit_1_pure : qcp_qlr_active_mask_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qlr_active_mask_partial_solve_wit_1 : qcp_qlr_active_mask_partial_solve_wit_1.
Axiom proof_of_qcp_qlr_active_splat_safety_wit_1 : qcp_qlr_active_splat_safety_wit_1.
Axiom proof_of_qcp_qlr_active_splat_return_wit_1 : qcp_qlr_active_splat_return_wit_1.
Axiom proof_of_qcp_qlr_active_splat_return_wit_2 : qcp_qlr_active_splat_return_wit_2.
Axiom proof_of_qcp_qlr_active_merge_safety_wit_1 : qcp_qlr_active_merge_safety_wit_1.
Axiom proof_of_qcp_qlr_active_merge_return_wit_1 : qcp_qlr_active_merge_return_wit_1.
Axiom proof_of_qcp_qlr_active_merge_return_wit_2 : qcp_qlr_active_merge_return_wit_2.
Axiom proof_of_qcp_qlr_active_merge_partial_solve_wit_1_pure : qcp_qlr_active_merge_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qlr_active_merge_partial_solve_wit_1 : qcp_qlr_active_merge_partial_solve_wit_1.

End VC_Correct.
