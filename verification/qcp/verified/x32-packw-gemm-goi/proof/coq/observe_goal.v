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
Require Import X32Packw.ScalarMemory.
Require Import X32Packw.ObservationModel.
Local Open Scope sac.

(*----- Function pw_read_output -----*)

Definition pw_read_output_entail_wit_1 := 
(
forall (p_pre: Z) (x: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (p_pre > 0)) (PreH2 : (NoDup W )) (PreH3 : (In p_pre W )) (PreH4 : (pw_exact O p_pre x )) ,
  (pw_output W O )
|--
  “ (p_pre > 0) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (In p_pre W ) ” 
  &&  “ (pw_exact O p_pre x ) ”
  &&  ((p_pre) # UInt  |-> x)
  **  (pw_output_rest W O p_pre )
) \/
(
forall (p_pre: Z) (x: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (p_pre > 0)) (PreH2 : (NoDup W )) (PreH3 : (In p_pre W )) (PreH4 : (pw_exact O p_pre x )) ,
  (pw_output W O )
|--
  ((p_pre) # UInt  |-> x)
  **  (pw_output_rest W O p_pre )
).

Definition pw_read_output_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (p_pre > 0)) (PreH2 : (NoDup W )) (PreH3 : (In p_pre W )) (PreH4 : (pw_exact O p_pre x )) ,
  (pw_output W O )
|--
  ((p_pre) # UInt  |-> x)
  **  (pw_output_rest W O p_pre )
.

Definition pw_read_output_return_wit_1 := 
(
forall (p_pre: Z) (x: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (p_pre > 0)) (PreH2 : (NoDup W )) (PreH3 : (In p_pre W )) (PreH4 : (pw_exact O p_pre x )) ,
  ((p_pre) # UInt  |-> x)
  **  (pw_output_rest W O p_pre )
|--
  “ (x = x) ”
  &&  (pw_output W O )
) \/
(
forall (p_pre: Z) (x: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (x <= UINT_MAX)) (PreH2 : (x >= 0)) (PreH3 : (p_pre > 0)) (PreH4 : (NoDup W )) (PreH5 : (In p_pre W )) (PreH6 : (pw_exact O p_pre x )) ,
  ((p_pre) # UInt  |-> x)
  **  (pw_output_rest W O p_pre )
|--
  (pw_output W O )
).

Definition pw_read_output_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (x <= UINT_MAX)) (PreH2 : (x >= 0)) (PreH3 : (p_pre > 0)) (PreH4 : (NoDup W )) (PreH5 : (In p_pre W )) (PreH6 : (pw_exact O p_pre x )) ,
  ((p_pre) # UInt  |-> x)
  **  (pw_output_rest W O p_pre )
|--
  (pw_output W O )
.

Module Type VC_Correct.


Axiom proof_of_pw_read_output_entail_wit_1 : pw_read_output_entail_wit_1.
Axiom proof_of_pw_read_output_return_wit_1 : pw_read_output_return_wit_1.

End VC_Correct.
