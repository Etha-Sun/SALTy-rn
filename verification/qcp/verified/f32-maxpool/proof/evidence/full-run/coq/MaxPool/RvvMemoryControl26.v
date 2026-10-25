From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_26:MaxPool.rvv_unit_goal.test_rvv_entail_wit_26.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_26;
 left;mpm_prepare.
 Exists g_2.
 rewrite ?Z.sub_diag,?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r.
 rewrite mpm_more_start by lia.
 unfold mp_output_cursor;rewrite ?Z.mul_0_r,?Z.add_0_r.
 mp_call_frame.

Qed.
Print Assumptions proof_of_test_rvv_entail_wit_26.
