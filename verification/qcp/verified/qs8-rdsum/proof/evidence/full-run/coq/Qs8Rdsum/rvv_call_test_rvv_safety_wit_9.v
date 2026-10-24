From Qs8Rdsum Require Import CallerOrigin rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_safety_wit_9 : Qs8Rdsum.rvv_unit_goal.test_rvv_safety_wit_9.
Proof. unfold Qs8Rdsum.rvv_unit_goal.test_rvv_safety_wit_9;try left;intros;subst;rd_pure_caller_origin. Qed.
Print Assumptions proof_of_test_rvv_safety_wit_9.
