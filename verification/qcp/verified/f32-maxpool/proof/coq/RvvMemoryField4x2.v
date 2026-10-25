(* Proof pattern adapted from NeonMemoryRow4x2.v SHA256 077e6a51a28eeb7d0c7be159bfd730e66d770e7e218d6866d920e670e2411acb; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_4_2:MaxPool.rvv_unit_goal.test_rvv_entail_wit_4_2.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_4_2;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 2]=>
  pose proof(mpm_row_fallback PT table K 0 2 ltac:(lia))as Hrow;
  pose proof(mpm_cursor_skip table K 0 2 ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_2.
