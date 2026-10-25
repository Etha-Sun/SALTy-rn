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

Definition test_neon_partial_solve_wit_114_pure_split_goal_2 := 
forall (params_pre: Z) (cm_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_stride_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (nc <= UINT64_MAX)) (PreH3 : (cn_stride <= UINT64_MAX)) (PreH4 : (cm_stride_pre <= UINT64_MAX)) (PreH5 : (a_stride_pre <= UINT64_MAX)) (PreH6 : (kc_pre <= UINT64_MAX)) (PreH7 : (mr_pre <= UINT64_MAX)) (PreH8 : (k >= 0)) (PreH9 : (nc >= 0)) (PreH10 : (cn_stride >= 0)) (PreH11 : (cm_stride_pre >= 0)) (PreH12 : (a_stride_pre >= 0)) (PreH13 : (kc_pre >= 0)) (PreH14 : (mr_pre >= 0)) (PreH15 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps)) <= INT_MAX)) (PreH16 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps)) <= INT_MAX)) (PreH17 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps)) <= INT_MAX)) (PreH18 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps)) <= INT_MAX)) (PreH19 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps)) <= INT_MAX)) (PreH20 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps)) <= INT_MAX)) (PreH21 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps)) <= INT_MAX)) (PreH22 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps)) <= INT_MAX)) (PreH23 : (offset <= INT_MAX)) (PreH24 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps)) >= INT_MIN)) (PreH25 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps)) >= INT_MIN)) (PreH26 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps)) >= INT_MIN)) (PreH27 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps)) >= INT_MIN)) (PreH28 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps)) >= INT_MIN)) (PreH29 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps)) >= INT_MIN)) (PreH30 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps)) >= INT_MIN)) (PreH31 : ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps)) >= INT_MIN)) (PreH32 : (offset >= INT_MIN)) (PreH33 : (k <> 0)) (PreH34 : (k < (8 * sizeof(CHAR) ))) (PreH35 : (cn_stride = 8)) (PreH36 : (mr_pre = 1)) (PreH37 : (0 < kc_pre)) (PreH38 : (0 < nc_pre)) (PreH39 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH40 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH41 : (qs8_matrix_wf kc_pre Ps )) (PreH42 : (sizeof(CHAR) = 1)) (PreH43 : (sizeof(FLOAT) = 4)) (PreH44 : (0 <= nc)) (PreH45 : (nc <= nc_pre)) (PreH46 : (0 < nc)) (PreH47 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH48 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH49 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH50 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH51 : (0 <= k)) (PreH52 : (k <= kc_pre)) (PreH53 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH54 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH55 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  (UndefStructPredint8x8_t ( &( "va0" ) ) )
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "c" ) )) # Ptr  |-> c_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "a_stride" ) )) # UInt64  |-> a_stride_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride_pre)
  **  ((( &( "cn_stride" ) )) # UInt64  |-> cn_stride)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "c0" ) )) # Ptr  |-> c0)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "a0" ) )) # Ptr  |-> a0)
  **  ((( &( "w" ) )) # Ptr  |-> w)
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps)))
|--
  “ (qs8_i8_address_ok 0 a0 a_pre w_pre kc_pre ((nc_pre - nc ) ÷ 8 ) (kc_pre - k ) Ps ) ”
.

