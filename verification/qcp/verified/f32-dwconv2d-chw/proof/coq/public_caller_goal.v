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
Require Import DwChw.Types.
Require Import DwChw.MemoryFacts DwChw.OutputInterface.
Require Import DwChw.ProgressModel.
Require Import DwChw.PublicObservation.
Local Open Scope sac.
From DwChw Require Import dw_maps_strategy_goal.
From DwChw Require Import dw_maps_strategy_proof.
From DwChw Require Import dw_output_strategy_goal.
From DwChw Require Import dw_output_strategy_proof.

(*----- Function dwchw_public_pair -----*)

Definition dwchw_public_pair_safety_wit_1 := 
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  (dw_data F )
  **  (dw_output WR (dw_progress ((dw_rvv_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (OR) (OutR) (H) (N) (H) (0)) )
  **  (dw_output WN (dw_progress ((dw_neon_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (ON) (OutN) (H) (N) (H) (0)) )
  **  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "outN" ) )) # Ptr  |-> outN_pre)
  **  ((( &( "outR" ) )) # Ptr  |-> outR_pre)
  **  ((( &( "padding_top" ) )) # UInt  |-> padding_top_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dwchw_public_pair_return_wit_1 := 
(
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  (dw_data F )
  **  (dw_output WR (dw_progress ((dw_rvv_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (OR) (OutR) (H) (N) (H) (0)) )
  **  (dw_output WN (dw_progress ((dw_neon_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (ON) (OutN) (H) (N) (H) (0)) )
|--
  “ (1 = 1) ” 
  &&  “ (dw_public_observed (dw_progress ((dw_neon_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (ON) (OutN) (H) (N) (H) (0)) (dw_progress ((dw_rvv_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (OR) (OutR) (H) (N) (H) (0)) OutN OutR H N ) ”
  &&  (dw_data F )
  **  (dw_output WN (dw_progress ((dw_neon_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (ON) (OutN) (H) (N) (H) (0)) )
  **  (dw_output WR (dw_progress ((dw_rvv_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (OR) (OutR) (H) (N) (H) (0)) )
) \/
(
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  TT && emp 
|--
  “ (dw_public_observed (dw_progress ((dw_neon_results (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (N) (Lo) (Hi))) (ON) (outN_pre) (input_height_pre) (N) (input_height_pre) (0)) (dw_progress ((dw_rvv_results (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (N) (Lo) (Hi))) (OR) (outR_pre) (input_height_pre) (N) (input_height_pre) (0)) outN_pre outR_pre input_height_pre N ) ”
  &&  emp
).

Definition dwchw_public_pair_return_wit_1_split_goal_1 := 
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  (dw_public_observed (dw_progress ((dw_neon_results (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (N) (Lo) (Hi))) (ON) (outN_pre) (input_height_pre) (N) (input_height_pre) (0)) (dw_progress ((dw_rvv_results (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (N) (Lo) (Hi))) (OR) (outR_pre) (input_height_pre) (N) (input_height_pre) (0)) outN_pre outR_pre input_height_pre N )
.

Definition dwchw_public_pair_partial_solve_wit_1_pure := 
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "outN" ) )) # Ptr  |-> outN_pre)
  **  ((( &( "outR" ) )) # Ptr  |-> outR_pre)
  **  ((( &( "padding_top" ) )) # UInt  |-> padding_top_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_data F )
  **  (dw_output WN ON )
  **  (dw_output WR OR )
|--
  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outN_pre = OutN) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WN = (dw_addresses (OutN) (H) (N))) ” 
  &&  “ (dw_distinct WN ) ” 
  &&  “ (dw_footprint OutN (H * N ) ) ”
.

Definition dwchw_public_pair_partial_solve_wit_1_aux := 
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  (dw_data F )
  **  (dw_output WN ON )
  **  (dw_output WR OR )
|--
  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outN_pre = OutN) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WN = (dw_addresses (OutN) (H) (N))) ” 
  &&  “ (dw_distinct WN ) ” 
  &&  “ (dw_footprint OutN (H * N ) ) ” 
  &&  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outN_pre = OutN) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WN = (dw_addresses (OutN) (H) (N))) ” 
  &&  “ (dw_distinct WN ) ” 
  &&  “ (dw_footprint OutN (H * N ) ) ” 
  &&  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outR_pre = OutR) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WR = (dw_addresses (OutR) (H) (N))) ” 
  &&  “ (dw_distinct WR ) ” 
  &&  “ (dw_footprint OutR (H * N ) ) ”
  &&  (dw_data F )
  **  (dw_output WN ON )
  **  (dw_output WR OR )
.

Definition dwchw_public_pair_partial_solve_wit_1 := dwchw_public_pair_partial_solve_wit_1_pure -> dwchw_public_pair_partial_solve_wit_1_aux.

Definition dwchw_public_pair_partial_solve_wit_2_pure := 
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  (dw_data F )
  **  (dw_output WN (dw_progress ((dw_neon_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (ON) (OutN) (H) (N) (H) (0)) )
  **  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "outN" ) )) # Ptr  |-> outN_pre)
  **  ((( &( "outR" ) )) # Ptr  |-> outR_pre)
  **  ((( &( "padding_top" ) )) # UInt  |-> padding_top_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output WR OR )
|--
  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outR_pre = OutR) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WR = (dw_addresses (OutR) (H) (N))) ” 
  &&  “ (dw_distinct WR ) ” 
  &&  “ (dw_footprint OutR (H * N ) ) ”
.

Definition dwchw_public_pair_partial_solve_wit_2_aux := 
forall (params_pre: Z) (padding_top_pre: Z) (outR_pre: Z) (outN_pre: Z) (zero_pre: Z) (weights_pre: Z) (input_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (Hi: fp32) (Lo: fp32) (Params: Z) (OutR: Z) (OutN: Z) (Weights: Z) (Zero: Z) (Input: Z) (N: Z) (H: Z) (WR: (@list Z)) (WN: (@list Z)) (OR: DwOutput) (ON: DwOutput) (F: DwROMap) (PreH1 : (0 < H)) (PreH2 : (0 < N)) (PreH3 : (H <= UINT64_MAX)) (PreH4 : ((4 * N ) <= UINT64_MAX)) (PreH5 : ((input_width_pre % ( 4 ) ) = 0)) (PreH6 : (input_height_pre = H)) (PreH7 : (input_width_pre = (4 * N ))) (PreH8 : (input_pre = Input)) (PreH9 : (zero_pre = Zero)) (PreH10 : (weights_pre = Weights)) (PreH11 : (outN_pre = OutN)) (PreH12 : (params_pre = Params)) (PreH13 : (padding_top_pre = 1)) (PreH14 : (dw_inputs F Input Zero Weights Params H N )) (PreH15 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH16 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH17 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH18 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH19 : (WN = (dw_addresses (OutN) (H) (N)))) (PreH20 : (dw_distinct WN )) (PreH21 : (dw_footprint OutN (H * N ) )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (H <= UINT64_MAX)) (PreH25 : ((4 * N ) <= UINT64_MAX)) (PreH26 : ((input_width_pre % ( 4 ) ) = 0)) (PreH27 : (input_height_pre = H)) (PreH28 : (input_width_pre = (4 * N ))) (PreH29 : (input_pre = Input)) (PreH30 : (zero_pre = Zero)) (PreH31 : (weights_pre = Weights)) (PreH32 : (outR_pre = OutR)) (PreH33 : (params_pre = Params)) (PreH34 : (padding_top_pre = 1)) (PreH35 : (dw_inputs F Input Zero Weights Params H N )) (PreH36 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH37 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH38 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH39 : (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH40 : (WR = (dw_addresses (OutR) (H) (N)))) (PreH41 : (dw_distinct WR )) (PreH42 : (dw_footprint OutR (H * N ) )) ,
  (dw_data F )
  **  (dw_output WN (dw_progress ((dw_neon_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (ON) (OutN) (H) (N) (H) (0)) )
  **  (dw_output WR OR )
|--
  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outR_pre = OutR) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WR = (dw_addresses (OutR) (H) (N))) ” 
  &&  “ (dw_distinct WR ) ” 
  &&  “ (dw_footprint OutR (H * N ) ) ” 
  &&  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outN_pre = OutN) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WN = (dw_addresses (OutN) (H) (N))) ” 
  &&  “ (dw_distinct WN ) ” 
  &&  “ (dw_footprint OutN (H * N ) ) ” 
  &&  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (H <= UINT64_MAX) ” 
  &&  “ ((4 * N ) <= UINT64_MAX) ” 
  &&  “ ((input_width_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = (4 * N )) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (outR_pre = OutR) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (padding_top_pre = 1) ” 
  &&  “ (dw_inputs F Input Zero Weights Params H N ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (dw_same (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (WR = (dw_addresses (OutR) (H) (N))) ” 
  &&  “ (dw_distinct WR ) ” 
  &&  “ (dw_footprint OutR (H * N ) ) ”
  &&  (dw_data F )
  **  (dw_output WR OR )
  **  (dw_output WN (dw_progress ((dw_neon_results (F) (Input) (Zero) (Weights) (H) (N) (Lo) (Hi))) (ON) (OutN) (H) (N) (H) (0)) )
.

Definition dwchw_public_pair_partial_solve_wit_2 := dwchw_public_pair_partial_solve_wit_2_pure -> dwchw_public_pair_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include dw_maps_Strategy_Correct.
Include dw_output_Strategy_Correct.

Axiom proof_of_dwchw_public_pair_safety_wit_1 : dwchw_public_pair_safety_wit_1.
Axiom proof_of_dwchw_public_pair_return_wit_1 : dwchw_public_pair_return_wit_1.
Axiom proof_of_dwchw_public_pair_partial_solve_wit_1_pure : dwchw_public_pair_partial_solve_wit_1_pure.
Axiom proof_of_dwchw_public_pair_partial_solve_wit_1 : dwchw_public_pair_partial_solve_wit_1.
Axiom proof_of_dwchw_public_pair_partial_solve_wit_2_pure : dwchw_public_pair_partial_solve_wit_2_pure.
Axiom proof_of_dwchw_public_pair_partial_solve_wit_2 : dwchw_public_pair_partial_solve_wit_2.

End VC_Correct.
