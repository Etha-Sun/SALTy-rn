(* Proof pattern adapted from NeonMemoryReturn.v SHA256 1573d4886bbc99b7e8356f15bf7f967d015bdc4c706462587a72ba7ef4bd30be; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1:MaxPool.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_return_wit_1;left;mpm_prepare.
 rewrite ?Z.sub_0_r,?mpm_pixel_complete.
 mp_call_frame.
Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
