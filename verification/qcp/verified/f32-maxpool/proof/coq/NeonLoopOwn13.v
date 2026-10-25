From MaxPool Require Import NeonLoopAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane.
Lemma checked13 : MaxPool.neon_unit_goal.test_neon_entail_wit_13.
Proof. unfold MaxPool.neon_unit_goal.test_neon_entail_wit_13;left;mp_intro;subst;
rewrite mp_loop_store_first4 by lia;
replace(channels_pre-(c-4))with((channels_pre-c)+4)by lia;mp_loop_frame.
Set Printing All.
all:match goal with|-?G=>idtac "REMAINING" G end. Qed.
Print Assumptions checked13.
