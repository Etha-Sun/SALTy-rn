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
From ExpMinusMax Require Import record_copy_def.
Import Snaive_C_Rules64.
Require Import ExpMinusMax.VectorRecords.
Local Open Scope sac.

(*----- Function em_copy4 -----*)

Definition em_copy4_return_wit_1 := 
forall (p_pre: Z) (A: Recordfloat32x4_t) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
|--
  (StructPredfloat32x4_t p_pre A )
  **  (StructPredfloat32x4_t record_return A )
.

Definition em_copy4_partial_solve_wit_1 := 
forall (p_pre: Z) (A: Recordfloat32x4_t) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  (StructPredfloat32x4_t p_pre A )
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
.

Definition em_copy4_partial_solve_wit_2 := 
forall (p_pre: Z) (A: Recordfloat32x4_t) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((p_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
.

(*----- Function em_copy16 -----*)

Definition em_copy16_return_wit_1 := 
forall (p_pre: Z) (A: Recordvfloat32m4_t) (record_return: Z) ,
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
|--
  (StructPredvfloat32m4_t p_pre A )
  **  (StructPredvfloat32m4_t record_return A )
.

Definition em_copy16_partial_solve_wit_1 := 
forall (p_pre: Z) (A: Recordvfloat32m4_t) ,
  (UndefStructPredvfloat32m4_t ( &( "a" ) ) )
  **  (StructPredvfloat32m4_t p_pre A )
|--
  ((&(( &( "a" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
.

Definition em_copy16_partial_solve_wit_2 := 
forall (p_pre: Z) (A: Recordvfloat32m4_t) (record_return: Z) ,
  (UndefStructPredvfloat32m4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
|--
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&((p_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
.

Module Type VC_Correct.


Axiom proof_of_em_copy4_return_wit_1 : em_copy4_return_wit_1.
Axiom proof_of_em_copy4_partial_solve_wit_1 : em_copy4_partial_solve_wit_1.
Axiom proof_of_em_copy4_partial_solve_wit_2 : em_copy4_partial_solve_wit_2.
Axiom proof_of_em_copy16_return_wit_1 : em_copy16_return_wit_1.
Axiom proof_of_em_copy16_partial_solve_wit_1 : em_copy16_partial_solve_wit_1.
Axiom proof_of_em_copy16_partial_solve_wit_2 : em_copy16_partial_solve_wit_2.

End VC_Correct.
