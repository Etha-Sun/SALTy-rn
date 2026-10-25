(* Proof pattern adapted from NeonMemoryRow23x1.v SHA256 b1e4596fbacb0a204413c927b73b4471647c605b282684bc8249416cfc8e4505; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_24_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_24_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_24_1;right;mpm_prepare.
 unfold mp_k_after in *.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K ?group 8]=>
  pose proof(mpm_row_read PT table K group 8 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K group 8 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_24_1.
