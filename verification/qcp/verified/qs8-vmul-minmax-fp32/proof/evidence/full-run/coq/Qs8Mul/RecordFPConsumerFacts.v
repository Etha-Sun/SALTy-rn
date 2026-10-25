From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordStageFacts RecordWmulFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac qm_record_fp_consumer_start:=try left;intros;subst;autorewrite with qm_record_fp qm_record in *;
 unfold StructPredvfloat32m8_t,StructPredvint32m8_t in *;
 try unfold UndefStructPredvfloat32m8_t,UndefStructPredvint32m8_t;
 rewrite ?qm_local_field_address;repeat progress rewrite<-logic_equiv_andp_assoc.
Ltac qm_record_fp_consumer_solve:=qm_record_fp_consumer_start;
 first[solve[apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[qm_pure]|solve[entailer!;lia]].
