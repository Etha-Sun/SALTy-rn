(* Proof pattern adapted from NeonMemoryOffset11.v SHA256 eafb7abcbb1b9bddd648db3c598c8673fd689a07abb9d267c8a2e16bb430ac64; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_11:MaxPool.rvv_unit_goal.test_rvv_entail_wit_11.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_11;right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K ?group 9]=>
  pose proof(mp_table_read_complete table K group ltac:(lia)ltac:(lia)
   ltac:(first[left;reflexivity|right;unfold mp_k_after in *;lia]))as Hcursor
 end.
 rewrite !mpm_row_add_offset.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|reflexivity|lia]|split].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_11.
