From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import NeonCallStoreFrame.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qm_lane qm_neon_lane qm_arm_mul qm_arm_add qm_values qm_signed_bits qm_sat8 qm_sat16 qm_sat32.
Lemma proof_of_test_neon_partial_solve_wit_321:Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_321.
Proof.
 unfold Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_321,Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_321_aux;qm_nm_intro.
 change(sizeof(CHAR))with 1 in *;subst batch.
 rewrite ?Z.mul_1_r,?Z.add_0_r.
 qm_store_fast_split qm_store2_undef_prefix.
 qm_nm_start;rewrite ?CharArray.undef_full_empty;repeat rewrite <-Z.add_assoc;qm_k_finish.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_321.
