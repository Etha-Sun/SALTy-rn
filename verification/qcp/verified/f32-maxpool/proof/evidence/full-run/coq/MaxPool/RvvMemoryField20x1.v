(* Proof pattern adapted from NeonMemoryRow19x1.v SHA256 c7f476dd6eb77617d6347d973aee1e377ad2715e7d69a7baff4da1008794ea4b; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_20_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_20_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_20_1;right;mpm_prepare.
 unfold mp_k_after in *.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K ?group 4]=>
  pose proof(mpm_row_read PT table K group 4 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K group 4 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_20_1.
