From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_safety_wit_36:test_neon_safety_wit_36.
Proof. unfold test_neon_safety_wit_36.
 first [right;intros;pw_main_auto|left;intros;pw_main_auto|intros;pw_main_auto].
Qed.
Print Assumptions checked_test_neon_safety_wit_36.
