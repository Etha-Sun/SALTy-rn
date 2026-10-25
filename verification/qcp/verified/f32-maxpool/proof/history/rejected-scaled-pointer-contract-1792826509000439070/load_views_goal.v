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
Require Import MaxPool.Model.
Require Import MaxPool.Types.
Require Import MaxPool.MemoryModel MaxPool.PackModel.
Local Open Scope sac.

(*----- Function mp_probe_readonly -----*)

Definition mp_probe_readonly_return_wit_1 := 
forall (p_pre: Z) (F: MPFloatMap) (record_return: Z) (PreH1 : (mp_window F p_pre 4 )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (mp_get (F) ((p_pre + (12 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (mp_get (F) ((p_pre + (8 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (mp_get (F) ((p_pre + (4 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (mp_get (F) ((p_pre + (0 * sizeof(FLOAT))))))
  **  (mp_data F )
|--
  (mp_data F )
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (mp_get (F) ((p_pre + (0 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (mp_get (F) ((p_pre + (4 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (mp_get (F) ((p_pre + (8 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (mp_get (F) ((p_pre + (12 * sizeof(FLOAT))))))
.

Definition mp_probe_readonly_partial_solve_wit_1_pure := 
forall (p_pre: Z) (F: MPFloatMap) (record_return: Z) (PreH1 : (mp_window F p_pre 4 )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (mp_data F )
|--
  “ (mp_window F p_pre 4 ) ”
.

Definition mp_probe_readonly_partial_solve_wit_1_aux := 
forall (p_pre: Z) (F: MPFloatMap) (record_return: Z) (PreH1 : (mp_window F p_pre 4 )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  (mp_data F )
|--
  “ (mp_window F p_pre 4 ) ” 
  &&  “ (mp_window F p_pre 4 ) ”
  &&  (mp_data F )
  **  (UndefStructPredfloat32x4_t record_return )
.

Definition mp_probe_readonly_partial_solve_wit_1 := mp_probe_readonly_partial_solve_wit_1_pure -> mp_probe_readonly_partial_solve_wit_1_aux.

Definition mp_probe_readonly_partial_solve_wit_2 := 
forall (p_pre: Z) (F: MPFloatMap) (record_return: Z) (retval: Z) (PreH1 : (mp_window F p_pre 4 )) ,
  (mp_data F )
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (mp_get (F) ((p_pre + (0 * sizeof(FLOAT))))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (mp_get (F) ((p_pre + (4 * sizeof(FLOAT))))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (mp_get (F) ((p_pre + (8 * sizeof(FLOAT))))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (mp_get (F) ((p_pre + (12 * sizeof(FLOAT))))))
  **  (UndefStructPredfloat32x4_t record_return )
|--
  “ (mp_window F p_pre 4 ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (mp_get (F) ((p_pre + (12 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (mp_get (F) ((p_pre + (8 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (mp_get (F) ((p_pre + (4 * sizeof(FLOAT))))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (mp_get (F) ((p_pre + (0 * sizeof(FLOAT))))))
  **  (mp_data F )
.

(*----- Function mp_probe_output -----*)

Definition mp_probe_output_return_wit_1 := 
forall (p_pre: Z) (O: MPOutput) (W: (@list Z)) (record_return: Z) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0_2: fp32) (PreH1 : (mp_loaded O (p_pre + (0 * sizeof(FLOAT))) r0_2 )) (PreH2 : (mp_loaded O (p_pre + (4 * sizeof(FLOAT))) r1_2 )) (PreH3 : (mp_loaded O (p_pre + (8 * sizeof(FLOAT))) r2_2 )) (PreH4 : (mp_loaded O (p_pre + (12 * sizeof(FLOAT))) r3_2 )) (PreH5 : (mp_write_window W p_pre 4 )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> r3_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> r2_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> r1_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> r0_2)
  **  (mp_out W O )
|--
  EX (r3: fp32)  (r2: fp32)  (r1: fp32)  (r0: fp32) ,
  “ (mp_loaded O (p_pre + (0 * sizeof(FLOAT))) r0 ) ” 
  &&  “ (mp_loaded O (p_pre + (4 * sizeof(FLOAT))) r1 ) ” 
  &&  “ (mp_loaded O (p_pre + (8 * sizeof(FLOAT))) r2 ) ” 
  &&  “ (mp_loaded O (p_pre + (12 * sizeof(FLOAT))) r3 ) ”
  &&  (mp_out W O )
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> r3)
.

Definition mp_probe_output_partial_solve_wit_1_pure := 
forall (p_pre: Z) (O: MPOutput) (W: (@list Z)) (record_return: Z) (PreH1 : (mp_write_window W p_pre 4 )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (mp_out W O )
|--
  “ (mp_write_window W p_pre 4 ) ”
.

Definition mp_probe_output_partial_solve_wit_1_aux := 
forall (p_pre: Z) (O: MPOutput) (W: (@list Z)) (record_return: Z) (PreH1 : (mp_write_window W p_pre 4 )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  (mp_out W O )
|--
  “ (mp_write_window W p_pre 4 ) ” 
  &&  “ (mp_write_window W p_pre 4 ) ”
  &&  (mp_out W O )
  **  (UndefStructPredfloat32x4_t record_return )
.

Definition mp_probe_output_partial_solve_wit_1 := mp_probe_output_partial_solve_wit_1_pure -> mp_probe_output_partial_solve_wit_1_aux.

Definition mp_probe_output_partial_solve_wit_2 := 
forall (p_pre: Z) (O: MPOutput) (W: (@list Z)) (record_return: Z) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (mp_loaded O (p_pre + (0 * sizeof(FLOAT))) r0 )) (PreH2 : (mp_loaded O (p_pre + (4 * sizeof(FLOAT))) r1 )) (PreH3 : (mp_loaded O (p_pre + (8 * sizeof(FLOAT))) r2 )) (PreH4 : (mp_loaded O (p_pre + (12 * sizeof(FLOAT))) r3 )) (PreH5 : (mp_write_window W p_pre 4 )) ,
  (mp_out W O )
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> r3)
  **  (UndefStructPredfloat32x4_t record_return )
|--
  “ (mp_loaded O (p_pre + (0 * sizeof(FLOAT))) r0 ) ” 
  &&  “ (mp_loaded O (p_pre + (4 * sizeof(FLOAT))) r1 ) ” 
  &&  “ (mp_loaded O (p_pre + (8 * sizeof(FLOAT))) r2 ) ” 
  &&  “ (mp_loaded O (p_pre + (12 * sizeof(FLOAT))) r3 ) ” 
  &&  “ (mp_write_window W p_pre 4 ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> r0)
  **  (mp_out W O )
.

Module Type VC_Correct.


Axiom proof_of_mp_probe_readonly_return_wit_1 : mp_probe_readonly_return_wit_1.
Axiom proof_of_mp_probe_readonly_partial_solve_wit_1_pure : mp_probe_readonly_partial_solve_wit_1_pure.
Axiom proof_of_mp_probe_readonly_partial_solve_wit_1 : mp_probe_readonly_partial_solve_wit_1.
Axiom proof_of_mp_probe_readonly_partial_solve_wit_2 : mp_probe_readonly_partial_solve_wit_2.
Axiom proof_of_mp_probe_output_return_wit_1 : mp_probe_output_return_wit_1.
Axiom proof_of_mp_probe_output_partial_solve_wit_1_pure : mp_probe_output_partial_solve_wit_1_pure.
Axiom proof_of_mp_probe_output_partial_solve_wit_1 : mp_probe_output_partial_solve_wit_1.
Axiom proof_of_mp_probe_output_partial_solve_wit_2 : mp_probe_output_partial_solve_wit_2.

End VC_Correct.
