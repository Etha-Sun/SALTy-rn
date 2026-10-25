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
Require Import Qs8Gemm.Model Qs8Gemm.Layouts.
Require Import Qs8Gemm.Model Qs8Gemm.Layouts.
Local Open Scope sac.
From Qs8Gemm Require Import copy_strategy_goal.
From Qs8Gemm Require Import copy_strategy_proof.

(*----- Function test_neon -----*)

Definition test_neon_partial_solve_wit_1_pure := 
forall (params_pre: Z) (cn_stride_pre: Z) (cm_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_stride_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre <> 0)) (PreH2 : (mr_pre = 1)) (PreH3 : (0 < nc_pre)) (PreH4 : (0 < kc_pre)) (PreH5 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH7 : (cn_stride_pre = 8)) (PreH8 : (a_pre <> 0)) (PreH9 : (w_pre <> 0)) (PreH10 : (c_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "a_stride" ) )) # UInt64  |-> a_stride_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "c" ) )) # Ptr  |-> c_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride_pre)
  **  ((( &( "cn_stride" ) )) # UInt64  |-> cn_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full c_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (1 <> 0) ”
.

Definition test_neon_partial_solve_wit_1_aux := 
forall (params_pre: Z) (cn_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre <> 0)) (PreH2 : (mr_pre = 1)) (PreH3 : (0 < nc_pre)) (PreH4 : (0 < kc_pre)) (PreH5 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH7 : (cn_stride_pre = 8)) (PreH8 : (a_pre <> 0)) (PreH9 : (w_pre <> 0)) (PreH10 : (c_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full c_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (1 <> 0) ” 
  &&  “ (mr_pre <> 0) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre c_pre ) ” 
  &&  “ (cn_stride_pre = 8) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (c_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full c_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
.

Definition test_neon_partial_solve_wit_1 := test_neon_partial_solve_wit_1_pure -> test_neon_partial_solve_wit_1_aux.

