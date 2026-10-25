From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_29_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_29_1.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_29_1;right;mpm_prepare;assert(c=0)by lia;subst c;rewrite Z.sub_0_r.
 Exists (g_2+1);rewrite mp_pass_partial_full by lia.
 pose proof(mp_loop_group_advance kernel_elements_pre g_2 ltac:(lia)ltac:(lia)ltac:(lia))as Hadvance.
 unfold mp_k_after in *;mp_call_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_29_1.
