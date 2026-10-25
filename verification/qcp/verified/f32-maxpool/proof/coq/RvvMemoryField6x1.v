(* Proof pattern adapted from NeonMemoryRow6x1.v SHA256 1d68b7b202c8d90c83e2c92eabea60e4e14b8bf43962c0f88c011822798e9a7f; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_6_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_6_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_6_1;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 4]=>
  pose proof(mpm_row_read PT table K 0 4 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K 0 4 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_6_1.
