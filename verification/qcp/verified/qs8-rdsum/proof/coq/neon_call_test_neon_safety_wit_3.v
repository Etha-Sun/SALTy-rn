From Qs8Rdsum Require Import CallerOrigin neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_safety_wit_3 : Qs8Rdsum.neon_unit_goal.test_neon_safety_wit_3.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_safety_wit_3;try left;intros;subst;rd_pure_caller_origin. Qed.
Print Assumptions proof_of_test_neon_safety_wit_3.
