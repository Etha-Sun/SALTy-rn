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
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Local Open Scope sac.

(*----- Function qm_ext_self -----*)

Definition qm_ext_self_safety_wit_1 := 
forall (k_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "k" ) )) # Int  |-> k_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qm_ext_self_return_wit_1 := 
(
forall (k_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (0)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (1)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (2)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (3)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (4)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (5)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (6)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (7)))
) \/
(
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  TT && emp 
|--
  “ (x3 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (7))) ” 
  &&  “ (x2 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (6))) ” 
  &&  “ (x1 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (5))) ” 
  &&  “ (x0 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (4))) ” 
  &&  “ (x7 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (3))) ” 
  &&  “ (x6 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (2))) ” 
  &&  “ (x5 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (1))) ” 
  &&  “ (x4 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (0))) ”
  &&  emp
).

Definition qm_ext_self_return_wit_1_split_goal_1 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x3 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (7)))
.

Definition qm_ext_self_return_wit_1_split_goal_2 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x2 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (6)))
.

Definition qm_ext_self_return_wit_1_split_goal_3 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x1 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (5)))
.

Definition qm_ext_self_return_wit_1_split_goal_4 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x0 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (4)))
.

Definition qm_ext_self_return_wit_1_split_goal_5 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x7 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (3)))
.

Definition qm_ext_self_return_wit_1_split_goal_6 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x6 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (2)))
.

Definition qm_ext_self_return_wit_1_split_goal_7 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x5 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (1)))
.

Definition qm_ext_self_return_wit_1_split_goal_8 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x4 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (4) (0)))
.

Definition qm_ext_self_return_wit_2 := 
(
forall (k_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (0)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (1)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (2)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (3)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (4)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (5)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (6)))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (7)))
) \/
(
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  TT && emp 
|--
  “ (x1 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (7))) ” 
  &&  “ (x0 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (6))) ” 
  &&  “ (x7 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (5))) ” 
  &&  “ (x6 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (4))) ” 
  &&  “ (x5 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (3))) ” 
  &&  “ (x4 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (2))) ” 
  &&  “ (x3 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (1))) ” 
  &&  “ (x2 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (0))) ”
  &&  emp
).

Definition qm_ext_self_return_wit_2_split_goal_1 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x1 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (7)))
.

Definition qm_ext_self_return_wit_2_split_goal_2 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x0 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (6)))
.

Definition qm_ext_self_return_wit_2_split_goal_3 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x7 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (5)))
.

Definition qm_ext_self_return_wit_2_split_goal_4 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x6 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (4)))
.

Definition qm_ext_self_return_wit_2_split_goal_5 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x5 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (3)))
.

Definition qm_ext_self_return_wit_2_split_goal_6 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x4 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (2)))
.

Definition qm_ext_self_return_wit_2_split_goal_7 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x3 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (1)))
.

Definition qm_ext_self_return_wit_2_split_goal_8 := 
forall (k_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (x2 = (qm_ext8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (k_pre) (0)))
.

Definition qm_ext_self_partial_solve_wit_1 := 
forall (k_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (k_pre = 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (UndefStructPredint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (k_pre = 4) ” 
  &&  “ (((k_pre - 2 ) * (k_pre - 4 ) ) = 0) ”
  &&  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Definition qm_ext_self_partial_solve_wit_2 := 
forall (k_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (k_pre <> 4)) (PreH2 : (((k_pre - 2 ) * (k_pre - 4 ) ) = 0)) ,
  (UndefStructPredint8x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (k_pre <> 4) ” 
  &&  “ (((k_pre - 2 ) * (k_pre - 4 ) ) = 0) ”
  &&  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Module Type VC_Correct.


Axiom proof_of_qm_ext_self_safety_wit_1 : qm_ext_self_safety_wit_1.
Axiom proof_of_qm_ext_self_return_wit_1 : qm_ext_self_return_wit_1.
Axiom proof_of_qm_ext_self_return_wit_2 : qm_ext_self_return_wit_2.
Axiom proof_of_qm_ext_self_partial_solve_wit_1 : qm_ext_self_partial_solve_wit_1.
Axiom proof_of_qm_ext_self_partial_solve_wit_2 : qm_ext_self_partial_solve_wit_2.

End VC_Correct.
