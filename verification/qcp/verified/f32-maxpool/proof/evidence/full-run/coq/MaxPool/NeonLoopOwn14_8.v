From MaxPool Require Import NeonLoopAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane mp_out mp_data mp_ptr_data mp_pass_partial mp_pass_complete.
Lemma checked : MaxPool.neon_unit_goal.test_neon_entail_wit_14_8.
Proof. unfold MaxPool.neon_unit_goal.test_neon_entail_wit_14_8;left;mp_intro;Exists(0:Z);
assert(Hc:c=0)by(assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;destruct Hcases as[H0|[H1|[H2|H3]]];subst c;cbn in PreH40,PreH41;lia).
contradiction.
Qed.
Print Assumptions checked.
