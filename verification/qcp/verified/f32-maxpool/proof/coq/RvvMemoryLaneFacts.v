From MaxPool Require Import RvvMemoryControlSupport NeonLoopMoreFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope.
Local Opaque mp_arm mp_rvv mp_load_lane mp_after_groups.
Ltac mpr_specialize := repeat match goal with
 H:mp_fmatch ?i ?vl _ _|-_=>unfold mp_fmatch in H;specialize(H ltac:(lia)) end.
Lemma mpr_first_lane:forall (F:MPFloatMap)(PT:MPPtrMap)(table offset K done lane vl:Z)(lo hi:fp32)(i0 i1 i2 i3 i4 i5 i6 i7 i8:Z)(r0 r0_2 r0_3 r0_4 r0_5 r0_6 r0_7 r0_8 r0_9 r0_10 r0_11 r0_12 r0_13 r0_14 r0_15 r0_16 r0_17 r0_18 r0_19:fp32),
 0<=lane<vl->
 (mp_fmatch lane vl r0_19 (mp_arm_min (r0_18) (hi)) )->
 (mp_fmatch lane vl r0_18 (mp_arm_max (r0_17) (lo)) )->
 (mp_fmatch lane vl r0_17 (mp_arm_max (r0_15) (r0_16)) )->
 (mp_fmatch lane vl r0_16 (mp_arm_max (r0_11) (r0_14)) )->
 (mp_fmatch lane vl r0_15 (mp_arm_max (r0_12) (r0_13)) )->
 (mp_fmatch lane vl r0_14 (mp_arm_max (r0_7) (r0_8)) )->
 (mp_fmatch lane vl r0_13 (mp_arm_max (r0_5) (r0_6)) )->
 (mp_fmatch lane vl r0_12 (mp_arm_max (r0_3) (r0_4)) )->
 (mp_fmatch lane vl r0_11 (mp_arm_max (r0_10) (r0_9)) )->
 (mp_fmatch lane vl r0_10 (mp_arm_max (r0) (r0_2)) )->
 (mp_fmatch lane vl r0_9 (mp_load_lane (F) (i8) (lane)) )->
 (mp_fmatch lane vl r0_8 (mp_load_lane (F) (i7) (lane)) )->
 (mp_fmatch lane vl r0_7 (mp_load_lane (F) (i6) (lane)) )->
 (mp_fmatch lane vl r0_6 (mp_load_lane (F) (i5) (lane)) )->
 (mp_fmatch lane vl r0_5 (mp_load_lane (F) (i4) (lane)) )->
 (mp_fmatch lane vl r0_4 (mp_load_lane (F) (i3) (lane)) )->
 (mp_fmatch lane vl r0_3 (mp_load_lane (F) (i2) (lane)) )->
 (mp_fmatch lane vl r0_2 (mp_load_lane (F) (i1) (lane)) )->
 (mp_fmatch lane vl r0 (mp_load_lane (F) (i0) (lane)) )->
 i0=mp_row_cursor PT table offset K 0 0 done->
 i1=mp_row_cursor PT table offset K 0 1 done->
 i2=mp_row_cursor PT table offset K 0 2 done->
 i3=mp_row_cursor PT table offset K 0 3 done->
 i4=mp_row_cursor PT table offset K 0 4 done->
 i5=mp_row_cursor PT table offset K 0 5 done->
 i6=mp_row_cursor PT table offset K 0 6 done->
 i7=mp_row_cursor PT table offset K 0 7 done->
 i8=mp_row_cursor PT table offset K 0 8 done->
 r0_19=mp_after_groups F PT table offset K 0(done+lane)lo hi.
Proof.
 intros F PT table offset K done lane vl lo hi i0 i1 i2 i3 i4 i5 i6 i7 i8 r0 r0_2 r0_3 r0_4 r0_5 r0_6 r0_7 r0_8 r0_9 r0_10 r0_11 r0_12 r0_13 r0_14 r0_15 r0_16 r0_17 r0_18 r0_19 Hlane;intros.
 mpr_specialize.
 subst i0 i1 i2 i3 i4 i5 i6 i7 i8 r0_19 r0_18 r0_17 r0_16 r0_15 r0_14 r0_13 r0_12 r0_11 r0_10 r0_9 r0_8 r0_7 r0_6 r0_5 r0_4 r0_3 r0_2 r0.
 rewrite<-mp_loop_first_lane_correct.
 unfold mp_loop_first_lane,mp_first,mp_tree9,mp_arm_max,mp_arm_min,mp_max,mp_min;reflexivity.
