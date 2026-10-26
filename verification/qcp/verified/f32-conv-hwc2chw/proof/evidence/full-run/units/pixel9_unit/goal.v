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
From HwcConv Require Import pixel9_unit_def.
Import Snaive_C_Rules64.
Require Import HwcConv.Types.
Require Import HwcConv.VectorRecords.
Require Import HwcConv.FloatCopyModel.
Require Import HwcConv.ClampModel HwcConv.MaskModel.
Require Import HwcConv.MemoryFacts HwcConv.FloatCopyModel.
Require Import HwcConv.StoreViewsModel.
Require Import HwcConv.RvvViewsModel.
Require Import HwcConv.RvvRowsFma3Model.
Require Import HwcConv.HwcRvvPixel9Model.
Local Open Scope sac.
From HwcConv Require Import hc_maps_strategy_goal.
From HwcConv Require Import hc_maps_strategy_proof.

(*----- Function hc_rvv_pixel9_raw -----*)

Definition hc_rvv_pixel9_raw_entail_wit_1 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (retval: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_splat R retval vl_pre )) (PreH2 : (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) )) (PreH3 : (0 < width_pre)) (PreH4 : (0 <= x_pre)) (PreH5 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH6 : (0 <= lane_pre)) (PreH7 : (lane_pre < 4)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) (PreH10 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH11 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_footprint w_pre 112 )) (PreH15 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH18 : (hc_window F w_pre 112 )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits retval (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (retval: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_splat R retval vl_pre )) (PreH2 : (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) )) (PreH3 : (0 < width_pre)) (PreH4 : (0 <= x_pre)) (PreH5 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH6 : (0 <= lane_pre)) (PreH7 : (lane_pre < 4)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) (PreH10 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH11 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_footprint w_pre 112 )) (PreH15 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH18 : (hc_window F w_pre 112 )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre ) ” 
  &&  “ (hc_same_bits retval (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (retval: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_splat R retval vl_pre )) (PreH2 : (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) )) (PreH3 : (0 < width_pre)) (PreH4 : (0 <= x_pre)) (PreH5 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH6 : (0 <= lane_pre)) (PreH7 : (lane_pre < 4)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) (PreH10 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH11 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_footprint w_pre 112 )) (PreH15 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH18 : (hc_window F w_pre 112 )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_1_split_goal_2 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (retval: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_splat R retval vl_pre )) (PreH2 : (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) )) (PreH3 : (0 < width_pre)) (PreH4 : (0 <= x_pre)) (PreH5 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH6 : (0 <= lane_pre)) (PreH7 : (lane_pre < 4)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) (PreH10 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH11 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_footprint w_pre 112 )) (PreH15 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH18 : (hc_window F w_pre 112 )) ,
  (hc_same_bits retval (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )
.

Definition hc_rvv_pixel9_raw_entail_wit_2 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_3 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_3_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_4 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_4_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_5 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_5_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_6 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_6_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_7 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_7_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_8 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_8_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_9 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_9_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre )
.

Definition hc_rvv_pixel9_raw_entail_wit_10 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre )) ,
  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (A: Recordvfloat32m1_t) ,
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_entail_wit_10_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A_2: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (PreH1 : (hc_rvv_rows_group R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((R.(vfloat32m1_t_s0) )) ((R.(vfloat32m1_t_s1) )) ((R.(vfloat32m1_t_s2) )) ((R.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre )
.

Definition hc_rvv_pixel9_raw_return_wit_1 := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (record_return: Z) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre )) ,
  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  (hc_data F )
|--
  EX (R: Recordvfloat32m1_t) ,
  “ (hc_rvv_pixel9_prefix R F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t record_return R )
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre )) ,
  TT && emp 
|--
  “ (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre ) ”
  &&  emp
).

