From Coq Require Import ZArith List Lia.
From MaxPool Require Export KernelState StateObservation.
From MaxPool Require Import WindowFacts CompareModel.
Import ListNotations.
Local Open Scope Z_scope.
Fixpoint mp_trace_lookup(xs:list(Z*fp32))(p:Z):option fp32:=
 match xs with []=>None|(q,value)::rest=>
 match mp_trace_lookup rest p with Some value=>Some value
 |None=>if Z.eqb p q then Some value else None end end.
Definition mp_trace_value(xs:list(Z*fp32))(p:Z):fp32:=
 match mp_trace_lookup xs p with Some value=>value|None=>mp_zero end.
Lemma mp_run_lookup:forall xs O p,
 mp_run_writes O xs p=
 match mp_trace_lookup xs p with Some value=>Some value|None=>O p end.
Proof.
 induction xs as[|[q value]xs IH];intros O p;[reflexivity|].
 change(mp_run_writes(mp_put O q value)xs p=
 match mp_trace_lookup((q,value)::xs)p with Some value=>Some value|None=>O p end).
 rewrite IH;cbn[mp_trace_lookup];destruct(mp_trace_lookup xs p);[reflexivity|].
 unfold mp_put;destruct(Z.eqb p q);reflexivity.
Qed.
Lemma mp_written_lookup_some:forall xs p,In p(map fst xs)->
 exists value,mp_trace_lookup xs p=Some value.
Proof.
 induction xs as[|[q value]xs IH];intros p Hp;[contradiction|].
 cbn in Hp;cbn[mp_trace_lookup];destruct Hp as[Heq|Hin].
 - subst p;destruct(mp_trace_lookup xs q)as[v|]eqn:E;
   [exists v;reflexivity|rewrite Z.eqb_refl;exists value;reflexivity].
 - destruct(IH p Hin)as[v Hv];rewrite Hv;exists v;reflexivity.
Qed.
Lemma mp_run_written_value:forall xs O p,In p(map fst xs)->
 mp_run_writes O xs p=Some(mp_trace_value xs p).
Proof.
 intros;destruct(mp_written_lookup_some xs p H)as[v Hv].
 rewrite mp_run_lookup;unfold mp_trace_value;rewrite Hv;reflexivity.
Qed.
Definition mp_probe_value(F:MPFloatMap)(PT:MPPtrMap)
 (pixels K channels table offset stride inc output outinc:Z)(lo hi:fp32)(p:Z):fp32:=
 mp_trace_value(mp_complete_writes F PT pixels K channels table offset stride inc output outinc lo hi)p.
Theorem mp_complete_probe_known:forall F PT old pixels K channels table offset stride inc output outinc lo hi p,
 0<=pixels->0<=channels->mp_written pixels channels output outinc p->
 mp_out_known(mp_complete F PT old pixels K channels table offset stride inc output outinc lo hi)p
 (mp_probe_value F PT pixels K channels table offset stride inc output outinc lo hi p).
Proof.
 intros;unfold mp_out_known,mp_probe_value;rewrite mp_complete_as_trace.
 apply mp_run_written_value;rewrite mp_complete_written_addresses by assumption;assumption.
Qed.
Theorem mp_written_window:forall F PT W pixels K channels table offset stride inc output outinc p,
 mp_geometry F PT W pixels K channels table offset stride inc output outinc->
 mp_written pixels channels output outinc p->mp_write_window W p 4.
Proof.
 intros F PT W pixels K channels table offset stride inc output outinc p HG[i[j[Hi[Hj Heq]]]].
 pose proof(mp_geometry_pixel F PT W pixels K channels table offset stride inc output outinc i HG Hi)as[HR HW].
 rewrite Heq;eapply mp_write_window_suffix;[exact HW|lia|lia|lia].
Qed.
Theorem mp_kernel_posts_full_state:forall F PT oldN oldR finalN finalR
 pixels K channels table offset stride inc output outinc lo hi,
 0<=pixels->0<=channels->
 finalN=mp_complete F PT oldN pixels K channels table offset stride inc output outinc lo hi->
 finalR=mp_complete F PT oldR pixels K channels table offset stride inc output outinc lo hi->
 (forall p,~mp_written pixels channels output outinc p->oldN p=oldR p)->
 forall p,finalN p=finalR p.
Proof.
 intros F PT oldN oldR finalN finalR pixels K channels table offset stride inc output outinc lo hi HP HC HN HR Hinitial p.
 subst finalN finalR.
 destruct(in_dec Z.eq_dec p(map fst(mp_complete_writes F PT pixels K channels table offset stride inc output outinc lo hi)))as[Hin|Hout].
 - rewrite !mp_complete_as_trace,!mp_run_written_value by assumption;reflexivity.
 - assert(Hnot:~mp_written pixels channels output outinc p).
   { rewrite<-mp_complete_written_addresses with(F:=F)(PT:=PT)(K:=K)(table:=table)(offset:=offset)(stride:=stride)(inc:=inc)(lo:=lo)(hi:=hi)by assumption;assumption. }
   rewrite !mp_complete_unwritten_frame by assumption;apply Hinitial;assumption.
Qed.

Print Assumptions mp_run_lookup.
Print Assumptions mp_written_lookup_some.
Print Assumptions mp_run_written_value.
Print Assumptions mp_complete_probe_known.
Print Assumptions mp_written_window.
Print Assumptions mp_kernel_posts_full_state.
