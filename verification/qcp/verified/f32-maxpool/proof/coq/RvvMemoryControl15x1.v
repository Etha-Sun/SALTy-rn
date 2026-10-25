From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_15_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_15_1.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_15_1;right;mpm_prepare;assert(c=0)by lia;subst c;rewrite Z.sub_0_r.
 Exists 0;rewrite mp_pass_partial_full by lia;unfold mp_k_after.
 pose proof(mp_extra_groups_nonnegative kernel_elements_pre)as Hextra;mp_call_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_15_1.
