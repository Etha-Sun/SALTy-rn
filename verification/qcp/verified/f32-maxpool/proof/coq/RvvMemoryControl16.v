From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_16:MaxPool.rvv_unit_goal.test_rvv_entail_wit_16.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_16;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_cursor ?table ?K ?group]=>
 pose proof(mp_k_after_nonnegative K group)as Hnonnegative;
 pose proof(mp_loop_next_pointer PT table K group ltac:(lia)ltac:(lia)ltac:(lia))as Hrow;
 pose proof(mp_loop_next_cursor table K group ltac:(lia)ltac:(lia)ltac:(lia))as Hcursor end.
 unfold mp_k_after in *.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp];repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_16.
