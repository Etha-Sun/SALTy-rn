From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_25:MaxPool.rvv_unit_goal.test_rvv_entail_wit_25.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_25;
 right;mpm_prepare.
 lazymatch goal with |-context[mp_table_read_cursor ?table ?K ?group 9]=>
  pose proof(mp_table_read_complete table K group ltac:(lia)ltac:(lia)
   ltac:(first[left;reflexivity|right;unfold mp_k_after in *;lia]))as Hcursor
 end.
 rewrite !mpm_row_add_offset.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|symmetry;assumption|reflexivity|lia]|split].

Qed.
Print Assumptions proof_of_test_rvv_entail_wit_25.
