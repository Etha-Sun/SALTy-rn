From Coq Require Import ZArith Lia List FunctionalExtensionality.
From ArgmaxPool Require Import APProgramFacts APProgramMemoryFacts.
Import ListNotations. Local Open Scope Z_scope.

(* Written slots are related independently of either initial state. Repeated
   addresses retain sequential last-write semantics; None is never defaulted. *)
Definition apo_run{A:Type}(O:APState A)(xs:list(Z*A)):APState A:=
 fold_left(fun state w=>ap_put state(fst w)(snd w))xs O.
Definition apo_item_related{A:Type}(T:Z->Z)(x y:Z*A):Prop:=
 fst y=T(fst x) /\ snd x=snd y.
Definition apo_trace_related{A:Type}(T:Z->Z)(xs ys:list(Z*A)):Prop:=
 Forall2(apo_item_related T)xs ys.
Definition apo_states_on{A:Type}(T:Z->Z)(addresses:list Z)(O1 O2:APState A):Prop:=
 forall p,In p addresses->exists value,O1 p=Some value /\ O2(T p)=Some value.

Lemma apo_put_related:forall A T,
 (forall p q,T p=T q->p=q)->forall addresses(O1 O2:APState A)p v,
 apo_states_on T addresses O1 O2->
 apo_states_on T(p::addresses)(ap_put O1 p v)(ap_put O2(T p)v).
Proof.
 intros A T Hinj addresses O1 O2 p v Hstates q Hq.
 destruct(Z.eq_dec q p)as[->|Hneq].
 - rewrite !ap_put_same;exists v;auto.
 - rewrite !ap_put_other by(intro E;apply Hneq;try symmetry;auto).
   apply Hstates;destruct Hq as[Heq|Hin];[congruence|exact Hin].
Qed.
Lemma apo_writes_related:forall A T,
 (forall p q,T p=T q->p=q)->forall(xs ys:list(Z*A)),apo_trace_related T xs ys->
 forall addresses O1 O2,apo_states_on T addresses O1 O2->
 apo_states_on T(map fst xs++addresses)(apo_run O1 xs)(apo_run O2 ys).
Proof.
 intros A T Hinj xs ys Htrace.
 induction Htrace as[|[p a][q b]xs ys Hhead Htail IH];intros addresses O1 O2 Hstates.
 - exact Hstates.
 - destruct Hhead as[Hq Hv];cbn in Hq,Hv;subst q b.
   pose proof(apo_put_related A T Hinj addresses O1 O2 p a Hstates)as Hput.
   specialize(IH(p::addresses)(ap_put O1 p a)(ap_put O2(T p)a)Hput).
   intros z Hz;apply IH;cbn in Hz;rewrite in_app_iff in *;cbn;tauto.
Qed.
Theorem apo_written_slots:forall A T,
 (forall p q,T p=T q->p=q)->forall(xs ys:list(Z*A))O1 O2,
 apo_trace_related T xs ys->forall p,In p(map fst xs)->
 exists value,apo_run O1 xs p=Some value /\ apo_run O2 ys(T p)=Some value.
Proof.
 intros A T Hinj xs ys O1 O2 Htrace p Hp.
 pose proof(apo_writes_related A T Hinj xs ys Htrace [] O1 O2)as H.
 assert(He:apo_states_on T [] O1 O2)by(intros q Hq;contradiction).
 specialize(H He p);apply H;rewrite app_nil_r;assumption.
Qed.
Theorem apo_unwritten_frame:forall A(xs:list(Z*A))O p,
 ~In p(map fst xs)->apo_run O xs p=O p.
Proof.
 intros A xs;induction xs as[|[q v]xs IH];intros O p Hp;[reflexivity|].
 cbn in Hp;change(apo_run(ap_put O q v)xs p=O p).
 rewrite IH by tauto;apply ap_put_other;tauto.
Qed.
Lemma apo_trace_addresses:forall A T(xs ys:list(Z*A)),
 apo_trace_related T xs ys->map fst ys=map T(map fst xs).
Proof.
 intros A T xs ys H;induction H as[|[p a][q b]xs ys Hhead Htail IH];[reflexivity|].
 destruct Hhead as[Hq _];cbn in Hq;cbn;rewrite Hq,IH;reflexivity.
Qed.
Theorem apo_related_unwritten_frames:forall A T,
 (forall p q,T p=T q->p=q)->forall(xs ys:list(Z*A))O1 O2,
 apo_trace_related T xs ys->forall p,~In p(map fst xs)->
 apo_run O1 xs p=O1 p /\ apo_run O2 ys(T p)=O2(T p).
Proof.
 intros A T Hinj xs ys O1 O2 Htrace p Hp;split.
 - apply apo_unwritten_frame;assumption.
 - apply apo_unwritten_frame;rewrite(apo_trace_addresses A T xs ys Htrace).
   intro Hbad;apply in_map_iff in Hbad;destruct Hbad as[q[Heq Hq]].
   apply Hinj in Heq;subst q;contradiction.
