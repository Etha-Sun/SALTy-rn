From MaxPool Require Import NanArrayAutomation NanArrayPrefixFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_mp_propagate_nan_entail_wit_1:MaxPool.propagate_goal.mp_propagate_nan_entail_wit_1.
Proof. unfold MaxPool.propagate_goal.mp_propagate_nan_entail_wit_1;right;na_intro;na_constants.
 rewrite <-mp_zero32_repeat.
 rewrite mp_restore_prefix_zero by(apply mp_u32_prefix_length;[apply mp_zero32_length|apply mp_u32_vec_length|lia]).
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;repeat first[solve[assumption|reflexivity|lia]|split].
Qed.
Lemma proof_of_mp_propagate_nan_entail_wit_2:MaxPool.propagate_goal.mp_propagate_nan_entail_wit_2.
Proof. unfold MaxPool.propagate_goal.mp_propagate_nan_entail_wit_2;right;na_intro;na_constants;subst.
 rewrite ?mp_restore_prefix_original in * by lia.
 rewrite mp_restore_prefix_step by lia.
 unfold derivable1,andp,coq_prop;intros m[Ht Hemp];subst;repeat first[solve[assumption|reflexivity|lia]|split].
Qed.
Print Assumptions proof_of_mp_propagate_nan_entail_wit_1.
Print Assumptions proof_of_mp_propagate_nan_entail_wit_2.
