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
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.ReadPreviousModel.
Local Open Scope sac.

(*----- Function ap_read_previous_float -----*)

Definition ap_read_previous_float_entail_wit_1 := 
(
forall (p_pre: Z) (v: fp32) (O: APOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p_pre )) (PreH4 : (ap_float_initialized O p_pre v )) ,
  (ap_output W O )
|--
  “ (p_pre <> 0) ” 
  &&  “ (ap_distinct W ) ” 
  &&  “ (ap_owned W p_pre ) ” 
  &&  “ (ap_float_initialized O p_pre v ) ”
  &&  ((p_pre) # Float  |-> v)
  **  (ap_output (ap_removed (W) (p_pre)) O )
) \/
(
forall (p_pre: Z) (v: fp32) (O: APOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p_pre )) (PreH4 : (ap_float_initialized O p_pre v )) ,
  (ap_output W O )
|--
  ((p_pre) # Float  |-> v)
  **  (ap_output (ap_removed (W) (p_pre)) O )
).

Definition ap_read_previous_float_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (v: fp32) (O: APOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p_pre )) (PreH4 : (ap_float_initialized O p_pre v )) ,
  (ap_output W O )
|--
  ((p_pre) # Float  |-> v)
  **  (ap_output (ap_removed (W) (p_pre)) O )
.

Definition ap_read_previous_float_return_wit_1 := 
(
forall (v: fp32) (O: APOutput) (W: (@list Z)) (p: Z) (PreH1 : (p <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p )) (PreH4 : (ap_float_initialized O p v )) ,
  ((p) # Float  |-> v)
  **  (ap_output (ap_removed (W) (p)) O )
|--
  “ (ap_same_bits v v ) ”
  &&  (ap_output W O )
) \/
(
forall (v: fp32) (O: APOutput) (W: (@list Z)) (p: Z) (PreH1 : (p <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p )) (PreH4 : (ap_float_initialized O p v )) ,
  ((p) # Float  |-> v)
  **  (ap_output (ap_removed (W) (p)) O )
|--
  “ (ap_same_bits v v ) ”
  &&  (ap_output W O )
).

Definition ap_read_previous_float_return_wit_1_split_goal_1 := 
forall (v: fp32) (O: APOutput) (W: (@list Z)) (p: Z) (PreH1 : (p <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p )) (PreH4 : (ap_float_initialized O p v )) ,
  ((p) # Float  |-> v)
  **  (ap_output (ap_removed (W) (p)) O )
|--
  “ (ap_same_bits v v ) ”
.

Definition ap_read_previous_float_return_wit_1_split_goal_spatial := 
forall (v: fp32) (O: APOutput) (W: (@list Z)) (p: Z) (PreH1 : (p <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p )) (PreH4 : (ap_float_initialized O p v )) ,
  ((p) # Float  |-> v)
  **  (ap_output (ap_removed (W) (p)) O )
|--
  (ap_output W O )
.

(*----- Function ap_read_previous_uint -----*)

Definition ap_read_previous_uint_entail_wit_1 := 
(
forall (p_pre: Z) (v: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p_pre )) (PreH4 : (ap_uint_initialized O p_pre v )) ,
  (ap_index W O )
|--
  “ (p_pre <> 0) ” 
  &&  “ (ap_distinct W ) ” 
  &&  “ (ap_owned W p_pre ) ” 
  &&  “ (ap_uint_initialized O p_pre v ) ”
  &&  ((p_pre) # UInt  |-> v)
  **  (ap_index (ap_removed (W) (p_pre)) O )
) \/
(
forall (p_pre: Z) (v: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p_pre )) (PreH4 : (ap_uint_initialized O p_pre v )) ,
  (ap_index W O )
|--
  ((p_pre) # UInt  |-> v)
  **  (ap_index (ap_removed (W) (p_pre)) O )
).

Definition ap_read_previous_uint_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (v: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p_pre )) (PreH4 : (ap_uint_initialized O p_pre v )) ,
  (ap_index W O )
|--
  ((p_pre) # UInt  |-> v)
  **  (ap_index (ap_removed (W) (p_pre)) O )
.

Definition ap_read_previous_uint_return_wit_1 := 
(
forall (v: Z) (O: APIndex) (W: (@list Z)) (p: Z) (PreH1 : (p <> 0)) (PreH2 : (ap_distinct W )) (PreH3 : (ap_owned W p )) (PreH4 : (ap_uint_initialized O p v )) ,
  ((p) # UInt  |-> v)
  **  (ap_index (ap_removed (W) (p)) O )
|--
  “ (v = v) ”
  &&  (ap_index W O )
) \/
(
forall (v: Z) (O: APIndex) (W: (@list Z)) (p: Z) (PreH1 : (v <= UINT_MAX)) (PreH2 : (v >= 0)) (PreH3 : (p <> 0)) (PreH4 : (ap_distinct W )) (PreH5 : (ap_owned W p )) (PreH6 : (ap_uint_initialized O p v )) ,
  ((p) # UInt  |-> v)
  **  (ap_index (ap_removed (W) (p)) O )
|--
  (ap_index W O )
).

Definition ap_read_previous_uint_return_wit_1_split_goal_spatial := 
forall (v: Z) (O: APIndex) (W: (@list Z)) (p: Z) (PreH1 : (v <= UINT_MAX)) (PreH2 : (v >= 0)) (PreH3 : (p <> 0)) (PreH4 : (ap_distinct W )) (PreH5 : (ap_owned W p )) (PreH6 : (ap_uint_initialized O p v )) ,
  ((p) # UInt  |-> v)
  **  (ap_index (ap_removed (W) (p)) O )
|--
  (ap_index W O )
.

Module Type VC_Correct.


Axiom proof_of_ap_read_previous_float_entail_wit_1 : ap_read_previous_float_entail_wit_1.
Axiom proof_of_ap_read_previous_float_return_wit_1 : ap_read_previous_float_return_wit_1.
Axiom proof_of_ap_read_previous_uint_entail_wit_1 : ap_read_previous_uint_entail_wit_1.
Axiom proof_of_ap_read_previous_uint_return_wit_1 : ap_read_previous_uint_return_wit_1.

End VC_Correct.
