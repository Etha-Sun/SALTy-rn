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
Require Import DwChw.Types.
Require Import DwChw.TerminalModel.
Local Open Scope sac.

(*----- Function dw_n_vget_low_f32 -----*)

Definition dw_n_vget_low_f32_return_wit_1 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
.

Definition dw_n_vget_low_f32_partial_solve_wit_1 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vget_low_f32_partial_solve_wit_2 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  (UndefStructPredfloat32x2_t record_return )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vget_low_f32_partial_solve_wit_3 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  (UndefStructPredfloat32x2_t record_return )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
.

(*----- Function dw_n_vget_high_f32 -----*)

Definition dw_n_vget_high_f32_return_wit_1 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a2)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a3)
.

Definition dw_n_vget_high_f32_partial_solve_wit_1 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vget_high_f32_partial_solve_wit_2 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  (UndefStructPredfloat32x2_t record_return )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vget_high_f32_partial_solve_wit_3 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a2)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a3)
  **  (UndefStructPredfloat32x2_t record_return )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
|--
  ((&((record_return)  # "float32x2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a3)
  **  ((&((record_return)  # "float32x2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
.

(*----- Function dw_n_vdupq_lane_f32 -----*)

Definition dw_n_vdupq_lane_f32_return_wit_1 := 
forall (lane_pre: Z) (p_a_pre: Z) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
.

Definition dw_n_vdupq_lane_f32_partial_solve_wit_1 := 
forall (lane_pre: Z) (p_a_pre: Z) (a1: fp32) (a0: fp32) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x2_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vdupq_lane_f32_partial_solve_wit_2_pure := 
forall (lane_pre: Z) (p_a_pre: Z) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
.

Definition dw_n_vdupq_lane_f32_partial_solve_wit_2_aux := 
forall (lane_pre: Z) (p_a_pre: Z) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vdupq_lane_f32_partial_solve_wit_2 := dw_n_vdupq_lane_f32_partial_solve_wit_2_pure -> dw_n_vdupq_lane_f32_partial_solve_wit_2_aux.

Definition dw_n_vdupq_lane_f32_partial_solve_wit_3 := 
forall (lane_pre: Z) (p_a_pre: Z) (a1: fp32) (a0: fp32) (record_return: Z) (retval: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_fp2 (a0) (a1) (lane_pre)))
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
.

(*----- Function dw_n_vextq_f32 -----*)

Definition dw_n_vextq_f32_return_wit_1 := 
forall (k_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= k_pre)) (PreH2 : (k_pre < 4)) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (0)))
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (3)))
.

Definition dw_n_vextq_f32_partial_solve_wit_1 := 
forall (k_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= k_pre)) (PreH2 : (k_pre < 4)) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
|--
  “ (0 <= k_pre) ” 
  &&  “ (k_pre < 4) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
.

Definition dw_n_vextq_f32_partial_solve_wit_2 := 
forall (k_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= k_pre)) (PreH2 : (k_pre < 4)) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
|--
  “ (0 <= k_pre) ” 
  &&  “ (k_pre < 4) ”
  &&  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vextq_f32_partial_solve_wit_3_pure := 
forall (k_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= k_pre)) (PreH2 : (k_pre < 4)) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  ((( &( "p_b" ) )) # Ptr  |-> p_b_pre)
  **  ((( &( "k" ) )) # Int  |-> k_pre)
|--
  “ (0 <= k_pre) ” 
  &&  “ (k_pre < 4) ”
.

Definition dw_n_vextq_f32_partial_solve_wit_3_aux := 
forall (k_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= k_pre)) (PreH2 : (k_pre < 4)) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  “ (0 <= k_pre) ” 
  &&  “ (k_pre < 4) ” 
  &&  “ (0 <= k_pre) ” 
  &&  “ (k_pre < 4) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vextq_f32_partial_solve_wit_3 := dw_n_vextq_f32_partial_solve_wit_3_pure -> dw_n_vextq_f32_partial_solve_wit_3_aux.

Definition dw_n_vextq_f32_partial_solve_wit_4 := 
forall (k_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (retval: Z) (PreH1 : (0 <= k_pre)) (PreH2 : (k_pre < 4)) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (0)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (1)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (2)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (3)))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  “ (0 <= k_pre) ” 
  &&  “ (k_pre < 4) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_ext ((dw_fp4 (a0) (a1) (a2) (a3))) ((dw_fp4 (b0) (b1) (b2) (b3))) (k_pre) (0)))
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

