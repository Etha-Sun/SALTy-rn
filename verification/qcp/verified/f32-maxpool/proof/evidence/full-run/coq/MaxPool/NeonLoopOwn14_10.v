From MaxPool Require Import NeonLoopAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane.
Lemma checked14_10 : MaxPool.neon_unit_goal.test_neon_entail_wit_14_10.
Proof. unfold MaxPool.neon_unit_goal.test_neon_entail_wit_14_10;left;mp_intro;Exists(0:Z);subst;rewrite ?Z.sub_0_r;rewrite ?mp_pass_partial_full by lia;mp_loop_frame.
all:match goal with|-?G=>idtac "REMAINING" G end. Qed.
Print Assumptions checked14_10.
