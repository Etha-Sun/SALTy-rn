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
From ExpMinusMax Require Import rvv_stage_probe_def.
Import Snaive_C_Rules64.
Require Import ExpMinusMax.VectorRecords.
Require Import ExpMinusMax.IntrinsicModel.
Require Import ExpMinusMax.BorrowedMemory.
Require Import ExpMinusMax.RvvIntrinsicModel.
Require Import ExpMinusMax.RvvStageProbeModel.
Local Open Scope sac.

(*----- Function em_rvv_stage_probe -----*)

Definition em_rvv_stage_probe_return_wit_1 := 
(
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (A: Recordvfloat32m4_t) (B_2: Recordvfloat32m4_t) (record_return: Z) (PreH1 : (em_rvv_sub_p A X vl_pre B_2 )) (PreH2 : (em_rvv_dup_p X vl_pre A )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (em_same x_pre X )) ,
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (B_2.(vfloat32m4_t_s15) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (B_2.(vfloat32m4_t_s14) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (B_2.(vfloat32m4_t_s13) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (B_2.(vfloat32m4_t_s12) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (B_2.(vfloat32m4_t_s11) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (B_2.(vfloat32m4_t_s10) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (B_2.(vfloat32m4_t_s9) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (B_2.(vfloat32m4_t_s8) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (B_2.(vfloat32m4_t_s7) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (B_2.(vfloat32m4_t_s6) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (B_2.(vfloat32m4_t_s5) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (B_2.(vfloat32m4_t_s4) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (B_2.(vfloat32m4_t_s3) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (B_2.(vfloat32m4_t_s2) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (B_2.(vfloat32m4_t_s1) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (B_2.(vfloat32m4_t_s0) ))
|--
  EX (B: Recordvfloat32m4_t) ,
  “ (em_rvv_sub_self_p X vl_pre B ) ”
  &&  (StructPredvfloat32m4_t record_return B )
) \/
(
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (A: Recordvfloat32m4_t) (B_2: Recordvfloat32m4_t) (PreH1 : (em_rvv_sub_p A X vl_pre B_2 )) (PreH2 : (em_rvv_dup_p X vl_pre A )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (em_same x_pre X )) ,
  TT && emp 
|--
  “ (em_rvv_sub_self_p X vl_pre (make_record_vfloat32m4_t ((B_2.(vfloat32m4_t_s0) )) ((B_2.(vfloat32m4_t_s1) )) ((B_2.(vfloat32m4_t_s2) )) ((B_2.(vfloat32m4_t_s3) )) ((B_2.(vfloat32m4_t_s4) )) ((B_2.(vfloat32m4_t_s5) )) ((B_2.(vfloat32m4_t_s6) )) ((B_2.(vfloat32m4_t_s7) )) ((B_2.(vfloat32m4_t_s8) )) ((B_2.(vfloat32m4_t_s9) )) ((B_2.(vfloat32m4_t_s10) )) ((B_2.(vfloat32m4_t_s11) )) ((B_2.(vfloat32m4_t_s12) )) ((B_2.(vfloat32m4_t_s13) )) ((B_2.(vfloat32m4_t_s14) )) ((B_2.(vfloat32m4_t_s15) ))) ) ”
  &&  emp
).

Definition em_rvv_stage_probe_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (A: Recordvfloat32m4_t) (B_2: Recordvfloat32m4_t) (PreH1 : (em_rvv_sub_p A X vl_pre B_2 )) (PreH2 : (em_rvv_dup_p X vl_pre A )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (em_same x_pre X )) ,
  (em_rvv_sub_self_p X vl_pre (make_record_vfloat32m4_t ((B_2.(vfloat32m4_t_s0) )) ((B_2.(vfloat32m4_t_s1) )) ((B_2.(vfloat32m4_t_s2) )) ((B_2.(vfloat32m4_t_s3) )) ((B_2.(vfloat32m4_t_s4) )) ((B_2.(vfloat32m4_t_s5) )) ((B_2.(vfloat32m4_t_s6) )) ((B_2.(vfloat32m4_t_s7) )) ((B_2.(vfloat32m4_t_s8) )) ((B_2.(vfloat32m4_t_s9) )) ((B_2.(vfloat32m4_t_s10) )) ((B_2.(vfloat32m4_t_s11) )) ((B_2.(vfloat32m4_t_s12) )) ((B_2.(vfloat32m4_t_s13) )) ((B_2.(vfloat32m4_t_s14) )) ((B_2.(vfloat32m4_t_s15) ))) )
.

Definition em_rvv_stage_probe_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (em_same x_pre X )) ,
  (UndefStructPredvfloat32m4_t ( &( "a" ) ) )
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ”
.

Definition em_rvv_stage_probe_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (em_same x_pre X )) ,
  (UndefStructPredvfloat32m4_t ( &( "a" ) ) )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ”
  &&  (UndefStructPredvfloat32m4_t ( &( "a" ) ) )
.

Definition em_rvv_stage_probe_partial_solve_wit_1 := em_rvv_stage_probe_partial_solve_wit_1_pure -> em_rvv_stage_probe_partial_solve_wit_1_aux.

Definition em_rvv_stage_probe_partial_solve_wit_2 := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (R: Recordvfloat32m4_t) (retval: Z) (PreH1 : (em_rvv_dup_p X vl_pre R )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) (PreH4 : (em_same x_pre X )) ,
  (StructPredvfloat32m4_t retval R )
  **  (UndefStructPredvfloat32m4_t ( &( "a" ) ) )
|--
  “ (em_rvv_dup_p X vl_pre R ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((&(( &( "a" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (R.(vfloat32m4_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (R.(vfloat32m4_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (R.(vfloat32m4_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (R.(vfloat32m4_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (R.(vfloat32m4_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (R.(vfloat32m4_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (R.(vfloat32m4_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (R.(vfloat32m4_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (R.(vfloat32m4_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (R.(vfloat32m4_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (R.(vfloat32m4_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (R.(vfloat32m4_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m4_t_s0) ))
.

Definition em_rvv_stage_probe_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (A: Recordvfloat32m4_t) (PreH1 : (em_rvv_dup_p X vl_pre A )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) (PreH4 : (em_same x_pre X )) ,
  (UndefStructPredvfloat32m4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ”
.

Definition em_rvv_stage_probe_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (A: Recordvfloat32m4_t) (PreH1 : (em_rvv_dup_p X vl_pre A )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) (PreH4 : (em_same x_pre X )) ,
  (UndefStructPredvfloat32m4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m4_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m4_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m4_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m4_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m4_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m4_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m4_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m4_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m4_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m4_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m4_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m4_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m4_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ” 
  &&  “ (em_rvv_dup_p X vl_pre A ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ”
  &&  (StructPredvfloat32m4_t ( &( "a" ) ) A )
  **  (UndefStructPredvfloat32m4_t ( &( "b" ) ) )
.

Definition em_rvv_stage_probe_partial_solve_wit_3 := em_rvv_stage_probe_partial_solve_wit_3_pure -> em_rvv_stage_probe_partial_solve_wit_3_aux.

Definition em_rvv_stage_probe_partial_solve_wit_4 := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (A: Recordvfloat32m4_t) (R: Recordvfloat32m4_t) (retval: Z) (PreH1 : (em_rvv_sub_p A X vl_pre R )) (PreH2 : (em_rvv_dup_p X vl_pre A )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (em_same x_pre X )) ,
  (StructPredvfloat32m4_t ( &( "a" ) ) A )
  **  (StructPredvfloat32m4_t retval R )
  **  (UndefStructPredvfloat32m4_t ( &( "b" ) ) )
|--
  “ (em_rvv_sub_p A X vl_pre R ) ” 
  &&  “ (em_rvv_dup_p X vl_pre A ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (R.(vfloat32m4_t_s15) ))
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (R.(vfloat32m4_t_s14) ))
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (R.(vfloat32m4_t_s13) ))
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (R.(vfloat32m4_t_s12) ))
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (R.(vfloat32m4_t_s11) ))
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (R.(vfloat32m4_t_s10) ))
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (R.(vfloat32m4_t_s9) ))
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (R.(vfloat32m4_t_s8) ))
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (R.(vfloat32m4_t_s7) ))
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (R.(vfloat32m4_t_s6) ))
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (R.(vfloat32m4_t_s5) ))
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (R.(vfloat32m4_t_s4) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m4_t_s0) ))
  **  (StructPredvfloat32m4_t ( &( "a" ) ) A )
.

Definition em_rvv_stage_probe_partial_solve_wit_5 := 
forall (vl_pre: Z) (x_pre: fp32) (X: fp32) (A: Recordvfloat32m4_t) (B: Recordvfloat32m4_t) (record_return: Z) (PreH1 : (em_rvv_sub_p A X vl_pre B )) (PreH2 : (em_rvv_dup_p X vl_pre A )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (em_same x_pre X )) ,
  (UndefStructPredvfloat32m4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> (B.(vfloat32m4_t_s15) ))
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> (B.(vfloat32m4_t_s14) ))
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> (B.(vfloat32m4_t_s13) ))
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> (B.(vfloat32m4_t_s12) ))
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> (B.(vfloat32m4_t_s11) ))
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> (B.(vfloat32m4_t_s10) ))
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> (B.(vfloat32m4_t_s9) ))
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> (B.(vfloat32m4_t_s8) ))
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> (B.(vfloat32m4_t_s7) ))
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> (B.(vfloat32m4_t_s6) ))
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> (B.(vfloat32m4_t_s5) ))
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> (B.(vfloat32m4_t_s4) ))
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(vfloat32m4_t_s3) ))
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(vfloat32m4_t_s2) ))
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(vfloat32m4_t_s1) ))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(vfloat32m4_t_s0) ))
  **  (StructPredvfloat32m4_t ( &( "a" ) ) A )
|--
  “ (em_rvv_sub_p A X vl_pre B ) ” 
  &&  “ (em_rvv_dup_p X vl_pre A ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (em_same x_pre X ) ”
  &&  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> (B.(vfloat32m4_t_s15) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> (B.(vfloat32m4_t_s14) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> (B.(vfloat32m4_t_s13) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> (B.(vfloat32m4_t_s12) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> (B.(vfloat32m4_t_s11) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> (B.(vfloat32m4_t_s10) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> (B.(vfloat32m4_t_s9) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> (B.(vfloat32m4_t_s8) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> (B.(vfloat32m4_t_s7) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> (B.(vfloat32m4_t_s6) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> (B.(vfloat32m4_t_s5) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> (B.(vfloat32m4_t_s4) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> (B.(vfloat32m4_t_s3) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> (B.(vfloat32m4_t_s2) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> (B.(vfloat32m4_t_s1) ))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> (B.(vfloat32m4_t_s0) ))
  **  (StructPredvfloat32m4_t ( &( "a" ) ) A )
.

Module Type VC_Correct.


Axiom proof_of_em_rvv_stage_probe_return_wit_1 : em_rvv_stage_probe_return_wit_1.
Axiom proof_of_em_rvv_stage_probe_partial_solve_wit_1_pure : em_rvv_stage_probe_partial_solve_wit_1_pure.
Axiom proof_of_em_rvv_stage_probe_partial_solve_wit_1 : em_rvv_stage_probe_partial_solve_wit_1.
Axiom proof_of_em_rvv_stage_probe_partial_solve_wit_2 : em_rvv_stage_probe_partial_solve_wit_2.
Axiom proof_of_em_rvv_stage_probe_partial_solve_wit_3_pure : em_rvv_stage_probe_partial_solve_wit_3_pure.
Axiom proof_of_em_rvv_stage_probe_partial_solve_wit_3 : em_rvv_stage_probe_partial_solve_wit_3.
Axiom proof_of_em_rvv_stage_probe_partial_solve_wit_4 : em_rvv_stage_probe_partial_solve_wit_4.
Axiom proof_of_em_rvv_stage_probe_partial_solve_wit_5 : em_rvv_stage_probe_partial_solve_wit_5.

End VC_Correct.
