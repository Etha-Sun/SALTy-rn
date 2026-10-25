From Coq Require Import ZArith List Lia.
From X32Packw Require Import OddAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_pw_neon_odd_safety_wit_1:pw_neon_odd_safety_wit_1.
Proof. unfold pw_neon_odd_safety_wit_1.
 first [right;intros;pw_odd_auto|left;intros;pw_odd_auto|intros;pw_odd_auto].
Qed.
Print Assumptions checked_pw_neon_odd_safety_wit_1.