Qed.
Lemma apo_run_app:forall A(O:APState A)xs ys,
 apo_run O(xs++ys)=apo_run(apo_run O xs)ys.
Proof. intros;unfold apo_run;apply fold_left_app. Qed.
Lemma apo_write_trace:forall A(O:APState A)p n value,
 ap_state_write_n O p n value=
 apo_run O(map(fun j=>(p+4*Z.of_nat j,value(Z.of_nat j)))(seq 0 n)).
Proof.
 intros A O p n;induction n as[|n IH];intro value;[reflexivity|].
 rewrite seq_S,map_app,apo_run_app;cbn[map apo_run fold_left].
 rewrite<-IH;reflexivity.
Qed.
Definition apo_pixel_trace{A:Type}(address:APProgram->Z->Z)(project:fp32*Z->A)
 (side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel:Z):list(Z*A):=
 if Z.leb(app_groups(app_rows D))0 then[]else
 map(fun j=>(address D pixel+4*Z.of_nat j,
 project(app_lane_value side F P D pixel(app_groups(app_rows D))(Z.of_nat j))))
 (seq 0(Z.to_nat(app_channels D))).
Definition apo_program_trace{A:Type}(address:APProgram->Z->Z)(project:fp32*Z->A)
 (side:bool)(F:APMap)(P:APPtrMap)(D:APProgram):list(Z*A):=
 concat(map(fun pixel=>apo_pixel_trace address project side F P D(Z.of_nat pixel))
 (seq 0(Z.to_nat(app_pixels D)))).
Lemma apo_finish_pixel_traces:forall side F P D pixel S,
 app_finish_pixel side F P D pixel S=
 (apo_run(fst S)(apo_pixel_trace app_output_at fst side F P D pixel),
 apo_run(snd S)(apo_pixel_trace app_index_at snd side F P D pixel)).
Proof.
 intros side F P D pixel[O I].
 unfold app_finish_pixel,app_pass_complete,apo_pixel_trace.
 destruct(Z.leb(app_groups(app_rows D))0);[reflexivity|].
 unfold app_write_pair,ap_output_write,ap_index_write;cbn[fst snd].
 rewrite !apo_write_trace;reflexivity.
Qed.
Theorem apo_program_result_traces:forall side F P D S,
 app_program_result side F P D S=
 (apo_run(fst S)(apo_program_trace app_output_at fst side F P D),
 apo_run(snd S)(apo_program_trace app_index_at snd side F P D)).
Proof.
 intros side F P D;unfold app_program_result,app_pixel_before,apo_program_trace.
 generalize(seq 0(Z.to_nat(app_pixels D)))as pixels;intro pixels.
 induction pixels as[|pixel pixels IH];intros[O I];[reflexivity|].
 cbn[fold_left map concat];rewrite IH,apo_finish_pixel_traces.
 cbn[fst snd];rewrite !apo_run_app;reflexivity.
Qed.

(* The caller supplies actual address correspondence. An arbitrary address
   shift is not silently assumed across machine-word wrap. *)
Theorem apo_program_written_observation:forall F P DN DR TO TI SN SR,
 (forall p q,TO p=TO q->p=q)->(forall p q,TI p=TI q->p=q)->
 apo_trace_related TO(apo_program_trace app_output_at fst true F P DN)
 (apo_program_trace app_output_at fst false F P DR)->
 apo_trace_related TI(apo_program_trace app_index_at snd true F P DN)
 (apo_program_trace app_index_at snd false F P DR)->
 forall p q,
 In p(map fst(apo_program_trace app_output_at fst true F P DN))->
 In q(map fst(apo_program_trace app_index_at snd true F P DN))->
 exists value index,
 fst(app_program_result true F P DN SN)p=Some value /\
 fst(app_program_result false F P DR SR)(TO p)=Some value /\
 snd(app_program_result true F P DN SN)q=Some index /\
 snd(app_program_result false F P DR SR)(TI q)=Some index.
Proof.
 intros F P DN DR TO TI SN SR HO HI Hfloat Hindex p q Hp Hq.
 rewrite !apo_program_result_traces;cbn[fst snd].
 destruct(apo_written_slots fp32 TO HO _ _ (fst SN)(fst SR)Hfloat p Hp)as[v[HN HR]].
 destruct(apo_written_slots Z TI HI _ _ (snd SN)(snd SR)Hindex q Hq)as[i[IN IR]].
 exists v,i;auto.
Qed.
Print Assumptions apo_put_related.
Print Assumptions apo_writes_related.
Print Assumptions apo_written_slots.
Print Assumptions apo_unwritten_frame.
Print Assumptions apo_trace_addresses.
Print Assumptions apo_related_unwritten_frames.
Print Assumptions apo_run_app.
Print Assumptions apo_write_trace.
Print Assumptions apo_finish_pixel_traces.
Print Assumptions apo_program_result_traces.
Print Assumptions apo_program_written_observation.

(* A common input view is enough for lane equality even when output addresses
   and the two arbitrary initial states differ. These are explicit premises,
   not a new axiom or an assumed relation between final program states. *)
