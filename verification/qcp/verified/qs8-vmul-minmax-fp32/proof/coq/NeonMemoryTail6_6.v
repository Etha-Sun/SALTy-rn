From Qs8Mul Require Import NeonMemoryTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qm_lane qm_neon_lane qm_arm_mul qm_arm_add qm_values qm_signed_bits qm_sat8 qm_sat16 qm_sat32.
Lemma proof_of_test_neon_entail_wit_6_6:Qs8Mul.neon_unit_goal.test_neon_entail_wit_6_6.
Proof. unfold Qs8Mul.neon_unit_goal.test_neon_entail_wit_6_6;qm_nm_start;qm_nm_pick. Qed.
Print Assumptions proof_of_test_neon_entail_wit_6_6.
