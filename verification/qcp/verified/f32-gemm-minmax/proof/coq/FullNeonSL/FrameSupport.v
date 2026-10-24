From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From GemmNeon Require Import CopyFacts LayoutModel copy_strategy_proof.
From LeaderAutomation Require Import FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac frame_pure := repeat first [assumption | split | reflexivity]; lia.
Ltac full_neon_frame :=
 rewrite ?sizeof_float in *;
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?neon_local_field_address;
 first [apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;frame_pure
  |forget_rhs_fields;LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel]
 |forget_rhs_fields;LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel].
