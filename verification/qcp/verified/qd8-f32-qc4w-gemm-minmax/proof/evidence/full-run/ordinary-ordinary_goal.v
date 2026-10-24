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
Require Import QC4W.NibbleModel.
Local Open Scope sac.

(*----- Function round_up_po2 -----*)

Definition round_up_po2_safety_wit_1 := 
forall (quantum_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre < UINT64_MAX)) (PreH3 : (quantum_pre = 2)) ,
  ((( &( "mask" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "quantum" ) )) # UInt64  |-> quantum_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition round_up_po2_return_wit_1 := 
(
forall (quantum_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre < UINT64_MAX)) (PreH3 : (quantum_pre = 2)) ,
  TT && emp 
|--
  “ ((Z.land (n_pre + (quantum_pre - 1 ) ) (Z.lnot (quantum_pre - 1 ))) = (rounded_depth (n_pre))) ”
  &&  emp
) \/
(
forall (quantum_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre < UINT64_MAX)) (PreH3 : (quantum_pre = 2)) ,
  TT && emp 
|--
  “ ((Z.land (n_pre + (2 - 1 ) ) (Z.lnot (2 - 1 ))) = (rounded_depth (n_pre))) ”
  &&  emp
).

Definition round_up_po2_return_wit_1_split_goal_1 := 
forall (quantum_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre < UINT64_MAX)) (PreH3 : (quantum_pre = 2)) ,
  ((Z.land (n_pre + (2 - 1 ) ) (Z.lnot (2 - 1 ))) = (rounded_depth (n_pre)))
.

(*----- Function qcp_assert -----*)

Definition qcp_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_round_up_po2_safety_wit_1 : round_up_po2_safety_wit_1.
Axiom proof_of_round_up_po2_return_wit_1 : round_up_po2_return_wit_1.
Axiom proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.

End VC_Correct.
