From Dwconv Require Import NeonKernelMemorySimpleFrames.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_11_1:Dwconv.neon_unit_goal.test_neon_entail_wit_11_1.
Proof. unfold test_neon_entail_wit_11_1;try left;dwm_simple_frame. Qed.
Print Assumptions proof_of_test_neon_entail_wit_11_1.
