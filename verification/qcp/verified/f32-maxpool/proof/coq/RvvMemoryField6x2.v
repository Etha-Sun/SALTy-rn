(* Proof pattern adapted from NeonMemoryRow6x2.v SHA256 61d4aece8de5a98ebb81cbc49ff7efea2f50886c20b28bb3834c8b5a4bcd0b5a; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_6_2:MaxPool.rvv_unit_goal.test_rvv_entail_wit_6_2.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_6_2;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 4]=>
  pose proof(mpm_row_fallback PT table K 0 4 ltac:(lia))as Hrow;
  pose proof(mpm_cursor_skip table K 0 4 ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_6_2.
