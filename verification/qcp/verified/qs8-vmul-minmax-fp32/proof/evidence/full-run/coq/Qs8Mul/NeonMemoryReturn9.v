From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import NeonMemoryTactics.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_return_wit_9:Qs8Mul.neon_unit_goal.test_neon_return_wit_9.
Proof.
 unfold Qs8Mul.neon_unit_goal.test_neon_return_wit_9;left;qm_nm_start.
 rewrite ?Z.sub_0_r,?CharArray.undef_full_empty;qm_k_finish.
Qed.
Print Assumptions proof_of_test_neon_return_wit_9.
