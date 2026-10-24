From Coq Require Import ZArith List.
From Dwconv Require Import ProgramModel Observation StateObservation.
Import ListNotations.
Local Open Scope Z_scope.

(* The trace preserves both loop orders and every write, including writes to
   an address already written by an earlier pixel. *)
Definition dw_pixel_trace isa F P D pixel count lo hi : list (Z*fp32) :=
 map (fun i => (dw_output_at D pixel+4*Z.of_nat i,
                dw_value isa F P D pixel (Z.of_nat i) lo hi))
     (seq 0 (Z.to_nat count)).
Definition dw_program_trace isa F P D count lo hi : list (Z*fp32) :=
 flat_map (fun pixel => dw_pixel_trace isa F P D (Z.of_nat pixel)
                       (dw_channels D) lo hi)
          (seq 0 (Z.to_nat count)).

Lemma dw_run_writes_app : forall xs ys O,
 dw_run_writes O (xs++ys)=dw_run_writes (dw_run_writes O xs) ys.
Proof. intros;unfold dw_run_writes;apply fold_left_app. Qed.

Lemma dw_pixel_trace_state : forall isa F P D pixel count lo hi O,
 dw_run_writes O (dw_pixel_trace isa F P D pixel count lo hi)=
 dw_channel_state isa F P D pixel count lo hi O.
Proof.
 intros;unfold dw_pixel_trace,dw_channel_state,dw_run_writes.
 generalize (seq 0 (Z.to_nat count));intro xs;revert O.
 induction xs as[|i xs IH];intro O;cbn[map fold_left];[reflexivity|].
 apply IH.
Qed.

Lemma dw_program_trace_state : forall isa F P D count lo hi O,
 dw_run_writes O (dw_program_trace isa F P D count lo hi)=
 dw_full_state isa F P D count lo hi O.
Proof.
 intros;unfold dw_program_trace,dw_full_state.
 generalize (seq 0 (Z.to_nat count));intro xs;revert O.
 induction xs as[|pixel xs IH];intro O;cbn[flat_map fold_left];[reflexivity|].
 rewrite dw_run_writes_app,dw_pixel_trace_state;apply IH.
Qed.

Lemma dw_pixel_trace_related : forall F P D pixel count lo hi,
 dw_trace_related (fun p=>p)
 (dw_pixel_trace true F P D pixel count lo hi)
 (dw_pixel_trace false F P D pixel count lo hi).
Proof.
 intros;unfold dw_trace_related,dw_pixel_trace.
 generalize(seq 0(Z.to_nat count));intro xs;induction xs as[|i xs IH];constructor.
 - split;[reflexivity|];unfold dw_value;apply dw_lane_related.
 - exact IH.
Qed.

Lemma dw_trace_related_app : forall T xs ys xs' ys',
 dw_trace_related T xs ys -> dw_trace_related T xs' ys' ->
 dw_trace_related T (xs++xs') (ys++ys').
Proof. unfold dw_trace_related;intros;now apply Forall2_app. Qed.

Lemma dw_program_trace_related : forall F P D count lo hi,
 dw_trace_related (fun p=>p)
 (dw_program_trace true F P D count lo hi)
 (dw_program_trace false F P D count lo hi).
Proof.
 intros;unfold dw_program_trace.
 generalize(seq 0(Z.to_nat count));intro xs;induction xs as[|i xs IH].
 - constructor.
 - cbn[flat_map];apply dw_trace_related_app;[apply dw_pixel_trace_related|exact IH].
Qed.

Theorem dw_full_states_written_observe : forall F P D count lo hi O1 O2 p,
 In p (map fst (dw_program_trace true F P D count lo hi)) ->
 exists a b,dw_full_state true F P D count lo hi O1 p=Some a /\
 dw_full_state false F P D count lo hi O2 p=Some b /\ dw_observe a b.
Proof.
 intros F P D count lo hi O1 O2 p Hp.
 pose proof(dw_written_slots_observe (fun p=>p) (fun p q H=>H)
 (dw_program_trace true F P D count lo hi)
 (dw_program_trace false F P D count lo hi) O1 O2
 (dw_program_trace_related F P D count lo hi) p Hp)as H.
 rewrite !dw_program_trace_state in H;exact H.
Qed.
Print Assumptions dw_program_trace_state.
Print Assumptions dw_program_trace_related.
Print Assumptions dw_full_states_written_observe.
