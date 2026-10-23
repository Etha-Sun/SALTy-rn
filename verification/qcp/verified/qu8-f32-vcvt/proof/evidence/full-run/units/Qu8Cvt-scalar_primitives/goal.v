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
Local Open Scope sac.

(*----- Function qcp_cvt_narrow16 -----*)

Definition qcp_cvt_narrow16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (16)) = (cvt_s16 (x_pre))) ” 
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
  &&  “ ((signed_last_nbits (x_pre) (16)) = (cvt_s16 (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_narrow16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) <= 32767)
.

Definition qcp_cvt_narrow16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((-32768) <= (signed_last_nbits (x_pre) (16)))
.

Definition qcp_cvt_narrow16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (16)) = (cvt_s16 (x_pre)))
.

(*----- Function qcp_cvt_seed -----*)

Definition qcp_cvt_seed_return_wit_1 := 
(
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) = (cvt_seed (z_pre))) ” 
  &&  “ ((-32768) <= (signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16))) ” 
  &&  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) <= 32767) ”
  &&  emp
) \/
(
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) <= 32767) ” 
  &&  “ ((-32768) <= (signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16))) ” 
  &&  “ ((signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) = (cvt_seed (z_pre))) ”
  &&  emp
).

Definition qcp_cvt_seed_return_wit_1_split_goal_1 := 
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  ((signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) <= 32767)
.

Definition qcp_cvt_seed_return_wit_1_split_goal_2 := 
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  ((-32768) <= (signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)))
.

Definition qcp_cvt_seed_return_wit_1_split_goal_3 := 
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  ((signed_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) = (cvt_seed (z_pre)))
.

(*----- Function qcp_cvt_addw -----*)

Definition qcp_cvt_addw_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre + b_pre )) ”
.

Definition qcp_cvt_addw_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (cvt_addw (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (cvt_addw (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_cvt_addw_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  (retval = (cvt_addw (a_pre) (b_pre)))
.

Definition qcp_cvt_addw_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ”
.

Definition qcp_cvt_addw_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
.

Definition qcp_cvt_addw_partial_solve_wit_1 := qcp_cvt_addw_partial_solve_wit_1_pure -> qcp_cvt_addw_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_sub16 -----*)

Definition qcp_cvt_sub16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((a_pre - b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre - b_pre )) ”
.

Definition qcp_cvt_sub16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 ((a_pre - b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (cvt_sub16 (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 ((a_pre - b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (cvt_sub16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_cvt_sub16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 ((a_pre - b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  (retval = (cvt_sub16 (a_pre) (b_pre)))
.

Definition qcp_cvt_sub16_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
|--
  “ ((INT_MIN) <= (a_pre - b_pre )) ” 
  &&  “ ((a_pre - b_pre ) <= INT_MAX) ”
.

Definition qcp_cvt_sub16_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (a_pre - b_pre )) ” 
  &&  “ ((a_pre - b_pre ) <= INT_MAX) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  emp
.

Definition qcp_cvt_sub16_partial_solve_wit_1 := qcp_cvt_sub16_partial_solve_wit_1_pure -> qcp_cvt_sub16_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_sext8 -----*)

Definition qcp_cvt_sext8_return_wit_1 := 
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 255)) ,
  TT && emp 
|--
  “ (x_pre = x_pre) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  emp
.

(*----- Function qcp_cvt_sext16 -----*)

Definition qcp_cvt_sext16_return_wit_1 := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (x_pre = x_pre) ”
  &&  emp
.

(*----- Function qcp_cvt_to_f32 -----*)

Definition qcp_cvt_to_f32_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (cvt_same (Z_to_fp32 (x_pre)) (Z_to_fp32 (x_pre)) ) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ (cvt_same (Z_to_fp32 (x_pre)) (Z_to_fp32 (x_pre)) ) ”
  &&  emp
).

Definition qcp_cvt_to_f32_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  (cvt_same (Z_to_fp32 (x_pre)) (Z_to_fp32 (x_pre)) )
.

(*----- Function qcp_cvt_mul -----*)

Definition qcp_cvt_mul_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (cvt_same (fp32_mul (a_pre) (b_pre)) (fp32_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (cvt_same (fp32_mul (a_pre) (b_pre)) (fp32_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_cvt_mul_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) ,
  (cvt_same (fp32_mul (a_pre) (b_pre)) (fp32_mul (a_pre) (b_pre)) )
.

Module Type VC_Correct.


Axiom proof_of_qcp_cvt_narrow16_return_wit_1 : qcp_cvt_narrow16_return_wit_1.
Axiom proof_of_qcp_cvt_seed_return_wit_1 : qcp_cvt_seed_return_wit_1.
Axiom proof_of_qcp_cvt_addw_safety_wit_1 : qcp_cvt_addw_safety_wit_1.
Axiom proof_of_qcp_cvt_addw_return_wit_1 : qcp_cvt_addw_return_wit_1.
Axiom proof_of_qcp_cvt_addw_partial_solve_wit_1_pure : qcp_cvt_addw_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_addw_partial_solve_wit_1 : qcp_cvt_addw_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_sub16_safety_wit_1 : qcp_cvt_sub16_safety_wit_1.
Axiom proof_of_qcp_cvt_sub16_return_wit_1 : qcp_cvt_sub16_return_wit_1.
Axiom proof_of_qcp_cvt_sub16_partial_solve_wit_1_pure : qcp_cvt_sub16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_sub16_partial_solve_wit_1 : qcp_cvt_sub16_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_sext8_return_wit_1 : qcp_cvt_sext8_return_wit_1.
Axiom proof_of_qcp_cvt_sext16_return_wit_1 : qcp_cvt_sext16_return_wit_1.
Axiom proof_of_qcp_cvt_to_f32_return_wit_1 : qcp_cvt_to_f32_return_wit_1.
Axiom proof_of_qcp_cvt_mul_return_wit_1 : qcp_cvt_mul_return_wit_1.

End VC_Correct.
