From QC4CheckedNeonfinish01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_return_wit_1:test_neon_return_wit_1.
Proof.
 unfold test_neon_return_wit_1;right;intros;qc_subst;qc_normalize.
 sep_apply(qc_finished_output c_pre nc_pre kc_pre zp A Ps inv lo hi).
 ig_cancel.
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.
