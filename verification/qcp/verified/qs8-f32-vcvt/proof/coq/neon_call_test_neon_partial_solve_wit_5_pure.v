From Qs8Cvt Require Import KernelBounds neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_5_pure : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5_pure.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5_pure;left;intros;pose proof(cvt_s16_range(0-unsigned_last_nbits RawZ 32))as Hb;unfold cvt_s16 in Hb;entailer!;lia. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_5_pure.
