From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_entail_wit_2:test_neon_entail_wit_2.
Proof. unfold test_neon_entail_wit_2.
 right;intros;pw_main_normalize;pw_main_facts.
 rewrite pw_tile_state_zero.
 replace(pw_tile_weight G group 0)with(pw_group_weight G group)by(unfold pw_tile_weight,pw_group_weight;ring).
 replace(2*0)with(0:Z)by ring;entailer!.
Qed.
Print Assumptions checked_test_neon_entail_wit_2.
