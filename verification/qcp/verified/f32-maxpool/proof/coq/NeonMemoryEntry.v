From MaxPool Require Import NeonMemorySupport.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_1:MaxPool.neon_unit_goal.test_neon_entail_wit_1.
Proof. unfold test_neon_entail_wit_1;mpm_prepare;mp_call_frame. Qed.
Print Assumptions proof_of_test_neon_entail_wit_1.