(*----- Function dw_n_vfmaq_lane_f32 -----*)

Definition dw_n_vfmaq_lane_f32_return_wit_1 := 
forall (lane_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (p_c_pre: Z) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (record_return: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_fma (c3) (a3) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_fma (c2) (a2) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_fma (c1) (a1) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_fma (c0) (a0) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
|--
  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_fma (c0) (a0) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_fma (c1) (a1) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_fma (c2) (a2) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_fma (c3) (a3) ((dw_fp2 (b0) (b1) (lane_pre)))))
.

Definition dw_n_vfmaq_lane_f32_partial_solve_wit_1 := 
forall (lane_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (p_c_pre: Z) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x4_t ( &( "c" ) ) )
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&(( &( "c" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
.

Definition dw_n_vfmaq_lane_f32_partial_solve_wit_2 := 
forall (lane_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (p_c_pre: Z) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
.

Definition dw_n_vfmaq_lane_f32_partial_solve_wit_3 := 
forall (lane_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (p_c_pre: Z) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x2_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
.

Definition dw_n_vfmaq_lane_f32_partial_solve_wit_4_pure := 
forall (lane_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (p_c_pre: Z) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (record_return: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((( &( "p_c" ) )) # Ptr  |-> p_c_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  ((( &( "p_b" ) )) # Ptr  |-> p_b_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
.

Definition dw_n_vfmaq_lane_f32_partial_solve_wit_4_aux := 
forall (lane_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (p_c_pre: Z) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (record_return: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
.

Definition dw_n_vfmaq_lane_f32_partial_solve_wit_4 := dw_n_vfmaq_lane_f32_partial_solve_wit_4_pure -> dw_n_vfmaq_lane_f32_partial_solve_wit_4_aux.

Definition dw_n_vfmaq_lane_f32_partial_solve_wit_5 := 
forall (lane_pre: Z) (p_b_pre: Z) (p_a_pre: Z) (p_c_pre: Z) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (record_return: Z) (retval: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 2)) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_fma (c0) (a0) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_fma (c1) (a1) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_fma (c2) (a2) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_fma (c3) (a3) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 2) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_fma (c3) (a3) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_fma (c2) (a2) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_fma (c1) (a1) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_fma (c0) (a0) ((dw_fp2 (b0) (b1) (lane_pre)))))
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> c3)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> c2)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> c1)
  **  ((&((p_c_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
.

(*----- Function dw_n_vmaxq_f32 -----*)

Definition dw_n_vmaxq_f32_return_wit_1 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_max (a3) (b3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_max (a2) (b2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_max (a1) (b1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_max (a0) (b0)))
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_max (a0) (b0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_max (a1) (b1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_max (a2) (b2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_max (a3) (b3)))
.

Definition dw_n_vmaxq_f32_partial_solve_wit_1 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
.

Definition dw_n_vmaxq_f32_partial_solve_wit_2 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
|--
  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vmaxq_f32_partial_solve_wit_3 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vmaxq_f32_partial_solve_wit_4 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_max (a0) (b0)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_max (a1) (b1)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_max (a2) (b2)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_max (a3) (b3)))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_max (a3) (b3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_max (a2) (b2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_max (a1) (b1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_max (a0) (b0)))
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

(*----- Function dw_n_vminq_f32 -----*)

Definition dw_n_vminq_f32_return_wit_1 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_min (a3) (b3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_min (a2) (b2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_min (a1) (b1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_min (a0) (b0)))
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_min (a0) (b0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_min (a1) (b1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_min (a2) (b2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_min (a3) (b3)))
.

Definition dw_n_vminq_f32_partial_solve_wit_1 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
.

Definition dw_n_vminq_f32_partial_solve_wit_2 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
|--
  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vminq_f32_partial_solve_wit_3 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vminq_f32_partial_solve_wit_4 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_min (a0) (b0)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_min (a1) (b1)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_min (a2) (b2)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_min (a3) (b3)))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (dw_arm_min (a3) (b3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (dw_arm_min (a2) (b2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (dw_arm_min (a1) (b1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (dw_arm_min (a0) (b0)))
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((p_b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

(*----- Function dw_n_vandq_u32 -----*)

Definition dw_n_vandq_u32_return_wit_1 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (3)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (0)))
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
|--
  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (0)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (3)))
.

Definition dw_n_vandq_u32_partial_solve_wit_1 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  (UndefStructPreduint32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
|--
  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
.

Definition dw_n_vandq_u32_partial_solve_wit_2 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  (UndefStructPreduint32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
|--
  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
.

Definition dw_n_vandq_u32_partial_solve_wit_3 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
  **  (UndefStructPreduint32x4_t record_return )
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
.

Definition dw_n_vandq_u32_partial_solve_wit_4 := 
forall (p_b_pre: Z) (p_a_pre: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (0)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (1)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (2)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (3)))
  **  (UndefStructPreduint32x4_t record_return )
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (3)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (dw_arm_and ((dw_u4 (a0) (a1) (a2) (a3))) ((dw_u4 (b0) (b1) (b2) (b3))) (0)))
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> b3)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> b2)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> b1)
  **  ((&((p_b_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

(*----- Function dw_n_vreinterpretq_u32_f32 -----*)

Definition dw_n_vreinterpretq_u32_f32_return_wit_1 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (bits_of_fp32 (a3)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (bits_of_fp32 (a2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (bits_of_fp32 (a1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (bits_of_fp32 (a0)))
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (bits_of_fp32 (a0)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (bits_of_fp32 (a1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (bits_of_fp32 (a2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (bits_of_fp32 (a3)))
.

Definition dw_n_vreinterpretq_u32_f32_partial_solve_wit_1 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vreinterpretq_u32_f32_partial_solve_wit_2 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  (UndefStructPreduint32x4_t record_return )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_n_vreinterpretq_u32_f32_partial_solve_wit_3 := 
forall (p_a_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (bits_of_fp32 (a0)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (bits_of_fp32 (a1)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (bits_of_fp32 (a2)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (bits_of_fp32 (a3)))
  **  (UndefStructPreduint32x4_t record_return )
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (bits_of_fp32 (a3)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (bits_of_fp32 (a2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (bits_of_fp32 (a1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (bits_of_fp32 (a0)))
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
.

(*----- Function dw_n_vreinterpretq_f32_u32 -----*)

Definition dw_n_vreinterpretq_f32_u32_return_wit_1 := 
forall (p_a_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_of_bits (a3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_of_bits (a2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_of_bits (a1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_of_bits (a0)))
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
|--
  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_of_bits (a0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_of_bits (a1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_of_bits (a2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_of_bits (a3)))
.

Definition dw_n_vreinterpretq_f32_u32_partial_solve_wit_1 := 
forall (p_a_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  (UndefStructPreduint32x4_t ( &( "a" ) ) )
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
.

Definition dw_n_vreinterpretq_f32_u32_partial_solve_wit_2 := 
forall (p_a_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
.

Definition dw_n_vreinterpretq_f32_u32_partial_solve_wit_3 := 
forall (p_a_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (retval: Z) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_of_bits (a0)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_of_bits (a1)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_of_bits (a2)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_of_bits (a3)))
  **  (UndefStructPredfloat32x4_t record_return )
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_of_bits (a3)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_of_bits (a2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_of_bits (a1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_of_bits (a0)))
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((p_a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
.

(*----- Function dw_n_vst1q_f32 -----*)

Definition dw_n_vst1q_f32_safety_wit_1 := 
forall (p_a_pre: Z) (p_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition dw_n_vst1q_f32_safety_wit_2 := 
forall (p_a_pre: Z) (p_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_n_vst1q_f32_safety_wit_3 := 
forall (p_a_pre: Z) (p_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> a1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition dw_n_vst1q_f32_safety_wit_4 := 
forall (p_a_pre: Z) (p_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> a1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> a2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition dw_n_vst1q_f32_return_wit_1 := 
forall (p_a_pre: Z) (p_pre: Z) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> a1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> a2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> a1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> a2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> a3)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> a3)
.

(*----- Function dw_n_vst1_f32 -----*)

Definition dw_n_vst1_f32_safety_wit_1 := 
forall (p_a_pre: Z) (p_pre: Z) (a1: fp32) (a0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition dw_n_vst1_f32_safety_wit_2 := 
forall (p_a_pre: Z) (p_pre: Z) (a1: fp32) (a0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_n_vst1_f32_return_wit_1 := 
forall (p_a_pre: Z) (p_pre: Z) (a1: fp32) (a0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> a1)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
.

(*----- Function dw_n_vst1_lane_f32 -----*)

Definition dw_n_vst1_lane_f32_safety_wit_1 := 
forall (lane_pre: Z) (p_a_pre: Z) (p_pre: Z) (a1: fp32) (a0: fp32) (PreH1 : (lane_pre = 0)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p_a" ) )) # Ptr  |-> p_a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition dw_n_vst1_lane_f32_return_wit_1 := 
forall (lane_pre: Z) (p_a_pre: Z) (p_pre: Z) (a1: fp32) (a0: fp32) (PreH1 : (lane_pre = 0)) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> a1)
.

Module Type VC_Correct.


Axiom proof_of_dw_n_vget_low_f32_return_wit_1 : dw_n_vget_low_f32_return_wit_1.
Axiom proof_of_dw_n_vget_low_f32_partial_solve_wit_1 : dw_n_vget_low_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vget_low_f32_partial_solve_wit_2 : dw_n_vget_low_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vget_low_f32_partial_solve_wit_3 : dw_n_vget_low_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vget_high_f32_return_wit_1 : dw_n_vget_high_f32_return_wit_1.
Axiom proof_of_dw_n_vget_high_f32_partial_solve_wit_1 : dw_n_vget_high_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vget_high_f32_partial_solve_wit_2 : dw_n_vget_high_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vget_high_f32_partial_solve_wit_3 : dw_n_vget_high_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vdupq_lane_f32_return_wit_1 : dw_n_vdupq_lane_f32_return_wit_1.
Axiom proof_of_dw_n_vdupq_lane_f32_partial_solve_wit_1 : dw_n_vdupq_lane_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vdupq_lane_f32_partial_solve_wit_2_pure : dw_n_vdupq_lane_f32_partial_solve_wit_2_pure.
Axiom proof_of_dw_n_vdupq_lane_f32_partial_solve_wit_2 : dw_n_vdupq_lane_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vdupq_lane_f32_partial_solve_wit_3 : dw_n_vdupq_lane_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vextq_f32_return_wit_1 : dw_n_vextq_f32_return_wit_1.
Axiom proof_of_dw_n_vextq_f32_partial_solve_wit_1 : dw_n_vextq_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vextq_f32_partial_solve_wit_2 : dw_n_vextq_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vextq_f32_partial_solve_wit_3_pure : dw_n_vextq_f32_partial_solve_wit_3_pure.
Axiom proof_of_dw_n_vextq_f32_partial_solve_wit_3 : dw_n_vextq_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vextq_f32_partial_solve_wit_4 : dw_n_vextq_f32_partial_solve_wit_4.
Axiom proof_of_dw_n_vfmaq_lane_f32_return_wit_1 : dw_n_vfmaq_lane_f32_return_wit_1.
Axiom proof_of_dw_n_vfmaq_lane_f32_partial_solve_wit_1 : dw_n_vfmaq_lane_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vfmaq_lane_f32_partial_solve_wit_2 : dw_n_vfmaq_lane_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vfmaq_lane_f32_partial_solve_wit_3 : dw_n_vfmaq_lane_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vfmaq_lane_f32_partial_solve_wit_4_pure : dw_n_vfmaq_lane_f32_partial_solve_wit_4_pure.
Axiom proof_of_dw_n_vfmaq_lane_f32_partial_solve_wit_4 : dw_n_vfmaq_lane_f32_partial_solve_wit_4.
Axiom proof_of_dw_n_vfmaq_lane_f32_partial_solve_wit_5 : dw_n_vfmaq_lane_f32_partial_solve_wit_5.
Axiom proof_of_dw_n_vmaxq_f32_return_wit_1 : dw_n_vmaxq_f32_return_wit_1.
Axiom proof_of_dw_n_vmaxq_f32_partial_solve_wit_1 : dw_n_vmaxq_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vmaxq_f32_partial_solve_wit_2 : dw_n_vmaxq_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vmaxq_f32_partial_solve_wit_3 : dw_n_vmaxq_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vmaxq_f32_partial_solve_wit_4 : dw_n_vmaxq_f32_partial_solve_wit_4.
Axiom proof_of_dw_n_vminq_f32_return_wit_1 : dw_n_vminq_f32_return_wit_1.
Axiom proof_of_dw_n_vminq_f32_partial_solve_wit_1 : dw_n_vminq_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vminq_f32_partial_solve_wit_2 : dw_n_vminq_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vminq_f32_partial_solve_wit_3 : dw_n_vminq_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vminq_f32_partial_solve_wit_4 : dw_n_vminq_f32_partial_solve_wit_4.
Axiom proof_of_dw_n_vandq_u32_return_wit_1 : dw_n_vandq_u32_return_wit_1.
Axiom proof_of_dw_n_vandq_u32_partial_solve_wit_1 : dw_n_vandq_u32_partial_solve_wit_1.
Axiom proof_of_dw_n_vandq_u32_partial_solve_wit_2 : dw_n_vandq_u32_partial_solve_wit_2.
Axiom proof_of_dw_n_vandq_u32_partial_solve_wit_3 : dw_n_vandq_u32_partial_solve_wit_3.
Axiom proof_of_dw_n_vandq_u32_partial_solve_wit_4 : dw_n_vandq_u32_partial_solve_wit_4.
Axiom proof_of_dw_n_vreinterpretq_u32_f32_return_wit_1 : dw_n_vreinterpretq_u32_f32_return_wit_1.
Axiom proof_of_dw_n_vreinterpretq_u32_f32_partial_solve_wit_1 : dw_n_vreinterpretq_u32_f32_partial_solve_wit_1.
Axiom proof_of_dw_n_vreinterpretq_u32_f32_partial_solve_wit_2 : dw_n_vreinterpretq_u32_f32_partial_solve_wit_2.
Axiom proof_of_dw_n_vreinterpretq_u32_f32_partial_solve_wit_3 : dw_n_vreinterpretq_u32_f32_partial_solve_wit_3.
Axiom proof_of_dw_n_vreinterpretq_f32_u32_return_wit_1 : dw_n_vreinterpretq_f32_u32_return_wit_1.
Axiom proof_of_dw_n_vreinterpretq_f32_u32_partial_solve_wit_1 : dw_n_vreinterpretq_f32_u32_partial_solve_wit_1.
Axiom proof_of_dw_n_vreinterpretq_f32_u32_partial_solve_wit_2 : dw_n_vreinterpretq_f32_u32_partial_solve_wit_2.
Axiom proof_of_dw_n_vreinterpretq_f32_u32_partial_solve_wit_3 : dw_n_vreinterpretq_f32_u32_partial_solve_wit_3.
Axiom proof_of_dw_n_vst1q_f32_safety_wit_1 : dw_n_vst1q_f32_safety_wit_1.
Axiom proof_of_dw_n_vst1q_f32_safety_wit_2 : dw_n_vst1q_f32_safety_wit_2.
Axiom proof_of_dw_n_vst1q_f32_safety_wit_3 : dw_n_vst1q_f32_safety_wit_3.
Axiom proof_of_dw_n_vst1q_f32_safety_wit_4 : dw_n_vst1q_f32_safety_wit_4.
Axiom proof_of_dw_n_vst1q_f32_return_wit_1 : dw_n_vst1q_f32_return_wit_1.
Axiom proof_of_dw_n_vst1_f32_safety_wit_1 : dw_n_vst1_f32_safety_wit_1.
Axiom proof_of_dw_n_vst1_f32_safety_wit_2 : dw_n_vst1_f32_safety_wit_2.
Axiom proof_of_dw_n_vst1_f32_return_wit_1 : dw_n_vst1_f32_return_wit_1.
Axiom proof_of_dw_n_vst1_lane_f32_safety_wit_1 : dw_n_vst1_lane_f32_safety_wit_1.
Axiom proof_of_dw_n_vst1_lane_f32_return_wit_1 : dw_n_vst1_lane_f32_return_wit_1.

End VC_Correct.
