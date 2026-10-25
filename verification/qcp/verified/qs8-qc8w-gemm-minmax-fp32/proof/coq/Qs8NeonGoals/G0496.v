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

Definition test_neon_entail_wit_4_63 := 
(
forall (params_pre: Z) (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (nc < 8)) (PreH2 : (k < (2 * sizeof(CHAR) ))) (PreH3 : (k <> 0)) (PreH4 : (k < (8 * sizeof(CHAR) ))) (PreH5 : (cn_stride = 8)) (PreH6 : (mr_pre = 1)) (PreH7 : (0 < kc_pre)) (PreH8 : (0 < nc_pre)) (PreH9 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH10 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH11 : (qs8_matrix_wf kc_pre Ps )) (PreH12 : (sizeof(CHAR) = 1)) (PreH13 : (sizeof(FLOAT) = 4)) (PreH14 : (0 <= nc)) (PreH15 : (nc <= nc_pre)) (PreH16 : (0 < nc)) (PreH17 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH18 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH19 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH20 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH21 : (0 <= k)) (PreH22 : (k <= kc_pre)) (PreH23 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH24 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH25 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) (PreH26 : ((Z.land nc 4) <> 0)) (PreH27 : ((Z.land nc 2) = 0)) (PreH28 : ((Z.land nc 1) = 0)) ,
  (qs8_write_state c_pre nc_pre ((nc_pre - nc ) + 4 ) (qs8_append ((completed_values (kc_pre) ((nc_pre - nc )) (A) (Ps) (magic) (offset) (lo) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((@nil Z))))))))))) )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (cn_stride = 8) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (domain_shape 1 nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre c_pre ) ” 
  &&  “ (qs8_matrix_wf kc_pre Ps ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= nc_pre) ” 
  &&  “ (0 = 0) ”
  &&  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - 0 ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
) \/
(
forall (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (nc < 8)) (PreH2 : (k < (2 * sizeof(CHAR) ))) (PreH3 : (k <> 0)) (PreH4 : (k < (8 * sizeof(CHAR) ))) (PreH5 : (cn_stride = 8)) (PreH6 : (mr_pre = 1)) (PreH7 : (0 < kc_pre)) (PreH8 : (0 < nc_pre)) (PreH9 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH10 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH11 : (qs8_matrix_wf kc_pre Ps )) (PreH12 : (sizeof(CHAR) = 1)) (PreH13 : (sizeof(FLOAT) = 4)) (PreH14 : (0 <= nc)) (PreH15 : (nc <= nc_pre)) (PreH16 : (0 < nc)) (PreH17 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH18 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH19 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH20 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH21 : (0 <= k)) (PreH22 : (k <= kc_pre)) (PreH23 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH24 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH25 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) (PreH26 : ((Z.land nc 4) <> 0)) (PreH27 : ((Z.land nc 2) = 0)) (PreH28 : ((Z.land nc 1) = 0)) ,
  (qs8_write_state c_pre nc_pre ((nc_pre - nc ) + 4 ) (qs8_append ((completed_values (kc_pre) ((nc_pre - nc )) (A) (Ps) (magic) (offset) (lo) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((cons ((qs8_min ((qs8_max ((qs8_narrow8 ((qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps))))) (magic))))) (offset))))))) (lo))) (hi))) ((@nil Z))))))))))) )
  **  (packed_matrix kc_pre w_pre Ps )
|--
  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - 0 ) kc_pre A Ps magic offset lo hi )
).

