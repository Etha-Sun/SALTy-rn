From HwcConv Require Export pixel9_unit_goal HwcRvvPixel9Facts AddressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_rvv_rows_group hc_rvv_row_group_value hc_rvv_pixel9_prefix hc_rvv_pixel9_fold dw_rvv_fma.
Lemma hp_pure_right : forall(P:Assertion)(Q:Prop),Q->P|--coq_prop Q.
Proof. unfold derivable1,coq_prop;intros;assumption. Qed.
Lemma hp_true_left : forall P:Assertion,TT&&P|--P.
Proof. unfold derivable1,andp,truep;intros P m[HT HP];exact HP. Qed.
Lemma hp_v4_eta:forall A,make_record_vfloat32m1_t A.(vfloat32m1_t_s0) A.(vfloat32m1_t_s1) A.(vfloat32m1_t_s2) A.(vfloat32m1_t_s3)=A.
Proof. intros [];reflexivity. Qed.
Ltac hp_intro:=lazymatch goal with
 | |- ?P |-- ?Q => idtac
 | |- forall _,_ => intro;hp_intro end.
Ltac hp_norm:=try change(sizeof(FLOAT))with 4 in *;
 try change(UINT64_MAX)with 18446744073709551615 in *;
 try change(UINT_MAX)with 4294967295 in *;rewrite ?hp_v4_eta in *;
 unfold hc_footprint,hc_u64_limit in *;
 repeat match goal with H:_ /\ _ |- _=>destruct H end.
Ltac hp_next:=lazymatch goal with
 | HA:hc_rvv_pixel9_prefix ?a ?f ?p0 ?p1 ?p2 ?w ?width ?x ?lane ?k ?vl,
 HG:hc_rvv_rows_group ?r ?a ?f ?p0 ?p1 ?p2 ?w ?width ?x ?dx ?ci ?lane ?vl
 |-hc_rvv_pixel9_prefix ?r ?f ?p0 ?p1 ?p2 ?w ?width ?x ?lane ?n ?vl=>
 change(hc_rvv_pixel9_prefix r f p0 p1 p2 w width x lane(k+1)vl);
 eapply hc_pixel9_prefix_next;[lia|reflexivity|exact HA|exact HG] end.
Ltac hp_atom:=first[assumption|reflexivity|lia|hp_next|
 solve[eapply hc_pixel9_bias_present;[eassumption|lia]]].
Ltac hp_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply hp_pure_right;hp_atom
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hp_pure|hp_pure] end.
Ltac hp_frame:=first[
 lazymatch goal with |- ?P |-- ?Q => constr_eq P Q;exact(derivable1_refl P) end
 |lazymatch goal with |- andp truep ?P |-- ?Q => constr_eq P Q;exact(hp_true_left P) end
 |
 unfold StructPredvfloat32m1_t,UndefStructPredvfloat32m1_t in *;
 cbn[vfloat32m1_t_s0 vfloat32m1_t_s1 vfloat32m1_t_s2 vfloat32m1_t_s3];
 rewrite ?hc_local_field_address;entailer!].
Ltac hp_rhs:=first[solve[hp_pure]|lazymatch goal with
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hp_rhs|hp_rhs]
 | |-?P|--?Q=>hp_frame end].
Ltac hp_solve:=hp_intro;hp_norm;hp_rhs.
Print Assumptions hp_pure_right.
Print Assumptions hp_true_left.
Print Assumptions hp_v4_eta.