Definition hc_rvv_pixel9_raw_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre )) ,
  (hc_rvv_pixel9_prefix (make_record_vfloat32m1_t ((A.(vfloat32m1_t_s0) )) ((A.(vfloat32m1_t_s1) )) ((A.(vfloat32m1_t_s2) )) ((A.(vfloat32m1_t_s3) ))) F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_1_pure := 
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) ,
  ((( &( "bias" ) )) # Float  |->_)
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (hc_data F )
|--
  “ (hc_present F (w_pre + (lane_pre * sizeof(FLOAT))) ) ”
) \/
(
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (x_pre <= UINT64_MAX)) (PreH3 : (width_pre <= UINT64_MAX)) (PreH4 : (vl_pre >= 0)) (PreH5 : (x_pre >= 0)) (PreH6 : (width_pre >= 0)) (PreH7 : (lane_pre <= UINT_MAX)) (PreH8 : (lane_pre >= 0)) (PreH9 : (0 < width_pre)) (PreH10 : (0 <= x_pre)) (PreH11 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH12 : (0 <= lane_pre)) (PreH13 : (lane_pre < 4)) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 4)) (PreH16 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH17 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH18 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH19 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH20 : (hc_footprint w_pre 112 )) (PreH21 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH22 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH23 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH24 : (hc_window F w_pre 112 )) ,
  ((( &( "bias" ) )) # Float  |->_)
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (hc_data F )
|--
  “ (hc_present F (w_pre + (lane_pre * sizeof(FLOAT))) ) ”
).

Definition hc_rvv_pixel9_raw_partial_solve_wit_1_pure_split_goal_1 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (x_pre <= UINT64_MAX)) (PreH3 : (width_pre <= UINT64_MAX)) (PreH4 : (vl_pre >= 0)) (PreH5 : (x_pre >= 0)) (PreH6 : (width_pre >= 0)) (PreH7 : (lane_pre <= UINT_MAX)) (PreH8 : (lane_pre >= 0)) (PreH9 : (0 < width_pre)) (PreH10 : (0 <= x_pre)) (PreH11 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH12 : (0 <= lane_pre)) (PreH13 : (lane_pre < 4)) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 4)) (PreH16 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH17 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH18 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH19 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH20 : (hc_footprint w_pre 112 )) (PreH21 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH22 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH23 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH24 : (hc_window F w_pre 112 )) ,
  ((( &( "bias" ) )) # Float  |->_)
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (hc_data F )
|--
  “ (hc_present F (w_pre + (lane_pre * sizeof(FLOAT))) ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) ,
  (hc_data F )
|--
  “ (hc_present F (w_pre + (lane_pre * sizeof(FLOAT))) ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
  &&  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_1 := hc_rvv_pixel9_raw_partial_solve_wit_1_pure -> hc_rvv_pixel9_raw_partial_solve_wit_1_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (retval: fp32) (PreH1 : (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  ((( &( "bias" ) )) # Float  |-> retval)
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (retval: fp32) (PreH1 : (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
  &&  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_2 := hc_rvv_pixel9_raw_partial_solve_wit_2_pure -> hc_rvv_pixel9_raw_partial_solve_wit_2_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_3 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (retval: fp32) (R: Recordvfloat32m1_t) (retval_2: Z) (PreH1 : (hc_rvv_splat R retval vl_pre )) (PreH2 : (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) )) (PreH3 : (0 < width_pre)) (PreH4 : (0 <= x_pre)) (PreH5 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH6 : (0 <= lane_pre)) (PreH7 : (lane_pre < 4)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 4)) (PreH10 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH11 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_footprint w_pre 112 )) (PreH15 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH18 : (hc_window F w_pre 112 )) ,
  (StructPredvfloat32m1_t retval_2 R )
  **  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
|--
  “ (hc_rvv_splat R retval vl_pre ) ” 
  &&  “ (hc_same_bits retval (hc_get (F) ((w_pre + (lane_pre * sizeof(FLOAT))))) ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_4 := hc_rvv_pixel9_raw_partial_solve_wit_4_pure -> hc_rvv_pixel9_raw_partial_solve_wit_4_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_5 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 0 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 0 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_6 := hc_rvv_pixel9_raw_partial_solve_wit_6_pure -> hc_rvv_pixel9_raw_partial_solve_wit_6_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_7 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 1 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 1 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_8 := hc_rvv_pixel9_raw_partial_solve_wit_8_pure -> hc_rvv_pixel9_raw_partial_solve_wit_8_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_9 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0 2 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 2 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_10 := hc_rvv_pixel9_raw_partial_solve_wit_10_pure -> hc_rvv_pixel9_raw_partial_solve_wit_10_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_11 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 0 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 3 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_12 := hc_rvv_pixel9_raw_partial_solve_wit_12_pure -> hc_rvv_pixel9_raw_partial_solve_wit_12_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_13 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 1 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 4 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_14 := hc_rvv_pixel9_raw_partial_solve_wit_14_pure -> hc_rvv_pixel9_raw_partial_solve_wit_14_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_15 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 1 2 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 5 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_16 := hc_rvv_pixel9_raw_partial_solve_wit_16_pure -> hc_rvv_pixel9_raw_partial_solve_wit_16_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_17 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 0 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 0 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_18_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_18_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_18 := hc_rvv_pixel9_raw_partial_solve_wit_18_pure -> hc_rvv_pixel9_raw_partial_solve_wit_18_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_19 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 1 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 1 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 7 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_20_pure := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "width" ) )) # UInt64  |-> width_pre)
  **  ((( &( "x" ) )) # UInt64  |-> x_pre)
  **  ((( &( "lane" ) )) # UInt  |-> lane_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "bias" ) )) # Float  |-> bias)
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ”
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_20_aux := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre )) ,
  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 3) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre ) ”
  &&  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_20 := hc_rvv_pixel9_raw_partial_solve_wit_20_pure -> hc_rvv_pixel9_raw_partial_solve_wit_20_aux.

