From Coq Require Import ZArith Lia List.
From Dwconv Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_arm_add dw_arm_mul dw_arm_fma dw_arm_min dw_arm_max dw_neon_lane dw_rvv_lane.
Lemma proof_of_test_neon_return_wit_1:Dwconv.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold test_neon_return_wit_1;left;dwm_prepare;unfold dw_neon_progress,dw_neon_result;rewrite Z.sub_0_r;reflexivity. Qed.
Print Assumptions proof_of_test_neon_return_wit_1.
