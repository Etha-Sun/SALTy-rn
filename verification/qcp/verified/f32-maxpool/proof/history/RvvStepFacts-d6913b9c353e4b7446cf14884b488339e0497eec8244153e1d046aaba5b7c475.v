From Coq Require Import ZArith Lia.
From MaxPool Require Import KernelFacts RvvMemoryModel.
Local Open Scope Z_scope.

(* Only the active prefix is constrained. These statements do not choose a
   value for inactive lanes or initialize a None output cell. *)
Lemma mp_rvv_write_step : forall F PT old table offset output K channels group done vl lo hi values,
 0<=done -> 0<=vl ->
 (forall j,0<=j<vl -> values j=
  mp_after_groups F PT table offset K group (done+j) lo hi) ->
 mp_write (mp_pass_partial F PT old table offset output K channels group done lo hi)
  (mp_output_cursor output done) vl values =
 mp_pass_partial F PT old table offset output K channels group (done+vl) lo hi.
Proof.
 intros F PT old table offset output K channels group done vl lo hi values Hd Hv Heq.
 unfold mp_pass_partial,mp_output_cursor.
 etransitivity.
 - eapply mp_write_ext_bounded;[exact Hv|exact Heq].
 - apply mp_write_append;assumption.
Qed.

Lemma mp_rvv_previous_lane : forall F PT old table offset output K channels group done lane vl lo hi value,
 0<group -> 0<=done -> 0<=lane<vl -> done+lane<channels ->
 mp_active_loaded (mp_pass_partial F PT old table offset output K channels group done lo hi)
  (mp_output_cursor output done) lane vl value ->
 value=mp_after_groups F PT table offset K (group-1) (done+lane) lo hi.
Proof.
 intros F PT old table offset output K channels group done lane vl lo hi value Hg Hd Hj Hc Hload.
 unfold mp_active_loaded in Hload;specialize(Hload Hj).
 unfold mp_loaded_lane,mp_output_cursor in Hload.
 replace(output+4*done+4*lane)with(output+4*(done+lane))in Hload by lia.
 unfold mp_pass_partial in Hload.
 assert(Hgroup:Z.eqb group 0=false)by(apply Z.eqb_neq;lia).
 rewrite Hgroup in Hload.
 unfold mp_loaded in Hload.
 rewrite mp_write_outside in Hload by(intros;lia).
 unfold mp_pass_complete in Hload.
 rewrite mp_write_inside in Hload by lia.
 exact Hload.
Qed.

Lemma mp_rvv_row_active : forall F PT table offset K group row done lane vl,
 0<=lane<vl ->
 mp_load_lane F (mp_row_cursor PT table offset K group row done) lane=
 mp_load_lane F (mp_row_base PT table offset K group row) (done+lane).
Proof. intros;apply mp_row_load_cursor. Qed.

Print Assumptions mp_rvv_write_step.
Print Assumptions mp_rvv_previous_lane.
Print Assumptions mp_rvv_row_active.
