From MaxPool Require Import NeonMemoryFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_return_wit_1:MaxPool.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold test_neon_return_wit_1;left;mpm_prepare.
 rewrite ?Z.sub_0_r,?mpm_pixel_complete.
 mp_call_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.
