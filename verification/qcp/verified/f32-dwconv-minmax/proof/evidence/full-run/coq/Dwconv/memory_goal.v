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
Require Import Dwconv.MemoryInterface.
Local Open Scope sac.

(*----- Function dw_read_float -----*)

Definition dw_read_float_entail_wit_1 := 
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_present F p_pre )) ,
  (dw_data F )
|--
  “ (dw_present F p_pre ) ”
  &&  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
) \/
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_present F p_pre )) ,
  (dw_data F )
|--
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
).

Definition dw_read_float_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (F: DwROMap) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_present F p_pre )) ,
  (dw_data F )
|--
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
.

Definition dw_read_float_return_wit_1 := 
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
|--
  “ (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) ) ”
  &&  (dw_data F )
) \/
(
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
|--
  “ (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) ) ”
  &&  (dw_data F )
).

Definition dw_read_float_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
|--
  “ (dw_same (dw_get (F) (p_pre)) (dw_get (F) (p_pre)) ) ”
.

Definition dw_read_float_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (F: DwROMap) (PreH1 : (dw_present F p_pre )) ,
  ((p_pre) # Float  |-> (dw_get (F) (p_pre)))
  **  (dw_data (dw_pop (F) (p_pre)) )
|--
  (dw_data F )
.

(*----- Function dw_store_float -----*)

Definition dw_store_float_entail_wit_1 := 
(
forall (v_pre: fp32) (p_pre: Z) (O: DwOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_distinct W )) (PreH3 : (dw_owned W p_pre )) ,
  (dw_output W O )
|--
  “ (dw_same v_pre v_pre ) ” 
  &&  “ (dw_distinct W ) ” 
  &&  “ (dw_owned W p_pre ) ”
  &&  ((p_pre) # Float  |->_)
  **  (dw_output (dw_removed (W) (p_pre)) O )
) \/
(
forall (v_pre: fp32) (p_pre: Z) (O: DwOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (dw_distinct W )) (PreH3 : (dw_owned W p_pre )) ,
  (dw_output W O )
|--
  EX (x: fp32) ,
  “ (dw_same v_pre v_pre ) ” 
  &&  “ (dw_distinct W ) ” 
  &&  “ (dw_owned W p_pre ) ”
  &&  ((p_pre) # Float  |-> x)
  **  (dw_output (dw_removed (W) (p_pre)) O )
).

Definition dw_store_float_return_wit_1 := 
(
forall (v_pre: fp32) (p_pre: Z) (O: DwOutput) (W: (@list Z)) (v: fp32) (PreH1 : (dw_same v v_pre )) (PreH2 : (dw_distinct W )) (PreH3 : (dw_owned W p_pre )) ,
  ((p_pre) # Float  |-> v)
  **  (dw_output (dw_removed (W) (p_pre)) O )
|--
  (dw_output W (dw_output_put (O) (p_pre) (v_pre)) )
) \/
(
forall (v_pre: fp32) (p_pre: Z) (O: DwOutput) (W: (@list Z)) (v: fp32) (PreH1 : (dw_same v v_pre )) (PreH2 : (dw_distinct W )) (PreH3 : (dw_owned W p_pre )) ,
  ((p_pre) # Float  |-> v)
  **  (dw_output (dw_removed (W) (p_pre)) O )
|--
  (dw_output W (dw_output_put (O) (p_pre) (v_pre)) )
).

Definition dw_store_float_return_wit_1_split_goal_spatial := 
forall (v_pre: fp32) (p_pre: Z) (O: DwOutput) (W: (@list Z)) (v: fp32) (PreH1 : (dw_same v v_pre )) (PreH2 : (dw_distinct W )) (PreH3 : (dw_owned W p_pre )) ,
  ((p_pre) # Float  |-> v)
  **  (dw_output (dw_removed (W) (p_pre)) O )
|--
  (dw_output W (dw_output_put (O) (p_pre) (v_pre)) )
.

Module Type VC_Correct.


Axiom proof_of_dw_read_float_entail_wit_1 : dw_read_float_entail_wit_1.
Axiom proof_of_dw_read_float_return_wit_1 : dw_read_float_return_wit_1.
Axiom proof_of_dw_store_float_entail_wit_1 : dw_store_float_entail_wit_1.
Axiom proof_of_dw_store_float_return_wit_1 : dw_store_float_return_wit_1.

End VC_Correct.
