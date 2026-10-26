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
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.Types.
Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts.
Require Import ArgmaxPool.APKernelModel.
Require Import ArgmaxPool.APPublicModel.
Local Open Scope sac.

(*----- Function argmax_public_pair -----*)

Definition argmax_public_pair_safety_wit_1 := 
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WR (app_rvv_output (F) (P) (DR) (OR) (IR)) )
  **  (ap_index WIR (app_rvv_index (F) (P) (DR) (OR) (IR)) )
  **  (ap_output WN (app_neon_output (F) (P) (DN) (ON) (IN)) )
  **  (ap_index WIN (app_neon_index (F) (P) (DN) (ON) (IN)) )
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels_pre)
  **  ((( &( "rows" ) )) # UInt64  |-> rows_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "offset" ) )) # UInt64  |-> offset_pre)
  **  ((( &( "stride" ) )) # UInt64  |-> stride_pre)
  **  ((( &( "outN" ) )) # Ptr  |-> outN_pre)
  **  ((( &( "idxN" ) )) # Ptr  |-> idxN_pre)
  **  ((( &( "outR" ) )) # Ptr  |-> outR_pre)
  **  ((( &( "idxR" ) )) # Ptr  |-> idxR_pre)
  **  ((( &( "input_inc" ) )) # UInt64  |-> input_inc_pre)
  **  ((( &( "output_inc" ) )) # UInt64  |-> output_inc_pre)
  **  ((( &( "index_inc" ) )) # UInt64  |-> index_inc_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition argmax_public_pair_return_wit_1 := 
(
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WR (app_rvv_output (F) (P) (DR) (OR) (IR)) )
  **  (ap_index WIR (app_rvv_index (F) (P) (DR) (OR) (IR)) )
  **  (ap_output WN (app_neon_output (F) (P) (DN) (ON) (IN)) )
  **  (ap_index WIN (app_neon_index (F) (P) (DN) (ON) (IN)) )
|--
  “ (1 = 1) ” 
  &&  “ (app_public_equal F P DN DR L (app_neon_output (F) (P) (DN) (ON) (IN)) (app_neon_index (F) (P) (DN) (ON) (IN)) (app_rvv_output (F) (P) (DR) (OR) (IR)) (app_rvv_index (F) (P) (DR) (OR) (IR)) ) ”
  &&  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WN (app_neon_output (F) (P) (DN) (ON) (IN)) )
  **  (ap_index WIN (app_neon_index (F) (P) (DN) (ON) (IN)) )
  **  (ap_output WR (app_rvv_output (F) (P) (DR) (OR) (IR)) )
  **  (ap_index WIR (app_rvv_index (F) (P) (DR) (OR) (IR)) )
) \/
(
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  TT && emp 
|--
  “ (app_public_equal F P DN DR L (app_neon_output (F) (P) (DN) (ON) (IN)) (app_neon_index (F) (P) (DN) (ON) (IN)) (app_rvv_output (F) (P) (DR) (OR) (IR)) (app_rvv_index (F) (P) (DR) (OR) (IR)) ) ”
  &&  emp
).

Definition argmax_public_pair_return_wit_1_split_goal_1 := 
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  (app_public_equal F P DN DR L (app_neon_output (F) (P) (DN) (ON) (IN)) (app_neon_index (F) (P) (DN) (ON) (IN)) (app_rvv_output (F) (P) (DR) (OR) (IR)) (app_rvv_index (F) (P) (DR) (OR) (IR)) )
.

Definition argmax_public_pair_partial_solve_wit_1_pure := 
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  ((( &( "pixels" ) )) # UInt64  |-> pixels_pre)
  **  ((( &( "rows" ) )) # UInt64  |-> rows_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "offset" ) )) # UInt64  |-> offset_pre)
  **  ((( &( "stride" ) )) # UInt64  |-> stride_pre)
  **  ((( &( "outN" ) )) # Ptr  |-> outN_pre)
  **  ((( &( "idxN" ) )) # Ptr  |-> idxN_pre)
  **  ((( &( "outR" ) )) # Ptr  |-> outR_pre)
  **  ((( &( "idxR" ) )) # Ptr  |-> idxR_pre)
  **  ((( &( "input_inc" ) )) # UInt64  |-> input_inc_pre)
  **  ((( &( "output_inc" ) )) # UInt64  |-> output_inc_pre)
  **  ((( &( "index_inc" ) )) # UInt64  |-> index_inc_pre)
  **  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WN ON )
  **  (ap_index WIN IN )
  **  (ap_output WR OR )
  **  (ap_index WIR IR )
|--
  “ (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_valid F P WN WIN DN ) ”
.

Definition argmax_public_pair_partial_solve_wit_1_aux := 
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WN ON )
  **  (ap_index WIN IN )
  **  (ap_output WR OR )
  **  (ap_index WIR IR )
|--
  “ (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_valid F P WN WIN DN ) ” 
  &&  “ (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_valid F P WN WIN DN ) ” 
  &&  “ (app_valid F P WR WIR DR ) ” 
  &&  “ (app_public_layout DN DR L ) ”
  &&  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WN ON )
  **  (ap_index WIN IN )
  **  (ap_output WR OR )
  **  (ap_index WIR IR )
.

Definition argmax_public_pair_partial_solve_wit_1 := argmax_public_pair_partial_solve_wit_1_pure -> argmax_public_pair_partial_solve_wit_1_aux.

Definition argmax_public_pair_partial_solve_wit_2_pure := 
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WN (app_neon_output (F) (P) (DN) (ON) (IN)) )
  **  (ap_index WIN (app_neon_index (F) (P) (DN) (ON) (IN)) )
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels_pre)
  **  ((( &( "rows" ) )) # UInt64  |-> rows_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "offset" ) )) # UInt64  |-> offset_pre)
  **  ((( &( "stride" ) )) # UInt64  |-> stride_pre)
  **  ((( &( "outN" ) )) # Ptr  |-> outN_pre)
  **  ((( &( "idxN" ) )) # Ptr  |-> idxN_pre)
  **  ((( &( "outR" ) )) # Ptr  |-> outR_pre)
  **  ((( &( "idxR" ) )) # Ptr  |-> idxR_pre)
  **  ((( &( "input_inc" ) )) # UInt64  |-> input_inc_pre)
  **  ((( &( "output_inc" ) )) # UInt64  |-> output_inc_pre)
  **  ((( &( "index_inc" ) )) # UInt64  |-> index_inc_pre)
  **  (ap_output WR OR )
  **  (ap_index WIR IR )
|--
  “ (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_valid F P WR WIR DR ) ”
.

Definition argmax_public_pair_partial_solve_wit_2_aux := 
forall (index_inc_pre: Z) (output_inc_pre: Z) (input_inc_pre: Z) (idxR_pre: Z) (outR_pre: Z) (idxN_pre: Z) (outN_pre: Z) (stride_pre: Z) (offset_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (pixels_pre: Z) (IR: APIndex) (OR: APOutput) (IN: APIndex) (ON: APOutput) (WIR: (@list Z)) (WR: (@list Z)) (WIN: (@list Z)) (WN: (@list Z)) (P: APPtrMap) (F: APMap) (L: APPublicLayout) (DR: APProgram) (DN: APProgram) (PreH1 : (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH2 : (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre )) (PreH3 : (app_valid F P WN WIN DN )) (PreH4 : (app_valid F P WR WIR DR )) (PreH5 : (app_public_layout DN DR L )) ,
  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WN (app_neon_output (F) (P) (DN) (ON) (IN)) )
  **  (ap_index WIN (app_neon_index (F) (P) (DN) (ON) (IN)) )
  **  (ap_output WR OR )
  **  (ap_index WIR IR )
|--
  “ (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_valid F P WR WIR DR ) ” 
  &&  “ (app_arguments DN pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outN_pre idxN_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_arguments DR pixels_pre rows_pre channels_pre input_pre offset_pre stride_pre outR_pre idxR_pre input_inc_pre output_inc_pre index_inc_pre ) ” 
  &&  “ (app_valid F P WN WIN DN ) ” 
  &&  “ (app_valid F P WR WIR DR ) ” 
  &&  “ (app_public_layout DN DR L ) ”
  &&  (ap_data F )
  **  (ap_ptr_data P )
  **  (ap_output WR OR )
  **  (ap_index WIR IR )
  **  (ap_output WN (app_neon_output (F) (P) (DN) (ON) (IN)) )
  **  (ap_index WIN (app_neon_index (F) (P) (DN) (ON) (IN)) )
.

Definition argmax_public_pair_partial_solve_wit_2 := argmax_public_pair_partial_solve_wit_2_pure -> argmax_public_pair_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_argmax_public_pair_safety_wit_1 : argmax_public_pair_safety_wit_1.
Axiom proof_of_argmax_public_pair_return_wit_1 : argmax_public_pair_return_wit_1.
Axiom proof_of_argmax_public_pair_partial_solve_wit_1_pure : argmax_public_pair_partial_solve_wit_1_pure.
Axiom proof_of_argmax_public_pair_partial_solve_wit_1 : argmax_public_pair_partial_solve_wit_1.
Axiom proof_of_argmax_public_pair_partial_solve_wit_2_pure : argmax_public_pair_partial_solve_wit_2_pure.
Axiom proof_of_argmax_public_pair_partial_solve_wit_2 : argmax_public_pair_partial_solve_wit_2.

End VC_Correct.
