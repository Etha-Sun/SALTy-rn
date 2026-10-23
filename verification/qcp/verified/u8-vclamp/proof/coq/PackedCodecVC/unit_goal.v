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
Require Import FullU8.Packed32Model.
Local Open Scope sac.

(*----- Function qcp_pack4 -----*)

Definition qcp_pack4_return_wit_1 := 
(
forall (d_pre: Z) (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) (PreH5 : (0 <= c_pre)) (PreH6 : (c_pre <= 255)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 255)) ,
  TT && emp 
|--
  “ ((((a_pre + (256 * b_pre ) ) + (65536 * c_pre ) ) + (16777216 * d_pre ) ) = (pack4 (a_pre) (b_pre) (c_pre) (d_pre))) ” 
  &&  “ (0 <= (((a_pre + (256 * b_pre ) ) + (65536 * c_pre ) ) + (16777216 * d_pre ) )) ” 
  &&  “ ((((a_pre + (256 * b_pre ) ) + (65536 * c_pre ) ) + (16777216 * d_pre ) ) <= UINT_MAX) ”
  &&  emp
) \/
(
forall (d_pre: Z) (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) (PreH5 : (0 <= c_pre)) (PreH6 : (c_pre <= 255)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 255)) ,
  TT && emp 
|--
  “ ((((a_pre + (256 * b_pre ) ) + (65536 * c_pre ) ) + (16777216 * d_pre ) ) = (pack4 (a_pre) (b_pre) (c_pre) (d_pre))) ”
  &&  emp
).

Definition qcp_pack4_return_wit_1_split_goal_1 := 
forall (d_pre: Z) (c_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 255)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) (PreH5 : (0 <= c_pre)) (PreH6 : (c_pre <= 255)) (PreH7 : (0 <= d_pre)) (PreH8 : (d_pre <= 255)) ,
  ((((a_pre + (256 * b_pre ) ) + (65536 * c_pre ) ) + (16777216 * d_pre ) ) = (pack4 (a_pre) (b_pre) (c_pre) (d_pre)))
.

(*----- Function qcp_word_byte -----*)

Definition qcp_word_byte_safety_wit_1 := 
forall (lane_pre: Z) (w_pre: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) ,
  ((( &( "w" ) )) # UInt  |-> w_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
|--
  “ ((8 * lane_pre ) <= 31) ” 
  &&  “ (0 <= (8 * lane_pre )) ”
.

Definition qcp_word_byte_return_wit_1 := 
(
forall (lane_pre: Z) (w_pre: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8)) = (word_byte (w_pre) (lane_pre))) ” 
  &&  “ (0 <= (unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8))) ” 
  &&  “ ((unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8)) <= 255) ”
  &&  emp
) \/
(
forall (lane_pre: Z) (w_pre: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8)) <= 255) ” 
  &&  “ (0 <= (unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8))) ” 
  &&  “ ((unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8)) = (word_byte (w_pre) (lane_pre))) ”
  &&  emp
).

Definition qcp_word_byte_return_wit_1_split_goal_1 := 
forall (lane_pre: Z) (w_pre: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) ,
  ((unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8)) <= 255)
.

Definition qcp_word_byte_return_wit_1_split_goal_2 := 
forall (lane_pre: Z) (w_pre: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) ,
  (0 <= (unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8)))
.

Definition qcp_word_byte_return_wit_1_split_goal_3 := 
forall (lane_pre: Z) (w_pre: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) ,
  ((unsigned_last_nbits ((Z.shiftr w_pre (8 * lane_pre ))) (8)) = (word_byte (w_pre) (lane_pre)))
.

Module Type VC_Correct.


Axiom proof_of_qcp_pack4_return_wit_1 : qcp_pack4_return_wit_1.
Axiom proof_of_qcp_word_byte_safety_wit_1 : qcp_word_byte_safety_wit_1.
Axiom proof_of_qcp_word_byte_return_wit_1 : qcp_word_byte_return_wit_1.

End VC_Correct.
