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
Require Import X32Transpose.VectorModel.
Require Import X32Transpose.ProgramModel.
Require Import X32Transpose.ObservationModel.
Local Open Scope sac.

(*----- Function test_equivalence -----*)

Definition test_equivalence_safety_wit_1 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (retval_2: Z) (R_2: XTOutput) (retval_3: Z) (PreH1 : (retval_2 <> retval_3)) (PreH2 : (retval_3 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH3 : (xt_result F G R R_2 )) (PreH4 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH5 : (xt_result F G old R )) (PreH6 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH7 : (xt_valid F W G )) (PreH8 : (input_pre = (xt_input (G)))) (PreH9 : (output_pre = (xt_output_base (G)))) (PreH10 : (input_stride_pre = (xt_input_stride (G)))) (PreH11 : (output_stride_pre = (xt_output_stride (G)))) (PreH12 : (block_width_pre = (xt_width (G)))) (PreH13 : (block_height_pre = (xt_height (G)))) (PreH14 : (0 <= row_pre)) (PreH15 : (row_pre < (xt_height (G)))) (PreH16 : (0 <= column_pre)) (PreH17 : (column_pre < (xt_cols (G)))) ,
  (xt_output W R_2 )
  **  ((( &( "right" ) )) # UInt  |-> retval_3)
  **  (xt_data F )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ False ”
.

Definition test_equivalence_return_wit_1 := 
(
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R_3: XTOutput) (retval_3: Z) (PreH1 : (retval_2 = retval_3)) (PreH2 : (retval_3 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH3 : (xt_result F G R_2 R_3 )) (PreH4 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH5 : (xt_result F G old R_2 )) (PreH6 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH7 : (xt_valid F W G )) (PreH8 : (input_pre = (xt_input (G)))) (PreH9 : (output_pre = (xt_output_base (G)))) (PreH10 : (input_stride_pre = (xt_input_stride (G)))) (PreH11 : (output_stride_pre = (xt_output_stride (G)))) (PreH12 : (block_width_pre = (xt_width (G)))) (PreH13 : (block_height_pre = (xt_height (G)))) (PreH14 : (0 <= row_pre)) (PreH15 : (row_pre < (xt_height (G)))) (PreH16 : (0 <= column_pre)) (PreH17 : (column_pre < (xt_cols (G)))) ,
  (xt_output W R_3 )
  **  (xt_data F )
|--
  EX (R: XTOutput) ,
  “ (1 = 1) ” 
  &&  “ (xt_result F G old R ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R_3: XTOutput) (retval_3: Z) (PreH1 : (retval_2 = retval_3)) (PreH2 : (retval_3 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH3 : (xt_result F G R_2 R_3 )) (PreH4 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH5 : (xt_result F G old R_2 )) (PreH6 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH7 : (xt_valid F W G )) (PreH8 : (input_pre = (xt_input (G)))) (PreH9 : (output_pre = (xt_output_base (G)))) (PreH10 : (input_stride_pre = (xt_input_stride (G)))) (PreH11 : (output_stride_pre = (xt_output_stride (G)))) (PreH12 : (block_width_pre = (xt_width (G)))) (PreH13 : (block_height_pre = (xt_height (G)))) (PreH14 : (0 <= row_pre)) (PreH15 : (row_pre < (xt_height (G)))) (PreH16 : (0 <= column_pre)) (PreH17 : (column_pre < (xt_cols (G)))) ,
  TT && emp 
|--
  “ (xt_result F G old R_3 ) ”
  &&  emp
).

Definition test_equivalence_return_wit_1_split_goal_1 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R_3: XTOutput) (retval_3: Z) (PreH1 : (retval_2 = retval_3)) (PreH2 : (retval_3 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH3 : (xt_result F G R_2 R_3 )) (PreH4 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH5 : (xt_result F G old R_2 )) (PreH6 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH7 : (xt_valid F W G )) (PreH8 : (input_pre = (xt_input (G)))) (PreH9 : (output_pre = (xt_output_base (G)))) (PreH10 : (input_stride_pre = (xt_input_stride (G)))) (PreH11 : (output_stride_pre = (xt_output_stride (G)))) (PreH12 : (block_width_pre = (xt_width (G)))) (PreH13 : (block_height_pre = (xt_height (G)))) (PreH14 : (0 <= row_pre)) (PreH15 : (row_pre < (xt_height (G)))) (PreH16 : (0 <= column_pre)) (PreH17 : (column_pre < (xt_cols (G)))) ,
  (xt_result F G old R_3 )
.

Definition test_equivalence_partial_solve_wit_1 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_valid F W G )) (PreH2 : (input_pre = (xt_input (G)))) (PreH3 : (output_pre = (xt_output_base (G)))) (PreH4 : (input_stride_pre = (xt_input_stride (G)))) (PreH5 : (output_stride_pre = (xt_output_stride (G)))) (PreH6 : (block_width_pre = (xt_width (G)))) (PreH7 : (block_height_pre = (xt_height (G)))) (PreH8 : (0 <= row_pre)) (PreH9 : (row_pre < (xt_height (G)))) (PreH10 : (0 <= column_pre)) (PreH11 : (column_pre < (xt_cols (G)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (0 <= row_pre) ” 
  &&  “ (row_pre < (xt_height (G))) ” 
  &&  “ (0 <= column_pre) ” 
  &&  “ (column_pre < (xt_cols (G))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_equivalence_partial_solve_wit_2_pure := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (PreH1 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH2 : (xt_valid F W G )) (PreH3 : (input_pre = (xt_input (G)))) (PreH4 : (output_pre = (xt_output_base (G)))) (PreH5 : (input_stride_pre = (xt_input_stride (G)))) (PreH6 : (output_stride_pre = (xt_output_stride (G)))) (PreH7 : (block_width_pre = (xt_width (G)))) (PreH8 : (block_height_pre = (xt_height (G)))) (PreH9 : (0 <= row_pre)) (PreH10 : (row_pre < (xt_height (G)))) (PreH11 : (0 <= column_pre)) (PreH12 : (column_pre < (xt_cols (G)))) ,
  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ”
.

Definition test_equivalence_partial_solve_wit_2_aux := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (PreH1 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH2 : (xt_valid F W G )) (PreH3 : (input_pre = (xt_input (G)))) (PreH4 : (output_pre = (xt_output_base (G)))) (PreH5 : (input_stride_pre = (xt_input_stride (G)))) (PreH6 : (output_stride_pre = (xt_output_stride (G)))) (PreH7 : (block_width_pre = (xt_width (G)))) (PreH8 : (block_height_pre = (xt_height (G)))) (PreH9 : (0 <= row_pre)) (PreH10 : (row_pre < (xt_height (G)))) (PreH11 : (0 <= column_pre)) (PreH12 : (column_pre < (xt_cols (G)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (0 <= row_pre) ” 
  &&  “ (row_pre < (xt_height (G))) ” 
  &&  “ (0 <= column_pre) ” 
  &&  “ (column_pre < (xt_cols (G))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_equivalence_partial_solve_wit_2 := test_equivalence_partial_solve_wit_2_pure -> test_equivalence_partial_solve_wit_2_aux.

Definition test_equivalence_partial_solve_wit_3_pure := 
(
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (xt_result F G old R )) (PreH2 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH3 : (xt_valid F W G )) (PreH4 : (input_pre = (xt_input (G)))) (PreH5 : (output_pre = (xt_output_base (G)))) (PreH6 : (input_stride_pre = (xt_input_stride (G)))) (PreH7 : (output_stride_pre = (xt_output_stride (G)))) (PreH8 : (block_width_pre = (xt_width (G)))) (PreH9 : (block_height_pre = (xt_height (G)))) (PreH10 : (0 <= row_pre)) (PreH11 : (row_pre < (xt_height (G)))) (PreH12 : (0 <= column_pre)) (PreH13 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (0 < retval) ” 
  &&  “ (In retval W ) ” 
  &&  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (xt_output_exact R (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (In (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) W ) ” 
  &&  “ (0 < (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (NoDup W ) ”
) \/
(
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (NoDup W ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (In retval W ) ” 
  &&  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (In retval W ) ” 
  &&  “ (0 < retval) ”
).

Definition test_equivalence_partial_solve_wit_3_pure_split_goal_1 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (NoDup W ) ”
.

Definition test_equivalence_partial_solve_wit_3_pure_split_goal_2 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (0 < retval) ”
.

Definition test_equivalence_partial_solve_wit_3_pure_split_goal_3 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (In retval W ) ”
.

Definition test_equivalence_partial_solve_wit_3_pure_split_goal_4 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ”
.

Definition test_equivalence_partial_solve_wit_3_pure_split_goal_5 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ”
.

Definition test_equivalence_partial_solve_wit_3_pure_split_goal_6 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (In retval W ) ”
.

Definition test_equivalence_partial_solve_wit_3_pure_split_goal_7 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (xt_result F G old R )) (PreH14 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH15 : (xt_valid F W G )) (PreH16 : (input_pre = (xt_input (G)))) (PreH17 : (output_pre = (xt_output_base (G)))) (PreH18 : (input_stride_pre = (xt_input_stride (G)))) (PreH19 : (output_stride_pre = (xt_output_stride (G)))) (PreH20 : (block_width_pre = (xt_width (G)))) (PreH21 : (block_height_pre = (xt_height (G)))) (PreH22 : (0 <= row_pre)) (PreH23 : (row_pre < (xt_height (G)))) (PreH24 : (0 <= column_pre)) (PreH25 : (column_pre < (xt_cols (G)))) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (0 < retval) ”
.

Definition test_equivalence_partial_solve_wit_3_aux := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (PreH1 : (xt_result F G old R )) (PreH2 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH3 : (xt_valid F W G )) (PreH4 : (input_pre = (xt_input (G)))) (PreH5 : (output_pre = (xt_output_base (G)))) (PreH6 : (input_stride_pre = (xt_input_stride (G)))) (PreH7 : (output_stride_pre = (xt_output_stride (G)))) (PreH8 : (block_width_pre = (xt_width (G)))) (PreH9 : (block_height_pre = (xt_height (G)))) (PreH10 : (0 <= row_pre)) (PreH11 : (row_pre < (xt_height (G)))) (PreH12 : (0 <= column_pre)) (PreH13 : (column_pre < (xt_cols (G)))) ,
  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 < retval) ” 
  &&  “ (In retval W ) ” 
  &&  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (xt_output_exact R (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (In (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) W ) ” 
  &&  “ (0 < (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (xt_result F G old R ) ” 
  &&  “ (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (0 <= row_pre) ” 
  &&  “ (row_pre < (xt_height (G))) ” 
  &&  “ (0 <= column_pre) ” 
  &&  “ (column_pre < (xt_cols (G))) ”
  &&  (xt_output W R )
  **  (xt_data F )
.

Definition test_equivalence_partial_solve_wit_3 := test_equivalence_partial_solve_wit_3_pure -> test_equivalence_partial_solve_wit_3_aux.

Definition test_equivalence_partial_solve_wit_4_pure := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (retval_2: Z) (PreH1 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH2 : (xt_result F G old R )) (PreH3 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH4 : (xt_valid F W G )) (PreH5 : (input_pre = (xt_input (G)))) (PreH6 : (output_pre = (xt_output_base (G)))) (PreH7 : (input_stride_pre = (xt_input_stride (G)))) (PreH8 : (output_stride_pre = (xt_output_stride (G)))) (PreH9 : (block_width_pre = (xt_width (G)))) (PreH10 : (block_height_pre = (xt_height (G)))) (PreH11 : (0 <= row_pre)) (PreH12 : (row_pre < (xt_height (G)))) (PreH13 : (0 <= column_pre)) (PreH14 : (column_pre < (xt_cols (G)))) ,
  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  (xt_data F )
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ”
.

Definition test_equivalence_partial_solve_wit_4_aux := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R: XTOutput) (retval_2: Z) (PreH1 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH2 : (xt_result F G old R )) (PreH3 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH4 : (xt_valid F W G )) (PreH5 : (input_pre = (xt_input (G)))) (PreH6 : (output_pre = (xt_output_base (G)))) (PreH7 : (input_stride_pre = (xt_input_stride (G)))) (PreH8 : (output_stride_pre = (xt_output_stride (G)))) (PreH9 : (block_width_pre = (xt_width (G)))) (PreH10 : (block_height_pre = (xt_height (G)))) (PreH11 : (0 <= row_pre)) (PreH12 : (row_pre < (xt_height (G)))) (PreH13 : (0 <= column_pre)) (PreH14 : (column_pre < (xt_cols (G)))) ,
  (xt_output W R )
  **  (xt_data F )
|--
  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre))))) ” 
  &&  “ (xt_result F G old R ) ” 
  &&  “ (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (0 <= row_pre) ” 
  &&  “ (row_pre < (xt_height (G))) ” 
  &&  “ (0 <= column_pre) ” 
  &&  “ (column_pre < (xt_cols (G))) ”
  &&  (xt_data F )
  **  (xt_output W R )
.

Definition test_equivalence_partial_solve_wit_4 := test_equivalence_partial_solve_wit_4_pure -> test_equivalence_partial_solve_wit_4_aux.

Definition test_equivalence_partial_solve_wit_5_pure := 
(
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (xt_result F G R_2 R )) (PreH2 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH3 : (xt_result F G old R_2 )) (PreH4 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH5 : (xt_valid F W G )) (PreH6 : (input_pre = (xt_input (G)))) (PreH7 : (output_pre = (xt_output_base (G)))) (PreH8 : (input_stride_pre = (xt_input_stride (G)))) (PreH9 : (output_stride_pre = (xt_output_stride (G)))) (PreH10 : (block_width_pre = (xt_width (G)))) (PreH11 : (block_height_pre = (xt_height (G)))) (PreH12 : (0 <= row_pre)) (PreH13 : (row_pre < (xt_height (G)))) (PreH14 : (0 <= column_pre)) (PreH15 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (0 < retval) ” 
  &&  “ (In retval W ) ” 
  &&  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (xt_output_exact R (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) retval_2 ) ” 
  &&  “ (In (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) W ) ” 
  &&  “ (0 < (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (NoDup W ) ”
) \/
(
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (NoDup W ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (In retval W ) ” 
  &&  “ (xt_output_exact R retval retval_2 ) ” 
  &&  “ (xt_output_exact R retval retval_2 ) ” 
  &&  “ (In retval W ) ” 
  &&  “ (0 < retval) ”
).

Definition test_equivalence_partial_solve_wit_5_pure_split_goal_1 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (NoDup W ) ”
.

Definition test_equivalence_partial_solve_wit_5_pure_split_goal_2 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (0 < retval) ”
.

Definition test_equivalence_partial_solve_wit_5_pure_split_goal_3 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (In retval W ) ”
.

Definition test_equivalence_partial_solve_wit_5_pure_split_goal_4 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (xt_output_exact R retval retval_2 ) ”
.

Definition test_equivalence_partial_solve_wit_5_pure_split_goal_5 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (xt_output_exact R retval retval_2 ) ”
.

Definition test_equivalence_partial_solve_wit_5_pure_split_goal_6 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (In retval W ) ”
.

Definition test_equivalence_partial_solve_wit_5_pure_split_goal_7 := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (column_pre <= UINT64_MAX)) (PreH2 : (row_pre <= UINT64_MAX)) (PreH3 : (block_height_pre <= UINT64_MAX)) (PreH4 : (block_width_pre <= UINT64_MAX)) (PreH5 : (output_stride_pre <= UINT64_MAX)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (column_pre >= 0)) (PreH8 : (row_pre >= 0)) (PreH9 : (block_height_pre >= 0)) (PreH10 : (block_width_pre >= 0)) (PreH11 : (output_stride_pre >= 0)) (PreH12 : (input_stride_pre >= 0)) (PreH13 : (retval_2 <= UINT_MAX)) (PreH14 : (retval_2 >= 0)) (PreH15 : (xt_result F G R_2 R )) (PreH16 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH17 : (xt_result F G old R_2 )) (PreH18 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH19 : (xt_valid F W G )) (PreH20 : (input_pre = (xt_input (G)))) (PreH21 : (output_pre = (xt_output_base (G)))) (PreH22 : (input_stride_pre = (xt_input_stride (G)))) (PreH23 : (output_stride_pre = (xt_output_stride (G)))) (PreH24 : (block_width_pre = (xt_width (G)))) (PreH25 : (block_height_pre = (xt_height (G)))) (PreH26 : (0 <= row_pre)) (PreH27 : (row_pre < (xt_height (G)))) (PreH28 : (0 <= column_pre)) (PreH29 : (column_pre < (xt_cols (G)))) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (xt_data F )
  **  (xt_output W R )
  **  ((( &( "left" ) )) # UInt  |-> retval_2)
  **  ((( &( "address" ) )) # Ptr  |-> retval)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width_pre)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height_pre)
  **  ((( &( "row" ) )) # UInt64  |-> row_pre)
  **  ((( &( "column" ) )) # UInt64  |-> column_pre)
|--
  “ (0 < retval) ”
.

Definition test_equivalence_partial_solve_wit_5_aux := 
forall (column_pre: Z) (row_pre: Z) (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (R_2: XTOutput) (retval_2: Z) (R: XTOutput) (PreH1 : (xt_result F G R_2 R )) (PreH2 : (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))))) (PreH3 : (xt_result F G old R_2 )) (PreH4 : (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)))) (PreH5 : (xt_valid F W G )) (PreH6 : (input_pre = (xt_input (G)))) (PreH7 : (output_pre = (xt_output_base (G)))) (PreH8 : (input_stride_pre = (xt_input_stride (G)))) (PreH9 : (output_stride_pre = (xt_output_stride (G)))) (PreH10 : (block_width_pre = (xt_width (G)))) (PreH11 : (block_height_pre = (xt_height (G)))) (PreH12 : (0 <= row_pre)) (PreH13 : (row_pre < (xt_height (G)))) (PreH14 : (0 <= column_pre)) (PreH15 : (column_pre < (xt_cols (G)))) ,
  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 < retval) ” 
  &&  “ (In retval W ) ” 
  &&  “ (xt_output_exact R retval (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre)))) ) ” 
  &&  “ (xt_output_exact R (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) retval_2 ) ” 
  &&  “ (In (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre)) W ) ” 
  &&  “ (0 < (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (xt_result F G R_2 R ) ” 
  &&  “ (retval_2 = (xt_get (F) ((xt_input_address (G) (row_pre) (column_pre))))) ” 
  &&  “ (xt_result F G old R_2 ) ” 
  &&  “ (retval = (xt_observation_address (output_pre) (output_stride_pre) (row_pre) (column_pre))) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (0 <= row_pre) ” 
  &&  “ (row_pre < (xt_height (G))) ” 
  &&  “ (0 <= column_pre) ” 
  &&  “ (column_pre < (xt_cols (G))) ”
  &&  (xt_output W R )
  **  (xt_data F )
.

Definition test_equivalence_partial_solve_wit_5 := test_equivalence_partial_solve_wit_5_pure -> test_equivalence_partial_solve_wit_5_aux.

Module Type VC_Correct.


Axiom proof_of_test_equivalence_safety_wit_1 : test_equivalence_safety_wit_1.
Axiom proof_of_test_equivalence_return_wit_1 : test_equivalence_return_wit_1.
Axiom proof_of_test_equivalence_partial_solve_wit_1 : test_equivalence_partial_solve_wit_1.
Axiom proof_of_test_equivalence_partial_solve_wit_2_pure : test_equivalence_partial_solve_wit_2_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_2 : test_equivalence_partial_solve_wit_2.
Axiom proof_of_test_equivalence_partial_solve_wit_3_pure : test_equivalence_partial_solve_wit_3_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_3 : test_equivalence_partial_solve_wit_3.
Axiom proof_of_test_equivalence_partial_solve_wit_4_pure : test_equivalence_partial_solve_wit_4_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_4 : test_equivalence_partial_solve_wit_4.
Axiom proof_of_test_equivalence_partial_solve_wit_5_pure : test_equivalence_partial_solve_wit_5_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_5 : test_equivalence_partial_solve_wit_5.

End VC_Correct.
