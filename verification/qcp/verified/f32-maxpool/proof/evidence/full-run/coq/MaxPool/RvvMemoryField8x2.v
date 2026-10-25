(* Proof pattern adapted from NeonMemoryRow8x2.v SHA256 faaa1ba308b5d1ff7b04e7f8912d8b45546472e9767f180c98672ecd3d8c44c4; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_8_2:MaxPool.rvv_unit_goal.test_rvv_entail_wit_8_2.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_8_2;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K 0 6]=>
  pose proof(mpm_row_fallback PT table K 0 6 ltac:(lia))as Hrow;
  pose proof(mpm_cursor_skip table K 0 6 ltac:(lia))as Hcursor
 end.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_8_2.
