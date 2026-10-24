From QC4CheckedNeonframe05 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_100:test_neon_partial_solve_wit_100.
Proof.
 Time unfold test_neon_partial_solve_wit_100;intros.
 Time timeout 120(repeat progress rewrite <-logic_equiv_andp_assoc).
 apply _derivable1_andp_intros.
 - Time timeout 120 qc_pure.
 - Time timeout 180 qc_reflect_cancel.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_100.
