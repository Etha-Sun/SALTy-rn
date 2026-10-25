(* Proof pattern adapted from NeonMemoryRow3x2.v SHA256 47fa273b4d5a134183a18c05a7642397406ed23666f0cb3082f7c11ae5af3d4f; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_3_2:MaxPool.rvv_unit_goal.test_rvv_entail_wit_3_2.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_3_2;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 1]=>
  pose proof(mpm_row_fallback PT table K 0 1 ltac:(lia))as Hrow;
  pose proof(mpm_cursor_skip table K 0 1 ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3_2.
