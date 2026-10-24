From Qu8Rdsum Require Import CallerOrigin neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_safety_wit_125 : Qu8Rdsum.neon_unit_goal.test_neon_safety_wit_125.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_safety_wit_125;try left;intros;subst;rd_pure_caller_origin. Qed.
Print Assumptions proof_of_test_neon_safety_wit_125.
