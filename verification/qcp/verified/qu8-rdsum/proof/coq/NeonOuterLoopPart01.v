From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import NeonOuterTactics neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_11_2 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_11_2.
Proof.
 unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_11_2;try left;intros;rd_limits;subst input output input_increment.
 rd_mem_facts_owned.
 rd_outer_values.
 rd_outer_finish.
 all:try(match goal with |- ?G=>idtac "REMAINING" G end).
Qed.
Print Assumptions proof_of_test_neon_entail_wit_11_2.
