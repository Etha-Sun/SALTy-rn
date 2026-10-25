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

Definition test_neon_partial_solve_wit_677 := 
forall (params_pre: Z) (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (cp: Z) (wp: Z) (ap: Z) (nc: Z) (cn_stride: Z) (retval: Z) (PreH1 : (nc <> 0)) (PreH2 : (cn_stride = 8)) (PreH3 : (mr_pre = 1)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < nc_pre)) (PreH6 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH7 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH8 : (qs8_matrix_wf kc_pre Ps )) (PreH9 : (sizeof(CHAR) = 1)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : (0 <= nc)) (PreH12 : (nc <= nc_pre)) (PreH13 : (0 < nc)) (PreH14 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH15 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH16 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH17 : (cp = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH18 : (ap = a_pre)) (PreH19 : (wp = (w_pre + ((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) * sizeof(CHAR))))) ,
  (packed_matrix kc_pre w_pre Ps )
  **  ((&((retval)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps)))
  **  ((&((retval)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps)))
  **  ((&((retval)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps)))
  **  ((&((retval)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps)))
  **  (UndefStructPredint32x4_t ( &( "vacc0x4567" ) ) )
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)))
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (nc <> 0) ” 
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
  &&  “ (cp = (c_pre + ((nc_pre - nc ) * sizeof(CHAR)))) ” 
  &&  “ (ap = a_pre) ” 
  &&  “ (wp = (w_pre + ((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) * sizeof(CHAR)))) ”
  &&  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 3 )) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 2 )) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 1 )) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((4 + 0 )) (Ps)))
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 3 )) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 2 )) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 1 )) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)))
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
.

