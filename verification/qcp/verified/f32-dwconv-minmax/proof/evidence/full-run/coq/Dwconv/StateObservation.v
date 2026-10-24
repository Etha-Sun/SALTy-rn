From Coq Require Import ZArith List.
From Dwconv Require Import Model OutputMemory Observation.
Import ListNotations.
Local Open Scope Z_scope.

(** Traces retain the actual sequential write order.  Repeated addresses and
    overlapping pixels are allowed.  Initial states need only be related on D;
    taking D=[] permits completely unrelated, possibly uninitialized outputs. *)
Definition dw_run_writes(O:DwOutput)(xs:list(Z*fp32)):DwOutput:=
 fold_left(fun S w=>dw_put S(fst w)(snd w))xs O.
Definition dw_trace_item_related(T:Z->Z)(x y:Z*fp32):Prop:=
 fst y=T(fst x) /\ dw_rel(snd x)(snd y).
Definition dw_trace_related(T:Z->Z)(xs ys:list(Z*fp32)):Prop:=
 Forall2(dw_trace_item_related T)xs ys.
Definition dw_slot_related(x y:option fp32):Prop:=
 exists a b,x=Some a /\ y=Some b /\ dw_rel a b.
Definition dw_states_related_on(T:Z->Z)(D:list Z)(O1 O2:DwOutput):Prop:=
 forall p,In p D->dw_slot_related(O1 p)(O2(T p)).

Lemma dw_put_related_on : forall T,
 (forall p q,T p=T q->p=q)->
 forall D O1 O2 p a b,
 dw_states_related_on T D O1 O2->dw_rel a b->
 dw_states_related_on T(p::D)(dw_put O1 p a)(dw_put O2(T p)b).
Proof.
 intros T Hinj D O1 O2 p a b Hstates Hab q Hq.
 destruct(Z.eq_dec q p)as[->|Hneq].
 - rewrite !dw_put_same;exists a,b;auto.
 - rewrite !dw_put_other by(intro E;apply Hneq;try symmetry;auto).
   apply Hstates;destruct Hq as[Hbad|Hq];[congruence|assumption].
Qed.

Theorem dw_writes_related_on : forall T,
 (forall p q,T p=T q->p=q)->
 forall xs ys,dw_trace_related T xs ys->
 forall D O1 O2,dw_states_related_on T D O1 O2->
 dw_states_related_on T(map fst xs++D)(dw_run_writes O1 xs)(dw_run_writes O2 ys).
Proof.
 intros T Hinj xs ys Htrace.
 induction Htrace as[|[p a][q b]xs ys Hhead Htail IH];intros D O1 O2 Hstates.
 - exact Hstates.
 - destruct Hhead as[Hq Hab];cbn in Hq,Hab;subst q.
   pose proof(dw_put_related_on T Hinj D O1 O2 p a b Hstates Hab)as Hput.
   specialize(IH(p::D)(dw_put O1 p a)(dw_put O2(T p)b)Hput).
   intros z Hz;apply IH.
   cbn in Hz;rewrite in_app_iff in *;cbn;tauto.
Qed.

Theorem dw_written_slots_related : forall T,
 (forall p q,T p=T q->p=q)->
 forall xs ys O1 O2,dw_trace_related T xs ys->
 forall p,In p(map fst xs)->
 dw_slot_related(dw_run_writes O1 xs p)(dw_run_writes O2 ys(T p)).
Proof.
 intros T Hinj xs ys O1 O2 Htrace p Hp.
 pose proof(dw_writes_related_on T Hinj xs ys Htrace [] O1 O2)as H.
 assert(Hempty:dw_states_related_on T [] O1 O2)by(intros q Hq;contradiction).
 specialize(H Hempty p);apply H;rewrite app_nil_r;assumption.
Qed.

Theorem dw_written_slots_observe : forall T,
 (forall p q,T p=T q->p=q)->
 forall xs ys O1 O2,dw_trace_related T xs ys->
 forall p,In p(map fst xs)->
 exists a b,dw_run_writes O1 xs p=Some a /\
 dw_run_writes O2 ys(T p)=Some b /\ dw_observe a b.
Proof.
 intros T Hinj xs ys O1 O2 Htrace p Hp.
 destruct(dw_written_slots_related T Hinj xs ys O1 O2 Htrace p Hp)
 as[a[b[Ha[Hb Hab]]]].
 exists a,b;repeat split;try assumption;now apply dw_related_observe.
Qed.

Theorem dw_writes_unwritten_frame : forall xs O p,
 ~In p(map fst xs)->dw_run_writes O xs p=O p.
Proof.
 induction xs as[|[q v]xs IH];intros O p Hp;[reflexivity|].
 cbn in Hp;change(dw_run_writes(dw_put O q v)xs p=O p).
 rewrite IH by tauto;apply dw_put_other;tauto.
Qed.

Lemma dw_trace_address_map : forall T xs ys,
 dw_trace_related T xs ys->map fst ys=map T(map fst xs).
Proof.
 intros T xs ys H;induction H as[|[p a][q b]xs ys Hhead Htail IH];[reflexivity|].
 destruct Hhead as[Hq _];cbn in Hq;cbn;rewrite Hq,IH;reflexivity.
Qed.

Theorem dw_related_unwritten_frames : forall T,
 (forall p q,T p=T q->p=q)->
 forall xs ys O1 O2,dw_trace_related T xs ys->
 forall p,~In p(map fst xs)->
 dw_run_writes O1 xs p=O1 p /\ dw_run_writes O2 ys(T p)=O2(T p).
Proof.
 intros T Hinj xs ys O1 O2 Htrace p Hp;split.
 - now apply dw_writes_unwritten_frame.
 - apply dw_writes_unwritten_frame;rewrite(dw_trace_address_map T xs ys Htrace).
   intro Hbad;apply in_map_iff in Hbad;destruct Hbad as[q[Heq Hq]].
   apply Hinj in Heq;subst q;contradiction.
Qed.

Print Assumptions dw_put_related_on.
Print Assumptions dw_writes_related_on.
Print Assumptions dw_written_slots_related.
Print Assumptions dw_written_slots_observe.
Print Assumptions dw_writes_unwritten_frame.
Print Assumptions dw_trace_address_map.
Print Assumptions dw_related_unwritten_frames.
