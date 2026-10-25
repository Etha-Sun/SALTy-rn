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
Require Import SpmmSpec.TupleMemory.
Require Import GemmSpec.FmaModel.
Require Import SpmmSpec.Model SpmmSpec.Vectors.
Require Import SpmmSpec.Memory.
Local Open Scope sac.
From SpmmSpec Require Import tuple_strategy_goal.
From SpmmSpec Require Import tuple_strategy_proof.
From SpmmVectors Require Import vectors_strategy_goal.
From SpmmVectors Require Import vectors_strategy_proof.

(*----- Function equivalent -----*)

Definition equivalent_safety_wit_1 := 
forall (params_pre: Z) (output_stride_pre: Z) (output_rvv_pre: Z) (output_neon_pre: Z) (nidx_nnzmap_pre: Z) (widx_dmap_pre: Z) (weights_pre: Z) (input_pre: Z) (nc_pre: Z) (mc_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (D: (@list Z)) (NN: (@list Z)) (a: Z) (start: Z) (rows: Z) (PreH1 : (mc_pre = (4 * rows ))) (PreH2 : (input_pre = (a + (start * sizeof(FLOAT))))) (PreH3 : (spmm_shape rows nc_pre start NN D A W )) (PreH4 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W )) (PreH5 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W )) ,
  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
  **  ((( &( "mc" ) )) # UInt64  |-> mc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "widx_dmap" ) )) # Ptr  |-> widx_dmap_pre)
  **  ((( &( "nidx_nnzmap" ) )) # Ptr  |-> nidx_nnzmap_pre)
  **  ((( &( "output_neon" ) )) # Ptr  |-> output_neon_pre)
  **  ((( &( "output_rvv" ) )) # Ptr  |-> output_rvv_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition equivalent_return_wit_1 := 
forall (params_pre: Z) (output_stride_pre: Z) (output_rvv_pre: Z) (output_neon_pre: Z) (nidx_nnzmap_pre: Z) (widx_dmap_pre: Z) (weights_pre: Z) (input_pre: Z) (nc_pre: Z) (mc_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (D: (@list Z)) (NN: (@list Z)) (a: Z) (start: Z) (rows: Z) (PreH1 : (mc_pre = (4 * rows ))) (PreH2 : (input_pre = (a + (start * sizeof(FLOAT))))) (PreH3 : (spmm_shape rows nc_pre start NN D A W )) (PreH4 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W )) (PreH5 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W )) ,
  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
|--
  “ (1 = 1) ”
  &&  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (output_stride_pre: Z) (output_rvv_pre: Z) (output_neon_pre: Z) (nidx_nnzmap_pre: Z) (widx_dmap_pre: Z) (weights_pre: Z) (input_pre: Z) (nc_pre: Z) (mc_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (D: (@list Z)) (NN: (@list Z)) (a: Z) (start: Z) (rows: Z) (PreH1 : (mc_pre = (4 * rows ))) (PreH2 : (input_pre = (a + (start * sizeof(FLOAT))))) (PreH3 : (spmm_shape rows nc_pre start NN D A W )) (PreH4 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W )) (PreH5 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W )) ,
  ((( &( "mc" ) )) # UInt64  |-> mc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "widx_dmap" ) )) # Ptr  |-> widx_dmap_pre)
  **  ((( &( "nidx_nnzmap" ) )) # Ptr  |-> nidx_nnzmap_pre)
  **  ((( &( "output_neon" ) )) # Ptr  |-> output_neon_pre)
  **  ((( &( "output_rvv" ) )) # Ptr  |-> output_rvv_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
|--
  “ (mc_pre = (4 * rows )) ” 
  &&  “ (input_pre = (a + (start * sizeof(FLOAT)))) ” 
  &&  “ (spmm_shape rows nc_pre start NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W ) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (output_stride_pre: Z) (output_rvv_pre: Z) (output_neon_pre: Z) (nidx_nnzmap_pre: Z) (widx_dmap_pre: Z) (weights_pre: Z) (input_pre: Z) (nc_pre: Z) (mc_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (D: (@list Z)) (NN: (@list Z)) (a: Z) (start: Z) (rows: Z) (PreH1 : (mc_pre = (4 * rows ))) (PreH2 : (input_pre = (a + (start * sizeof(FLOAT))))) (PreH3 : (spmm_shape rows nc_pre start NN D A W )) (PreH4 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W )) (PreH5 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W )) ,
  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
|--
  “ (mc_pre = (4 * rows )) ” 
  &&  “ (input_pre = (a + (start * sizeof(FLOAT)))) ” 
  &&  “ (spmm_shape rows nc_pre start NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W ) ” 
  &&  “ (mc_pre = (4 * rows )) ” 
  &&  “ (input_pre = (a + (start * sizeof(FLOAT)))) ” 
  &&  “ (spmm_shape rows nc_pre start NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W ) ”
  &&  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (output_stride_pre: Z) (output_rvv_pre: Z) (output_neon_pre: Z) (nidx_nnzmap_pre: Z) (widx_dmap_pre: Z) (weights_pre: Z) (input_pre: Z) (nc_pre: Z) (mc_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (D: (@list Z)) (NN: (@list Z)) (a: Z) (start: Z) (rows: Z) (PreH1 : (mc_pre = (4 * rows ))) (PreH2 : (input_pre = (a + (start * sizeof(FLOAT))))) (PreH3 : (spmm_shape rows nc_pre start NN D A W )) (PreH4 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W )) (PreH5 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W )) ,
  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
  **  ((( &( "mc" ) )) # UInt64  |-> mc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "widx_dmap" ) )) # Ptr  |-> widx_dmap_pre)
  **  ((( &( "nidx_nnzmap" ) )) # Ptr  |-> nidx_nnzmap_pre)
  **  ((( &( "output_neon" ) )) # Ptr  |-> output_neon_pre)
  **  ((( &( "output_rvv" ) )) # Ptr  |-> output_rvv_pre)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
|--
  “ (mc_pre = (4 * rows )) ” 
  &&  “ (input_pre = (a + (start * sizeof(FLOAT)))) ” 
  &&  “ (spmm_shape rows nc_pre start NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W ) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (output_stride_pre: Z) (output_rvv_pre: Z) (output_neon_pre: Z) (nidx_nnzmap_pre: Z) (widx_dmap_pre: Z) (weights_pre: Z) (input_pre: Z) (nc_pre: Z) (mc_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (D: (@list Z)) (NN: (@list Z)) (a: Z) (start: Z) (rows: Z) (PreH1 : (mc_pre = (4 * rows ))) (PreH2 : (input_pre = (a + (start * sizeof(FLOAT))))) (PreH3 : (spmm_shape rows nc_pre start NN D A W )) (PreH4 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W )) (PreH5 : (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W )) ,
  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
|--
  “ (mc_pre = (4 * rows )) ” 
  &&  “ (input_pre = (a + (start * sizeof(FLOAT)))) ” 
  &&  “ (spmm_shape rows nc_pre start NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W ) ” 
  &&  “ (mc_pre = (4 * rows )) ” 
  &&  “ (input_pre = (a + (start * sizeof(FLOAT)))) ” 
  &&  “ (spmm_shape rows nc_pre start NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_neon_pre NN D A W ) ” 
  &&  “ (spmm_capacity rows nc_pre output_stride_pre a weights_pre widx_dmap_pre nidx_nnzmap_pre output_rvv_pre NN D A W ) ”
  &&  (FloatArray.full a (Zlength (A)) A )
  **  (FloatArray.full weights_pre (Zlength (W)) W )
  **  (IntArray.full widx_dmap_pre (Zlength (D)) D )
  **  (UIntArray.full nidx_nnzmap_pre nc_pre NN )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (spmm_output output_rvv_pre rows nc_pre output_stride_pre 0 0 0 start NN D A W lo hi )
  **  (spmm_output output_neon_pre rows nc_pre output_stride_pre rows 0 0 start NN D A W lo hi )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include tuple_Strategy_Correct.
Include vectors_Strategy_Correct.

Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.

End VC_Correct.