Definition hc_rvv_pixel9_raw_partial_solve_wit_21 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (R: Recordvfloat32m1_t) (retval: Z) (PreH1 : (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 2 lane_pre vl_pre )) (PreH2 : (0 < width_pre)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH5 : (0 <= lane_pre)) (PreH6 : (lane_pre < 4)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) (PreH9 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH10 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH13 : (hc_footprint w_pre 112 )) (PreH14 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH17 : (hc_window F w_pre 112 )) (PreH18 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH19 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre )) ,
  (UndefStructPredvfloat32m1_t ( &( "a" ) ) )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t retval R )
|--
  “ (hc_rvv_rows_group R A F p0_pre p1_pre p2_pre w_pre width_pre x_pre 2 2 lane_pre vl_pre ) ” 
  &&  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 8 vl_pre ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |-> (R.(vfloat32m1_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |-> (R.(vfloat32m1_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |-> (R.(vfloat32m1_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |-> (R.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Definition hc_rvv_pixel9_raw_partial_solve_wit_22 := 
forall (vl_pre: Z) (lane_pre: Z) (x_pre: Z) (width_pre: Z) (w_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (F: HwcROMap) (A: Recordvfloat32m1_t) (bias: fp32) (record_return: Z) (PreH1 : (0 < width_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre < ((width_pre + 1 ) ÷ 2 ))) (PreH4 : (0 <= lane_pre)) (PreH5 : (lane_pre < 4)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) (PreH8 : (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre ))) (PreH9 : (hc_footprint p0_pre ((3 * width_pre ) + 3 ) )) (PreH10 : (hc_footprint p1_pre ((3 * width_pre ) + 3 ) )) (PreH11 : (hc_footprint p2_pre ((3 * width_pre ) + 3 ) )) (PreH12 : (hc_footprint w_pre 112 )) (PreH13 : (hc_window F p0_pre ((3 * width_pre ) + 3 ) )) (PreH14 : (hc_window F p1_pre ((3 * width_pre ) + 3 ) )) (PreH15 : (hc_window F p2_pre ((3 * width_pre ) + 3 ) )) (PreH16 : (hc_window F w_pre 112 )) (PreH17 : (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) )) (PreH18 : (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre )) ,
  (UndefStructPredvfloat32m1_t record_return )
  **  (hc_data F )
  **  (StructPredvfloat32m1_t ( &( "a" ) ) A )
|--
  “ (0 < width_pre) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre < ((width_pre + 1 ) ÷ 2 )) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ” 
  &&  “ (vl_pre <= (((width_pre + 1 ) ÷ 2 ) - x_pre )) ” 
  &&  “ (hc_footprint p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_footprint w_pre 112 ) ” 
  &&  “ (hc_window F p0_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p1_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F p2_pre ((3 * width_pre ) + 3 ) ) ” 
  &&  “ (hc_window F w_pre 112 ) ” 
  &&  “ (hc_same_bits bias (hc_rvv_pixel9_bias (F) (w_pre) (lane_pre)) ) ” 
  &&  “ (hc_rvv_pixel9_prefix A F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 9 vl_pre ) ”
  &&  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m1_t_s3) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m1_t_s2) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m1_t_s1) ))
  **  ((&((record_return)  # "vfloat32m1_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m1_t_s0) ))
  **  (hc_data F )
.

Module Type VC_Correct.

Include hc_maps_Strategy_Correct.

Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_1 : hc_rvv_pixel9_raw_entail_wit_1.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_2 : hc_rvv_pixel9_raw_entail_wit_2.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_3 : hc_rvv_pixel9_raw_entail_wit_3.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_4 : hc_rvv_pixel9_raw_entail_wit_4.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_5 : hc_rvv_pixel9_raw_entail_wit_5.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_6 : hc_rvv_pixel9_raw_entail_wit_6.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_7 : hc_rvv_pixel9_raw_entail_wit_7.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_8 : hc_rvv_pixel9_raw_entail_wit_8.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_9 : hc_rvv_pixel9_raw_entail_wit_9.
Axiom proof_of_hc_rvv_pixel9_raw_entail_wit_10 : hc_rvv_pixel9_raw_entail_wit_10.
Axiom proof_of_hc_rvv_pixel9_raw_return_wit_1 : hc_rvv_pixel9_raw_return_wit_1.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_1_pure : hc_rvv_pixel9_raw_partial_solve_wit_1_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_1 : hc_rvv_pixel9_raw_partial_solve_wit_1.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_2_pure : hc_rvv_pixel9_raw_partial_solve_wit_2_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_2 : hc_rvv_pixel9_raw_partial_solve_wit_2.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_3 : hc_rvv_pixel9_raw_partial_solve_wit_3.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_4_pure : hc_rvv_pixel9_raw_partial_solve_wit_4_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_4 : hc_rvv_pixel9_raw_partial_solve_wit_4.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_5 : hc_rvv_pixel9_raw_partial_solve_wit_5.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_6_pure : hc_rvv_pixel9_raw_partial_solve_wit_6_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_6 : hc_rvv_pixel9_raw_partial_solve_wit_6.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_7 : hc_rvv_pixel9_raw_partial_solve_wit_7.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_8_pure : hc_rvv_pixel9_raw_partial_solve_wit_8_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_8 : hc_rvv_pixel9_raw_partial_solve_wit_8.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_9 : hc_rvv_pixel9_raw_partial_solve_wit_9.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_10_pure : hc_rvv_pixel9_raw_partial_solve_wit_10_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_10 : hc_rvv_pixel9_raw_partial_solve_wit_10.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_11 : hc_rvv_pixel9_raw_partial_solve_wit_11.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_12_pure : hc_rvv_pixel9_raw_partial_solve_wit_12_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_12 : hc_rvv_pixel9_raw_partial_solve_wit_12.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_13 : hc_rvv_pixel9_raw_partial_solve_wit_13.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_14_pure : hc_rvv_pixel9_raw_partial_solve_wit_14_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_14 : hc_rvv_pixel9_raw_partial_solve_wit_14.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_15 : hc_rvv_pixel9_raw_partial_solve_wit_15.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_16_pure : hc_rvv_pixel9_raw_partial_solve_wit_16_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_16 : hc_rvv_pixel9_raw_partial_solve_wit_16.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_17 : hc_rvv_pixel9_raw_partial_solve_wit_17.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_18_pure : hc_rvv_pixel9_raw_partial_solve_wit_18_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_18 : hc_rvv_pixel9_raw_partial_solve_wit_18.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_19 : hc_rvv_pixel9_raw_partial_solve_wit_19.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_20_pure : hc_rvv_pixel9_raw_partial_solve_wit_20_pure.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_20 : hc_rvv_pixel9_raw_partial_solve_wit_20.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_21 : hc_rvv_pixel9_raw_partial_solve_wit_21.
Axiom proof_of_hc_rvv_pixel9_raw_partial_solve_wit_22 : hc_rvv_pixel9_raw_partial_solve_wit_22.

End VC_Correct.
