From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordInputViews RecordFPConsumerFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_eta_vint8m2_t:forall a:Recordvint8m2_t,make_record_vint8m2_t (a.(vint8m2_t_s0)) (a.(vint8m2_t_s1)) (a.(vint8m2_t_s2)) (a.(vint8m2_t_s3)) (a.(vint8m2_t_s4)) (a.(vint8m2_t_s5)) (a.(vint8m2_t_s6)) (a.(vint8m2_t_s7)) (a.(vint8m2_t_s8)) (a.(vint8m2_t_s9)) (a.(vint8m2_t_s10)) (a.(vint8m2_t_s11)) (a.(vint8m2_t_s12)) (a.(vint8m2_t_s13)) (a.(vint8m2_t_s14)) (a.(vint8m2_t_s15)) (a.(vint8m2_t_s16)) (a.(vint8m2_t_s17)) (a.(vint8m2_t_s18)) (a.(vint8m2_t_s19)) (a.(vint8m2_t_s20)) (a.(vint8m2_t_s21)) (a.(vint8m2_t_s22)) (a.(vint8m2_t_s23)) (a.(vint8m2_t_s24)) (a.(vint8m2_t_s25)) (a.(vint8m2_t_s26)) (a.(vint8m2_t_s27)) (a.(vint8m2_t_s28)) (a.(vint8m2_t_s29)) (a.(vint8m2_t_s30)) (a.(vint8m2_t_s31))=a.
Proof. intros[];reflexivity. Qed.
Lemma qm_record_load_window:forall M p vl,rd_window M p vl->qm_record_load_allowed M p vl.
Proof. unfold qm_record_load_allowed;auto. Qed.
Lemma qm_record_sext_sub_composes:forall vl A B R x,
 qm_record_sext_match vl A B->qm_record_sub16_match vl B R x->qm_record_sext_sub_match vl A R x.
Proof. unfold qm_record_sext_match,qm_record_sub16_match,qm_record_sext_sub_match;intros vl A B R x HS HD i Hi;rewrite HD,HS by exact Hi;reflexivity. Qed.
#[export] Hint Rewrite qm_eta_vint8m2_t:qm_record_input.
Ltac qm_record_input_start:=try left;intros;subst;autorewrite with qm_record_input qm_record in *;
 unfold StructPredvint8m2_t,StructPredvint16m4_t in *;
 try unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t;
 rewrite ?qm_local_field_address;repeat progress rewrite<-logic_equiv_andp_assoc.
Ltac qm_record_input_pure:=first[qm_pure|solve[unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_ /\ _=>split end;
 first[assumption|reflexivity|lia|apply qm_record_load_window;assumption]]].
Ltac qm_record_input_solve:=qm_record_input_start;
 first[solve[apply _derivable1_andp_intros;[qm_record_input_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[qm_record_input_pure]|solve[entailer!;lia]].
Print Assumptions qm_eta_vint8m2_t.
Print Assumptions qm_record_load_window.
Print Assumptions qm_record_sext_sub_composes.
