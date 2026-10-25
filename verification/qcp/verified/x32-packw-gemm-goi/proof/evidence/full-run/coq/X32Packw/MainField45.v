From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_entail_wit_3_1:test_neon_entail_wit_3_1.
Proof. unfold test_neon_entail_wit_3_1.
 right;intros;pw_main_normalize;pw_main_facts.
 rewrite(pw_tile_advance F W G group tile)by(eassumption||lia).
 rewrite pw_weight_next_tile.
 replace(pw_bias_at G group(2*tile)+8)with(pw_bias_at G group(2*(tile+1)))by
  (replace(2*(tile+1))with(2*tile+2)by ring;rewrite <-pw_bias_at_step_present by lia;ring).
 rewrite(pw_pair_tile_progress F W G O group tile)by(eassumption||lia);entailer!.
Qed.
Print Assumptions checked_test_neon_entail_wit_3_1.
