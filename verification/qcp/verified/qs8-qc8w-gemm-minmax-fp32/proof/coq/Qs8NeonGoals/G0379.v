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

Definition test_neon_entail_wit_3_split_goal_9 := 
forall (c_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (Ps: (@list panel_data)) (A: (@list Z)) (cp: Z) (wp: Z) (ap: Z) (nc: Z) (cn_stride: Z) (PreH1 : (nc <> 0)) (PreH2 : (cn_stride = 8)) (PreH3 : (mr_pre = 1)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < nc_pre)) (PreH6 : (domain_shape 1 nc_pre kc_pre Ps )) (PreH7 : (data_capacity nc_pre kc_pre a_pre w_pre c_pre )) (PreH8 : (qs8_matrix_wf kc_pre Ps )) (PreH9 : (sizeof(CHAR) = 1)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : (0 <= nc)) (PreH12 : (nc <= nc_pre)) (PreH13 : (0 < nc)) (PreH14 : (((nc_pre - nc ) % ( 8 ) ) = 0)) (PreH15 : (0 <= ((nc_pre - nc ) ÷ 8 ))) (PreH16 : (((nc_pre - nc ) ÷ 8 ) < (Zlength (Ps)))) (PreH17 : (cp = (c_pre + ((nc_pre - nc ) * sizeof(CHAR))))) (PreH18 : (ap = a_pre)) (PreH19 : (wp = (w_pre + ((((nc_pre - nc ) ÷ 8 ) * (64 + (8 * kc_pre ) ) ) * sizeof(CHAR))))) ,
  ((qs8_bias (((nc_pre - nc ) ÷ 8 )) ((0 + 0 )) (Ps)) = (qs8_acc ((kc_pre - kc_pre )) (((nc_pre - nc ) ÷ 8 )) (0) (A) (Ps)))
.

