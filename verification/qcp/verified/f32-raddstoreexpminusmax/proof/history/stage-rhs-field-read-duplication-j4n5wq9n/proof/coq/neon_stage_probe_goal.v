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
(
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (record_return: Z) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
|--
  EX (A: Recordfloat32x4_t) ,
  (StructPredfloat32x4_t record_return A )
) \/
(
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
|--
  TT && emp 
).

Definition em_stage_probe_return_wit_1_split_goal_spatial := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
|--
  TT && emp 
.

Definition em_stage_probe_partial_solve_wit_1_pure := 
(
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
) \/
(
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
).

Definition em_stage_probe_partial_solve_wit_1_pure_split_goal_1 := 
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
.

Definition em_stage_probe_partial_solve_wit_1_aux := 
forall (x_pre: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
|--
  “ (em_same x_pre x_pre ) ”
  &&  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
.

Definition em_stage_probe_partial_solve_wit_1 := em_stage_probe_partial_solve_wit_1_pure -> em_stage_probe_partial_solve_wit_1_aux.

Definition em_stage_probe_partial_solve_wit_2 := 
forall (x_pre: fp32) (retval: Z) ,
  (StructPredfloat32x4_t retval (em_neon_dup (x_pre)) )
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
.

Definition em_stage_probe_partial_solve_wit_3 := 
forall (x_pre: fp32) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
.

Definition em_stage_probe_partial_solve_wit_4_pure := 
(
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
) \/
(
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
).

Definition em_stage_probe_partial_solve_wit_4_pure_split_goal_1 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (em_same x_pre x_pre ) ”
.

Definition em_stage_probe_partial_solve_wit_4_aux := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (em_same x_pre x_pre ) ” 
  &&  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
  &&  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
.

Definition em_stage_probe_partial_solve_wit_4 := em_stage_probe_partial_solve_wit_4_pure -> em_stage_probe_partial_solve_wit_4_aux.

Definition em_stage_probe_partial_solve_wit_5 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (retval: Z) (PreH1 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (StructPredfloat32x4_t retval (em_neon_dup (x_pre)) )
  **  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
  &&  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
.

Definition em_stage_probe_partial_solve_wit_6 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (PreH1 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
  &&  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
.

Definition em_stage_probe_partial_solve_wit_7_pure := 
(
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (VB = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ” 
  &&  “ (VA = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ”
) \/
(
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VA.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ” 
  &&  “ (VA = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ” 
  &&  “ (VB = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ”
).

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_1 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VA.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_2 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VA.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_3 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VA.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_4 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VA.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_5 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (VA = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_6 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VB.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_7 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VB.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_8 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VB.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_9 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (fp32_eq (VB.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ”
.

Definition em_stage_probe_partial_solve_wit_7_pure_split_goal_10 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
|--
  “ (VB = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ”
.

Definition em_stage_probe_partial_solve_wit_7_aux := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> ((em_neon_dup (x_pre)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
|--
  “ (VB = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ” 
  &&  “ (fp32_eq (VB.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ” 
  &&  “ (VA = (make_record_float32x4_t (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) )))) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s3) ) ((em_neon_dup (x_pre)).(float32x4_t_s3) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s2) ) ((em_neon_dup (x_pre)).(float32x4_t_s2) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s1) ) ((em_neon_dup (x_pre)).(float32x4_t_s1) )) ” 
  &&  “ (fp32_eq (VA.(float32x4_t_s0) ) ((em_neon_dup (x_pre)).(float32x4_t_s0) )) ” 
  &&  “ (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ” 
  &&  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
  &&  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
  **  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
.

Definition em_stage_probe_partial_solve_wit_7 := em_stage_probe_partial_solve_wit_7_pure -> em_stage_probe_partial_solve_wit_7_aux.

Definition em_stage_probe_partial_solve_wit_8 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (retval: Z) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  (StructPredfloat32x4_t retval (em_neon_sub (VA) (VB)) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
  **  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
|--
  “ (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ” 
  &&  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
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
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
.

Definition em_stage_probe_partial_solve_wit_9 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
|--
  “ (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ” 
  &&  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
.

Definition em_stage_probe_partial_solve_wit_10 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
|--
  “ (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ” 
  &&  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
  &&  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
.

Definition em_stage_probe_partial_solve_wit_11 := 
forall (x_pre: fp32) (VA: Recordfloat32x4_t) (VB: Recordfloat32x4_t) (record_return: Z) (PreH1 : (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) (PreH2 : (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
|--
  “ (em_same_record4 VB (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ” 
  &&  “ (em_same_record4 VA (em_pack4 (((em_neon_dup (x_pre)).(float32x4_t_s0) )) (((em_neon_dup (x_pre)).(float32x4_t_s1) )) (((em_neon_dup (x_pre)).(float32x4_t_s2) )) (((em_neon_dup (x_pre)).(float32x4_t_s3) ))) ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> ((em_neon_sub (VA) (VB)).(float32x4_t_s0) ))
  **  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (VA.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (VA.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (VA.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (VA.(float32x4_t_s0) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (VB.(float32x4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (VB.(float32x4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (VB.(float32x4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (VB.(float32x4_t_s0) ))
.

Definition em_stage_probe_which_implies_wit_1 := 
(
forall (v: fp32) (v_2: fp32) (v_3: fp32) (v_4: fp32) ,
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> v)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> v_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> v_3)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> v_4)
|--
  EX (VA: Recordfloat32x4_t) ,
  “ (em_same_record4 VA (em_pack4 (v) (v_2) (v_3) (v_4)) ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> v_4)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> v_3)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> v_2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> v)
  **  (StructPredfloat32x4_t ( &( "a" ) ) VA )
) \/
(
forall (v: fp32) (v_2: fp32) (v_3: fp32) (v_4: fp32) ,
  TT && emp 
|--
  EX (VA: Recordfloat32x4_t) ,
  “ (em_same_record4 VA (em_pack4 (v) (v_2) (v_3) (v_4)) ) ”
  &&  (StructPredfloat32x4_t ( &( "a" ) ) VA )
).

Definition em_stage_probe_which_implies_wit_2 := 
(
forall (v: fp32) (v_2: fp32) (v_3: fp32) (v_4: fp32) ,
  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> v)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> v_2)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> v_3)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> v_4)
|--
  EX (VB: Recordfloat32x4_t) ,
  “ (em_same_record4 VB (em_pack4 (v) (v_2) (v_3) (v_4)) ) ”
  &&  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> v_4)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> v_3)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> v_2)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> v)
  **  (StructPredfloat32x4_t ( &( "b" ) ) VB )
) \/
(
forall (v: fp32) (v_2: fp32) (v_3: fp32) (v_4: fp32) ,
  TT && emp 
|--
  EX (VB: Recordfloat32x4_t) ,
  “ (em_same_record4 VB (em_pack4 (v) (v_2) (v_3) (v_4)) ) ”
  &&  (StructPredfloat32x4_t ( &( "b" ) ) VB )
).

Definition em_stage_probe_which_implies_wit_3 := 
forall (v: fp32) (v_2: fp32) (v_3: fp32) (v_4: fp32) ,
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> v)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> v_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> v_3)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> v_4)
|--
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
.

Definition em_stage_probe_which_implies_wit_4 := 
forall (v: fp32) (v_2: fp32) (v_3: fp32) (v_4: fp32) ,
  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> v)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> v_2)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> v_3)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> v_4)
|--
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
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
Axiom proof_of_em_stage_probe_partial_solve_wit_7_pure : em_stage_probe_partial_solve_wit_7_pure.
Axiom proof_of_em_stage_probe_partial_solve_wit_7 : em_stage_probe_partial_solve_wit_7.
Axiom proof_of_em_stage_probe_partial_solve_wit_8 : em_stage_probe_partial_solve_wit_8.
Axiom proof_of_em_stage_probe_partial_solve_wit_9 : em_stage_probe_partial_solve_wit_9.
Axiom proof_of_em_stage_probe_partial_solve_wit_10 : em_stage_probe_partial_solve_wit_10.
Axiom proof_of_em_stage_probe_partial_solve_wit_11 : em_stage_probe_partial_solve_wit_11.
Axiom proof_of_em_stage_probe_which_implies_wit_1 : em_stage_probe_which_implies_wit_1.
Axiom proof_of_em_stage_probe_which_implies_wit_2 : em_stage_probe_which_implies_wit_2.
Axiom proof_of_em_stage_probe_which_implies_wit_3 : em_stage_probe_which_implies_wit_3.
Axiom proof_of_em_stage_probe_which_implies_wit_4 : em_stage_probe_which_implies_wit_4.

End VC_Correct.
