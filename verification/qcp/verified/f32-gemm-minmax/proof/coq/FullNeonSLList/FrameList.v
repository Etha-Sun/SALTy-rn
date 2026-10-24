From FullNeonSLExtra Require Import FrameExtra.
From FullDomainRvv Require Import FullState.
From GemmNeon Require Import CopyFacts LayoutModel.
From LeaderAutomation Require Import FastFrame.
From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac normalize_cell_columns :=
 repeat multimatch goal with
 | |- context[FullState.full_cell ?A ?W ?k ?row ?col ?lo ?hi] => progress ring_simplify col
 end.
Ltac normalize_array_pointers :=
 repeat multimatch goal with
 | |- context[FloatArray.full ?p ?n ?xs] => progress ring_simplify p
 end.
Ltac full_neon_list_frame :=
 rewrite ?sizeof_float in *;subst;repeat rewrite Z.add_assoc in *;
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?neon_local_field_address;
 apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;full_neon_extra_pure
 |normalize_cell_columns;normalize_array_pointers;
 forget_rhs_fields;LeaderAutomation.FastFrame.opaque_leaves;
 sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel].
