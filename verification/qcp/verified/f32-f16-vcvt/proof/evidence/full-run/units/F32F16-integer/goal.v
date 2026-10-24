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
Require Import F32F16.IntegerModel.
Local Open Scope sac.

(*----- Function qcp_f16_narrow16 -----*)

Definition qcp_f16_narrow16_return_wit_1 := 
(
forall (x_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) = (f16_narrow16 (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) = (f16_narrow16 (x_pre))) ”
  &&  emp
).

Definition qcp_f16_narrow16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) ,
  ((unsigned_last_nbits (x_pre) (16)) = (f16_narrow16 (x_pre)))
.

(*----- Function qcp_f16_add32 -----*)

Definition qcp_f16_add32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((a_pre + b_pre )) (32)) = (f16_add32 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((a_pre + b_pre )) (32)) = (f16_add32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_add32_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) ,
  ((unsigned_last_nbits ((a_pre + b_pre )) (32)) = (f16_add32 (a_pre) (b_pre)))
.

(*----- Function qcp_f16_and32 -----*)

Definition qcp_f16_and32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) ,
  TT && emp 
|--
  “ ((Z.land a_pre b_pre) = (f16_and32 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) ,
  TT && emp 
|--
  “ ((Z.land a_pre b_pre) = (f16_and32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_and32_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) ,
  ((Z.land a_pre b_pre) = (f16_and32 (a_pre) (b_pre)))
.

(*----- Function qcp_f16_or32 -----*)

Definition qcp_f16_or32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) ,
  TT && emp 
|--
  “ ((Z.lor a_pre b_pre) = (f16_or32 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) ,
  TT && emp 
|--
  “ ((Z.lor a_pre b_pre) = (f16_or32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_or32_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) ,
  ((Z.lor a_pre b_pre) = (f16_or32 (a_pre) (b_pre)))
.

(*----- Function qcp_f16_max32 -----*)

Definition qcp_f16_max32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) ,
  TT && emp 
|--
  “ (a_pre = (f16_max32 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) ,
  TT && emp 
|--
  “ (a_pre = (f16_max32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_max32_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) ,
  (a_pre = (f16_max32 (a_pre) (b_pre)))
.

Definition qcp_f16_max32_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) ,
  TT && emp 
|--
  “ (b_pre = (f16_max32 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) ,
  TT && emp 
|--
  “ (b_pre = (f16_max32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_max32_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) ,
  (b_pre = (f16_max32 (a_pre) (b_pre)))
.

(*----- Function qcp_f16_gt32 -----*)

Definition qcp_f16_gt32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  TT && emp 
|--
  “ (0 = (f16_gt32 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  TT && emp 
|--
  “ (0 = (f16_gt32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt32_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) ,
  (0 = (f16_gt32 (a_pre) (b_pre)))
.

Definition qcp_f16_gt32_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  TT && emp 
|--
  “ (UINT_MAX = (f16_gt32 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  TT && emp 
|--
  “ (UINT_MAX = (f16_gt32 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_gt32_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) ,
  (UINT_MAX = (f16_gt32 (a_pre) (b_pre)))
.

(*----- Function qcp_f16_add16 -----*)

Definition qcp_f16_add16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((unsigned_last_nbits ((a_pre + b_pre )) (32)))))) ,
  TT && emp 
|--
  “ (retval = (f16_add16 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((unsigned_last_nbits ((a_pre + b_pre )) (32)))))) ,
  TT && emp 
|--
  “ (retval = (f16_add16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_add16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((unsigned_last_nbits ((a_pre + b_pre )) (32)))))) ,
  (retval = (f16_add16 (a_pre) (b_pre)))
.

Definition qcp_f16_add16_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_f16_and16 -----*)

Definition qcp_f16_and16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.land a_pre b_pre))))) ,
  TT && emp 
|--
  “ (retval = (f16_and16 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.land a_pre b_pre))))) ,
  TT && emp 
|--
  “ (retval = (f16_and16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_and16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.land a_pre b_pre))))) ,
  (retval = (f16_and16 (a_pre) (b_pre)))
.

Definition qcp_f16_and16_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_f16_or16 -----*)

Definition qcp_f16_or16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.lor a_pre b_pre))))) ,
  TT && emp 
|--
  “ (retval = (f16_or16 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.lor a_pre b_pre))))) ,
  TT && emp 
|--
  “ (retval = (f16_or16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_or16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.lor a_pre b_pre))))) ,
  (retval = (f16_or16 (a_pre) (b_pre)))
.

Definition qcp_f16_or16_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_f16_select16 -----*)

Definition qcp_f16_select16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.lor (Z.land m_pre a_pre) (Z.land (Z.lxor m_pre 65535) b_pre)))))) ,
  TT && emp 
|--
  “ (retval = (f16_select16 (m_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.lor (Z.land m_pre a_pre) (Z.land (Z.lxor m_pre 65535) b_pre)))))) ,
  TT && emp 
