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
From HwcConv Require Import nan_helpers_unit_def.
Import Snaive_C_Rules64.
Require Import HwcConv.Types.
Require Import HwcConv.VectorRecords.
Require Import HwcConv.FloatCopyModel.
Require Import HwcConv.ClampModel HwcConv.MaskModel.
Local Open Scope sac.

(*----- Function hc_min_f32m1 -----*)

Definition hc_min_f32m1_return_wit_1 := 
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R_4: Recordvbool32_t) (R_5: Recordvfloat32m1_t) (record_return: Z) (R_6: Recordvfloat32m1_t) (PreH1 : (hc_isa_merge R_6 (make_record_vfloat32m1_t ((R_5.(vfloat32m1_t_s0) )) ((R_5.(vfloat32m1_t_s1) )) ((R_5.(vfloat32m1_t_s2) )) ((R_5.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_4.(vbool32_t_s0) )) ((R_4.(vbool32_t_s1) )) ((R_4.(vbool32_t_s2) )) ((R_4.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_min R_5 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_4 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_6.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_6.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_6.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_6.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  EX (R: Recordvfloat32m1_t) ,
  “ (hc_clamp_min R A b_pre vl_pre ) ”
  &&  (StructPredvfloat32m1_t pa_pre A )
  **  (StructPredvfloat32m1_t record_return R )
) \/
(
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R_4: Recordvbool32_t) (R_5: Recordvfloat32m1_t) (R_6: Recordvfloat32m1_t) (PreH1 : (hc_isa_merge R_6 (make_record_vfloat32m1_t ((R_5.(vfloat32m1_t_s0) )) ((R_5.(vfloat32m1_t_s1) )) ((R_5.(vfloat32m1_t_s2) )) ((R_5.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_4.(vbool32_t_s0) )) ((R_4.(vbool32_t_s1) )) ((R_4.(vbool32_t_s2) )) ((R_4.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_min R_5 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_4 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  TT && emp 
|--
  “ (hc_clamp_min (make_record_vfloat32m1_t ((R_6.(vfloat32m1_t_s0) )) ((R_6.(vfloat32m1_t_s1) )) ((R_6.(vfloat32m1_t_s2) )) ((R_6.(vfloat32m1_t_s3) ))) A b_pre vl_pre ) ”
  &&  emp
).

Definition hc_min_f32m1_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R_4: Recordvbool32_t) (R_5: Recordvfloat32m1_t) (R_6: Recordvfloat32m1_t) (PreH1 : (hc_isa_merge R_6 (make_record_vfloat32m1_t ((R_5.(vfloat32m1_t_s0) )) ((R_5.(vfloat32m1_t_s1) )) ((R_5.(vfloat32m1_t_s2) )) ((R_5.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_4.(vbool32_t_s0) )) ((R_4.(vbool32_t_s1) )) ((R_4.(vbool32_t_s2) )) ((R_4.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_min R_5 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_4 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  (hc_clamp_min (make_record_vfloat32m1_t ((R_6.(vfloat32m1_t_s0) )) ((R_6.(vfloat32m1_t_s1) )) ((R_6.(vfloat32m1_t_s2) )) ((R_6.(vfloat32m1_t_s3) ))) A b_pre vl_pre )
.

Definition hc_min_f32m1_return_wit_2 := 
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (record_return: Z) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  EX (R: Recordvfloat32m1_t) ,
  “ (hc_clamp_min R A b_pre vl_pre ) ”
  &&  (StructPredvfloat32m1_t pa_pre A )
  **  (StructPredvfloat32m1_t record_return R )
) \/
(
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  TT && emp 
|--
  “ (hc_clamp_min (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) A b_pre vl_pre ) ”
  &&  emp
).

Definition hc_min_f32m1_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (hc_clamp_min (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) A b_pre vl_pre )
.

Definition hc_min_f32m1_partial_solve_wit_1 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (StructPredvfloat32m1_t pa_pre A )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 4)) ,
  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
.

Definition hc_min_f32m1_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 4)) ,
  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_2 := hc_min_f32m1_partial_solve_wit_2_pure -> hc_min_f32m1_partial_solve_wit_2_aux.

Definition hc_min_f32m1_partial_solve_wit_3 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (retval: Z) (PreH1 : (hc_uconstant R 2143289344 vl_pre )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 4)) ,
  (StructPredvuint32m1_t retval R )
  **  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "qbits" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s3")) # UInt  |-> (R.(vuint32m1_t_s3) ))
  **  ((&(( &( "qbits" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s2")) # UInt  |-> (R.(vuint32m1_t_s2) ))
  **  ((&(( &( "qbits" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s1")) # UInt  |-> (R.(vuint32m1_t_s1) ))
  **  ((&(( &( "qbits" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s0")) # UInt  |-> (R.(vuint32m1_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_4 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (PreH1 : (hc_uconstant R 2143289344 vl_pre )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "qnan" ) ) )
  **  ((&(( &( "qbits" ) )->ₛ "s3")) # UInt  |-> (R.(vuint32m1_t_s3) ))
  **  ((&(( &( "qbits" ) )->ₛ "s2")) # UInt  |-> (R.(vuint32m1_t_s2) ))
  **  ((&(( &( "qbits" ) )->ₛ "s1")) # UInt  |-> (R.(vuint32m1_t_s1) ))
  **  ((&(( &( "qbits" ) )->ₛ "s0")) # UInt  |-> (R.(vuint32m1_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  (UndefStructPredvfloat32m1_t ( &( "qnan" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_5 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH2 : (hc_uconstant R 2143289344 vl_pre )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 4)) ,
  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t retval R_2 )
  **  (UndefStructPredvfloat32m1_t ( &( "qnan" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_6 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (PreH1 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH2 : (hc_uconstant R 2143289344 vl_pre )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 4)) ,
  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_7 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (record_return: Z) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (fp32_ne b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_eq b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
.

Definition hc_min_f32m1_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_eq b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_8 := hc_min_f32m1_partial_solve_wit_8_pure -> hc_min_f32m1_partial_solve_wit_8_aux.

Definition hc_min_f32m1_partial_solve_wit_9 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (retval_2: Z) (PreH1 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH2 : (hc_legal_mask R_3 vl_pre )) (PreH3 : (fp32_eq b_pre retval )) (PreH4 : (hc_same_bits retval b_pre )) (PreH5 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH6 : (hc_uconstant R 2143289344 vl_pre )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t retval_2 R_3 )
  **  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (PreH1 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH2 : (hc_legal_mask R_3 vl_pre )) (PreH3 : (fp32_eq b_pre retval )) (PreH4 : (hc_same_bits retval b_pre )) (PreH5 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH6 : (hc_uconstant R 2143289344 vl_pre )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
.

Definition hc_min_f32m1_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (PreH1 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH2 : (hc_legal_mask R_3 vl_pre )) (PreH3 : (fp32_eq b_pre retval )) (PreH4 : (hc_same_bits retval b_pre )) (PreH5 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH6 : (hc_uconstant R 2143289344 vl_pre )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_10 := hc_min_f32m1_partial_solve_wit_10_pure -> hc_min_f32m1_partial_solve_wit_10_aux.

Definition hc_min_f32m1_partial_solve_wit_11 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (retval_2: Z) (PreH1 : (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH2 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH3 : (hc_legal_mask R_3 vl_pre )) (PreH4 : (fp32_eq b_pre retval )) (PreH5 : (hc_same_bits retval b_pre )) (PreH6 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH7 : (hc_uconstant R 2143289344 vl_pre )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) ,
  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t retval_2 R_4 )
  **  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre ) ” 
  &&  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_12_pure := 
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH2 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH3 : (hc_legal_mask R vl_pre )) (PreH4 : (fp32_eq b_pre retval )) (PreH5 : (hc_same_bits retval b_pre )) (PreH6 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH7 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ”
) \/
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : ((R.(vbool32_t_s0) ) <= UINT_MAX)) (PreH4 : ((R.(vbool32_t_s1) ) <= UINT_MAX)) (PreH5 : ((R.(vbool32_t_s2) ) <= UINT_MAX)) (PreH6 : ((R.(vbool32_t_s3) ) <= UINT_MAX)) (PreH7 : ((R.(vbool32_t_s0) ) >= 0)) (PreH8 : ((R.(vbool32_t_s1) ) >= 0)) (PreH9 : ((R.(vbool32_t_s2) ) >= 0)) (PreH10 : ((R.(vbool32_t_s3) ) >= 0)) (PreH11 : (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH12 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH13 : (hc_legal_mask R vl_pre )) (PreH14 : (fp32_eq b_pre retval )) (PreH15 : (hc_same_bits retval b_pre )) (PreH16 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH17 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH18 : (0 <= vl_pre)) (PreH19 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ”
).

Definition hc_min_f32m1_partial_solve_wit_12_pure_split_goal_1 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : ((R.(vbool32_t_s0) ) <= UINT_MAX)) (PreH4 : ((R.(vbool32_t_s1) ) <= UINT_MAX)) (PreH5 : ((R.(vbool32_t_s2) ) <= UINT_MAX)) (PreH6 : ((R.(vbool32_t_s3) ) <= UINT_MAX)) (PreH7 : ((R.(vbool32_t_s0) ) >= 0)) (PreH8 : ((R.(vbool32_t_s1) ) >= 0)) (PreH9 : ((R.(vbool32_t_s2) ) >= 0)) (PreH10 : ((R.(vbool32_t_s3) ) >= 0)) (PreH11 : (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH12 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH13 : (hc_legal_mask R vl_pre )) (PreH14 : (fp32_eq b_pre retval )) (PreH15 : (hc_same_bits retval b_pre )) (PreH16 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH17 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH18 : (0 <= vl_pre)) (PreH19 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ”
.

Definition hc_min_f32m1_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH2 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH3 : (hc_legal_mask R vl_pre )) (PreH4 : (fp32_eq b_pre retval )) (PreH5 : (hc_same_bits retval b_pre )) (PreH6 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH7 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre ) ” 
  &&  “ (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R_2 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvfloat32m1_t ( &( "r" ) ) (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "qnan" ) ) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t ( &( "nan" ) ) (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) )
  **  (UndefStructPredvfloat32m1_t record_return )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_min_f32m1_partial_solve_wit_12 := hc_min_f32m1_partial_solve_wit_12_pure -> hc_min_f32m1_partial_solve_wit_12_aux.

Definition hc_min_f32m1_partial_solve_wit_13 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (R_5: Recordvfloat32m1_t) (retval_2: Z) (PreH1 : (hc_isa_merge R_5 (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_3 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  (StructPredvfloat32m1_t ( &( "r" ) ) (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "qnan" ) ) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t ( &( "nan" ) ) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) )
  **  (StructPredvfloat32m1_t retval_2 R_5 )
  **  (UndefStructPredvfloat32m1_t record_return )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_isa_merge R_5 (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_isa_min R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre ) ” 
  &&  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_5.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_5.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_5.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_5.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "r" ) ) (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "qnan" ) ) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t ( &( "nan" ) ) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

(*----- Function hc_max_f32m1 -----*)

Definition hc_max_f32m1_return_wit_1 := 
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R_4: Recordvbool32_t) (R_5: Recordvfloat32m1_t) (record_return: Z) (R_6: Recordvfloat32m1_t) (PreH1 : (hc_isa_merge R_6 (make_record_vfloat32m1_t ((R_5.(vfloat32m1_t_s0) )) ((R_5.(vfloat32m1_t_s1) )) ((R_5.(vfloat32m1_t_s2) )) ((R_5.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_4.(vbool32_t_s0) )) ((R_4.(vbool32_t_s1) )) ((R_4.(vbool32_t_s2) )) ((R_4.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_max R_5 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_4 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_6.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_6.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_6.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_6.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  EX (R: Recordvfloat32m1_t) ,
  “ (hc_clamp_max R A b_pre vl_pre ) ”
  &&  (StructPredvfloat32m1_t pa_pre A )
  **  (StructPredvfloat32m1_t record_return R )
) \/
(
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R_4: Recordvbool32_t) (R_5: Recordvfloat32m1_t) (R_6: Recordvfloat32m1_t) (PreH1 : (hc_isa_merge R_6 (make_record_vfloat32m1_t ((R_5.(vfloat32m1_t_s0) )) ((R_5.(vfloat32m1_t_s1) )) ((R_5.(vfloat32m1_t_s2) )) ((R_5.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_4.(vbool32_t_s0) )) ((R_4.(vbool32_t_s1) )) ((R_4.(vbool32_t_s2) )) ((R_4.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_max R_5 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_4 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  TT && emp 
|--
  “ (hc_clamp_max (make_record_vfloat32m1_t ((R_6.(vfloat32m1_t_s0) )) ((R_6.(vfloat32m1_t_s1) )) ((R_6.(vfloat32m1_t_s2) )) ((R_6.(vfloat32m1_t_s3) ))) A b_pre vl_pre ) ”
  &&  emp
).

Definition hc_max_f32m1_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R_4: Recordvbool32_t) (R_5: Recordvfloat32m1_t) (R_6: Recordvfloat32m1_t) (PreH1 : (hc_isa_merge R_6 (make_record_vfloat32m1_t ((R_5.(vfloat32m1_t_s0) )) ((R_5.(vfloat32m1_t_s1) )) ((R_5.(vfloat32m1_t_s2) )) ((R_5.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_4.(vbool32_t_s0) )) ((R_4.(vbool32_t_s1) )) ((R_4.(vbool32_t_s2) )) ((R_4.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_max R_5 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_4 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  (hc_clamp_max (make_record_vfloat32m1_t ((R_6.(vfloat32m1_t_s0) )) ((R_6.(vfloat32m1_t_s1) )) ((R_6.(vfloat32m1_t_s2) )) ((R_6.(vfloat32m1_t_s3) ))) A b_pre vl_pre )
.

Definition hc_max_f32m1_return_wit_2 := 
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (record_return: Z) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  EX (R: Recordvfloat32m1_t) ,
  “ (hc_clamp_max R A b_pre vl_pre ) ”
  &&  (StructPredvfloat32m1_t pa_pre A )
  **  (StructPredvfloat32m1_t record_return R )
) \/
(
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  TT && emp 
|--
  “ (hc_clamp_max (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) A b_pre vl_pre ) ”
  &&  emp
).

Definition hc_max_f32m1_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (b_pre: fp32) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (hc_clamp_max (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) A b_pre vl_pre )
.

Definition hc_max_f32m1_partial_solve_wit_1 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (StructPredvfloat32m1_t pa_pre A )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 4)) ,
  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
.

Definition hc_max_f32m1_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 4)) ,
  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_2 := hc_max_f32m1_partial_solve_wit_2_pure -> hc_max_f32m1_partial_solve_wit_2_aux.

Definition hc_max_f32m1_partial_solve_wit_3 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (retval: Z) (PreH1 : (hc_uconstant R 2143289344 vl_pre )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 4)) ,
  (StructPredvuint32m1_t retval R )
  **  (UndefStructPredvuint32m1_t ( &( "qbits" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "qbits" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s3")) # UInt  |-> (R.(vuint32m1_t_s3) ))
  **  ((&(( &( "qbits" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s2")) # UInt  |-> (R.(vuint32m1_t_s2) ))
  **  ((&(( &( "qbits" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s1")) # UInt  |-> (R.(vuint32m1_t_s1) ))
  **  ((&(( &( "qbits" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s0")) # UInt  |-> (R.(vuint32m1_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_4 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (PreH1 : (hc_uconstant R 2143289344 vl_pre )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "qnan" ) ) )
  **  ((&(( &( "qbits" ) )->ₛ "s3")) # UInt  |-> (R.(vuint32m1_t_s3) ))
  **  ((&(( &( "qbits" ) )->ₛ "s2")) # UInt  |-> (R.(vuint32m1_t_s2) ))
  **  ((&(( &( "qbits" ) )->ₛ "s1")) # UInt  |-> (R.(vuint32m1_t_s1) ))
  **  ((&(( &( "qbits" ) )->ₛ "s0")) # UInt  |-> (R.(vuint32m1_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  (UndefStructPredvfloat32m1_t ( &( "qnan" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_5 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH2 : (hc_uconstant R 2143289344 vl_pre )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 4)) ,
  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t retval R_2 )
  **  (UndefStructPredvfloat32m1_t ( &( "qnan" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_6 := 
forall (vl_pre: Z) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (PreH1 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH2 : (hc_uconstant R 2143289344 vl_pre )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 4)) ,
  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_7 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (record_return: Z) (PreH1 : (fp32_ne b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (fp32_ne b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_eq b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
.

Definition hc_max_f32m1_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (PreH1 : (fp32_eq b_pre retval )) (PreH2 : (hc_same_bits retval b_pre )) (PreH3 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH4 : (hc_uconstant R 2143289344 vl_pre )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_8 := hc_max_f32m1_partial_solve_wit_8_pure -> hc_max_f32m1_partial_solve_wit_8_aux.

Definition hc_max_f32m1_partial_solve_wit_9 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (retval_2: Z) (PreH1 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH2 : (hc_legal_mask R_3 vl_pre )) (PreH3 : (fp32_eq b_pre retval )) (PreH4 : (hc_same_bits retval b_pre )) (PreH5 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH6 : (hc_uconstant R 2143289344 vl_pre )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t retval_2 R_3 )
  **  (UndefStructPredvbool32_t ( &( "nan" ) ) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval_2)  # "vbool32_t" ->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (PreH1 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH2 : (hc_legal_mask R_3 vl_pre )) (PreH3 : (fp32_eq b_pre retval )) (PreH4 : (hc_same_bits retval b_pre )) (PreH5 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH6 : (hc_uconstant R 2143289344 vl_pre )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
.

Definition hc_max_f32m1_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (PreH1 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH2 : (hc_legal_mask R_3 vl_pre )) (PreH3 : (fp32_eq b_pre retval )) (PreH4 : (hc_same_bits retval b_pre )) (PreH5 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH6 : (hc_uconstant R 2143289344 vl_pre )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_10 := hc_max_f32m1_partial_solve_wit_10_pure -> hc_max_f32m1_partial_solve_wit_10_aux.

Definition hc_max_f32m1_partial_solve_wit_11 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (retval_2: Z) (PreH1 : (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH2 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH3 : (hc_legal_mask R_3 vl_pre )) (PreH4 : (fp32_eq b_pre retval )) (PreH5 : (hc_same_bits retval b_pre )) (PreH6 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH7 : (hc_uconstant R 2143289344 vl_pre )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) ,
  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t retval_2 R_4 )
  **  (UndefStructPredvfloat32m1_t ( &( "r" ) ) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre ) ” 
  &&  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R_3.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R_3.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R_3.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R_3.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_2.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_2.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_2.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_2.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_12_pure := 
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH2 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH3 : (hc_legal_mask R vl_pre )) (PreH4 : (fp32_eq b_pre retval )) (PreH5 : (hc_same_bits retval b_pre )) (PreH6 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH7 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ”
) \/
(
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : ((R.(vbool32_t_s0) ) <= UINT_MAX)) (PreH4 : ((R.(vbool32_t_s1) ) <= UINT_MAX)) (PreH5 : ((R.(vbool32_t_s2) ) <= UINT_MAX)) (PreH6 : ((R.(vbool32_t_s3) ) <= UINT_MAX)) (PreH7 : ((R.(vbool32_t_s0) ) >= 0)) (PreH8 : ((R.(vbool32_t_s1) ) >= 0)) (PreH9 : ((R.(vbool32_t_s2) ) >= 0)) (PreH10 : ((R.(vbool32_t_s3) ) >= 0)) (PreH11 : (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH12 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH13 : (hc_legal_mask R vl_pre )) (PreH14 : (fp32_eq b_pre retval )) (PreH15 : (hc_same_bits retval b_pre )) (PreH16 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH17 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH18 : (0 <= vl_pre)) (PreH19 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ”
).

Definition hc_max_f32m1_partial_solve_wit_12_pure_split_goal_1 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : ((R.(vbool32_t_s0) ) <= UINT_MAX)) (PreH4 : ((R.(vbool32_t_s1) ) <= UINT_MAX)) (PreH5 : ((R.(vbool32_t_s2) ) <= UINT_MAX)) (PreH6 : ((R.(vbool32_t_s3) ) <= UINT_MAX)) (PreH7 : ((R.(vbool32_t_s0) ) >= 0)) (PreH8 : ((R.(vbool32_t_s1) ) >= 0)) (PreH9 : ((R.(vbool32_t_s2) ) >= 0)) (PreH10 : ((R.(vbool32_t_s3) ) >= 0)) (PreH11 : (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH12 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH13 : (hc_legal_mask R vl_pre )) (PreH14 : (fp32_eq b_pre retval )) (PreH15 : (hc_same_bits retval b_pre )) (PreH16 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH17 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH18 : (0 <= vl_pre)) (PreH19 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((( &( "bc" ) )) # Float  |-> retval)
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ”
.

Definition hc_max_f32m1_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R_2: Recordvuint32m1_t) (R_3: Recordvfloat32m1_t) (retval: fp32) (R: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (PreH1 : (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH2 : (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH3 : (hc_legal_mask R vl_pre )) (PreH4 : (fp32_eq b_pre retval )) (PreH5 : (hc_same_bits retval b_pre )) (PreH6 : (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )) (PreH7 : (hc_uconstant R_2 2143289344 vl_pre )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> (R_4.(vfloat32m1_t_s3) ))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> (R_4.(vfloat32m1_t_s2) ))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> (R_4.(vfloat32m1_t_s1) ))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> (R_4.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  ((&(( &( "nan" ) )->ₛ "s3")) # UInt  |-> (R.(vbool32_t_s3) ))
  **  ((&(( &( "nan" ) )->ₛ "s2")) # UInt  |-> (R.(vbool32_t_s2) ))
  **  ((&(( &( "nan" ) )->ₛ "s1")) # UInt  |-> (R.(vbool32_t_s1) ))
  **  ((&(( &( "nan" ) )->ₛ "s0")) # UInt  |-> (R.(vbool32_t_s0) ))
  **  ((&(( &( "qnan" ) )->ₛ "s3")) # Float  |-> (R_3.(vfloat32m1_t_s3) ))
  **  ((&(( &( "qnan" ) )->ₛ "s2")) # Float  |-> (R_3.(vfloat32m1_t_s2) ))
  **  ((&(( &( "qnan" ) )->ₛ "s1")) # Float  |-> (R_3.(vfloat32m1_t_s1) ))
  **  ((&(( &( "qnan" ) )->ₛ "s0")) # Float  |-> (R_3.(vfloat32m1_t_s0) ))
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (hc_legal_mask (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre ) ” 
  &&  “ (hc_selfmask R (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_3 (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R_2 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (StructPredvfloat32m1_t ( &( "r" ) ) (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "qnan" ) ) (make_record_vfloat32m1_t ((R_3.(vfloat32m1_t_s0) )) ((R_3.(vfloat32m1_t_s1) )) ((R_3.(vfloat32m1_t_s2) )) ((R_3.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t ( &( "nan" ) ) (make_record_vbool32_t ((R.(vbool32_t_s0) )) ((R.(vbool32_t_s1) )) ((R.(vbool32_t_s2) )) ((R.(vbool32_t_s3) ))) )
  **  (UndefStructPredvfloat32m1_t record_return )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R_2.(vuint32m1_t_s0) )) ((R_2.(vuint32m1_t_s1) )) ((R_2.(vuint32m1_t_s2) )) ((R_2.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Definition hc_max_f32m1_partial_solve_wit_12 := hc_max_f32m1_partial_solve_wit_12_pure -> hc_max_f32m1_partial_solve_wit_12_aux.

Definition hc_max_f32m1_partial_solve_wit_13 := 
forall (vl_pre: Z) (b_pre: fp32) (pa_pre: Z) (A: Recordvfloat32m1_t) (R: Recordvuint32m1_t) (R_2: Recordvfloat32m1_t) (retval: fp32) (R_3: Recordvbool32_t) (R_4: Recordvfloat32m1_t) (record_return: Z) (R_5: Recordvfloat32m1_t) (retval_2: Z) (PreH1 : (hc_isa_merge R_5 (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) vl_pre )) (PreH2 : (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre )) (PreH3 : (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre )) (PreH4 : (hc_legal_mask R_3 vl_pre )) (PreH5 : (fp32_eq b_pre retval )) (PreH6 : (hc_same_bits retval b_pre )) (PreH7 : (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )) (PreH8 : (hc_uconstant R 2143289344 vl_pre )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 4)) ,
  (StructPredvfloat32m1_t ( &( "r" ) ) (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "qnan" ) ) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t ( &( "nan" ) ) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) )
  **  (StructPredvfloat32m1_t retval_2 R_5 )
  **  (UndefStructPredvfloat32m1_t record_return )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
|--
  “ (hc_isa_merge R_5 (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_isa_max R_4 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) b_pre vl_pre ) ” 
  &&  “ (hc_selfmask R_3 (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) vl_pre ) ” 
  &&  “ (hc_legal_mask R_3 vl_pre ) ” 
  &&  “ (fp32_eq b_pre retval ) ” 
  &&  “ (hc_same_bits retval b_pre ) ” 
  &&  “ (hc_reinterpret R_2 (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) ) ” 
  &&  “ (hc_uconstant R 2143289344 vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R_5.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R_5.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R_5.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R_5.(vfloat32m1_t_s0) ))
  **  (StructPredvfloat32m1_t ( &( "r" ) ) (make_record_vfloat32m1_t ((R_4.(vfloat32m1_t_s0) )) ((R_4.(vfloat32m1_t_s1) )) ((R_4.(vfloat32m1_t_s2) )) ((R_4.(vfloat32m1_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "qnan" ) ) (make_record_vfloat32m1_t ((R_2.(vfloat32m1_t_s0) )) ((R_2.(vfloat32m1_t_s1) )) ((R_2.(vfloat32m1_t_s2) )) ((R_2.(vfloat32m1_t_s3) ))) )
  **  (StructPredvbool32_t ( &( "nan" ) ) (make_record_vbool32_t ((R_3.(vbool32_t_s0) )) ((R_3.(vbool32_t_s1) )) ((R_3.(vbool32_t_s2) )) ((R_3.(vbool32_t_s3) ))) )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) )
  **  (StructPredvuint32m1_t ( &( "qbits" ) ) (make_record_vuint32m1_t ((R.(vuint32m1_t_s0) )) ((R.(vuint32m1_t_s1) )) ((R.(vuint32m1_t_s2) )) ((R.(vuint32m1_t_s3) ))) )
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((pa_pre)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
.

Module Type VC_Correct.


Axiom proof_of_hc_min_f32m1_return_wit_1 : hc_min_f32m1_return_wit_1.
Axiom proof_of_hc_min_f32m1_return_wit_2 : hc_min_f32m1_return_wit_2.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_1 : hc_min_f32m1_partial_solve_wit_1.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_2_pure : hc_min_f32m1_partial_solve_wit_2_pure.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_2 : hc_min_f32m1_partial_solve_wit_2.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_3 : hc_min_f32m1_partial_solve_wit_3.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_4 : hc_min_f32m1_partial_solve_wit_4.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_5 : hc_min_f32m1_partial_solve_wit_5.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_6 : hc_min_f32m1_partial_solve_wit_6.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_7 : hc_min_f32m1_partial_solve_wit_7.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_8_pure : hc_min_f32m1_partial_solve_wit_8_pure.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_8 : hc_min_f32m1_partial_solve_wit_8.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_9 : hc_min_f32m1_partial_solve_wit_9.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_10_pure : hc_min_f32m1_partial_solve_wit_10_pure.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_10 : hc_min_f32m1_partial_solve_wit_10.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_11 : hc_min_f32m1_partial_solve_wit_11.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_12_pure : hc_min_f32m1_partial_solve_wit_12_pure.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_12 : hc_min_f32m1_partial_solve_wit_12.
Axiom proof_of_hc_min_f32m1_partial_solve_wit_13 : hc_min_f32m1_partial_solve_wit_13.
Axiom proof_of_hc_max_f32m1_return_wit_1 : hc_max_f32m1_return_wit_1.
Axiom proof_of_hc_max_f32m1_return_wit_2 : hc_max_f32m1_return_wit_2.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_1 : hc_max_f32m1_partial_solve_wit_1.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_2_pure : hc_max_f32m1_partial_solve_wit_2_pure.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_2 : hc_max_f32m1_partial_solve_wit_2.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_3 : hc_max_f32m1_partial_solve_wit_3.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_4 : hc_max_f32m1_partial_solve_wit_4.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_5 : hc_max_f32m1_partial_solve_wit_5.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_6 : hc_max_f32m1_partial_solve_wit_6.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_7 : hc_max_f32m1_partial_solve_wit_7.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_8_pure : hc_max_f32m1_partial_solve_wit_8_pure.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_8 : hc_max_f32m1_partial_solve_wit_8.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_9 : hc_max_f32m1_partial_solve_wit_9.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_10_pure : hc_max_f32m1_partial_solve_wit_10_pure.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_10 : hc_max_f32m1_partial_solve_wit_10.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_11 : hc_max_f32m1_partial_solve_wit_11.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_12_pure : hc_max_f32m1_partial_solve_wit_12_pure.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_12 : hc_max_f32m1_partial_solve_wit_12.
Axiom proof_of_hc_max_f32m1_partial_solve_wit_13 : hc_max_f32m1_partial_solve_wit_13.

End VC_Correct.
