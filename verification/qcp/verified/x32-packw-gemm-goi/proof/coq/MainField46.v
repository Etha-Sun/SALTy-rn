From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_entail_wit_3_2:test_neon_entail_wit_3_2.
Proof. unfold test_neon_entail_wit_3_2.
 right;intros;pw_main_normalize;pw_main_facts.
 rewrite(pw_tile_advance F W G group tile)by(eassumption||lia).
 rewrite pw_weight_next_tile.
 rewrite(pw_pair_tile_progress_null F W G O group tile)by(eassumption||lia).
 assert(Hnull:pw_bias G=0)by(apply(proj1(pw_bias_at_null_iff F W G group(2*tile)ltac:(eassumption)ltac:(lia)ltac:(lia)));lia).
 unfold pw_bias_at;rewrite Hnull;cbn[Z.eqb];entailer!.
Qed.
Print Assumptions checked_test_neon_entail_wit_3_2.
