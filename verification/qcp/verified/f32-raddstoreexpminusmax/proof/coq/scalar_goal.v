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
From ExpMinusMax Require Import scalar_def.
Import Snaive_C_Rules64.
Require Import ExpMinusMax.VectorRecords.
Require Import ExpMinusMax.IntrinsicModel.
Require Import ExpMinusMax.BorrowedMemory.
Require Import ExpMinusMax.MemoryInterface.
Local Open Scope sac.

(*----- Function em_read_scalar -----*)

Definition em_read_scalar_entail_wit_1 := 
(
forall (p_pre: Z) (F: EMMap) (PreH1 : (p_pre <> 0)) (PreH2 : (em_present F p_pre )) ,
  (em_data F )
|--
  “ (p_pre <> 0) ” 
  &&  “ (em_present F p_pre ) ”
  &&  ((p_pre) # Float  |-> (em_get (F) (p_pre)))
  **  (em_data (em_pop (F) (p_pre)) )
) \/
(
forall (p_pre: Z) (F: EMMap) (PreH1 : (p_pre <> 0)) (PreH2 : (em_present F p_pre )) ,
  (em_data F )
|--
  ((p_pre) # Float  |-> (em_get (F) (p_pre)))
  **  (em_data (em_pop (F) (p_pre)) )
).

Definition em_read_scalar_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (F: EMMap) (PreH1 : (p_pre <> 0)) (PreH2 : (em_present F p_pre )) ,
  (em_data F )
|--
  ((p_pre) # Float  |-> (em_get (F) (p_pre)))
  **  (em_data (em_pop (F) (p_pre)) )
.

Definition em_read_scalar_return_wit_1 := 
(
forall (p_pre: Z) (F: EMMap) (PreH1 : (p_pre <> 0)) (PreH2 : (em_present F p_pre )) ,
  ((p_pre) # Float  |-> (em_get (F) (p_pre)))
  **  (em_data (em_pop (F) (p_pre)) )
|--
  “ (em_same (em_get (F) (p_pre)) (em_get (F) (p_pre)) ) ”
  &&  (em_data F )
) \/
(
forall (p_pre: Z) (F: EMMap) (PreH1 : (p_pre <> 0)) (PreH2 : (em_present F p_pre )) ,
  ((p_pre) # Float  |-> (em_get (F) (p_pre)))
  **  (em_data (em_pop (F) (p_pre)) )
|--
  “ (em_same (em_get (F) (p_pre)) (em_get (F) (p_pre)) ) ”
  &&  (em_data F )
).

Definition em_read_scalar_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (F: EMMap) (PreH1 : (p_pre <> 0)) (PreH2 : (em_present F p_pre )) ,
  ((p_pre) # Float  |-> (em_get (F) (p_pre)))
  **  (em_data (em_pop (F) (p_pre)) )
|--
  “ (em_same (em_get (F) (p_pre)) (em_get (F) (p_pre)) ) ”
.

Definition em_read_scalar_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (F: EMMap) (PreH1 : (p_pre <> 0)) (PreH2 : (em_present F p_pre )) ,
  ((p_pre) # Float  |-> (em_get (F) (p_pre)))
  **  (em_data (em_pop (F) (p_pre)) )
|--
  (em_data F )
.

(*----- Function em_write_scalar -----*)

Definition em_write_scalar_entail_wit_1 := 
(
forall (x_pre: fp32) (p_pre: Z) (X: fp32) (O: EMOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (em_distinct W )) (PreH3 : (em_owned W p_pre )) (PreH4 : (em_same x_pre X )) ,
  (em_output W O )
|--
  “ (p_pre <> 0) ” 
  &&  “ (em_distinct W ) ” 
  &&  “ (em_owned W p_pre ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((p_pre) # Float  |->_)
  **  (em_output (em_removed (W) (p_pre)) O )
) \/
(
forall (x_pre: fp32) (p_pre: Z) (X: fp32) (O: EMOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (em_distinct W )) (PreH3 : (em_owned W p_pre )) (PreH4 : (em_same x_pre X )) ,
  (em_output W O )
|--
  EX (x: fp32) ,
  “ (p_pre <> 0) ” 
  &&  “ (em_distinct W ) ” 
  &&  “ (em_owned W p_pre ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((p_pre) # Float  |-> x)
  **  (em_output (em_removed (W) (p_pre)) O )
).

Definition em_write_scalar_return_wit_1 := 
(
forall (p_pre: Z) (X: fp32) (O: EMOutput) (W: (@list Z)) (x: fp32) (PreH1 : (p_pre <> 0)) (PreH2 : (em_distinct W )) (PreH3 : (em_owned W p_pre )) (PreH4 : (em_same x X )) ,
  ((p_pre) # Float  |-> x)
  **  (em_output (em_removed (W) (p_pre)) O )
|--
  (em_output W (em_output_put (O) (p_pre) (X)) )
) \/
(
forall (p_pre: Z) (X: fp32) (O: EMOutput) (W: (@list Z)) (x: fp32) (PreH1 : (p_pre <> 0)) (PreH2 : (em_distinct W )) (PreH3 : (em_owned W p_pre )) (PreH4 : (em_same x X )) ,
  ((p_pre) # Float  |-> x)
  **  (em_output (em_removed (W) (p_pre)) O )
|--
  (em_output W (em_output_put (O) (p_pre) (X)) )
).

Definition em_write_scalar_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (X: fp32) (O: EMOutput) (W: (@list Z)) (x: fp32) (PreH1 : (p_pre <> 0)) (PreH2 : (em_distinct W )) (PreH3 : (em_owned W p_pre )) (PreH4 : (em_same x X )) ,
  ((p_pre) # Float  |-> x)
  **  (em_output (em_removed (W) (p_pre)) O )
|--
  (em_output W (em_output_put (O) (p_pre) (X)) )
.

(*----- Function em_assert -----*)

Definition em_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_em_read_scalar_entail_wit_1 : em_read_scalar_entail_wit_1.
Axiom proof_of_em_read_scalar_return_wit_1 : em_read_scalar_return_wit_1.
Axiom proof_of_em_write_scalar_entail_wit_1 : em_write_scalar_entail_wit_1.
Axiom proof_of_em_write_scalar_return_wit_1 : em_write_scalar_return_wit_1.
Axiom proof_of_em_assert_return_wit_1 : em_assert_return_wit_1.

End VC_Correct.
