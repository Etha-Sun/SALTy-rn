(* Proof pattern adapted from NeonMemoryRow21x1.v SHA256 6e27040a0ec9f4b502735ca8366afcb43f404c466e025576bb5dbed10f008027; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_22_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_22_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_22_1;right;mpm_prepare.
 unfold mp_k_after in *.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K ?group 6]=>
  pose proof(mpm_row_read PT table K group 6 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K group 6 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_22_1.
