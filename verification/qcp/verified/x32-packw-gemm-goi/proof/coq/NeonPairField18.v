From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Import NeonPairAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_neon_pair_entail_wit_4:pw_neon_pair_entail_wit_4.
Proof. unfold pw_neon_pair_entail_wit_4.
 right;intros;pw_normalize.
 unfold pw_load_lane;rewrite !Z.add_0_r.
 replace(kc_pre-(k-1))with((kc_pre-k)+1)by lia.
 rewrite pw_pair_run_step by lia;entailer!.
Qed.
Print Assumptions checked_pw_neon_pair_entail_wit_4.
