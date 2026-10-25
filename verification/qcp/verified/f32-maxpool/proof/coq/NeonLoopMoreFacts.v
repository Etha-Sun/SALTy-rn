From Coq Require Import ZArith Lia.
From MaxPool Require Export NeonLoopFacts.
Local Open Scope Z_scope.
Local Opaque mp_first mp_more mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane mp_load_lane.
Definition mp_loop_more_lane (F:MPFloatMap)(PT:MPPtrMap)
 (table offset K group done lane:Z)(hi previous:fp32):fp32:=
 mp_more hi previous (mp_tree9(fun row=>mp_load_lane F(mp_row_cursor PT table offset K(group+1)row done)lane)).
Lemma mp_loop_more_lane_correct:forall F PT old table offset output K channels group done lane lo hi previous,
 0<=group->0<=done->0<=lane->done+lane<channels->
 mp_loaded_lane(mp_pass_partial F PT old table offset output K channels(group+1)done lo hi)
 (mp_output_cursor output done)lane previous ->
 mp_loop_more_lane F PT table offset K group done lane hi previous=
 mp_after_groups F PT table offset K(group+1)(done+lane)lo hi.
Proof.
 intros F PT old table offset output K channels group done lane lo hi previous Hg Hd Hl Hc Hload.
 assert(Hactive:mp_active_loaded(mp_pass_partial F PT old table offset output K channels(group+1)done lo hi)
 (mp_output_cursor output done)lane(lane+1)previous).
 { unfold mp_active_loaded;intros;exact Hload. }
 pose proof(mp_rvv_previous_lane F PT old table offset output K channels(group+1)done lane(lane+1)lo hi previous
 ltac:(lia) Hd ltac:(lia) Hc Hactive)as Hprevious.
 replace(group+1-1)with group in Hprevious by ring.
 unfold mp_loop_more_lane;rewrite mp_loop_tree_cursor,Hprevious.
 symmetry;apply mp_after_groups_successor;exact Hg.
Qed.
Print Assumptions mp_loop_more_lane_correct.
