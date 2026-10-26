From Coq Require Import ZArith Lia.
From ExpMinusMax Require Export NeonTactics KernelFootprintFacts.
Import Snaive_C_Rules64. Local Open Scope sac. Local Open Scope Z_scope.
Ltac emkx_atom:=first[assumption|reflexivity|lia|
 solve[unfold em_same;reflexivity]|
 solve[eapply em_valid_maximum;eassumption]|
 solve[eapply em_valid_bulk_read;[eassumption|lia|lia]]|
 solve[eapply em_valid_bulk_write;[eassumption|lia|lia]]].
Ltac emkx_props:=repeat first[solve[emkx_atom]|split].
Ltac emkx_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply em_pure_right;emk_literal;emkx_props
 | |-?P|--andp ?Q ?R=>apply _derivable1_andp_intros;[emkx_pure|emkx_pure]
 | |-?P|--truep=>unfold derivable1,truep;intros;exact I end.
Ltac emkx_frame:=emk_prepare;emk_literal;
 unfold StructPredfloat32x4_t,StructPredfloat32x2_t,
 StructPreduint32x4_t,StructPreduint32x2_t,StructPredint32x4_t,
 StructPredvfloat32m4_t,StructPredvint32m4_t,StructPredvbool8_t,
 UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,
 UndefStructPreduint32x4_t,UndefStructPreduint32x2_t,UndefStructPredint32x4_t,
 UndefStructPredvfloat32m4_t,UndefStructPredvint32m4_t,UndefStructPredvbool8_t;
 rewrite ?em_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[emkx_pure]|apply _derivable1_andp_intros;[emkx_pure|em_spatial]|em_spatial].
Ltac emkx_pure_goal:=first[solve[em_intro;emk_prepare;emkx_pure]|solve[left;em_intro;emk_prepare;emkx_pure]|right;em_intro;emk_prepare;emkx_pure].
