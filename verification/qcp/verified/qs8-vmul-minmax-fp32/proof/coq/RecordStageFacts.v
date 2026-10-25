From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordStageViews AdapterTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_eta_vfloat32m8_t:forall a:Recordvfloat32m8_t,make_record_vfloat32m8_t (a.(vfloat32m8_t_s0)) (a.(vfloat32m8_t_s1)) (a.(vfloat32m8_t_s2)) (a.(vfloat32m8_t_s3)) (a.(vfloat32m8_t_s4)) (a.(vfloat32m8_t_s5)) (a.(vfloat32m8_t_s6)) (a.(vfloat32m8_t_s7)) (a.(vfloat32m8_t_s8)) (a.(vfloat32m8_t_s9)) (a.(vfloat32m8_t_s10)) (a.(vfloat32m8_t_s11)) (a.(vfloat32m8_t_s12)) (a.(vfloat32m8_t_s13)) (a.(vfloat32m8_t_s14)) (a.(vfloat32m8_t_s15)) (a.(vfloat32m8_t_s16)) (a.(vfloat32m8_t_s17)) (a.(vfloat32m8_t_s18)) (a.(vfloat32m8_t_s19)) (a.(vfloat32m8_t_s20)) (a.(vfloat32m8_t_s21)) (a.(vfloat32m8_t_s22)) (a.(vfloat32m8_t_s23)) (a.(vfloat32m8_t_s24)) (a.(vfloat32m8_t_s25)) (a.(vfloat32m8_t_s26)) (a.(vfloat32m8_t_s27)) (a.(vfloat32m8_t_s28)) (a.(vfloat32m8_t_s29)) (a.(vfloat32m8_t_s30)) (a.(vfloat32m8_t_s31))=a.
Proof. intros[];reflexivity. Qed.
Lemma qm_record_float_pair_composes:forall vl A B R x y,
 qm_record_fmul_match vl A B x->qm_record_fadd_match vl B R y->
 qm_record_float_pair_match vl A R x y.
Proof. unfold qm_record_fmul_match,qm_record_fadd_match,qm_record_float_pair_match;intros vl A B R x y HM HA i Hi;rewrite HA,HM by exact Hi;reflexivity. Qed.
#[export] Hint Rewrite qm_eta_vfloat32m8_t:qm_record_fp.
Ltac qm_record_fp_start:=try left;intros;subst;autorewrite with qm_record_fp in *;
 unfold StructPredvfloat32m8_t in *;try unfold UndefStructPredvfloat32m8_t;
 rewrite ?qm_local_field_address;repeat progress rewrite<-logic_equiv_andp_assoc.
Ltac qm_record_fp_solve:=qm_record_fp_start;
 first[solve[apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[qm_pure]|solve[entailer!;lia]].
Print Assumptions qm_eta_vfloat32m8_t.
Print Assumptions qm_record_float_pair_composes.
