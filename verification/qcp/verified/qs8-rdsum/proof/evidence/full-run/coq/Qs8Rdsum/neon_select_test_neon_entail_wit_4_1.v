From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Import NeonSelectTactics neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_4_1 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_4_1.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_4_1;try left;intros;rd_limits;rd_selected_join;
 rewrite (rd_select_zero current_batch 1)by lia;rd_record_caller_cap. Qed.
Print Assumptions proof_of_test_neon_entail_wit_4_1.
