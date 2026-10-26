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
From ExpMinusMax Require Import neon_stage_probe_def.
Import Snaive_C_Rules64.
Require Import ExpMinusMax.VectorRecords.
Require Import ExpMinusMax.IntrinsicModel.
Require Import ExpMinusMax.BorrowedMemory.
Require Import ExpMinusMax.MemoryInterface.
Require Import ExpMinusMax.RecordStageFacts.
Local Open Scope sac.

(*----- Function em_stage_probe -----*)

Definition em_stage_probe_return_wit_1 := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (record_return: Z) (PreH1 : (em_same_record4 VB (em_neon_dup (X)) )) (PreH2 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH3 : (em_same x_pre X )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
|--
  EX (A: Recordfloat32x4_t) ,
  (StructPredfloat32x4_t record_return A )
.

Definition em_stage_probe_partial_solve_wit_1_pure := 
forall (x_pre: fp32) (X: fp32) (PreH1 : (em_same x_pre X )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre X ) ”
.

Definition em_stage_probe_partial_solve_wit_1_aux := 
forall (x_pre: fp32) (X: fp32) (PreH1 : (em_same x_pre X )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
|--
  “ (em_same x_pre X ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
.

Definition em_stage_probe_partial_solve_wit_1 := em_stage_probe_partial_solve_wit_1_pure -> em_stage_probe_partial_solve_wit_1_aux.

Definition em_stage_probe_partial_solve_wit_2 := 
forall (x_pre: fp32) (X: fp32) (retval: Z) (PreH1 : (em_same x_pre X )) ,
  (StructPredfloat32x4_t retval (em_neon_dup (X)) )
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
|--
  “ (em_same x_pre X ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s0) ))
.

Definition em_stage_probe_partial_solve_wit_3 := 
forall (x_pre: fp32) (X: fp32) (PreH1 : (em_same x_pre X )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s0) ))
|--
  “ (em_same x_pre X ) ”
  &&  (StructPredfloat32x4_t ( &( "a" ) ) (em_neon_dup (X)) )
.

Definition em_stage_probe_partial_solve_wit_4_pure := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH2 : (em_same x_pre X )) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre X ) ”
.

