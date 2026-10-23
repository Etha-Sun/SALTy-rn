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
Require Import Qu8Cvt.UnsignedModel.
Local Open Scope sac.

(*----- Function qcp_cvt_u16 -----*)

Definition qcp_cvt_u16_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) = (cvt_u16 (x_pre))) ” 
  &&  “ (0 <= (unsigned_last_nbits (x_pre) (16))) ” 
  &&  “ ((unsigned_last_nbits (x_pre) (16)) <= 65535) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (x_pre) (16)) <= 65535) ” 
  &&  “ (0 <= (unsigned_last_nbits (x_pre) (16))) ” 
  &&  “ ((unsigned_last_nbits (x_pre) (16)) = (cvt_u16 (x_pre))) ”
  &&  emp
).

Definition qcp_cvt_u16_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((unsigned_last_nbits (x_pre) (16)) <= 65535)
.

Definition qcp_cvt_u16_return_wit_1_split_goal_2 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  (0 <= (unsigned_last_nbits (x_pre) (16)))
.

Definition qcp_cvt_u16_return_wit_1_split_goal_3 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((unsigned_last_nbits (x_pre) (16)) = (cvt_u16 (x_pre)))
.

(*----- Function qcp_cvt_add_u16 -----*)

Definition qcp_cvt_add_u16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 65535)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre + b_pre )) ”
.

Definition qcp_cvt_add_u16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_u16 ((a_pre + b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 65535)) ,
  TT && emp 
|--
  “ (retval = (cvt_add_u16 (a_pre) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_u16 ((a_pre + b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 65535)) ,
  TT && emp 
|--
  “ (retval = (cvt_add_u16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_cvt_add_u16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_u16 ((a_pre + b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 65535)) ,
  (retval = (cvt_add_u16 (a_pre) (b_pre)))
.

Definition qcp_cvt_add_u16_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 65535)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ”
.

Definition qcp_cvt_add_u16_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 65535)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 65535) ”
  &&  emp
.

Definition qcp_cvt_add_u16_partial_solve_wit_1 := qcp_cvt_add_u16_partial_solve_wit_1_pure -> qcp_cvt_add_u16_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_as_s16 -----*)

Definition qcp_cvt_as_s16_return_wit_1 := 
forall (x_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_s16 (x_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= x_pre)) (PreH5 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ (retval = (cvt_s16 (x_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
.

Definition qcp_cvt_as_s16_partial_solve_wit_1_pure := 
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 65535)) ,
  ((( &( "x" ) )) # UShort  |-> x_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ”
.

Definition qcp_cvt_as_s16_partial_solve_wit_1_aux := 
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 65535)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 65535) ”
  &&  emp
.

Definition qcp_cvt_as_s16_partial_solve_wit_1 := qcp_cvt_as_s16_partial_solve_wit_1_pure -> qcp_cvt_as_s16_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_as_u16 -----*)

Definition qcp_cvt_as_u16_return_wit_1 := 
forall (x_pre: Z) (retval: Z) (PreH1 : (retval = (cvt_u16 (x_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : ((-32768) <= x_pre)) (PreH5 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ (retval = (cvt_u16 (x_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
.

Definition qcp_cvt_as_u16_partial_solve_wit_1_pure := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ”
.

Definition qcp_cvt_as_u16_partial_solve_wit_1_aux := 
forall (x_pre: Z) (PreH1 : ((-32768) <= x_pre)) (PreH2 : (x_pre <= 32767)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  emp
.

Definition qcp_cvt_as_u16_partial_solve_wit_1 := qcp_cvt_as_u16_partial_solve_wit_1_pure -> qcp_cvt_as_u16_partial_solve_wit_1_aux.

(*----- Function qcp_cvt_seed_u16 -----*)

Definition qcp_cvt_seed_u16_return_wit_1 := 
(
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) = (cvt_seed_u16 (z_pre))) ” 
  &&  “ (0 <= (unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16))) ” 
  &&  “ ((unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) <= 65535) ”
  &&  emp
) \/
(
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) <= 65535) ” 
  &&  “ (0 <= (unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16))) ” 
  &&  “ ((unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) = (cvt_seed_u16 (z_pre))) ”
  &&  emp
).

Definition qcp_cvt_seed_u16_return_wit_1_split_goal_1 := 
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  ((unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) <= 65535)
.

Definition qcp_cvt_seed_u16_return_wit_1_split_goal_2 := 
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  (0 <= (unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)))
.

Definition qcp_cvt_seed_u16_return_wit_1_split_goal_3 := 
forall (z_pre: Z) (PreH1 : ((INT_MIN) <= z_pre)) (PreH2 : (z_pre <= INT_MAX)) ,
  ((unsigned_last_nbits ((0 - (unsigned_last_nbits (z_pre) (32)) )) (16)) = (cvt_seed_u16 (z_pre)))
.

(*----- Function qcp_cvt_zext_u8 -----*)

Definition qcp_cvt_zext_u8_return_wit_1 := 
forall (x_pre: Z) (PreH1 : (0 <= x_pre)) (PreH2 : (x_pre <= 255)) ,
  TT && emp 
|--
  “ (x_pre = x_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 65535) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_qcp_cvt_u16_return_wit_1 : qcp_cvt_u16_return_wit_1.
Axiom proof_of_qcp_cvt_add_u16_safety_wit_1 : qcp_cvt_add_u16_safety_wit_1.
Axiom proof_of_qcp_cvt_add_u16_return_wit_1 : qcp_cvt_add_u16_return_wit_1.
Axiom proof_of_qcp_cvt_add_u16_partial_solve_wit_1_pure : qcp_cvt_add_u16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_add_u16_partial_solve_wit_1 : qcp_cvt_add_u16_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_as_s16_return_wit_1 : qcp_cvt_as_s16_return_wit_1.
Axiom proof_of_qcp_cvt_as_s16_partial_solve_wit_1_pure : qcp_cvt_as_s16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_as_s16_partial_solve_wit_1 : qcp_cvt_as_s16_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_as_u16_return_wit_1 : qcp_cvt_as_u16_return_wit_1.
Axiom proof_of_qcp_cvt_as_u16_partial_solve_wit_1_pure : qcp_cvt_as_u16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_as_u16_partial_solve_wit_1 : qcp_cvt_as_u16_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_seed_u16_return_wit_1 : qcp_cvt_seed_u16_return_wit_1.
Axiom proof_of_qcp_cvt_zext_u8_return_wit_1 : qcp_cvt_zext_u8_return_wit_1.

End VC_Correct.
