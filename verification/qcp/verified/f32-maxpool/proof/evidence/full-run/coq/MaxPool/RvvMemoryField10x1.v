(* Proof pattern adapted from NeonMemoryRow10x1.v SHA256 3990a0341224cc922fcb7b5b8b1ec1bddf77f1d372bf34b1dd7f9c839c55b74d; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_10_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_10_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_10_1;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 8]=>
  pose proof(mpm_row_read PT table K 0 8 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K 0 8 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_10_1.
