From Coq Require Import ZArith List Lia.
From MaxPool Require Import KernelState WriteFacts.
Import ListNotations.
Local Open Scope Z_scope.

(* Same-address specialization of the sequential trace method reviewed in
   f32-dwconv-minmax/StateObservation.v. This source is independently compiled.
   Equality is exact binary32 equality, not an all-NaNs-equivalent relation. *)
Definition mp_run_writes(O:MPOutput)(xs:list(Z*fp32)):MPOutput:=
 fold_left(fun state w=>mp_put state(fst w)(snd w))xs O.
Definition mp_slot_equal(x y:option fp32):Prop:=
 exists value,x=Some value /\ y=Some value.
Definition mp_states_equal_on(D:list Z)(O1 O2:MPOutput):Prop:=
 forall p,In p D->mp_slot_equal(O1 p)(O2 p).
Lemma mp_put_equal_on:forall D O1 O2 p value,
 mp_states_equal_on D O1 O2->
 mp_states_equal_on(p::D)(mp_put O1 p value)(mp_put O2 p value).
Proof.
 intros D O1 O2 p value H q Hq;destruct(Z.eq_dec q p)as[->|Hneq].
 - rewrite !mp_put_same;exists value;auto.
 - rewrite !mp_put_other by congruence;apply H;destruct Hq;[congruence|assumption].
Qed.
Lemma mp_run_equal_on:forall xs D O1 O2,
 mp_states_equal_on D O1 O2->
 mp_states_equal_on(map fst xs++D)(mp_run_writes O1 xs)(mp_run_writes O2 xs).
Proof.
 induction xs as[|[p value]xs IH];intros D O1 O2 H;[exact H|].
 pose proof(mp_put_equal_on D O1 O2 p value H)as Hput.
 specialize(IH(p::D)(mp_put O1 p value)(mp_put O2 p value)Hput).
 intros q Hq;apply IH;cbn in Hq;rewrite in_app_iff in *;cbn;tauto.
Qed.
Theorem mp_trace_written_bits:forall xs O1 O2 p,In p(map fst xs)->
 exists a b,mp_run_writes O1 xs p=Some a /\
 mp_run_writes O2 xs p=Some b /\ bits_of_fp32 a=bits_of_fp32 b.
Proof.
 intros xs O1 O2 p Hp.
 assert(HE:mp_states_equal_on [] O1 O2)by(intros q Hq;contradiction).
 pose proof(mp_run_equal_on xs [] O1 O2 HE p)as H.
 rewrite app_nil_r in H;specialize(H Hp);destruct H as[v[H1 H2]].
 exists v,v;auto.
Qed.
Theorem mp_trace_unwritten_frame:forall xs O p,
 ~In p(map fst xs)->mp_run_writes O xs p=O p.
Proof.
 induction xs as[|[q value]xs IH];intros O p H;[reflexivity|].
 cbn in H;change(mp_run_writes(mp_put O q value)xs p=O p).
 rewrite IH by tauto;apply mp_put_other;tauto.
Qed.
Lemma mp_run_append:forall xs ys O,
 mp_run_writes O(xs++ys)=mp_run_writes(mp_run_writes O xs)ys.
Proof. intros;unfold mp_run_writes;apply fold_left_app. Qed.

Fixpoint mp_lane_writes(count:nat)(p:Z)(value:Z->fp32):list(Z*fp32):=
 match count with O=>[]|S n=>
 mp_lane_writes n p value++[(p+4*Z.of_nat n,value(Z.of_nat n))]end.
Lemma mp_run_lane_writes:forall count O p value,
 mp_run_writes O(mp_lane_writes count p value)=mp_write_n O p count value.
Proof.
 induction count;intros O p value;[reflexivity|].
 cbn[mp_lane_writes mp_write_n];rewrite mp_run_append.
 change(mp_put(mp_run_writes O(mp_lane_writes count p value))
 (p+4*Z.of_nat count)(value(Z.of_nat count))=
 mp_put(mp_write_n O p count value)(p+4*Z.of_nat count)(value(Z.of_nat count))).
 rewrite IHcount;reflexivity.
