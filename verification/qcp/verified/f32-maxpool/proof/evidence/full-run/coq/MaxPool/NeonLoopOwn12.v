From MaxPool Require Import NeonLoopAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked12 : MaxPool.neon_unit_goal.test_neon_entail_wit_12.
Proof. unfold MaxPool.neon_unit_goal.test_neon_entail_wit_12;left;mp_intro;rewrite ?Z.sub_diag;rewrite ?mp_loop_partial_zero;mp_loop_frame. Qed.
Print Assumptions checked12.
