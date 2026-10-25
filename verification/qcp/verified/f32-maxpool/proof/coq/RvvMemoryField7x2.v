(* Proof pattern adapted from NeonMemoryRow7x2.v SHA256 8a3cc997432972f6208ca62d59d2353bd82203cdf17356779ffd6e94464748d6; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_7_2:MaxPool.rvv_unit_goal.test_rvv_entail_wit_7_2.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_7_2;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 5]=>
  pose proof(mpm_row_fallback PT table K 0 5 ltac:(lia))as Hrow;
  pose proof(mpm_cursor_skip table K 0 5 ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_7_2.
