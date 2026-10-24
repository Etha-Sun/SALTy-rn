From Qu8Rdsum Require Import CallerOrigin rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_16 : Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_16;try left;intros;subst;rd_record_caller_origin. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_16.