|--
  “ (retval = (f16_select16 (m_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_select16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (m_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.lor (Z.land m_pre a_pre) (Z.land (Z.lxor m_pre 65535) b_pre)))))) ,
  (retval = (f16_select16 (m_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_select16_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_f16_shrn13 -----*)

Definition qcp_f16_shrn13_safety_wit_1 := 
forall (a_pre: Z) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
|--
  “ (13 <= 31) ” 
  &&  “ (0 <= 13) ”
.

Definition qcp_f16_shrn13_safety_wit_2 := 
forall (a_pre: Z) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_f16_shrn13_return_wit_1 := 
(
forall (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.shiftr a_pre 13))))) ,
  TT && emp 
|--
  “ (retval = (f16_shrn13 (a_pre))) ”
  &&  emp
) \/
(
forall (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.shiftr a_pre 13))))) ,
  TT && emp 
|--
  “ (retval = (f16_shrn13 (a_pre))) ”
  &&  emp
).

Definition qcp_f16_shrn13_return_wit_1_split_goal_1 := 
forall (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.shiftr a_pre 13))))) ,
  (retval = (f16_shrn13 (a_pre)))
.

Definition qcp_f16_shrn13_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function qcp_f16_shrn16 -----*)

Definition qcp_f16_shrn16_safety_wit_1 := 
forall (a_pre: Z) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
|--
  “ (16 <= 31) ” 
  &&  “ (0 <= 16) ”
.

Definition qcp_f16_shrn16_safety_wit_2 := 
forall (a_pre: Z) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition qcp_f16_shrn16_return_wit_1 := 
(
forall (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.shiftr a_pre 16))))) ,
  TT && emp 
|--
  “ (retval = (f16_shrn16 (a_pre))) ”
  &&  emp
) \/
(
forall (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.shiftr a_pre 16))))) ,
  TT && emp 
|--
  “ (retval = (f16_shrn16 (a_pre))) ”
  &&  emp
).

Definition qcp_f16_shrn16_return_wit_1_split_goal_1 := 
forall (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 ((Z.shiftr a_pre 16))))) ,
  (retval = (f16_shrn16 (a_pre)))
.

Definition qcp_f16_shrn16_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_qcp_f16_narrow16_return_wit_1 : qcp_f16_narrow16_return_wit_1.
Axiom proof_of_qcp_f16_add32_return_wit_1 : qcp_f16_add32_return_wit_1.
Axiom proof_of_qcp_f16_and32_return_wit_1 : qcp_f16_and32_return_wit_1.
Axiom proof_of_qcp_f16_or32_return_wit_1 : qcp_f16_or32_return_wit_1.
Axiom proof_of_qcp_f16_max32_return_wit_1 : qcp_f16_max32_return_wit_1.
Axiom proof_of_qcp_f16_max32_return_wit_2 : qcp_f16_max32_return_wit_2.
Axiom proof_of_qcp_f16_gt32_return_wit_1 : qcp_f16_gt32_return_wit_1.
Axiom proof_of_qcp_f16_gt32_return_wit_2 : qcp_f16_gt32_return_wit_2.
Axiom proof_of_qcp_f16_add16_return_wit_1 : qcp_f16_add16_return_wit_1.
Axiom proof_of_qcp_f16_add16_partial_solve_wit_1 : qcp_f16_add16_partial_solve_wit_1.
Axiom proof_of_qcp_f16_and16_return_wit_1 : qcp_f16_and16_return_wit_1.
Axiom proof_of_qcp_f16_and16_partial_solve_wit_1 : qcp_f16_and16_partial_solve_wit_1.
Axiom proof_of_qcp_f16_or16_return_wit_1 : qcp_f16_or16_return_wit_1.
Axiom proof_of_qcp_f16_or16_partial_solve_wit_1 : qcp_f16_or16_partial_solve_wit_1.
Axiom proof_of_qcp_f16_select16_return_wit_1 : qcp_f16_select16_return_wit_1.
Axiom proof_of_qcp_f16_select16_partial_solve_wit_1 : qcp_f16_select16_partial_solve_wit_1.
Axiom proof_of_qcp_f16_shrn13_safety_wit_1 : qcp_f16_shrn13_safety_wit_1.
Axiom proof_of_qcp_f16_shrn13_safety_wit_2 : qcp_f16_shrn13_safety_wit_2.
Axiom proof_of_qcp_f16_shrn13_return_wit_1 : qcp_f16_shrn13_return_wit_1.
Axiom proof_of_qcp_f16_shrn13_partial_solve_wit_1 : qcp_f16_shrn13_partial_solve_wit_1.
Axiom proof_of_qcp_f16_shrn16_safety_wit_1 : qcp_f16_shrn16_safety_wit_1.
Axiom proof_of_qcp_f16_shrn16_safety_wit_2 : qcp_f16_shrn16_safety_wit_2.
Axiom proof_of_qcp_f16_shrn16_return_wit_1 : qcp_f16_shrn16_return_wit_1.
Axiom proof_of_qcp_f16_shrn16_partial_solve_wit_1 : qcp_f16_shrn16_partial_solve_wit_1.

End VC_Correct.
