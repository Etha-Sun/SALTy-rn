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
Local Open Scope sac.

(*----- Function qm_store_probe -----*)

Definition qm_store_probe_return_wit_1 := 
(
forall (v_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
) \/
(
forall (out_pre: Z) ,
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  (dup_data_at_error (out_pre + (0 * sizeof(CHAR))) )
).

Definition qm_store_probe_return_wit_1_split_goal_spatial := 
forall (out_pre: Z) ,
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  (dup_data_at_error (out_pre + (0 * sizeof(CHAR))) )
.

Definition qm_store_probe_partial_solve_wit_1 := 
forall (v_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPredint8x8_t ( &( "a" ) ) )
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&(( &( "a" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
.

Definition qm_store_probe_partial_solve_wit_2 := 
forall (v_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> x7)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> x7)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
.

Module Type VC_Correct.


Axiom proof_of_qm_store_probe_return_wit_1 : qm_store_probe_return_wit_1.
Axiom proof_of_qm_store_probe_partial_solve_wit_1 : qm_store_probe_partial_solve_wit_1.
Axiom proof_of_qm_store_probe_partial_solve_wit_2 : qm_store_probe_partial_solve_wit_2.

End VC_Correct.
