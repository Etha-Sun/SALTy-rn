From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_entail_wit_1:test_neon_entail_wit_1.
Proof. unfold test_neon_entail_wit_1.
 right;intros;pw_main_normalize.
 rewrite pw_group_state_zero,pw_bias_at_initial.
 unfold pw_group_weight,pw_tile_output;entailer!;ring.
Qed.
Print Assumptions checked_test_neon_entail_wit_1.
