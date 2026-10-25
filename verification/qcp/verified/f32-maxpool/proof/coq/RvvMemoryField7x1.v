(* Proof pattern adapted from NeonMemoryRow7x1.v SHA256 7f9758c09f09d81a3441a2562939199946deab4b0d0a42d21247fd645c6e9d3a; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_7_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_7_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_7_1;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 5]=>
  pose proof(mpm_row_read PT table K 0 5 ltac:(lia)ltac:(lia))as Hrow;
  pose proof(mpm_cursor_next table K 0 5 ltac:(lia)ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_7_1.
