From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_entail_wit_4_3:test_neon_entail_wit_4_3.
Proof. unfold test_neon_entail_wit_4_3.
 right;intros;pw_main_normalize;pw_main_facts.
 assert(Hnc:pw_channels G=2*tile)by lia.
 assert(Hfinish:tile=pw_tiles G)by(apply pw_tile_finished_even;assumption||lia).
 rewrite(pw_weight_advance F W G group)by eassumption.
 replace(pw_bias_at G group(2*tile))with(pw_bias_at G(group+1)0)by(rewrite <-Hnc;symmetry;apply pw_bias_at_next_group).
 rewrite Hfinish,pw_output_next_group;rewrite <-pw_group_state_step by lia;entailer!.
Qed.
Print Assumptions checked_test_neon_entail_wit_4_3.
