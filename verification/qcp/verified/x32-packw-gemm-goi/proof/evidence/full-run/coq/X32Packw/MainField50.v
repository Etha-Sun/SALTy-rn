From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_neon_return_wit_1:test_neon_return_wit_1.
Proof. unfold test_neon_return_wit_1.
 first[left|idtac];intros;pw_main_normalize.
 assert(Hend:group=pw_groups G)by lia;subst group.
 unfold pw_program,pw_group_state;entailer!.
Qed.
Print Assumptions checked_test_neon_return_wit_1.
