From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordViews AdapterTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_eta_vint16m4_t:forall a:Recordvint16m4_t,make_record_vint16m4_t (a.(vint16m4_t_s0)) (a.(vint16m4_t_s1)) (a.(vint16m4_t_s2)) (a.(vint16m4_t_s3)) (a.(vint16m4_t_s4)) (a.(vint16m4_t_s5)) (a.(vint16m4_t_s6)) (a.(vint16m4_t_s7)) (a.(vint16m4_t_s8)) (a.(vint16m4_t_s9)) (a.(vint16m4_t_s10)) (a.(vint16m4_t_s11)) (a.(vint16m4_t_s12)) (a.(vint16m4_t_s13)) (a.(vint16m4_t_s14)) (a.(vint16m4_t_s15)) (a.(vint16m4_t_s16)) (a.(vint16m4_t_s17)) (a.(vint16m4_t_s18)) (a.(vint16m4_t_s19)) (a.(vint16m4_t_s20)) (a.(vint16m4_t_s21)) (a.(vint16m4_t_s22)) (a.(vint16m4_t_s23)) (a.(vint16m4_t_s24)) (a.(vint16m4_t_s25)) (a.(vint16m4_t_s26)) (a.(vint16m4_t_s27)) (a.(vint16m4_t_s28)) (a.(vint16m4_t_s29)) (a.(vint16m4_t_s30)) (a.(vint16m4_t_s31))=a.
Proof. intros[];reflexivity. Qed.
Lemma qm_eta_vint32m8_t:forall a:Recordvint32m8_t,make_record_vint32m8_t (a.(vint32m8_t_s0)) (a.(vint32m8_t_s1)) (a.(vint32m8_t_s2)) (a.(vint32m8_t_s3)) (a.(vint32m8_t_s4)) (a.(vint32m8_t_s5)) (a.(vint32m8_t_s6)) (a.(vint32m8_t_s7)) (a.(vint32m8_t_s8)) (a.(vint32m8_t_s9)) (a.(vint32m8_t_s10)) (a.(vint32m8_t_s11)) (a.(vint32m8_t_s12)) (a.(vint32m8_t_s13)) (a.(vint32m8_t_s14)) (a.(vint32m8_t_s15)) (a.(vint32m8_t_s16)) (a.(vint32m8_t_s17)) (a.(vint32m8_t_s18)) (a.(vint32m8_t_s19)) (a.(vint32m8_t_s20)) (a.(vint32m8_t_s21)) (a.(vint32m8_t_s22)) (a.(vint32m8_t_s23)) (a.(vint32m8_t_s24)) (a.(vint32m8_t_s25)) (a.(vint32m8_t_s26)) (a.(vint32m8_t_s27)) (a.(vint32m8_t_s28)) (a.(vint32m8_t_s29)) (a.(vint32m8_t_s30)) (a.(vint32m8_t_s31))=a.
Proof. intros[];reflexivity. Qed.
#[export] Hint Rewrite qm_eta_vint16m4_t qm_eta_vint32m8_t : qm_record.
Ltac qm_record_wmul_start := try left;intros;subst;autorewrite with qm_record in *;
 unfold StructPredvint16m4_t,StructPredvint32m8_t in *;
 try unfold UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
 rewrite ?qm_local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc.
Ltac qm_record_wmul_solve := qm_record_wmul_start;
 first[solve[apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[qm_pure]|solve[entailer!;lia]].
Print Assumptions qm_eta_vint16m4_t.
Print Assumptions qm_eta_vint32m8_t.
