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
Local Open Scope sac.

(*----- Function pw_read_word -----*)

Definition pw_read_word_entail_wit_1 := 
(
forall (p_pre: Z) (F: PWMap) (PreH1 : (p_pre > 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_present F p_pre )) ,
  (pw_data F )
|--
  “ (p_pre > 0) ” 
  &&  “ (pw_map_nodup F ) ” 
  &&  “ (pw_present F p_pre ) ”
  &&  ((p_pre) # UInt  |-> (pw_get (F) (p_pre)))
  **  (pw_data_rest F p_pre )
) \/
(
forall (p_pre: Z) (F: PWMap) (PreH1 : (p_pre > 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_present F p_pre )) ,
  (pw_data F )
|--
  ((p_pre) # UInt  |-> (pw_get (F) (p_pre)))
  **  (pw_data_rest F p_pre )
).

Definition pw_read_word_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (F: PWMap) (PreH1 : (p_pre > 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_present F p_pre )) ,
  (pw_data F )
|--
  ((p_pre) # UInt  |-> (pw_get (F) (p_pre)))
  **  (pw_data_rest F p_pre )
.

Definition pw_read_word_entail_wit_2 := 
(
forall (p_pre: Z) (F: PWMap) (PreH1 : (p_pre > 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_present F p_pre )) ,
  ((p_pre) # UInt  |-> (pw_get (F) (p_pre)))
  **  (pw_data_rest F p_pre )
|--
  “ (p_pre > 0) ” 
  &&  “ (pw_map_nodup F ) ” 
  &&  “ (pw_present F p_pre ) ” 
  &&  “ ((pw_get (F) (p_pre)) = (pw_get (F) (p_pre))) ” 
  &&  “ (0 <= (pw_get (F) (p_pre))) ” 
  &&  “ ((pw_get (F) (p_pre)) <= UINT_MAX) ”
  &&  (pw_data F )
) \/
(
forall (p_pre: Z) (F: PWMap) (PreH1 : ((pw_get (F) (p_pre)) <= UINT_MAX)) (PreH2 : ((pw_get (F) (p_pre)) >= 0)) (PreH3 : (p_pre > 0)) (PreH4 : (pw_map_nodup F )) (PreH5 : (pw_present F p_pre )) ,
  ((p_pre) # UInt  |-> (pw_get (F) (p_pre)))
  **  (pw_data_rest F p_pre )
|--
  (pw_data F )
).

Definition pw_read_word_entail_wit_2_split_goal_spatial := 
forall (p_pre: Z) (F: PWMap) (PreH1 : ((pw_get (F) (p_pre)) <= UINT_MAX)) (PreH2 : ((pw_get (F) (p_pre)) >= 0)) (PreH3 : (p_pre > 0)) (PreH4 : (pw_map_nodup F )) (PreH5 : (pw_present F p_pre )) ,
  ((p_pre) # UInt  |-> (pw_get (F) (p_pre)))
  **  (pw_data_rest F p_pre )
|--
  (pw_data F )
.

Definition pw_read_word_return_wit_1 := 
forall (p_pre: Z) (F: PWMap) (x: Z) (PreH1 : (p_pre > 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_present F p_pre )) (PreH4 : (x = (pw_get (F) (p_pre)))) (PreH5 : (0 <= x)) (PreH6 : (x <= UINT_MAX)) ,
  (pw_data F )
|--
  “ (x = (pw_get (F) (p_pre))) ” 
  &&  “ (0 <= x) ” 
  &&  “ (x <= UINT_MAX) ”
  &&  (pw_data F )
.

(*----- Function pw_write_word -----*)

Definition pw_write_word_entail_wit_1 := 
(
forall (p_pre: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (p_pre > 0)) (PreH2 : (NoDup W )) (PreH3 : (In p_pre W )) ,
  (pw_output W O )
|--
  “ (p_pre > 0) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (In p_pre W ) ”
  &&  ((p_pre) # UInt  |->_)
  **  (pw_output_rest W O p_pre )
) \/
(
forall (p_pre: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (p_pre > 0)) (PreH2 : (NoDup W )) (PreH3 : (In p_pre W )) ,
  (pw_output W O )
|--
  EX (x: Z) ,
  “ (p_pre > 0) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (In p_pre W ) ”
  &&  ((p_pre) # UInt  |-> x)
  **  (pw_output_rest W O p_pre )
).

Definition pw_write_word_return_wit_1 := 
(
forall (x_pre: Z) (p_pre: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (p_pre > 0)) (PreH2 : (NoDup W )) (PreH3 : (In p_pre W )) ,
  ((p_pre) # UInt  |-> x_pre)
  **  (pw_output_rest W O p_pre )
|--
  (pw_output W (pw_output_put (O) (p_pre) (x_pre)) )
) \/
(
forall (x_pre: Z) (p_pre: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (x_pre <= UINT_MAX)) (PreH2 : (x_pre >= 0)) (PreH3 : (p_pre > 0)) (PreH4 : (NoDup W )) (PreH5 : (In p_pre W )) ,
  ((p_pre) # UInt  |-> x_pre)
  **  (pw_output_rest W O p_pre )
|--
  (pw_output W (pw_output_put (O) (p_pre) (x_pre)) )
).

Definition pw_write_word_return_wit_1_split_goal_spatial := 
forall (x_pre: Z) (p_pre: Z) (O: PWOutput) (W: (@list Z)) (PreH1 : (x_pre <= UINT_MAX)) (PreH2 : (x_pre >= 0)) (PreH3 : (p_pre > 0)) (PreH4 : (NoDup W )) (PreH5 : (In p_pre W )) ,
  ((p_pre) # UInt  |-> x_pre)
  **  (pw_output_rest W O p_pre )
|--
  (pw_output W (pw_output_put (O) (p_pre) (x_pre)) )
.

Module Type VC_Correct.


Axiom proof_of_pw_read_word_entail_wit_1 : pw_read_word_entail_wit_1.
Axiom proof_of_pw_read_word_entail_wit_2 : pw_read_word_entail_wit_2.
Axiom proof_of_pw_read_word_return_wit_1 : pw_read_word_return_wit_1.
Axiom proof_of_pw_write_word_entail_wit_1 : pw_write_word_entail_wit_1.
Axiom proof_of_pw_write_word_return_wit_1 : pw_write_word_return_wit_1.

End VC_Correct.
