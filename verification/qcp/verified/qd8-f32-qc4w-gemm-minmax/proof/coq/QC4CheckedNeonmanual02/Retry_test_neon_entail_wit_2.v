From QC4CheckedNeonmanual02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_2:test_neon_entail_wit_2.
Proof. unfold test_neon_entail_wit_2;right;intros;qc_subst;qc_normalize;rewrite ?qc4_literal_mask in *.
qc_bounds;qc_unwrap;qc_normalize.
qc_neon_constants. timeout 180 qc_neon_macs.
qc_normalize.
entailer!;try lia.
- qc_neon_even.
- rewrite Z.add_mod by lia;rewrite PreH26;reflexivity.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
