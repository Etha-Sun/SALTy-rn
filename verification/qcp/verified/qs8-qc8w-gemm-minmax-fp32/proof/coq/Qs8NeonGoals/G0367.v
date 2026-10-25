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

Definition test_neon_entail_wit_2_split_goal_7 := 
forall (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (k >= (8 * sizeof(CHAR) ))) (PreH2 : (cn_stride = 8)) (PreH3 : (mr_pre = 1)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < nc_pre)) (PreH6 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH7 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH8 : (qs8_matrix_wf kc_pre Ps )) (PreH9 : (sizeof(CHAR) = 1)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : (0 <= nc)) (PreH12 : (nc <= nc_pre)) (PreH13 : (0 < nc)) (PreH14 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH15 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH16 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH17 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) (PreH20 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH21 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH22 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) ,
  ((qs8_mac ((qs8_mac ((qs8_mac ((qs8_mac ((qs8_mac ((qs8_mac ((qs8_mac ((qs8_mac ((qs8_acc ((kc_pre - k )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 0 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 8 )) (2) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 16 )) (2) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 24 )) (2) (A) (Ps))) ((qs8_lane4 (3) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (0) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (1) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (2) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (3) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 32 )) (2) (A) (Ps))) ((qs8_lane4 (0) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 40 )) (2) (A) (Ps))) ((qs8_lane4 (1) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 48 )) (2) (A) (Ps))) ((qs8_lane4 (2) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps))))))) ((qs8_char (1) (((nc_pre - nc ) ÷ 8 )) (((8 * (kc_pre - k ) ) + 56 )) (2) (A) (Ps))) ((qs8_lane4 (3) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (4) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (5) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (6) (A) (Ps))) ((qs8_char (0) (((nc_pre - nc ) ÷ 8 )) ((kc_pre - k )) (7) (A) (Ps)))))) = (qs8_acc ((kc_pre - (k - (8 * 1 ) ) )) (((nc_pre - nc ) ÷ 8 )) (2) (A) (Ps)))
.