Qed.
Print Assumptions mpr_first_lane.
Lemma mpr_more_lane:forall (F:MPFloatMap)(PT:MPPtrMap)(old:MPOutput)(table offset output K channels group done lane vl:Z)(lo hi:fp32)(i0 i1 i2 i3 i4 i5 i6 i7 i8:Z)(r0 r0_2 r0_3 r0_4 r0_5 r0_6 r0_7 r0_8 r0_9 r0_10 r0_11 r0_12 r0_13 r0_14 r0_15 r0_16 r0_17 r0_18 r0_19 r0_20:fp32),
 0<=group->
 0<=done->
 0<=lane<vl->
 done+lane<channels->
 mp_active_loaded(mp_pass_partial F PT old table offset output K channels(group+1)done lo hi)(mp_output_cursor output done)lane vl r0_10->
 (mp_fmatch lane vl r0_20 (mp_arm_min (r0_19) (hi)) )->
 (mp_fmatch lane vl r0_19 (mp_arm_max (r0_10) (r0_18)) )->
 (mp_fmatch lane vl r0_18 (mp_arm_max (r0_16) (r0_17)) )->
 (mp_fmatch lane vl r0_17 (mp_arm_max (r0_12) (r0_15)) )->
 (mp_fmatch lane vl r0_16 (mp_arm_max (r0_13) (r0_14)) )->
 (mp_fmatch lane vl r0_15 (mp_arm_max (r0_7) (r0_8)) )->
 (mp_fmatch lane vl r0_14 (mp_arm_max (r0_5) (r0_6)) )->
 (mp_fmatch lane vl r0_13 (mp_arm_max (r0_3) (r0_4)) )->
 (mp_fmatch lane vl r0_12 (mp_arm_max (r0_11) (r0_9)) )->
 (mp_fmatch lane vl r0_11 (mp_arm_max (r0) (r0_2)) )->
 (mp_fmatch lane vl r0_9 (mp_load_lane (F) (i8) (lane)) )->
 (mp_fmatch lane vl r0_8 (mp_load_lane (F) (i7) (lane)) )->
 (mp_fmatch lane vl r0_7 (mp_load_lane (F) (i6) (lane)) )->
 (mp_fmatch lane vl r0_6 (mp_load_lane (F) (i5) (lane)) )->
 (mp_fmatch lane vl r0_5 (mp_load_lane (F) (i4) (lane)) )->
 (mp_fmatch lane vl r0_4 (mp_load_lane (F) (i3) (lane)) )->
 (mp_fmatch lane vl r0_3 (mp_load_lane (F) (i2) (lane)) )->
 (mp_fmatch lane vl r0_2 (mp_load_lane (F) (i1) (lane)) )->
 (mp_fmatch lane vl r0 (mp_load_lane (F) (i0) (lane)) )->
 i0=mp_row_cursor PT table offset K (group+1) 0 done->
 i1=mp_row_cursor PT table offset K (group+1) 1 done->
 i2=mp_row_cursor PT table offset K (group+1) 2 done->
 i3=mp_row_cursor PT table offset K (group+1) 3 done->
 i4=mp_row_cursor PT table offset K (group+1) 4 done->
 i5=mp_row_cursor PT table offset K (group+1) 5 done->
 i6=mp_row_cursor PT table offset K (group+1) 6 done->
 i7=mp_row_cursor PT table offset K (group+1) 7 done->
 i8=mp_row_cursor PT table offset K (group+1) 8 done->
 r0_20=mp_after_groups F PT table offset K (group+1)(done+lane)lo hi.
Proof.
 intros F PT old table offset output K channels group done lane vl lo hi i0 i1 i2 i3 i4 i5 i6 i7 i8 r0 r0_2 r0_3 r0_4 r0_5 r0_6 r0_7 r0_8 r0_9 r0_10 r0_11 r0_12 r0_13 r0_14 r0_15 r0_16 r0_17 r0_18 r0_19 r0_20 Hgroup Hdone Hlane Hchannel Hprevious;intros.
 unfold mp_active_loaded in Hprevious;specialize(Hprevious Hlane).
 mpr_specialize.
 subst i0 i1 i2 i3 i4 i5 i6 i7 i8 r0_20 r0_19 r0_18 r0_17 r0_16 r0_15 r0_14 r0_13 r0_12 r0_11 r0_9 r0_8 r0_7 r0_6 r0_5 r0_4 r0_3 r0_2 r0.
 pose proof(mp_loop_more_lane_correct F PT old table offset output K channels group done lane lo hi r0_10 Hgroup Hdone ltac:(lia)Hchannel Hprevious)as Hmore.
 unfold mp_loop_more_lane,mp_more,mp_tree9,mp_arm_max,mp_arm_min,mp_max,mp_min in Hmore;exact Hmore.
Qed.
Print Assumptions mpr_more_lane.