Qed.
Lemma mp_lane_writes_addresses:forall count p value q,
 In q(map fst(mp_lane_writes count p value))<->
 exists i,0<=i<Z.of_nat count /\ q=p+4*i.
Proof.
 induction count;intros p value q.
 - cbn;split;[contradiction|intros[i[Hi _]];lia].
 - cbn[mp_lane_writes];rewrite map_app,in_app_iff,IHcount;cbn.
   rewrite Nat2Z.inj_succ;split.
   + intros[[i[Hi Heq]]|[Heq|Hfalse]];
     [exists i|exists(Z.of_nat count)|contradiction];split;lia.
   + intros[i[Hi Heq]];destruct(Z.eq_dec i(Z.of_nat count))as[->|Hneq].
     * right;left;lia.
     * left;exists i;split;lia.
Qed.
Fixpoint mp_pixel_writes(F:MPFloatMap)(PT:MPPtrMap)
 (table offset stride inc output outinc K channels:Z)(lo hi:fp32)(pixels:nat):list(Z*fp32):=
 match pixels with O=>[]|S n=>
 mp_pixel_writes F PT table offset stride inc output outinc K channels lo hi n++
 mp_lane_writes(Z.to_nat channels)(mp_output_at output outinc(Z.of_nat n))
 (fun j=>mp_result_lane F PT(mp_table_at table inc(Z.of_nat n))
 (mp_offset_at offset stride(Z.of_nat n))K j lo hi)end.
Lemma mp_finish_pixels_as_trace:forall pixels F PT old table offset stride inc output outinc K channels lo hi,
 mp_finish_pixels F PT old table offset stride inc output outinc K channels lo hi pixels=
 mp_run_writes old(mp_pixel_writes F PT table offset stride inc output outinc K channels lo hi pixels).
Proof.
 induction pixels;intros;[reflexivity|].
 cbn[mp_finish_pixels mp_pixel_writes];rewrite mp_run_append,mp_run_lane_writes.
 rewrite<-IHpixels;reflexivity.
Qed.
Definition mp_complete_writes(F:MPFloatMap)(PT:MPPtrMap)
 (pixels K channels table offset stride inc output outinc:Z)(lo hi:fp32):list(Z*fp32):=
 mp_pixel_writes F PT table offset stride inc output outinc K channels lo hi(Z.to_nat pixels).
Definition mp_written(pixels channels output outinc p:Z):Prop:=
 exists pixel channel,0<=pixel<pixels /\ 0<=channel<channels /\
 p=mp_output_at output outinc pixel+4*channel.
Lemma mp_complete_as_trace:forall F PT old pixels K channels table offset stride inc output outinc lo hi,
 mp_complete F PT old pixels K channels table offset stride inc output outinc lo hi=
 mp_run_writes old(mp_complete_writes F PT pixels K channels table offset stride inc output outinc lo hi).
Proof. intros;apply mp_finish_pixels_as_trace. Qed.
Lemma mp_pixel_writes_addresses:forall pixels F PT table offset stride inc output outinc K channels lo hi p,
 0<=channels->
 (In p(map fst(mp_pixel_writes F PT table offset stride inc output outinc K channels lo hi pixels))<->
 mp_written(Z.of_nat pixels)channels output outinc p).
Proof.
 induction pixels;intros F PT table offset stride inc output outinc K channels lo hi p HC.
 - cbn;unfold mp_written;split;[contradiction|intros[i[j[Hi _]]];lia].
 - cbn[mp_pixel_writes];rewrite map_app,in_app_iff.
   rewrite IHpixels by assumption;rewrite mp_lane_writes_addresses,Z2Nat.id by assumption.
   unfold mp_written;rewrite Nat2Z.inj_succ;split.
   + intros[[i[j[Hi[Hj Heq]]]]|[j[Hj Heq]]].
     * exists i,j;repeat split;lia.
     * exists(Z.of_nat pixels),j;repeat split;try assumption;lia.
   + intros[i[j[Hi[Hj Heq]]]];destruct(Z.eq_dec i(Z.of_nat pixels))as[->|Hneq].
     * right;exists j;auto.
     * left;exists i,j;repeat split;try assumption;lia.
