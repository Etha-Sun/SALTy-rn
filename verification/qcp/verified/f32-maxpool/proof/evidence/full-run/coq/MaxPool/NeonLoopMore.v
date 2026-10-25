From MaxPool Require Import NeonMemorySupport NeonLoopMoreFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Transparent mp_more.
Local Opaque mp_first mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane mp_load_lane.
Ltac mpm_more_values := repeat multimatch goal with
 | H:mp_loaded_lane(mp_pass_partial ?F ?PT ?old ?table ?offset ?output ?K ?channels (?group+1) ?done ?lo ?hi)
  (mp_output_cursor ?output ?done) ?lane ?previous |- _ =>
  let HV:=fresh "Hlane" in
  pose proof(mp_loop_more_lane_correct F PT old table offset output K channels group done lane lo hi previous
    ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)H)as HV;
  unfold mp_loop_more_lane,mp_more,mp_tree9 in HV;rewrite HV;clear H HV
 end.
Ltac mpm_more_group K group :=
 let HG:=fresh "Hgroup"in
 pose proof(mp_loop_group_advance K group ltac:(lia)ltac:(lia)ltac:(lia))as HG;
 let HS:=fresh "Hstep"in
 first[assert(HS:mp_k_after K(group+1)=mp_k_after K group-9)by(unfold mp_k_after in *;lia)
 |assert(HS:mp_k_after K(group+1)=0)by(unfold mp_k_after in *;lia)].
Module CheckedNeonLoopMoreResources.
Lemma proof_of_test_neon_entail_wit_27_1:MaxPool.neon_unit_goal.test_neon_entail_wit_27_1.
Proof.
 unfold test_neon_entail_wit_27_1;left;mpm_prepare.
 assert(Hc:c=3)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 subst c;Exists(g_2+1).
 mpm_more_values.
 rewrite ?Z.add_0_r.
 rewrite mp_loop_store_two by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 rewrite mp_loop_output_shift2.
 rewrite mp_loop_store_one by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 replace(channels_pre-3+2+1)with channels_pre by lia.
 rewrite mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_27_2:MaxPool.neon_unit_goal.test_neon_entail_wit_27_2.
Proof.
 unfold test_neon_entail_wit_27_2;left;mpm_prepare.
 assert(Hc:c=3)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 subst c;Exists(g_2+1).
 mpm_more_values.
 rewrite ?Z.add_0_r.
 rewrite mp_loop_store_two by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 rewrite mp_loop_output_shift2.
 rewrite mp_loop_store_one by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 replace(channels_pre-3+2+1)with channels_pre by lia.
 rewrite mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_27_3:MaxPool.neon_unit_goal.test_neon_entail_wit_27_3.
Proof.
 unfold test_neon_entail_wit_27_3;left;mpm_prepare.
 assert(Hc:c=1)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 subst c;Exists(g_2+1).
 mpm_more_values.
 rewrite ?Z.add_0_r.
 rewrite mp_loop_store_one by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 replace(channels_pre-1+1)with channels_pre by lia.
 rewrite mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_27_4:MaxPool.neon_unit_goal.test_neon_entail_wit_27_4.
Proof.
 unfold test_neon_entail_wit_27_4;left;mpm_prepare.
 assert(Hc:c=1)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 subst c;Exists(g_2+1).
 mpm_more_values.
 rewrite ?Z.add_0_r.
 rewrite mp_loop_store_one by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 replace(channels_pre-1+1)with channels_pre by lia.
 rewrite mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_27_5:MaxPool.neon_unit_goal.test_neon_entail_wit_27_5.
Proof.
 unfold test_neon_entail_wit_27_5;left;mpm_prepare.
 assert(Hc:c=2)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 subst c;Exists(g_2+1).
 mpm_more_values.
 rewrite ?Z.add_0_r.
 rewrite mp_loop_store_two by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 replace(channels_pre-2+2)with channels_pre by lia.
 rewrite mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_27_6:MaxPool.neon_unit_goal.test_neon_entail_wit_27_6.
Proof.
 unfold test_neon_entail_wit_27_6;left;mpm_prepare.
 assert(Hc:c=2)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 subst c;Exists(g_2+1).
 mpm_more_values.
 rewrite ?Z.add_0_r.
 rewrite mp_loop_store_two by(first[solve[lia]|solve[rewrite ?Z.add_0_r;reflexivity]]).
 replace(channels_pre-2+2)with channels_pre by lia.
 rewrite mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_27_7:MaxPool.neon_unit_goal.test_neon_entail_wit_27_7.
Proof.
 unfold test_neon_entail_wit_27_7;left;mpm_prepare.
 assert(Hc:c=0)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 contradiction.
Qed.
Lemma proof_of_test_neon_entail_wit_27_8:MaxPool.neon_unit_goal.test_neon_entail_wit_27_8.
Proof.
 unfold test_neon_entail_wit_27_8;left;mpm_prepare.
 assert(Hc:c=0)by(
  assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;
  destruct Hcases as[Hc0|[Hc1|[Hc2|Hc3]]];subst c;cbn in PreH48,PreH49;lia).
 contradiction.
Qed.
Lemma proof_of_test_neon_entail_wit_27_9:MaxPool.neon_unit_goal.test_neon_entail_wit_27_9.
Proof.
 unfold test_neon_entail_wit_27_9;left;mpm_prepare.
 Exists(g_2+1).
 rewrite ?Z.sub_0_r,mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_27_10:MaxPool.neon_unit_goal.test_neon_entail_wit_27_10.
Proof.
 unfold test_neon_entail_wit_27_10;left;mpm_prepare.
 Exists(g_2+1).
 rewrite ?Z.sub_0_r,mp_pass_partial_full by lia.
 mpm_more_group kernel_elements_pre g_2;mp_call_frame.
Qed.
End CheckedNeonLoopMoreResources.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_1.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_2.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_3.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_4.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_5.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_6.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_7.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_8.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_9.
Print Assumptions CheckedNeonLoopMoreResources.proof_of_test_neon_entail_wit_27_10.
