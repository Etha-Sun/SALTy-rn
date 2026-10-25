From MaxPool Require Export NeonLoopFirstFacts NeonLoopMoreFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_first mp_more mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane mp_load_lane.
Lemma mp_loop_store_four:forall F PT old table offset output K channels group done lo hi v0 v1 v2 v3,
 0<=done->v0=mp_after_groups F PT table offset K group done lo hi->
 v1=mp_after_groups F PT table offset K group(done+1)lo hi->
 v2=mp_after_groups F PT table offset K group(done+2)lo hi->
 v3=mp_after_groups F PT table offset K group(done+3)lo hi->
 mp_write(mp_pass_partial F PT old table offset output K channels group done lo hi)
 (mp_output_cursor output done)4(mp_pack4 v0 v1 v2 v3)=
 mp_pass_partial F PT old table offset output K channels group(done+4)lo hi.
Proof.
 intros F PT old table offset output K channels group done lo hi v0 v1 v2 v3 Hd H0 H1 H2 H3.
 apply mp_rvv_write_step;[exact Hd|lia|].
 intros j Hj.
 assert(Hcases:j=0\/j=1\/j=2\/j=3)by lia.
 destruct Hcases as[Hj0|[Hj1|[Hj2|Hj3]]];subst j.
 - change(v0=mp_after_groups F PT table offset K group(done+0)lo hi).
   replace(done+0)with done by lia;exact H0.
 - change(v1=mp_after_groups F PT table offset K group(done+1)lo hi);exact H1.
 - change(v2=mp_after_groups F PT table offset K group(done+2)lo hi);exact H2.
 - change(v3=mp_after_groups F PT table offset K group(done+3)lo hi);exact H3.
Qed.
Print Assumptions mp_loop_store_four.
