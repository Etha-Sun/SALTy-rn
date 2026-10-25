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

Definition test_neon_partial_solve_wit_150 := 
forall (params_pre: Z) (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (k > (2 * sizeof(CHAR) ))) (PreH2 : (k >= (2 * sizeof(CHAR) ))) (PreH3 : (k <> 0)) (PreH4 : (k < (8 * sizeof(CHAR) ))) (PreH5 : (cn_stride = 8)) (PreH6 : (mr_pre = 1)) (PreH7 : (0 < kc_pre)) (PreH8 : (0 < nc_pre)) (PreH9 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH10 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH11 : (qs8_matrix_wf kc_pre Ps )) (PreH12 : (sizeof(CHAR) = 1)) (PreH13 : (sizeof(FLOAT) = 4)) (PreH14 : (0 <= nc)) (PreH15 : (nc <= nc_pre)) (PreH16 : (0 < nc)) (PreH17 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH18 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH19 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH20 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH21 : (0 <= k)) (PreH22 : (k <= kc_pre)) (PreH23 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH24 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH25 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (3) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (3) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (2) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (2) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (1) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (1) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (0) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (0) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (7) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (6) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (5) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (4) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
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
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s0")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (0) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s1")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (1) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s2")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (2) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s3")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (3) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s4")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (4) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s5")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (5) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s6")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (6) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s7")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (7) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s0")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (0) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s1")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (1) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s2")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (2) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s3")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (3) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s4")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (4) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s5")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (5) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s6")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (6) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s7")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (7) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s0")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (0) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s1")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (1) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s2")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (2) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s3")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (3) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s4")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (4) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s5")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (5) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s6")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (6) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s7")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (7) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s0")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (0) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s1")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (1) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s2")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (2) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s3")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (3) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s4")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (4) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s5")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (5) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s6")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (6) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s7")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (7) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s0")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s1")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s2")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s3")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s4")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s5")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s6")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s7")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps)))
|--
  “ (k > (2 * sizeof(CHAR) )) ” 
  &&  “ (k >= (2 * sizeof(CHAR) )) ” 
  &&  “ (k <> 0) ” 
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
  &&  ((&(( &( "vxb01234567c2" ) )->ₛ "s0")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (0) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s1")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (1) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s2")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (2) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s3")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (3) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s4")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (4) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s5")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (5) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s6")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (6) (A) (Ps)))
  **  ((&(( &( "vxb01234567c2" ) )->ₛ "s7")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (7) (A) (Ps)))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (3) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (3) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (3) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (3) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (2) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (2) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (1) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (1) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (1) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (1) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x0123" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (0) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (0) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (0) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s3")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (7) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (7) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (7) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s2")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (6) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (6) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (6) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s1")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (5) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (5) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (5) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
  **  ((&(( &( "vacc0x4567" ) )->ₛ "s0")) # Int  |-> (qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (4) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (4) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (4) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))))))
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
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s0")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (0) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s1")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (1) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s2")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (2) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s3")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (3) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s4")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (4) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s5")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (5) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s6")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (6) (A) (Ps)))
  **  ((&(( &( "vb01234567c1" ) )->ₛ "s7")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (7) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s0")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (0) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s1")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (1) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s2")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (2) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s3")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (3) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s4")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (4) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s5")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (5) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s6")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (6) (A) (Ps)))
  **  ((&(( &( "vxb01234567c1" ) )->ₛ "s7")) # Short  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (7) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s0")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (0) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s1")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (1) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s2")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (2) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s3")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (3) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s4")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (4) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s5")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (5) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s6")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (6) (A) (Ps)))
  **  ((&(( &( "vb01234567c2" ) )->ₛ "s7")) # Char  |-> (qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (7) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s0")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s1")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s2")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s3")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s4")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s5")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s6")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps)))
  **  ((&(( &( "vxa0" ) )->ₛ "s7")) # Short  |-> (qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps)))
.

