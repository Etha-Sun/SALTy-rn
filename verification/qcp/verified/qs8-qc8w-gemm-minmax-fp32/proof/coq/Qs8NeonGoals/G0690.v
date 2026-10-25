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

Definition test_neon_partial_solve_wit_130_pure := 
(
forall (params_pre: Z) (cm_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_stride_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (k >= (2 * sizeof(CHAR) ))) (PreH2 : (k <> 0)) (PreH3 : (k < (8 * sizeof(CHAR) ))) (PreH4 : (cn_stride = 8)) (PreH5 : (mr_pre = 1)) (PreH6 : (0 < kc_pre)) (PreH7 : (0 < nc_pre)) (PreH8 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH9 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH10 : (qs8_matrix_wf kc_pre Ps )) (PreH11 : (sizeof(CHAR) = 1)) (PreH12 : (sizeof(FLOAT) = 4)) (PreH13 : (0 <= nc)) (PreH14 : (nc <= nc_pre)) (PreH15 : (0 < nc)) (PreH16 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH17 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH18 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH19 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH20 : (0 <= k)) (PreH21 : (k <= kc_pre)) (PreH22 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH23 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH24 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  (UndefStructPredint8x8_t ( &( "vb01234567c1" ) ) )
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
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
  **  ((( &( "a0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (a0) (64)) + k )) (64)))
  **  ((( &( "w" ) )) # Ptr  |-> (w + (8 * sizeof(CHAR))))
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((&(( &( "va0" ) )->ₛ "s0")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s1")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s2")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s3")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s4")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s5")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s6")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s7")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s0")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s1")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s2")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s3")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s4")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s5")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s6")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s7")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s0")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s1")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s2")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s3")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s4")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s5")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s6")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s7")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s0")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s1")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s2")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s3")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s4")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s5")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s6")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s7")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps)))
|--
  “ (0 < kc_pre) ” 
  &&  “ (qs8_matrix_wf kc_pre Ps ) ” 
  &&  “ (qs8_i8_address_ok 1 (w + (8 * sizeof(CHAR))) a_pre w_pre kc_pre ((nc_pre - nc ) ÷ 8 ) ((8 * (kc_pre - k ) ) + 8 ) Ps ) ” 
  &&  “ (qs8_i8_address_ok 1 ((w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * 1)) + (8 * 1)) a_pre w_pre kc_pre ((nc_pre - nc ) ÷ 8 ) ((8 * (kc_pre - k ) ) + 8 ) Ps ) ”
) \/
(
forall (params_pre: Z) (cm_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_stride_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (nc <= UINT64_MAX)) (PreH3 : (cn_stride <= UINT64_MAX)) (PreH4 : (cm_stride_pre <= UINT64_MAX)) (PreH5 : (a_stride_pre <= UINT64_MAX)) (PreH6 : (kc_pre <= UINT64_MAX)) (PreH7 : (mr_pre <= UINT64_MAX)) (PreH8 : (k >= 0)) (PreH9 : (nc >= 0)) (PreH10 : (cn_stride >= 0)) (PreH11 : (cm_stride_pre >= 0)) (PreH12 : (a_stride_pre >= 0)) (PreH13 : (kc_pre >= 0)) (PreH14 : (mr_pre >= 0)) (PreH15 : (offset <= INT_MAX)) (PreH16 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH17 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH18 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH19 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH20 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH21 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH22 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH23 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) <= INT_MAX)) (PreH24 : (offset >= INT_MIN)) (PreH25 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH26 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH27 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH28 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH29 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH30 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH31 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH32 : ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))) >= INT_MIN)) (PreH33 : (k >= (2 * sizeof(CHAR) ))) (PreH34 : (k <> 0)) (PreH35 : (k < (8 * sizeof(CHAR) ))) (PreH36 : (cn_stride = 8)) (PreH37 : (mr_pre = 1)) (PreH38 : (0 < kc_pre)) (PreH39 : (0 < nc_pre)) (PreH40 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH41 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH42 : (qs8_matrix_wf kc_pre Ps )) (PreH43 : (sizeof(CHAR) = 1)) (PreH44 : (sizeof(FLOAT) = 4)) (PreH45 : (0 <= nc)) (PreH46 : (nc <= nc_pre)) (PreH47 : (0 < nc)) (PreH48 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH49 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH50 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH51 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH52 : (0 <= k)) (PreH53 : (k <= kc_pre)) (PreH54 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH55 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH56 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  (UndefStructPredint8x8_t ( &( "vb01234567c1" ) ) )
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
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
  **  ((( &( "a0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (a0) (64)) + k )) (64)))
  **  ((( &( "w" ) )) # Ptr  |-> (w + (8 * sizeof(CHAR))))
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((&(( &( "va0" ) )->ₛ "s0")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s1")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s2")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s3")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s4")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s5")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s6")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps)))
  **  ((&(( &( "va0" ) )->ₛ "s7")) # Char  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s0")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s1")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s2")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s3")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s4")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s5")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s6")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps)))
  **  ((&(( &( "vb01234567c0" ) )->ₛ "s7")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s0")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s1")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s2")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s3")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s4")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s5")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s6")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps)))
  **  ((&(( &( "vxb01234567c0" ) )->ₛ "s7")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s0")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s1")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s2")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s3")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s4")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s5")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s6")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s7")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps)))
|--
  “ (qs8_i8_address_ok 1 ((w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * 1)) + (8 * 1)) a_pre w_pre kc_pre ((nc_pre - nc ) ÷ 8 ) ((8 * (kc_pre - k ) ) + 8 ) Ps ) ” 
  &&  “ (qs8_i8_address_ok 1 (w + (8 * 1)) a_pre w_pre kc_pre ((nc_pre - nc ) ÷ 8 ) ((8 * (kc_pre - k ) ) + 8 ) Ps ) ”
).