Qed.
Theorem mp_complete_written_addresses:forall F PT pixels K channels table offset stride inc output outinc lo hi p,
 0<=pixels->0<=channels->
 (In p(map fst(mp_complete_writes F PT pixels K channels table offset stride inc output outinc lo hi))<->
 mp_written pixels channels output outinc p).
Proof.
 intros;unfold mp_complete_writes;rewrite mp_pixel_writes_addresses by assumption.
 rewrite Z2Nat.id by assumption;reflexivity.
Qed.
Theorem mp_complete_written_bits:forall F PT oldN oldR pixels K channels table offset stride inc output outinc lo hi p,
 0<=pixels->0<=channels->mp_written pixels channels output outinc p->
 exists a b,
 mp_complete F PT oldN pixels K channels table offset stride inc output outinc lo hi p=Some a /\
 mp_complete F PT oldR pixels K channels table offset stride inc output outinc lo hi p=Some b /\
 bits_of_fp32 a=bits_of_fp32 b.
Proof.
 intros;rewrite !mp_complete_as_trace;apply mp_trace_written_bits.
 apply(proj2(mp_complete_written_addresses F PT pixels K channels table offset stride inc output outinc lo hi p H H0));assumption.
Qed.
Theorem mp_complete_unwritten_frame:forall F PT old pixels K channels table offset stride inc output outinc lo hi p,
 0<=pixels->0<=channels->~mp_written pixels channels output outinc p->
 mp_complete F PT old pixels K channels table offset stride inc output outinc lo hi p=old p.
Proof.
 intros;rewrite mp_complete_as_trace;apply mp_trace_unwritten_frame.
 rewrite mp_complete_written_addresses by assumption;assumption.
Qed.
(* These two result equalities are supplied by the checked strong kernel
   contracts, not added as user-domain assumptions. Distinct initial maps may
   contain None; every written observation is initialized and bit-exact, and
   every unwritten slot retains its own original state. Repeated writes and
   overlapping pixels remain in the actual trace order above. *)
Theorem mp_kernel_posts_written_and_frames:forall F PT oldN oldR finalN finalR
 pixels K channels table offset stride inc output outinc lo hi,
 0<=pixels->0<=channels->
 finalN=mp_complete F PT oldN pixels K channels table offset stride inc output outinc lo hi->
 finalR=mp_complete F PT oldR pixels K channels table offset stride inc output outinc lo hi->
 (forall p,mp_written pixels channels output outinc p->
 exists a b,finalN p=Some a /\ finalR p=Some b /\ bits_of_fp32 a=bits_of_fp32 b) /\
 (forall p,~mp_written pixels channels output outinc p->finalN p=oldN p /\ finalR p=oldR p).
Proof.
 intros;subst finalN finalR;split.
 - intros;eapply mp_complete_written_bits;eassumption.
 - intros;split;apply mp_complete_unwritten_frame;assumption.
Qed.

Print Assumptions mp_put_equal_on.
Print Assumptions mp_run_equal_on.
Print Assumptions mp_trace_written_bits.
Print Assumptions mp_trace_unwritten_frame.
Print Assumptions mp_run_append.
Print Assumptions mp_run_lane_writes.
Print Assumptions mp_lane_writes_addresses.
Print Assumptions mp_finish_pixels_as_trace.
Print Assumptions mp_complete_as_trace.
Print Assumptions mp_pixel_writes_addresses.
Print Assumptions mp_complete_written_addresses.
Print Assumptions mp_complete_written_bits.
Print Assumptions mp_complete_unwritten_frame.
Print Assumptions mp_kernel_posts_written_and_frames.
