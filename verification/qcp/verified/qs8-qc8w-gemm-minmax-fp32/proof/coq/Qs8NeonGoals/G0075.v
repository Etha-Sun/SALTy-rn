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

Definition test_neon_safety_wit_76 := 
forall (params_pre: Z) (cm_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_stride_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (k < (2 * sizeof(CHAR) ))) (PreH2 : (k <> 0)) (PreH3 : (k < (8 * sizeof(CHAR) ))) (PreH4 : (cn_stride = 8)) (PreH5 : (mr_pre = 1)) (PreH6 : (0 < kc_pre)) (PreH7 : (0 < nc_pre)) (PreH8 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH9 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH10 : (qs8_matrix_wf kc_pre Ps )) (PreH11 : (sizeof(CHAR) = 1)) (PreH12 : (sizeof(FLOAT) = 4)) (PreH13 : (0 <= nc)) (PreH14 : (nc <= nc_pre)) (PreH15 : (0 < nc)) (PreH16 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH17 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH18 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH19 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH20 : (0 <= k)) (PreH21 : (k <= kc_pre)) (PreH22 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH23 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH24 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  ((&(( &( "vscale0123" ) )->ₛ "s3")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s2")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s1")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s0")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)))
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s3")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s2")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s1")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s0")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s3")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s2")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s1")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s0")) # Float  |-> (fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))))
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
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
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

