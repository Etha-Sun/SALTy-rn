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

Definition test_neon_safety_wit_49 := 
forall (params_pre: Z) (cm_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_stride_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (retval: Z) (retval_2: Z) (PreH1 : (k <> 0)) (PreH2 : (k < (8 * sizeof(CHAR) ))) (PreH3 : (cn_stride = 8)) (PreH4 : (mr_pre = 1)) (PreH5 : (0 < kc_pre)) (PreH6 : (0 < nc_pre)) (PreH7 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH8 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH9 : (qs8_matrix_wf kc_pre Ps )) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : (sizeof(FLOAT) = 4)) (PreH12 : (0 <= nc)) (PreH13 : (nc <= nc_pre)) (PreH14 : (0 < nc)) (PreH15 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH16 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH17 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH18 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH19 : (0 <= k)) (PreH20 : (k <= kc_pre)) (PreH21 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH22 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH23 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  ((&((retval_2)  # "int16x4_t" ->ₛ "s0")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps)))
  **  ((&((retval_2)  # "int16x4_t" ->ₛ "s1")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps)))
  **  ((&((retval_2)  # "int16x4_t" ->ₛ "s2")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps)))
  **  ((&((retval_2)  # "int16x4_t" ->ₛ "s3")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s0")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps)))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s1")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps)))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s2")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps)))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s3")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps)))
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
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps)))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps)))
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

