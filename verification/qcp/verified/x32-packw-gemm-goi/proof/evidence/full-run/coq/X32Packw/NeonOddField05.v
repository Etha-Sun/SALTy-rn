From Coq Require Import ZArith List Lia.
From X32Packw Require Import OddAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_neon_odd_entail_wit_2:pw_neon_odd_entail_wit_2.
Proof. unfold pw_neon_odd_entail_wit_2.
 right;intros;pw_odd_normalize.
 replace(kc_pre-(k-1))with(kc_pre-k+1)by lia.
 rewrite pw_odd_run_step by lia;entailer!.
Qed.
Print Assumptions checked_pw_neon_odd_entail_wit_2.