Definition apo_same_read(DN DR:APProgram):Prop:=
 app_pixels DN=app_pixels DR /\ app_rows DN=app_rows DR /\
 app_channels DN=app_channels DR /\
 (forall pixel,app_table DN pixel=app_table DR pixel) /\
 (forall pixel,app_offset_at DN pixel=app_offset_at DR pixel).
Lemma apo_lane_same_read:forall F P DN DR pixel groups channel,
 apo_same_read DN DR->
 app_lane_value true F P DN pixel groups channel=
 app_lane_value false F P DR pixel groups channel.
Proof.
 intros F P DN DR pixel groups channel[_[Hrows[_[Htable Hoffset]]]].
 unfold app_lane_value;rewrite !app_lane_prefix_correct.
 rewrite Hrows,Htable,Hoffset;reflexivity.
Qed.
Lemma apo_Forall2_map_same:forall(A B C:Type)(R:B->C->Prop)
 (f:A->B)(g:A->C)xs,
 (forall x,In x xs->R(f x)(g x))->Forall2 R(map f xs)(map g xs).
Proof.
 intros A B C R f g xs;induction xs;intros H;constructor.
 - apply H;left;reflexivity.
 - apply IHxs;intros;apply H;right;assumption.
Qed.
Lemma apo_Forall2_concat:forall(A:Type)(R:A->A->Prop)xs ys,
 Forall2(Forall2 R)xs ys->Forall2 R(concat xs)(concat ys).
Proof.
 intros A R xs ys H;induction H;cbn;[constructor|].
 apply Forall2_app;assumption.
Qed.
Lemma apo_pixel_trace_same_read:forall A(address:APProgram->Z->Z)
 (project:fp32*Z->A)F P DN DR T pixel,
 apo_same_read DN DR->
 (forall channel,0<=channel<app_channels DN->
 address DR pixel+4*channel=T(address DN pixel+4*channel))->
 apo_trace_related T(apo_pixel_trace address project true F P DN pixel)
 (apo_pixel_trace address project false F P DR pixel).
Proof.
 intros A address project F P DN DR T pixel Hread Haddr.
 destruct Hread as[Hpixels[Hrows[Hchannels[Htable Hoffset]]]].
 unfold apo_pixel_trace;rewrite <-Hrows,<-Hchannels.
 destruct(Z.leb(app_groups(app_rows DN))0);[constructor|].
 apply apo_Forall2_map_same;intros j Hj.
 apply in_seq in Hj;unfold apo_item_related;cbn[fst snd];split.
 - apply Haddr;lia.
 - f_equal;apply apo_lane_same_read;repeat split;assumption.
Qed.
Theorem apo_program_trace_same_read:forall A(address:APProgram->Z->Z)
 (project:fp32*Z->A)F P DN DR T,
 apo_same_read DN DR->
 (forall pixel channel,0<=pixel<app_pixels DN->0<=channel<app_channels DN->
 address DR pixel+4*channel=T(address DN pixel+4*channel))->
 apo_trace_related T(apo_program_trace address project true F P DN)
 (apo_program_trace address project false F P DR).
Proof.
 intros A address project F P DN DR T Hread Haddr.
 unfold apo_program_trace;rewrite <-(proj1 Hread).
 apply apo_Forall2_concat;apply apo_Forall2_map_same;intros pixel Hpixel.
 apply in_seq in Hpixel;apply apo_pixel_trace_same_read;[assumption|].
 intros channel Hchannel;apply Haddr;lia.
Qed.
Theorem apo_same_read_written_observation:forall F P DN DR TO TI SN SR,
 apo_same_read DN DR->
 (forall p q,TO p=TO q->p=q)->(forall p q,TI p=TI q->p=q)->
 (forall pixel channel,0<=pixel<app_pixels DN->0<=channel<app_channels DN->
 app_output_at DR pixel+4*channel=TO(app_output_at DN pixel+4*channel))->
 (forall pixel channel,0<=pixel<app_pixels DN->0<=channel<app_channels DN->
 app_index_at DR pixel+4*channel=TI(app_index_at DN pixel+4*channel))->
 forall p q,
 In p(map fst(apo_program_trace app_output_at fst true F P DN))->
 In q(map fst(apo_program_trace app_index_at snd true F P DN))->
 exists value index,
 fst(app_program_result true F P DN SN)p=Some value /\
 fst(app_program_result false F P DR SR)(TO p)=Some value /\
 snd(app_program_result true F P DN SN)q=Some index /\
 snd(app_program_result false F P DR SR)(TI q)=Some index.
Proof.
 intros F P DN DR TO TI SN SR Hread HO HI Hout Hidx.
 apply apo_program_written_observation;try assumption;
 apply apo_program_trace_same_read;assumption.
Qed.
Print Assumptions apo_lane_same_read.
Print Assumptions apo_Forall2_map_same.
Print Assumptions apo_Forall2_concat.
Print Assumptions apo_pixel_trace_same_read.
Print Assumptions apo_program_trace_same_read.
Print Assumptions apo_same_read_written_observation.
