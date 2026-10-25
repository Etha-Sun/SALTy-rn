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

Definition test_neon_partial_solve_wit_10_pure_split_goal_4 := 
forall (params_pre: Z) (cn_stride_pre: Z) (cm_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_stride_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (cn_stride_pre <= UINT64_MAX)) (PreH2 : (cm_stride_pre <= UINT64_MAX)) (PreH3 : (a_stride_pre <= UINT64_MAX)) (PreH4 : (kc_pre <= UINT64_MAX)) (PreH5 : (nc_pre <= UINT64_MAX)) (PreH6 : (mr_pre <= UINT64_MAX)) (PreH7 : (cn_stride_pre >= 0)) (PreH8 : (cm_stride_pre >= 0)) (PreH9 : (a_stride_pre >= 0)) (PreH10 : (kc_pre >= 0)) (PreH11 : (nc_pre >= 0)) (PreH12 : (mr_pre >= 0)) (PreH13 : (offset <= INT_MAX)) (PreH14 : (offset >= INT_MIN)) (PreH15 : (c_pre <> 0)) (PreH16 : (w_pre <> 0)) (PreH17 : (a_pre <> 0)) (PreH18 : ((kc_pre % ( sizeof(CHAR) ) ) = 0)) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : ((kc_pre % ( sizeof(CHAR) ) ) = 0)) (PreH21 : (kc_pre <> 0)) (PreH22 : (nc_pre <> 0)) (PreH23 : (mr_pre <= 1)) (PreH24 : (mr_pre <> 0)) (PreH25 : (mr_pre = 1)) (PreH26 : (0 < nc_pre)) (PreH27 : (0 < kc_pre)) (PreH28 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH29 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH30 : (cn_stride_pre = 8)) (PreH31 : (a_pre <> 0)) (PreH32 : (w_pre <> 0)) (PreH33 : (c_pre <> 0)) (PreH34 : (params_pre <> 0)) ,
  (UndefStructPredint32x4_t ( &( "vacc0x0123" ) ) )
  **  ((( &( "c0" ) )) # Ptr  |-> c_pre)
  **  ((( &( "a0" ) )) # Ptr  |-> a_pre)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
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
  “ (w_pre = ((w_pre + (((nc_pre - nc_pre ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) ) + (4 * 0 ) )) ”
.

