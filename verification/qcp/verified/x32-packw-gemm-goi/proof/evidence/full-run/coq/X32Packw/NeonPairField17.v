From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Import NeonPairAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_neon_pair_entail_wit_3:pw_neon_pair_entail_wit_3.
Proof. unfold pw_neon_pair_entail_wit_3.
 intros;pw_normalize;Exists x11_2 x10_2 x01_2 x00_2;entailer!.
Qed.
Print Assumptions checked_pw_neon_pair_entail_wit_3.
