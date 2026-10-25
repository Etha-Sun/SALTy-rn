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

Definition test_neon_partial_solve_wit_425 := 
forall (params_pre: Z) (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (retval: Z) (PreH1 : (k = 0)) (PreH2 : (k < (8 * sizeof(CHAR) ))) (PreH3 : (cn_stride = 8)) (PreH4 : (mr_pre = 1)) (PreH5 : (0 < kc_pre)) (PreH6 : (0 < nc_pre)) (PreH7 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH8 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH9 : (qs8_matrix_wf kc_pre Ps )) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : (sizeof(FLOAT) = 4)) (PreH12 : (0 <= nc)) (PreH13 : (nc <= nc_pre)) (PreH14 : (0 < nc)) (PreH15 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH16 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH17 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH18 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH19 : (0 <= k)) (PreH20 : (k <= kc_pre)) (PreH21 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH22 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH23 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  ((&((retval)  # "int16x4_t" ->ₛ "s0")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps))))) (magic))))) (offset)))))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s1")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps))))) (magic))))) (offset)))))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s2")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps))))) (magic))))) (offset)))))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s3")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps))))) (magic))))) (offset)))))
  **  (UndefStructPredint16x8_t ( &( "vacc0x01234567" ) ) )
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps))))) (magic))))) (offset)))
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((&(( &( "vscale0123" ) )->ₛ "s0")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s1")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s2")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s3")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s0")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s1")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s2")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s3")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps)))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s0")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s1")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps)))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s2")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps)))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s3")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s0")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s1")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s2")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s3")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps)))))
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s0")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s1")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s2")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s3")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s0")) # Int  |-> offset)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s1")) # Int  |-> offset)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s2")) # Int  |-> offset)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s3")) # Int  |-> offset)
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps))))) (magic))))) (offset)))
|--
  “ (k = 0) ” 
  &&  “ (k < (8 * sizeof(CHAR) )) ” 
  &&  “ (cn_stride = 8) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (domain_shape 1 nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre c_pre ) ” 
  &&  “ (qs8_matrix_wf kc_pre Ps ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (0 <= nc) ” 
  &&  “ (nc <= nc_pre) ” 
  &&  “ (0 < nc) ” 
  &&  “ (((nc_pre - nc ) % ( 8 ) ) = 0) ” 
  &&  “ (0 <= ((nc_pre - nc ) ÷ 8 )) ” 
  &&  “ (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps))) ” 
  &&  “ (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR)))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ” 
  &&  “ (((kc_pre - k ) % ( 8 ) ) = 0) ” 
  &&  “ (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR)))) ” 
  &&  “ (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR)))) ”
  &&  ((&((retval)  # "int16x4_t" ->ₛ "s0")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps))))) (magic))))) (offset)))))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s1")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps))))) (magic))))) (offset)))))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s2")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps))))) (magic))))) (offset)))))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s3")) # Short  |-> (qs8_narrow16 ((qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps))))) (magic))))) (offset)))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps))))) (magic))))) (offset)))
  **  (UndefStructPredint16x8_t ( &( "vacc0x01234567" ) ) )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((&(( &( "vscale0123" ) )->ₛ "s0")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s1")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s2")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps)))
  **  ((&(( &( "vscale0123" ) )->ₛ "s3")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s0")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s1")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s2")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps)))
  **  ((&(( &( "vscale4567" ) )->ₛ "s3")) # Float  |-> (qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps)))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s0")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s1")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps)))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s2")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps)))))
  **  ((&(( &( "vfpacc0x0123" ) )->ₛ "s3")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s0")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s1")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s2")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps)))))
  **  ((&(( &( "vfpacc0x4567" ) )->ₛ "s3")) # Float  |-> (f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps)))))
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s0")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s1")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s2")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias" ) )->ₛ "s3")) # Float  |-> magic)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s0")) # Int  |-> offset)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s1")) # Int  |-> offset)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s2")) # Int  |-> offset)
  **  ((&(( &( "vmagic_bias_less_output_zero_point" ) )->ₛ "s3")) # Int  |-> offset)
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps))))) (magic))))) (offset)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_ssub32 ((qs8_reinterpret ((f16_arm_add ((f16_arm_mul ((fp32_of_Z ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))))) ((qs8_scale (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps))))) (magic))))) (offset)))
.

