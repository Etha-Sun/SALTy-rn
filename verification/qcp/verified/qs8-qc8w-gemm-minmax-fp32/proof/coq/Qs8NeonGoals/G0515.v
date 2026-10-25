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

Definition test_neon_entail_wit_4_72_split_goal_spatial := 
forall (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (w: Z) (a0: Z) (k: Z) (c0: Z) (nc: Z) (cn_stride: Z) (PreH1 : (nc < 8)) (PreH2 : (k = 0)) (PreH3 : (k < (8 * sizeof(CHAR) ))) (PreH4 : (cn_stride = 8)) (PreH5 : (mr_pre = 1)) (PreH6 : (0 < kc_pre)) (PreH7 : (0 < nc_pre)) (PreH8 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH9 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH10 : (qs8_matrix_wf kc_pre Ps )) (PreH11 : (sizeof(CHAR) = 1)) (PreH12 : (sizeof(FLOAT) = 4)) (PreH13 : (0 <= nc)) (PreH14 : (nc <= nc_pre)) (PreH15 : (0 < nc)) (PreH16 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH17 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH18 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH19 : (c0 = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH20 : (0 <= k)) (PreH21 : (k <= kc_pre)) (PreH22 : (((kc_pre - k ) % ( 8 ) ) = 0)) (PreH23 : (a0 = (a_pre + ((kc_pre - k ) * sizeof(CHAR))))) (PreH24 : (w = (w_pre + ((((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) + 32 ) + (8 * (kc_pre - k ) ) ) * sizeof(CHAR))))) (PreH25 : ((Z.land nc 4) = 0)) (PreH26 : ((Z.land nc 2) = 0)) (PreH27 : ((Z.land nc 1) = 0)) ,
  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - nc ) kc_pre A Ps magic offset lo hi )
|--
  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_prefix c_pre nc_pre (nc_pre - 0 ) kc_pre A Ps magic offset lo hi )
.

