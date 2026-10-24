From QC4CheckedNeonmanual03 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_5_1:test_neon_entail_wit_5_1.
Proof.
 unfold test_neon_entail_wit_5_1;intros;qc_subst;qc_normalize;qc_bounds.
 qc_neon_constants;qc_neon_outputs;qc_neon_appends.
 qc_neon_final_indices(nc_pre-(nc-16)).
 qc_unwrap;qc_normalize.
 replace(a_pre+rounded_depth kc_pre-rounded_depth kc_pre)with a_pre by lia.
 unfold qc4_output_prefix.
 destruct(Z.eq_dec nc 16)as[He|He].
 - subst nc;Left. timeout 180 qc_output_frame.
 - Right.
   pose proof(qc_next_facts nc_pre nc ltac:(lia)ltac:(lia)ltac:(lia))as Hnext.
   decompose[and]Hnext;clear Hnext.
   timeout 180 qc_output_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_5_1.
