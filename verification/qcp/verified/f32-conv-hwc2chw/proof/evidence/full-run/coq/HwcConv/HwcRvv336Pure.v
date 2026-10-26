From Coq Require Import ZArith Lia List.
From HwcConv Require Export rvv_fma3_unit_goal NeonPixelBounds RvvRowsFma3Model.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma hr_pure_right:forall(P:Assertion)(Q:Prop),Q->P|--coq_prop Q.
Proof. intros P Q HQ;unfold derivable1,coq_prop;intros;exact HQ. Qed.
Lemma hr_v4_eta:forall A,make_record_vfloat32m1_t A.(vfloat32m1_t_s0) A.(vfloat32m1_t_s1) A.(vfloat32m1_t_s2) A.(vfloat32m1_t_s3)=A.
Proof. intros [];reflexivity. Qed.
Lemma hr_m4_eta:forall A,make_record_vbool32_t A.(vbool32_t_s0) A.(vbool32_t_s1) A.(vbool32_t_s2) A.(vbool32_t_s3)=A.
Proof. intros [];reflexivity. Qed.
Lemma hr_u4_eta:forall A,make_record_vuint32m1_t A.(vuint32m1_t_s0) A.(vuint32m1_t_s1) A.(vuint32m1_t_s2) A.(vuint32m1_t_s3)=A.
Proof. intros [];reflexivity. Qed.
Ltac hr_intro:=lazymatch goal with
 | |- ?P |-- ?Q => idtac
 | |- forall _,_ => intro;hr_intro end.
Ltac hr_prepare:=
 try change(sizeof(FLOAT))with 4 in *;
 try change(INT_MAX)with 2147483647 in *;try change(INT_MIN)with(-2147483648)in *;
 try change(UINT_MAX)with 4294967295 in *;
 try change(UINT64_MAX)with 18446744073709551615 in *;
 rewrite ?hr_v4_eta,?hr_m4_eta,?hr_u4_eta;
 unfold hc_footprint,hc_u64_limit in *;
 repeat match goal with H:_ /\ _|-_=>destruct H end;
 try match goal with H:?x<(?w+1)÷2|-_ => let B:=fresh "Hxbound"in assert(B:0<=2*x<w)by(eapply hc_neon_x_bound;eauto)end.
Ltac hr_atom:=first[assumption|reflexivity|lia|congruence].
Ltac hr_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply hr_pure_right;hr_atom
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hr_pure|hr_pure]
 | |-?P|--truep=>unfold derivable1,truep;intros;exact I end.
Ltac hr_solve:=first[solve[hr_intro;hr_prepare;hr_pure]|solve[left;hr_intro;hr_prepare;hr_pure]|solve[right;hr_intro;hr_prepare;hr_pure]].
Print Assumptions hr_pure_right.
Print Assumptions hr_v4_eta.
Print Assumptions hr_m4_eta.
Print Assumptions hr_u4_eta.
