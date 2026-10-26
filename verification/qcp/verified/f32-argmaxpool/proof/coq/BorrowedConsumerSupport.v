From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export BorrowedKernelModel FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* Prove constant pure conclusions without evaluating the spatial antecedent.
   The separate spatial goal must still cancel every owned input/result cell. *)
Lemma apb_pure_right:forall(P:Assertion)(Q:Prop),Q->P |-- “ Q ”.
Proof. intros P Q HQ;unfold derivable1,coq_prop;intros;exact HQ. Qed.
Ltac apb_intro:=lazymatch goal with
 | |- ?P |-- ?Q=>idtac
 | |- forall _,_=>intro;apb_intro
 | |- _ \/ _=>left;apb_intro
 end.
Ltac apb_prop:=repeat first[assumption|split|reflexivity|lia].
Ltac apb_pure:=lazymatch goal with
 | |- ?P |-- coq_prop ?Q=>apply apb_pure_right;apb_prop
 | |- ?P |-- andp ?Q ?R=>apply _derivable1_andp_intros;[apb_pure|apb_pure]
 | |- ?P |-- truep=>unfold derivable1,truep;intros;exact I
 end.
Ltac apb_spatial:=opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac apb_frame:=
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvuint32m8_t,UndefStructPredvbool4_t,
 UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t;
 rewrite ?ap_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apb_pure]
 |apply _derivable1_andp_intros;[apb_pure|apb_spatial]
 |apb_spatial].
Print Assumptions apb_pure_right.
