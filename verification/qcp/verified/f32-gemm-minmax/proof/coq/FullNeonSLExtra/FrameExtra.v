From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From GemmNeon Require Import CopyFacts LayoutModel copy_strategy_proof.
From LeaderAutomation Require Import FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac full_neon_extra_pure :=
 subst;
 repeat rewrite Z.add_assoc in *;
 repeat first[assumption|split|reflexivity];
 first[lia|nia|congruence|(repeat f_equal;lia)].
Ltac full_neon_extra_frame :=
 rewrite ?sizeof_float in *;
 subst;
 repeat rewrite Z.add_assoc in *;
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?neon_local_field_address;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;full_neon_extra_pure
 |forget_rhs_fields;LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel]
 |forget_rhs_fields;LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel].
