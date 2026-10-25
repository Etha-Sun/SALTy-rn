From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_27:MaxPool.rvv_unit_goal.test_rvv_entail_wit_27.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_27;right;mpm_prepare;pose proof(mp_vl_positive_bounded c retval ltac:(lia)ltac:(assumption))as Hvl.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp];repeat first[solve[assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_27.
