(* Proof pattern adapted from NeonMemoryRow19x2.v SHA256 69e4a2cb1635f2232d1adad711fe72b64d8a40c5454a56cc277433da35a7479f; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_20_2:MaxPool.rvv_unit_goal.test_rvv_entail_wit_20_2.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_20_2;right;mpm_prepare.
 unfold mp_k_after in *.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K ?group 4]=>
  pose proof(mpm_row_fallback PT table K group 4 ltac:(lia))as Hrow;
  pose proof(mpm_cursor_skip table K group 4 ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_20_2.
