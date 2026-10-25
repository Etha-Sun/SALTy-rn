From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_entail_wit_4_1:test_neon_entail_wit_4_1.
Proof. unfold test_neon_entail_wit_4_1.
 right;intros;pw_main_normalize;pw_main_facts.
 assert(Hnc:pw_channels G=2*tile+1)by lia.
 assert(Hfinish:tile+1=pw_tiles G)by(apply pw_tile_finished_odd;assumption||lia).
 rewrite(pw_tile_advance F W G group tile)by(eassumption||lia).
 rewrite(pw_weight_advance F W G group)by eassumption.
 rewrite(pw_odd_tile_progress F W G O group tile)by(eassumption||lia).
 replace(pw_bias_at G group(2*tile)+4)with(pw_bias_at G group(pw_channels G))by
  (rewrite Hnc;rewrite <-pw_bias_at_step_present by lia;ring).
 rewrite pw_bias_at_next_group,Hfinish,pw_output_next_group.
 rewrite <-pw_group_state_step by lia;entailer!.
Qed.
Print Assumptions checked_test_neon_entail_wit_4_1.
