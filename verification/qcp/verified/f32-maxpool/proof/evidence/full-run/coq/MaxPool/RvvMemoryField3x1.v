(* Proof pattern adapted from NeonMemoryRow3x1.v SHA256 406c4e01fef1773e50552aa4279b09068a861cb0c2bcad6298a13f94ed65bc7c; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_3_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_3_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_3_1;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 1]=>
  pose proof(mpm_row_read PT table K 0 1 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K 0 1 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3_1.
