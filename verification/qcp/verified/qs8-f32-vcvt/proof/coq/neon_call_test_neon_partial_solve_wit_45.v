From Qs8Cvt Require Import KernelBounds neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_45 : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45, Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_45_aux;try left;unfold QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;cvt_complete. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_45.
