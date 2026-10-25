From MaxPool Require Import NeonLoopBulkExactFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Transparent mp_more.
Local Opaque mp_first mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane mp_load_lane mp_out mp_pass_partial mp_pass_complete.
Lemma checked:MaxPool.neon_unit_goal.test_neon_entail_wit_26.
Proof. unfold MaxPool.neon_unit_goal.test_neon_entail_wit_26;left;mp_intro;subst;Exists(g_2).
 repeat multimatch goal with
 | H:mp_loaded_lane(mp_pass_partial ?F ?PT ?old ?table ?offset ?output ?K ?channels (?group+1) ?done ?lo ?hi)
 (mp_output_cursor ?output ?done) ?lane ?previous |- _ =>
 let HV:=fresh "Hlane" in
 pose proof(mp_loop_more_lane_correct F PT old table offset output K channels group done lane lo hi previous
 ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)H)as HV;
 unfold mp_loop_more_lane,mp_more,mp_tree9 in HV;rewrite HV;clear H HV end.
 rewrite ?Z.add_0_r.
 rewrite mp_loop_store_four by(first[solve[lia]|solve[reflexivity]]).
 replace(channels_pre-(c-4))with(channels_pre-c+4)by lia.
 mp_loop_frame.
Qed.
Print Assumptions checked.
