From MaxPool Require Import NeonMemoryPointerFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_23_1:MaxPool.neon_unit_goal.test_neon_entail_wit_23_1.
Proof.
 unfold test_neon_entail_wit_23_1;right;mpm_prepare.
 unfold mp_k_after in *.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K ?group 8]=>
  pose proof(mpm_row_read PT table K group 8 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K group 8 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_neon_entail_wit_23_1.
