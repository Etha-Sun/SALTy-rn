From MaxPool Require Import NeonLoopFirstFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked: MaxPool.neon_unit_goal.test_neon_entail_wit_15.
Proof. unfold MaxPool.neon_unit_goal.test_neon_entail_wit_15;right;mp_intro;mp_integer_constants.
 assert(Hk:0<k)by(pose proof(mp_k_after_nonnegative kernel_elements_pre g_2);lia).
 assert(Hp:mp_ptr_get PT i=mp_row_pointer PT input kernel_elements_pre(g_2+1)0).
 { rewrite PreH28;apply mp_loop_next_pointer;lia. }
 assert(Hc:i+8=mp_table_read_cursor input kernel_elements_pre(g_2+1)1).
 { rewrite PreH28;apply mp_loop_next_cursor;lia. }
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];repeat first[solve[assumption|lia]|split].
Qed.
Print Assumptions checked.
