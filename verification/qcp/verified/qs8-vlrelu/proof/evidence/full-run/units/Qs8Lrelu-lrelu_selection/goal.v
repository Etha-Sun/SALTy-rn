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
Local Open Scope sac.

(*----- Function qcp_qlr_cmp16 -----*)

Definition qcp_qlr_cmp16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (65535 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 65535) ”
.

Definition qcp_qlr_cmp16_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qlr_cmp16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qlr_neon_mask (a_pre) (b_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 65535) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qlr_neon_mask (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_cmp16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  (0 = (qlr_neon_mask (a_pre) (b_pre)))
.

Definition qcp_qlr_cmp16_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (65535 = (qlr_neon_mask (a_pre) (b_pre))) ” 
  &&  “ (0 <= 65535) ” 
  &&  “ (65535 <= 65535) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (65535 = (qlr_neon_mask (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_cmp16_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  (65535 = (qlr_neon_mask (a_pre) (b_pre)))
.

(*----- Function qcp_qlr_cmpbool -----*)

Definition qcp_qlr_cmpbool_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_qlr_cmpbool_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qlr_cmpbool_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qlr_rvv_mask (a_pre) (b_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 1) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (0 = (qlr_rvv_mask (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_cmpbool_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  (0 = (qlr_rvv_mask (a_pre) (b_pre)))
.

Definition qcp_qlr_cmpbool_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (1 = (qlr_rvv_mask (a_pre) (b_pre))) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= 1) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (1 = (qlr_rvv_mask (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_cmpbool_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) ,
  (1 = (qlr_rvv_mask (a_pre) (b_pre)))
.

(*----- Function qcp_qlr_choose_neon -----*)

Definition qcp_qlr_choose_neon_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (0 <= m_pre)) (PreH2 : (m_pre <= 65535)) (PreH3 : ((-32768) <= a_pre)) (PreH4 : (a_pre <= 32767)) (PreH5 : ((-32768) <= b_pre)) (PreH6 : (b_pre <= 32767)) ,
  ((( &( "m" ) )) # UShort  |-> m_pre)
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (65535 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 65535) ”
.

Definition qcp_qlr_choose_neon_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre <> 65535)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 65535)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (b_pre = (qlr_choose_neon (m_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre <> 65535)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 65535)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (b_pre = (qlr_choose_neon (m_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_choose_neon_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre <> 65535)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 65535)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (b_pre = (qlr_choose_neon (m_pre) (a_pre) (b_pre)))
.

Definition qcp_qlr_choose_neon_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre = 65535)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 65535)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (a_pre = (qlr_choose_neon (m_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre = 65535)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 65535)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (a_pre = (qlr_choose_neon (65535) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_choose_neon_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre = 65535)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 65535)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (a_pre = (qlr_choose_neon (65535) (a_pre) (b_pre)))
.

(*----- Function qcp_qlr_choose_rvv -----*)

Definition qcp_qlr_choose_rvv_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (0 <= m_pre)) (PreH2 : (m_pre <= 1)) (PreH3 : ((-32768) <= a_pre)) (PreH4 : (a_pre <= 32767)) (PreH5 : ((-32768) <= b_pre)) (PreH6 : (b_pre <= 32767)) ,
  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_qlr_choose_rvv_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre <> 1)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 1)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (b_pre = (qlr_choose_rvv (m_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre <> 1)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 1)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (b_pre = (qlr_choose_rvv (m_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_choose_rvv_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre <> 1)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 1)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (b_pre = (qlr_choose_rvv (m_pre) (a_pre) (b_pre)))
.

Definition qcp_qlr_choose_rvv_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre = 1)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 1)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (a_pre = (qlr_choose_rvv (m_pre) (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre = 1)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 1)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (a_pre = (qlr_choose_rvv (1) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_qlr_choose_rvv_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (PreH1 : (m_pre = 1)) (PreH2 : (0 <= m_pre)) (PreH3 : (m_pre <= 1)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (a_pre = (qlr_choose_rvv (1) (a_pre) (b_pre)))
.

Module Type VC_Correct.


Axiom proof_of_qcp_qlr_cmp16_safety_wit_1 : qcp_qlr_cmp16_safety_wit_1.
Axiom proof_of_qcp_qlr_cmp16_safety_wit_2 : qcp_qlr_cmp16_safety_wit_2.
Axiom proof_of_qcp_qlr_cmp16_return_wit_1 : qcp_qlr_cmp16_return_wit_1.
Axiom proof_of_qcp_qlr_cmp16_return_wit_2 : qcp_qlr_cmp16_return_wit_2.
Axiom proof_of_qcp_qlr_cmpbool_safety_wit_1 : qcp_qlr_cmpbool_safety_wit_1.
Axiom proof_of_qcp_qlr_cmpbool_safety_wit_2 : qcp_qlr_cmpbool_safety_wit_2.
Axiom proof_of_qcp_qlr_cmpbool_return_wit_1 : qcp_qlr_cmpbool_return_wit_1.
Axiom proof_of_qcp_qlr_cmpbool_return_wit_2 : qcp_qlr_cmpbool_return_wit_2.
Axiom proof_of_qcp_qlr_choose_neon_safety_wit_1 : qcp_qlr_choose_neon_safety_wit_1.
Axiom proof_of_qcp_qlr_choose_neon_return_wit_1 : qcp_qlr_choose_neon_return_wit_1.
Axiom proof_of_qcp_qlr_choose_neon_return_wit_2 : qcp_qlr_choose_neon_return_wit_2.
Axiom proof_of_qcp_qlr_choose_rvv_safety_wit_1 : qcp_qlr_choose_rvv_safety_wit_1.
Axiom proof_of_qcp_qlr_choose_rvv_return_wit_1 : qcp_qlr_choose_rvv_return_wit_1.
Axiom proof_of_qcp_qlr_choose_rvv_return_wit_2 : qcp_qlr_choose_rvv_return_wit_2.

End VC_Correct.
