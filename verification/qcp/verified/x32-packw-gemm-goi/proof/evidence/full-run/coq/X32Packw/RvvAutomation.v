From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export Types AddressSupport RvvAccessFacts rvv_pair_goal rvv_odd_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac pw_rvv_normalize:=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold pw_offset in *;subst;
 try unfold UndefStructPredvuint32m4_t;
 repeat rewrite pw_local_field_address;
 try match goal with H : (?k <= 0), Hk : (0 <= ?k) |- _=>assert(k=0)by lia;subst k end;
 repeat rewrite Z.sub_diag in *;
 repeat rewrite Z.sub_0_r in *;
 repeat rewrite pw_pair_run_zero in *;
 repeat rewrite pw_odd_run_zero in *.
Ltac pw_rvv_facts:=
 try match goal with H:pw_legal_vl ?k ?vl |- _=>
 let Hv:=fresh"Hvl"in pose proof(pw_legal_vl_positive k vl ltac:(lia)H)as Hv end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 try multimatch goal with
 | H:pw_pair_pre ?F ?W ?a ?b ?p ?kc,Hk:(?k <= ?kc),Hvl:pw_legal_vl ?k ?vl |- _ =>
 let Hw:=fresh"Hwindows"in pose proof(pw_pair_rvv_windows F W a b p kc(kc-k)vl H ltac:(lia)ltac:(lia)ltac:(lia))as Hw
 | H:pw_odd_pre ?F ?W ?a ?p ?kc,Hk:(?k <= ?kc),Hvl:pw_legal_vl ?k ?vl |- _ =>
 let Hw:=fresh"Hwindows"in pose proof(pw_odd_rvv_windows F W a p kc(kc-k)vl H ltac:(lia)ltac:(lia)ltac:(lia))as Hw
 end;
 try match goal with H:pw_pair_pre _ _ _ _ _ _ |- _=>let Hc:=fresh"Hparts"in pose proof H as Hc;unfold pw_pair_pre in Hc end;
 try match goal with H:pw_odd_pre _ _ _ _ _ |- _=>let Hc:=fresh"Hparts"in pose proof H as Hc;unfold pw_odd_pre in Hc end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end.
Ltac pw_rvv_auto:=pw_rvv_normalize;pw_rvv_facts;solve[entailer!].
