From Coq Require Import ZArith Lia.
From Dwconv Require Import NeonKernelMemoryStoreSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_arm_add dw_arm_mul dw_arm_fma dw_arm_min dw_arm_max.
Lemma proof_of_test_neon_entail_wit_10_1:Dwconv.neon_unit_goal.test_neon_entail_wit_10_1.
Proof.
 unfold test_neon_entail_wit_10_1;left;dwm_prepare;dwm_subst_float.
 dwm_rewrite_neon_lanes.
 rewrite dwm_neon_write2 by lia.
 dwm_fast_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_10_1.
