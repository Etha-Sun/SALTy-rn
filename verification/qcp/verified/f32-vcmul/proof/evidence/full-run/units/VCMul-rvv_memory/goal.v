Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Reals.Reals.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope R_scope.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import VCMul.Model.
Require Import VCMul.RvvMemoryModel.
Local Open Scope sac.

(*----- Function qcp_vcmul_read_lane -----*)

Definition qcp_vcmul_read_lane_entail_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth (idx + i_pre ) L __default_fp32))
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
|--
  (FloatArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth (idx + i_pre ) L __default_fp32))
).

Definition qcp_vcmul_read_lane_entail_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
|--
  (FloatArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth (idx + i_pre ) L __default_fp32))
.

Definition qcp_vcmul_read_lane_entail_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth (idx + i_pre ) L __default_fp32))
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth (idx + i_pre ) L __default_fp32))
|--
  (FloatArray.full base count L )
).

Definition qcp_vcmul_read_lane_entail_wit_2_split_goal_spatial := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth (idx + i_pre ) L __default_fp32))
|--
  (FloatArray.full base count L )
.

Definition qcp_vcmul_read_lane_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_read_lane_model (i_pre) (vl_pre) (idx) (L)) ) ”
  &&  (FloatArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_read_lane_model (i_pre) (vl_pre) (idx) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_read_lane_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (same_fp32 (fp32_of_real (0.0)) (vcmul_read_lane_model (i_pre) (vl_pre) (idx) (L)) )
.

Definition qcp_vcmul_read_lane_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
|--
  “ (same_fp32 (Znth (idx + i_pre ) L __default_fp32) (vcmul_read_lane_model (i_pre) (vl_pre) (idx) (L)) ) ”
  &&  (FloatArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  TT && emp 
|--
  “ (same_fp32 (Znth (idx + i_pre ) L __default_fp32) (vcmul_read_lane_model (i_pre) (vl_pre) (idx) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_read_lane_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z)  __default_fp32 (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (same_fp32 (Znth (idx + i_pre ) L __default_fp32) (vcmul_read_lane_model (i_pre) (vl_pre) (idx) (L)) )
.

(*----- Function qcp_vcmul_load16 -----*)

Definition qcp_vcmul_load16_safety_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (0 <= idx)) (PreH4 : ((idx + vl_pre ) <= count)) (PreH5 : (p_pre = (base + (4 * idx ) ))) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (FloatArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_vcmul_load16_safety_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + vl_pre ) <= count)) (PreH6 : (p_pre = (base + (4 * idx ) ))) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  (FloatArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_vcmul_load16_safety_wit_3 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (0 <= idx)) (PreH6 : ((idx + vl_pre ) <= count)) (PreH7 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_vcmul_load16_safety_wit_4 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_vcmul_load16_safety_wit_5 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + vl_pre ) <= count)) (PreH9 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_vcmul_load16_safety_wit_6 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) (PreH8 : (0 <= idx)) (PreH9 : ((idx + vl_pre ) <= count)) (PreH10 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_vcmul_load16_safety_wit_7 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (0 <= idx)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_vcmul_load16_safety_wit_8 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (0 <= idx)) (PreH11 : ((idx + vl_pre ) <= count)) (PreH12 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_vcmul_load16_safety_wit_9 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) (PreH11 : (0 <= idx)) (PreH12 : ((idx + vl_pre ) <= count)) (PreH13 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qcp_vcmul_load16_safety_wit_10 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) (PreH12 : (0 <= idx)) (PreH13 : ((idx + vl_pre ) <= count)) (PreH14 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qcp_vcmul_load16_safety_wit_11 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) (PreH13 : (0 <= idx)) (PreH14 : ((idx + vl_pre ) <= count)) (PreH15 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qcp_vcmul_load16_safety_wit_12 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) (PreH14 : (0 <= idx)) (PreH15 : ((idx + vl_pre ) <= count)) (PreH16 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qcp_vcmul_load16_safety_wit_13 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) (PreH15 : (0 <= idx)) (PreH16 : ((idx + vl_pre ) <= count)) (PreH17 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qcp_vcmul_load16_safety_wit_14 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) (PreH16 : (0 <= idx)) (PreH17 : ((idx + vl_pre ) <= count)) (PreH18 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_vcmul_load16_safety_wit_15 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) (PreH17 : (0 <= idx)) (PreH18 : ((idx + vl_pre ) <= count)) (PreH19 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qcp_vcmul_load16_safety_wit_16 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) (PreH18 : (0 <= idx)) (PreH19 : ((idx + vl_pre ) <= count)) (PreH20 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qcp_vcmul_load16_return_wit_1 := 
(
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> retval)
  **  (FloatArray.full base count L )
|--
  (FloatArray.full base count L )
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (vcmul_read_lane_model (0) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (vcmul_read_lane_model (1) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (vcmul_read_lane_model (2) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (vcmul_read_lane_model (3) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (vcmul_read_lane_model (4) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (vcmul_read_lane_model (5) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (vcmul_read_lane_model (6) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (vcmul_read_lane_model (7) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (vcmul_read_lane_model (8) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (vcmul_read_lane_model (9) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (vcmul_read_lane_model (10) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (vcmul_read_lane_model (11) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (vcmul_read_lane_model (12) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (vcmul_read_lane_model (13) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (vcmul_read_lane_model (14) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (vcmul_read_lane_model (15) (vl_pre) (idx) (L)))
) \/
(
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  TT && emp 
|--
  “ (fp32_eq retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L))) ” 
  &&  “ (fp32_eq retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L))) ”
  &&  emp
).

Definition qcp_vcmul_load16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_2 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_3 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_4 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_5 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_6 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_7 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_8 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_9 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_10 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_11 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_12 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_13 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_14 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_15 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_return_wit_1_split_goal_16 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (fp32_eq retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)))
.

Definition qcp_vcmul_load16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (0 <= idx)) (PreH4 : ((idx + vl_pre ) <= count)) (PreH5 : (p_pre = (base + (4 * idx ) ))) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (FloatArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (0 <= idx)) (PreH4 : ((idx + vl_pre ) <= count)) (PreH5 : (p_pre = (base + (4 * idx ) ))) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  (FloatArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
.

Definition qcp_vcmul_load16_partial_solve_wit_1 := qcp_vcmul_load16_partial_solve_wit_1_pure -> qcp_vcmul_load16_partial_solve_wit_1_aux.

Definition qcp_vcmul_load16_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + vl_pre ) <= count)) (PreH6 : (p_pre = (base + (4 * idx ) ))) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  (FloatArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + vl_pre ) <= count)) (PreH6 : (p_pre = (base + (4 * idx ) ))) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  (FloatArray.full base count L )
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_2 := qcp_vcmul_load16_partial_solve_wit_2_pure -> qcp_vcmul_load16_partial_solve_wit_2_aux.

Definition qcp_vcmul_load16_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (0 <= idx)) (PreH6 : ((idx + vl_pre ) <= count)) (PreH7 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (0 <= idx)) (PreH6 : ((idx + vl_pre ) <= count)) (PreH7 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_3 := qcp_vcmul_load16_partial_solve_wit_3_pure -> qcp_vcmul_load16_partial_solve_wit_3_aux.

Definition qcp_vcmul_load16_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_4 := qcp_vcmul_load16_partial_solve_wit_4_pure -> qcp_vcmul_load16_partial_solve_wit_4_aux.

Definition qcp_vcmul_load16_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + vl_pre ) <= count)) (PreH9 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + vl_pre ) <= count)) (PreH9 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_5 := qcp_vcmul_load16_partial_solve_wit_5_pure -> qcp_vcmul_load16_partial_solve_wit_5_aux.

Definition qcp_vcmul_load16_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) (PreH8 : (0 <= idx)) (PreH9 : ((idx + vl_pre ) <= count)) (PreH10 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) (PreH8 : (0 <= idx)) (PreH9 : ((idx + vl_pre ) <= count)) (PreH10 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_6 := qcp_vcmul_load16_partial_solve_wit_6_pure -> qcp_vcmul_load16_partial_solve_wit_6_aux.

Definition qcp_vcmul_load16_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (0 <= idx)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (0 <= idx)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_7 := qcp_vcmul_load16_partial_solve_wit_7_pure -> qcp_vcmul_load16_partial_solve_wit_7_aux.

Definition qcp_vcmul_load16_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (0 <= idx)) (PreH11 : ((idx + vl_pre ) <= count)) (PreH12 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (0 <= idx)) (PreH11 : ((idx + vl_pre ) <= count)) (PreH12 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_8 := qcp_vcmul_load16_partial_solve_wit_8_pure -> qcp_vcmul_load16_partial_solve_wit_8_aux.

Definition qcp_vcmul_load16_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) (PreH11 : (0 <= idx)) (PreH12 : ((idx + vl_pre ) <= count)) (PreH13 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) (PreH11 : (0 <= idx)) (PreH12 : ((idx + vl_pre ) <= count)) (PreH13 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_9 := qcp_vcmul_load16_partial_solve_wit_9_pure -> qcp_vcmul_load16_partial_solve_wit_9_aux.

Definition qcp_vcmul_load16_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) (PreH12 : (0 <= idx)) (PreH13 : ((idx + vl_pre ) <= count)) (PreH14 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) (PreH12 : (0 <= idx)) (PreH13 : ((idx + vl_pre ) <= count)) (PreH14 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_10 := qcp_vcmul_load16_partial_solve_wit_10_pure -> qcp_vcmul_load16_partial_solve_wit_10_aux.

Definition qcp_vcmul_load16_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) (PreH13 : (0 <= idx)) (PreH14 : ((idx + vl_pre ) <= count)) (PreH15 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) (PreH13 : (0 <= idx)) (PreH14 : ((idx + vl_pre ) <= count)) (PreH15 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_11 := qcp_vcmul_load16_partial_solve_wit_11_pure -> qcp_vcmul_load16_partial_solve_wit_11_aux.

Definition qcp_vcmul_load16_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) (PreH14 : (0 <= idx)) (PreH15 : ((idx + vl_pre ) <= count)) (PreH16 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) (PreH14 : (0 <= idx)) (PreH15 : ((idx + vl_pre ) <= count)) (PreH16 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_12 := qcp_vcmul_load16_partial_solve_wit_12_pure -> qcp_vcmul_load16_partial_solve_wit_12_aux.

Definition qcp_vcmul_load16_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) (PreH15 : (0 <= idx)) (PreH16 : ((idx + vl_pre ) <= count)) (PreH17 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) (PreH15 : (0 <= idx)) (PreH16 : ((idx + vl_pre ) <= count)) (PreH17 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_13 := qcp_vcmul_load16_partial_solve_wit_13_pure -> qcp_vcmul_load16_partial_solve_wit_13_aux.

Definition qcp_vcmul_load16_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) (PreH16 : (0 <= idx)) (PreH17 : ((idx + vl_pre ) <= count)) (PreH18 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) (PreH16 : (0 <= idx)) (PreH17 : ((idx + vl_pre ) <= count)) (PreH18 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_14 := qcp_vcmul_load16_partial_solve_wit_14_pure -> qcp_vcmul_load16_partial_solve_wit_14_aux.

Definition qcp_vcmul_load16_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) (PreH17 : (0 <= idx)) (PreH18 : ((idx + vl_pre ) <= count)) (PreH19 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) (PreH17 : (0 <= idx)) (PreH18 : ((idx + vl_pre ) <= count)) (PreH19 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_15 := qcp_vcmul_load16_partial_solve_wit_15_pure -> qcp_vcmul_load16_partial_solve_wit_15_aux.

Definition qcp_vcmul_load16_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) (PreH18 : (0 <= idx)) (PreH19 : ((idx + vl_pre ) <= count)) (PreH20 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
.

Definition qcp_vcmul_load16_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) (PreH18 : (0 <= idx)) (PreH19 : ((idx + vl_pre ) <= count)) (PreH20 : (p_pre = (base + (4 * idx ) ))) ,
  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ” 
  &&  “ (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
.

Definition qcp_vcmul_load16_partial_solve_wit_16 := qcp_vcmul_load16_partial_solve_wit_16_pure -> qcp_vcmul_load16_partial_solve_wit_16_aux.

Definition qcp_vcmul_load16_partial_solve_wit_17 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list fp32)) (idx: Z) (count: Z) (base: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) )) (PreH2 : (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) )) (PreH3 : (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) )) (PreH4 : (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) )) (PreH5 : (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) )) (PreH6 : (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) )) (PreH7 : (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) )) (PreH8 : (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) )) (PreH9 : (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) )) (PreH10 : (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) )) (PreH11 : (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) )) (PreH12 : (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) )) (PreH13 : (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) )) (PreH14 : (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) )) (PreH15 : (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) )) (PreH16 : (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + (4 * idx ) ))) ,
  (UndefStructPredvfloat32m4_t record_return )
  **  (FloatArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
|--
  “ (same_fp32 retval_16 (vcmul_read_lane_model (15) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_15 (vcmul_read_lane_model (14) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_read_lane_model (13) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_read_lane_model (12) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_read_lane_model (11) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_read_lane_model (10) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_read_lane_model (9) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_read_lane_model (8) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_read_lane_model (7) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_read_lane_model (6) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_read_lane_model (5) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_read_lane_model (4) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_read_lane_model (3) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_read_lane_model (2) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_read_lane_model (1) (vl_pre) (idx) (L)) ) ” 
  &&  “ (same_fp32 retval (vcmul_read_lane_model (0) (vl_pre) (idx) (L)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (4 * idx ) )) ”
  &&  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  (FloatArray.full base count L )
.

(*----- Function __riscv_vsetvl_e32m4 -----*)

Definition __riscv_vsetvl_e32m4_safety_wit_1 := 
forall (n_pre: Z) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition __riscv_vsetvl_e32m4_safety_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 16)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition __riscv_vsetvl_e32m4_return_wit_1 := 
(
forall (n_pre: Z) (PreH1 : (n_pre < 16)) ,
  TT && emp 
|--
  “ (n_pre = (vcmul_vl16 (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre < 16)) ,
  TT && emp 
|--
  “ (n_pre = (vcmul_vl16 (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m4_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre < 16)) ,
  (n_pre = (vcmul_vl16 (n_pre)))
.

Definition __riscv_vsetvl_e32m4_return_wit_2 := 
(
forall (n_pre: Z) (PreH1 : (n_pre >= 16)) ,
  TT && emp 
|--
  “ (16 = (vcmul_vl16 (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre >= 16)) ,
  TT && emp 
|--
  “ (16 = (vcmul_vl16 (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m4_return_wit_2_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 16)) ,
  (16 = (vcmul_vl16 (n_pre)))
.

Module Type VC_Correct.


Axiom proof_of_qcp_vcmul_read_lane_entail_wit_1 : qcp_vcmul_read_lane_entail_wit_1.
Axiom proof_of_qcp_vcmul_read_lane_entail_wit_2 : qcp_vcmul_read_lane_entail_wit_2.
Axiom proof_of_qcp_vcmul_read_lane_return_wit_1 : qcp_vcmul_read_lane_return_wit_1.
Axiom proof_of_qcp_vcmul_read_lane_return_wit_2 : qcp_vcmul_read_lane_return_wit_2.
Axiom proof_of_qcp_vcmul_load16_safety_wit_1 : qcp_vcmul_load16_safety_wit_1.
Axiom proof_of_qcp_vcmul_load16_safety_wit_2 : qcp_vcmul_load16_safety_wit_2.
Axiom proof_of_qcp_vcmul_load16_safety_wit_3 : qcp_vcmul_load16_safety_wit_3.
Axiom proof_of_qcp_vcmul_load16_safety_wit_4 : qcp_vcmul_load16_safety_wit_4.
Axiom proof_of_qcp_vcmul_load16_safety_wit_5 : qcp_vcmul_load16_safety_wit_5.
Axiom proof_of_qcp_vcmul_load16_safety_wit_6 : qcp_vcmul_load16_safety_wit_6.
Axiom proof_of_qcp_vcmul_load16_safety_wit_7 : qcp_vcmul_load16_safety_wit_7.
Axiom proof_of_qcp_vcmul_load16_safety_wit_8 : qcp_vcmul_load16_safety_wit_8.
Axiom proof_of_qcp_vcmul_load16_safety_wit_9 : qcp_vcmul_load16_safety_wit_9.
Axiom proof_of_qcp_vcmul_load16_safety_wit_10 : qcp_vcmul_load16_safety_wit_10.
Axiom proof_of_qcp_vcmul_load16_safety_wit_11 : qcp_vcmul_load16_safety_wit_11.
Axiom proof_of_qcp_vcmul_load16_safety_wit_12 : qcp_vcmul_load16_safety_wit_12.
Axiom proof_of_qcp_vcmul_load16_safety_wit_13 : qcp_vcmul_load16_safety_wit_13.
Axiom proof_of_qcp_vcmul_load16_safety_wit_14 : qcp_vcmul_load16_safety_wit_14.
Axiom proof_of_qcp_vcmul_load16_safety_wit_15 : qcp_vcmul_load16_safety_wit_15.
Axiom proof_of_qcp_vcmul_load16_safety_wit_16 : qcp_vcmul_load16_safety_wit_16.
Axiom proof_of_qcp_vcmul_load16_return_wit_1 : qcp_vcmul_load16_return_wit_1.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_1_pure : qcp_vcmul_load16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_1 : qcp_vcmul_load16_partial_solve_wit_1.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_2_pure : qcp_vcmul_load16_partial_solve_wit_2_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_2 : qcp_vcmul_load16_partial_solve_wit_2.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_3_pure : qcp_vcmul_load16_partial_solve_wit_3_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_3 : qcp_vcmul_load16_partial_solve_wit_3.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_4_pure : qcp_vcmul_load16_partial_solve_wit_4_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_4 : qcp_vcmul_load16_partial_solve_wit_4.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_5_pure : qcp_vcmul_load16_partial_solve_wit_5_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_5 : qcp_vcmul_load16_partial_solve_wit_5.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_6_pure : qcp_vcmul_load16_partial_solve_wit_6_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_6 : qcp_vcmul_load16_partial_solve_wit_6.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_7_pure : qcp_vcmul_load16_partial_solve_wit_7_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_7 : qcp_vcmul_load16_partial_solve_wit_7.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_8_pure : qcp_vcmul_load16_partial_solve_wit_8_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_8 : qcp_vcmul_load16_partial_solve_wit_8.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_9_pure : qcp_vcmul_load16_partial_solve_wit_9_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_9 : qcp_vcmul_load16_partial_solve_wit_9.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_10_pure : qcp_vcmul_load16_partial_solve_wit_10_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_10 : qcp_vcmul_load16_partial_solve_wit_10.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_11_pure : qcp_vcmul_load16_partial_solve_wit_11_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_11 : qcp_vcmul_load16_partial_solve_wit_11.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_12_pure : qcp_vcmul_load16_partial_solve_wit_12_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_12 : qcp_vcmul_load16_partial_solve_wit_12.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_13_pure : qcp_vcmul_load16_partial_solve_wit_13_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_13 : qcp_vcmul_load16_partial_solve_wit_13.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_14_pure : qcp_vcmul_load16_partial_solve_wit_14_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_14 : qcp_vcmul_load16_partial_solve_wit_14.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_15_pure : qcp_vcmul_load16_partial_solve_wit_15_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_15 : qcp_vcmul_load16_partial_solve_wit_15.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_16_pure : qcp_vcmul_load16_partial_solve_wit_16_pure.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_16 : qcp_vcmul_load16_partial_solve_wit_16.
Axiom proof_of_qcp_vcmul_load16_partial_solve_wit_17 : qcp_vcmul_load16_partial_solve_wit_17.
Axiom proof_of___riscv_vsetvl_e32m4_safety_wit_1 : __riscv_vsetvl_e32m4_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e32m4_safety_wit_2 : __riscv_vsetvl_e32m4_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e32m4_return_wit_1 : __riscv_vsetvl_e32m4_return_wit_1.
Axiom proof_of___riscv_vsetvl_e32m4_return_wit_2 : __riscv_vsetvl_e32m4_return_wit_2.

End VC_Correct.
