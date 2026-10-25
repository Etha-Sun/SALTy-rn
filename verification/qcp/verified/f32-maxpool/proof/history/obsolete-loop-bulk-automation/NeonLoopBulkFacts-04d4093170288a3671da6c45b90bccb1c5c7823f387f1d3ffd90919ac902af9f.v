From MaxPool Require Export NeonLoopFirstFacts NeonLoopMoreFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma mp_loop_store_four:forall F PT old table offset output K channels group done lo hi v0 v1 v2 v3,
 0<=done->v0=mp_after_groups F PT table offset K group done lo hi->
 v1=mp_after_groups F PT table offset K group(done+1)lo hi->
 v2=mp_after_groups F PT table offset K group(done+2)lo hi->
 v3=mp_after_groups F PT table offset K group(done+3)lo hi->
 mp_write(mp_pass_partial F PT old table offset output K channels group done lo hi)
 (mp_output_cursor output done)4(mp_pack4 v0 v1 v2 v3)=
 mp_pass_partial F PT old table offset output K channels group(done+4)lo hi.
Proof. intros;apply mp_rvv_write_step;[assumption|lia|].
 intros j Hj;assert(Hcases:j=0\/j=1\/j=2\/j=3)by lia;destruct Hcases as[Hj0|[Hj1|[Hj2|Hj3]]];subst j;cbn[mp_pack4];rewrite ?Z.add_0_r;assumption. Qed.
