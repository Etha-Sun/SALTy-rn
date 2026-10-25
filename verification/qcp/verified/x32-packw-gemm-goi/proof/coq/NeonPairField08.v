From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Import NeonPairAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_neon_pair_safety_wit_9:pw_neon_pair_safety_wit_9.
Proof. unfold pw_neon_pair_safety_wit_9.
 first [right;intros;pw_neon_pair_auto |left;intros;pw_neon_pair_auto |intros;pw_neon_pair_auto].
Qed.
Print Assumptions checked_pw_neon_pair_safety_wit_9.
