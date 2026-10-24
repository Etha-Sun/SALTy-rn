From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Import CallerFocused neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_162 : Qs8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_162.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_162, Qs8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_162_aux;try left;intros;subst;rd_focused_record. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_162.
