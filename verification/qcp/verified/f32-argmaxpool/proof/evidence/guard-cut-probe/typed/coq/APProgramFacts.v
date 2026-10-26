From Coq Require Import ZArith Lia List FunctionalExtensionality.
From ArgmaxPool Require Export APProgramModel.
Import ListNotations. Local Open Scope Z_scope.
Lemma app_advance_zero:forall p inc,app_advance p inc 0=p.
Proof. reflexivity. Qed.
Lemma app_u64_add_l:forall x y,ap_u64(ap_u64 x+y)=ap_u64(x+y).
Proof. intros;unfold ap_u64;rewrite unsigned_unsigned_add_l by lia;reflexivity. Qed.
Lemma app_advance_step:forall p inc pixel,0<=pixel->
 app_advance p inc(pixel+1)=ap_u64(app_advance p inc pixel+inc).
Proof.
 intros p inc pixel Hp;unfold app_advance.
 destruct(Z.eqb_spec(pixel+1)0);[lia|].
 destruct(Z.eqb_spec pixel 0);[subst;f_equal;ring|].
 rewrite app_u64_add_l;f_equal;ring.
Qed.
Lemma app_groups_bounds:forall K,0<K->1<=app_groups K<=K.
Proof.
 intros K HK;unfold app_groups;pose proof(Z.div_mod(K+8)9 ltac:(lia));pose proof(Z.mod_pos_bound(K+8)9 ltac:(lia));lia.
Qed.
Lemma app_remaining_initial:forall K,0<=K->app_remaining K 0=K.
Proof. unfold app_remaining;intros;lia. Qed.
Lemma app_remaining_step:forall K group,0<=group->
 app_remaining K(group+1)=if Z.ltb 9(app_remaining K group)then app_remaining K group-9 else 0.
Proof. unfold app_remaining;intros;destruct(Z.ltb_spec 9(Z.max 0(K-9*group)));lia. Qed.
Lemma app_remaining_active:forall K group,0<K->0<=group->
 (0<app_remaining K group<->group<app_groups K).
Proof.
 intros K group HK Hg;unfold app_remaining,app_groups.
 pose proof(Z.div_mod(K+8)9 ltac:(lia));pose proof(Z.mod_pos_bound(K+8)9 ltac:(lia));lia.
Qed.
Lemma app_run_passes_append:forall step n m b r old,0<=r->
 ap_run_passes step(n+m)b r old=
 ap_run_passes step m(b+9*Z.of_nat n)(Z.max 0(r-9*Z.of_nat n))(ap_run_passes step n b r old).
Proof.
 intros step n;induction n as[|n IH];intros m b r old Hr.
 - cbn[ap_run_passes];rewrite Z.mul_0_r,Z.add_0_r,Z.sub_0_r,Z.max_r by lia;reflexivity.
 - cbn[ap_run_passes Nat.add];rewrite IH by lia.
   repeat rewrite Nat2Z.inj_succ.
   f_equal;lia.
Qed.
Lemma app_lane_prefix_step:forall side F P D pixel group channel,0<=group->0<=app_rows D->
 app_lane_prefix side F P D pixel(group+1)channel=
 Some(app_step side F P(app_table D pixel)(app_offset_at D pixel)channel
 (9*group)(app_remaining(app_rows D)group)(app_lane_prefix side F P D pixel group channel)).
Proof.
 intros;unfold app_lane_prefix.
 rewrite Z2Nat.inj_add by lia;change(Z.to_nat 1)with 1%nat.
 rewrite app_run_passes_append by assumption.
 rewrite Z2Nat.id by assumption;cbn[ap_run_passes].
 unfold app_remaining;rewrite Z.add_0_l;reflexivity.
Qed.
Lemma app_lane_prefix_initialized:forall side F P D pixel groups channel,0<groups->
 exists value,app_lane_prefix side F P D pixel groups channel=Some value.
Proof.
 intros;unfold app_lane_prefix.
 assert(Hn:(0<Z.to_nat groups)%nat)by lia.
 destruct(Z.to_nat groups);[lia|cbn[ap_run_passes];apply ap_run_passes_some].
Qed.
Lemma app_lane_prefix_correct:forall side F P D pixel groups channel,
 app_lane_prefix side F P D pixel groups channel=
 ap_run_passes(ap_pass F P(app_table D pixel)(app_offset_at D pixel)channel)
 (Z.to_nat groups)0(app_rows D)None.
Proof.
 intros;unfold app_lane_prefix;apply ap_run_passes_ext;intros b r old;unfold app_step;destruct side;[apply ap_neon_pass_correct|apply ap_rvv_pass_correct].
Qed.
Lemma app_lane_value_equal:forall F P D pixel groups channel,
 app_lane_value true F P D pixel groups channel=app_lane_value false F P D pixel groups channel.
Proof. intros;unfold app_lane_value;rewrite !app_lane_prefix_correct;reflexivity. Qed.
Lemma app_pass_complete_equal:forall F P D pixel groups S,
 app_pass_complete true F P D pixel groups S=app_pass_complete false F P D pixel groups S.
Proof.
 intros;unfold app_pass_complete;destruct(Z.leb groups 0);[reflexivity|].
 assert(H:app_lane_value true F P D pixel groups=app_lane_value false F P D pixel groups).
 { apply functional_extensionality;intro;apply app_lane_value_equal. }
 rewrite H;reflexivity.
Qed.
Lemma app_program_equal_same_initial:forall F P D S,
 app_program_result true F P D S=app_program_result false F P D S.
Proof.
 intros;unfold app_program_result,app_pixel_before.
 generalize(seq 0(Z.to_nat(app_pixels D)))as indices;intro indices;revert S.
 induction indices;intros;cbn[fold_left];[reflexivity|].
 unfold app_finish_pixel;rewrite app_pass_complete_equal;apply IHindices.
Qed.
Print Assumptions app_advance_zero.
Print Assumptions app_advance_step.
Print Assumptions app_groups_bounds.
Print Assumptions app_remaining_initial.
Print Assumptions app_remaining_step.
Print Assumptions app_remaining_active.
Print Assumptions app_run_passes_append.
Print Assumptions app_lane_prefix_step.
Print Assumptions app_lane_prefix_initialized.
Print Assumptions app_lane_prefix_correct.
Print Assumptions app_lane_value_equal.
Print Assumptions app_pass_complete_equal.
Print Assumptions app_program_equal_same_initial.
