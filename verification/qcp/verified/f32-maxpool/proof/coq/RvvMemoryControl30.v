From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_30:MaxPool.rvv_unit_goal.test_rvv_entail_wit_30.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_30;
 right;mpm_prepare.
 unfold mp_row_pointer;rewrite mpm_row_index_zero,Z.mul_0_r,Z.add_0_r.
 rewrite mpm_table_first.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|reflexivity|lia]|split].

Qed.
Print Assumptions proof_of_test_rvv_entail_wit_30.
