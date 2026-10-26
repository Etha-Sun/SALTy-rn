From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedNeonMemoryEntry.
Lemma proof_of_test_neon_entail_wit_1:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_1.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_1;left;apb_intro.
 match goal with H:app_arguments _ _ _ _ _ _ _ _ _ _ _ _|-_=>unfold app_arguments in H;
 repeat match type of H with _ /\ _=>let HA:=fresh in destruct H as[HA H]end end.
 match goal with H:app_valid ?F ?P ?W ?WI ?D|-_=>
 pose proof(app_valid_positive F P W WI D H)as[HP[HK HC]]end.
 apkp_call_frame.
Qed.
End CheckedNeonMemoryEntry.
Print Assumptions CheckedNeonMemoryEntry.proof_of_test_neon_entail_wit_1.
