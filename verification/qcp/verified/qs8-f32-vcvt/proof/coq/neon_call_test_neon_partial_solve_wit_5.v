From Qs8Cvt Require Import KernelBounds neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_5 : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5, Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_5_aux;intros;pose proof(cvt_s16_range(0-unsigned_last_nbits RawZ 32))as Hb;unfold cvt_s16 in Hb;unfold QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;cvt_complete. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_5.
