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
Require Import S8Clamp.Types.
Local Open Scope sac.

(*----- Function qcp_s8_min -----*)

Definition qcp_s8_min_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (b_pre = (s8_min (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (b_pre = (s8_min (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_s8_min_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre >= b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  (b_pre = (s8_min (a_pre) (b_pre)))
.

Definition qcp_s8_min_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (a_pre = (s8_min (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (a_pre = (s8_min (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_s8_min_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre < b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  (a_pre = (s8_min (a_pre) (b_pre)))
.

(*----- Function qcp_s8_max -----*)

Definition qcp_s8_max_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (b_pre = (s8_max (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (b_pre = (s8_max (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_s8_max_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre <= b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  (b_pre = (s8_max (a_pre) (b_pre)))
.

Definition qcp_s8_max_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (a_pre = (s8_max (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (a_pre = (s8_max (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_s8_max_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (a_pre > b_pre)) (PreH2 : ((-128) <= a_pre)) (PreH3 : (a_pre <= 127)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) ,
  (a_pre = (s8_max (a_pre) (b_pre)))
.

(*----- Function qcp_s8_narrow -----*)

Definition qcp_s8_narrow_return_wit_1 := 
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (8)) = (s8_narrow (x_pre))) ”
  &&  emp
) \/
(
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  TT && emp 
|--
  “ ((signed_last_nbits (x_pre) (8)) = (s8_narrow (x_pre))) ”
  &&  emp
).

Definition qcp_s8_narrow_return_wit_1_split_goal_1 := 
forall (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) ,
  ((signed_last_nbits (x_pre) (8)) = (s8_narrow (x_pre)))
.

(*----- Function __riscv_vsetvl_e8m8 -----*)

Definition __riscv_vsetvl_e8m8_safety_wit_1 := 
forall (n_pre: Z) (PreH1 : (0 <= n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition __riscv_vsetvl_e8m8_safety_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 128)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition __riscv_vsetvl_e8m8_return_wit_1 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 128)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (128 <= n_pre) ” 
  &&  “ (128 = 128) ”
  &&  emp
.

Definition __riscv_vsetvl_e8m8_return_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre < 128)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (n_pre < 128) ” 
  &&  “ (n_pre = n_pre) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_qcp_s8_min_return_wit_1 : qcp_s8_min_return_wit_1.
Axiom proof_of_qcp_s8_min_return_wit_2 : qcp_s8_min_return_wit_2.
Axiom proof_of_qcp_s8_max_return_wit_1 : qcp_s8_max_return_wit_1.
Axiom proof_of_qcp_s8_max_return_wit_2 : qcp_s8_max_return_wit_2.
Axiom proof_of_qcp_s8_narrow_return_wit_1 : qcp_s8_narrow_return_wit_1.
Axiom proof_of___riscv_vsetvl_e8m8_safety_wit_1 : __riscv_vsetvl_e8m8_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e8m8_safety_wit_2 : __riscv_vsetvl_e8m8_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e8m8_return_wit_1 : __riscv_vsetvl_e8m8_return_wit_1.
Axiom proof_of___riscv_vsetvl_e8m8_return_wit_2 : __riscv_vsetvl_e8m8_return_wit_2.

End VC_Correct.