Definition em_stage_probe_partial_solve_wit_4_aux := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH2 : (em_same x_pre X )) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (em_same x_pre X ) ” 
  &&  “ (em_same_record4 VA (em_neon_dup (X)) ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
.

Definition em_stage_probe_partial_solve_wit_4 := em_stage_probe_partial_solve_wit_4_pure -> em_stage_probe_partial_solve_wit_4_aux.

Definition em_stage_probe_partial_solve_wit_5 := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (retval: Z) (PreH1 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH2 : (em_same x_pre X )) ,
  (StructPredfloat32x4_t retval (em_neon_dup (X)) )
  **  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (em_same_record4 VA (em_neon_dup (X)) ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
.

Definition em_stage_probe_partial_solve_wit_6 := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH2 : (em_same x_pre X )) ,
  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (X)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (em_same_record4 VA (em_neon_dup (X)) ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  (StructPredfloat32x4_t ( &( "b" ) ) (em_neon_dup (X)) )
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
.

Definition em_stage_probe_partial_solve_wit_7 := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_neon_dup (X)) )) (PreH2 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH3 : (em_same x_pre X )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (em_same_record4 VB (em_neon_dup (X)) ) ” 
  &&  “ (em_same_record4 VA (em_neon_dup (X)) ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
.

Definition em_stage_probe_partial_solve_wit_8 := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (retval: Z) (PreH1 : (em_same_record4 VB (em_neon_dup (X)) )) (PreH2 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH3 : (em_same x_pre X )) ,
  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  (StructPredfloat32x4_t retval (em_neon_sub (VA) (VB)) )
  **  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
|--
  “ (em_same_record4 VB (em_neon_dup (X)) ) ” 
  &&  “ (em_same_record4 VA (em_neon_dup (X)) ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((&(( &( "c" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
.

Definition em_stage_probe_partial_solve_wit_9 := 
forall (x_pre: fp32) (X: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (record_return: Z) (PreH1 : (em_same_record4 VB (em_neon_dup (X)) )) (PreH2 : (em_same_record4 VA (em_neon_dup (X)) )) (PreH3 : (em_same x_pre X )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
|--
  “ (em_same_record4 VB (em_neon_dup (X)) ) ” 
  &&  “ (em_same_record4 VA (em_neon_dup (X)) ) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
.

Definition em_stage_probe_which_implies_wit_1 := 
(
forall (X: fp32) ,
  (StructPredfloat32x4_t ( &( "a" ) ) (em_neon_dup (X)) )
|--
  EX (VA: Recordfloat32x4_t) ,
  “ (em_same_record4 VA (em_neon_dup (X)) ) ”
  &&  (StructPredfloat32x4_t ( &( "a" ) ) VA )
) \/
(
forall (X: fp32) ,
  TT && emp 
|--
  “ (em_same_record4 (em_neon_dup (X)) (em_neon_dup (X)) ) ”
  &&  emp
).

Definition em_stage_probe_which_implies_wit_1_split_goal_1 := 
forall (X: fp32) ,
  (em_same_record4 (em_neon_dup (X)) (em_neon_dup (X)) )
.

Definition em_stage_probe_which_implies_wit_2 := 
(
forall (X: fp32) ,
  (StructPredfloat32x4_t ( &( "b" ) ) (em_neon_dup (X)) )
|--
  EX (VB: Recordfloat32x4_t) ,
  “ (em_same_record4 VB (em_neon_dup (X)) ) ”
  &&  (StructPredfloat32x4_t ( &( "b" ) ) VB )
) \/
(
forall (X: fp32) ,
  TT && emp 
|--
  “ (em_same_record4 (em_neon_dup (X)) (em_neon_dup (X)) ) ”
  &&  emp
).

Definition em_stage_probe_which_implies_wit_2_split_goal_1 := 
forall (X: fp32) ,
  (em_same_record4 (em_neon_dup (X)) (em_neon_dup (X)) )
.

Module Type VC_Correct.


Axiom proof_of_em_stage_probe_return_wit_1 : em_stage_probe_return_wit_1.
Axiom proof_of_em_stage_probe_partial_solve_wit_1_pure : em_stage_probe_partial_solve_wit_1_pure.
Axiom proof_of_em_stage_probe_partial_solve_wit_1 : em_stage_probe_partial_solve_wit_1.
Axiom proof_of_em_stage_probe_partial_solve_wit_2 : em_stage_probe_partial_solve_wit_2.
Axiom proof_of_em_stage_probe_partial_solve_wit_3 : em_stage_probe_partial_solve_wit_3.
Axiom proof_of_em_stage_probe_partial_solve_wit_4_pure : em_stage_probe_partial_solve_wit_4_pure.
Axiom proof_of_em_stage_probe_partial_solve_wit_4 : em_stage_probe_partial_solve_wit_4.
Axiom proof_of_em_stage_probe_partial_solve_wit_5 : em_stage_probe_partial_solve_wit_5.
Axiom proof_of_em_stage_probe_partial_solve_wit_6 : em_stage_probe_partial_solve_wit_6.
Axiom proof_of_em_stage_probe_partial_solve_wit_7 : em_stage_probe_partial_solve_wit_7.
Axiom proof_of_em_stage_probe_partial_solve_wit_8 : em_stage_probe_partial_solve_wit_8.
Axiom proof_of_em_stage_probe_partial_solve_wit_9 : em_stage_probe_partial_solve_wit_9.
Axiom proof_of_em_stage_probe_which_implies_wit_1 : em_stage_probe_which_implies_wit_1.
Axiom proof_of_em_stage_probe_which_implies_wit_2 : em_stage_probe_which_implies_wit_2.

End VC_Correct.
