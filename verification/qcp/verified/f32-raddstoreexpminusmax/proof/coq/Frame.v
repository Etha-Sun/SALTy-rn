From Coq Require Import ZArith Lia List.
From ExpMinusMax Require Export VectorRecords FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma em_pure_right:forall(P:Assertion)(Q:Prop),Q->P|-- “ Q ”.
Proof. intros P Q HQ;unfold derivable1,coq_prop;intros;exact HQ. Qed.
Ltac em_intro:=lazymatch goal with
 | |- ?P |-- ?Q=>idtac
 | |- forall _,_=>intro;em_intro
 | |- _ \/ _=>left;em_intro
 end.
Ltac em_props:=repeat first[assumption|split|reflexivity|lia].
Ltac em_pure:=lazymatch goal with
 | |- ?P|--coq_prop ?Q=>apply em_pure_right;em_props
 | |- ?P|--andp ?Q ?R=>apply _derivable1_andp_intros;[em_pure|em_pure]
 | |- ?P|--truep=>unfold derivable1,truep;intros;exact I end.
Ltac em_spatial:=opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac em_frame:=unfold StructPredfloat32x4_t,StructPredfloat32x2_t,
 StructPreduint32x4_t,StructPreduint32x2_t,StructPredint32x4_t,
 StructPredvfloat32m4_t,StructPredvint32m4_t,StructPredvbool8_t,
 UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,
 UndefStructPreduint32x4_t,UndefStructPreduint32x2_t,UndefStructPredint32x4_t,
 UndefStructPredvfloat32m4_t,UndefStructPredvint32m4_t,UndefStructPredvbool8_t;
 rewrite ?em_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[em_pure]|apply _derivable1_andp_intros;[em_pure|em_spatial]|em_spatial].
Print Assumptions em_pure_right.
