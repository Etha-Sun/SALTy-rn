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

Definition test_neon_entail_wit_1_split_goal_11 := 
forall (params_pre: Z) (cn_stride_pre: Z) (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (c_pre <> 0)) (PreH2 : (w_pre <> 0)) (PreH3 : (a_pre <> 0)) (PreH4 : ((kc_pre % ( sizeof(CHAR) ) ) = 0)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((kc_pre % ( sizeof(CHAR) ) ) = 0)) (PreH7 : (kc_pre <> 0)) (PreH8 : (nc_pre <> 0)) (PreH9 : (mr_pre <= 1)) (PreH10 : (mr_pre <> 0)) (PreH11 : (mr_pre = 1)) (PreH12 : (0 < nc_pre)) (PreH13 : (0 < kc_pre)) (PreH14 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH15 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH16 : (cn_stride_pre = 8)) (PreH17 : (a_pre <> 0)) (PreH18 : (w_pre <> 0)) (PreH19 : (c_pre <> 0)) (PreH20 : (params_pre <> 0)) ,
  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full c_pre nc_pre )
|--
  “ ((qs8_bias (((nc_pre - nc_pre ) ÷ 8 )) ((0 + 3 )) (Ps)) = (qs8_acc ((kc_pre - kc_pre )) (((nc_pre - nc_pre ) ÷ 8 )) (3) (A) (Ps))) ”
.

