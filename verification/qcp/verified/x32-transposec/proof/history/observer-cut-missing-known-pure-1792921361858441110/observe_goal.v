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
Require Import X32Transpose.VectorModel.
Require Import X32Transpose.ProgramModel.
Require Import X32Transpose.ObservationModel.
Local Open Scope sac.

(*----- Function xt_observe_pointer -----*)

Definition xt_observe_pointer_return_wit_1 := 
(
forall (column_pre: Z) (row_pre: Z) (stride_pre: Z) (p_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits (p_pre) (64)) + (unsigned_last_nbits ((column_pre * stride_pre )) (64)) )) (64)) + (unsigned_last_nbits ((row_pre * sizeof(UINT) )) (64)) )) (64)) = (xt_observation_address (p_pre) (stride_pre) (row_pre) (column_pre))) ”
  &&  emp
) \/
(
forall (column_pre: Z) (row_pre: Z) (stride_pre: Z) (p_pre: Z) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits (p_pre) (64)) + (unsigned_last_nbits ((column_pre * stride_pre )) (64)) )) (64)) + (unsigned_last_nbits ((row_pre * sizeof(UINT) )) (64)) )) (64)) = (xt_observation_address (p_pre) (stride_pre) (row_pre) (column_pre))) ”
  &&  emp
).

Definition xt_observe_pointer_return_wit_1_split_goal_1 := 
forall (column_pre: Z) (row_pre: Z) (stride_pre: Z) (p_pre: Z) ,
  ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits (p_pre) (64)) + (unsigned_last_nbits ((column_pre * stride_pre )) (64)) )) (64)) + (unsigned_last_nbits ((row_pre * sizeof(UINT) )) (64)) )) (64)) = (xt_observation_address (p_pre) (stride_pre) (row_pre) (column_pre)))
.

(*----- Function xt_read_output -----*)

Definition xt_read_output_entail_wit_1 := 
(
forall (p_pre: Z) (x: Z) (O: XTOutput) (W: (@list Z)) (PreH1 : (NoDup W )) (PreH2 : (0 < p_pre)) (PreH3 : (In p_pre W )) (PreH4 : (xt_output_exact O p_pre x )) ,
  (xt_output W O )
|--
  ((p_pre) # UInt  |-> x)
  **  (xt_output_rest W O p_pre )
) \/
(
forall (p_pre: Z) (x: Z) (O: XTOutput) (W: (@list Z)) (PreH1 : (NoDup W )) (PreH2 : (0 < p_pre)) (PreH3 : (In p_pre W )) (PreH4 : (xt_output_exact O p_pre x )) ,
  (xt_output W O )
|--
  ((p_pre) # UInt  |-> x)
  **  (xt_output_rest W O p_pre )
).

Definition xt_read_output_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x: Z) (O: XTOutput) (W: (@list Z)) (PreH1 : (NoDup W )) (PreH2 : (0 < p_pre)) (PreH3 : (In p_pre W )) (PreH4 : (xt_output_exact O p_pre x )) ,
  (xt_output W O )
|--
  ((p_pre) # UInt  |-> x)
  **  (xt_output_rest W O p_pre )
.

Definition xt_read_output_return_wit_1 := 
(
forall (x: Z) (O: XTOutput) (W: (@list Z)) (p: Z) ,
  ((p) # UInt  |-> x)
  **  (xt_output_rest W O p )
|--
  “ (x = x) ”
  &&  (xt_output W O )
) \/
(
forall (x: Z) (O: XTOutput) (W: (@list Z)) (p: Z) (PreH1 : (x <= UINT_MAX)) (PreH2 : (x >= 0)) ,
  ((p) # UInt  |-> x)
  **  (xt_output_rest W O p )
|--
  (xt_output W O )
).

Definition xt_read_output_return_wit_1_split_goal_spatial := 
forall (x: Z) (O: XTOutput) (W: (@list Z)) (p: Z) (PreH1 : (x <= UINT_MAX)) (PreH2 : (x >= 0)) ,
  ((p) # UInt  |-> x)
  **  (xt_output_rest W O p )
|--
  (xt_output W O )
.

Module Type VC_Correct.


Axiom proof_of_xt_observe_pointer_return_wit_1 : xt_observe_pointer_return_wit_1.
Axiom proof_of_xt_read_output_entail_wit_1 : xt_read_output_entail_wit_1.
Axiom proof_of_xt_read_output_return_wit_1 : xt_read_output_return_wit_1.

End VC_Correct.
