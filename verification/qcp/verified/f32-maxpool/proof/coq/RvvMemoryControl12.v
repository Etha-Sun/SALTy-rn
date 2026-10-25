From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_12:MaxPool.rvv_unit_goal.test_rvv_entail_wit_12.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_12;right;mpm_prepare;rewrite mp_loop_partial_zero.
 unfold mp_output_cursor;rewrite ?Z.mul_0_r,?Z.add_0_r;mp_call_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_12.
