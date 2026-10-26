From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonMemoryReturn.
Lemma proof_of_test_neon_return_wit_1:ArgmaxPool.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_return_wit_1;left;apb_intro.
 subst output_pixels;rewrite Z.sub_0_r.
 unfold app_neon_partial_output,app_neon_partial_index,app_partial_output,app_partial_index.
 rewrite !app_pass_partial_zero.
 cbn[app_pass_complete].
 unfold app_neon_output,app_neon_index,app_final_output,app_final_index,app_program_result.
 apply derivable1_refl.
Qed.
End CheckedNeonMemoryReturn.
Print Assumptions CheckedNeonMemoryReturn.proof_of_test_neon_return_wit_1.
