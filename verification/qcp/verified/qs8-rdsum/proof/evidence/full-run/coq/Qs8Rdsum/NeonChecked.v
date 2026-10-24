From Qs8Rdsum Require Import neon_unit_goal NeonCallsChecked NeonSelect NeonInit NeonInnerInit NeonOuterLoop NeonMemory NeonInnerLoop.
Module CheckedNeon : Qs8Rdsum.neon_unit_goal.VC_Correct.
 Include Qs8Rdsum.NeonCallsChecked.CheckedNeonCalls.
 Include Qs8Rdsum.NeonSelect.CheckedNeonSelect.
 Include Qs8Rdsum.NeonOuterLoop.CheckedNeonOuterLoop.
 Include Qs8Rdsum.NeonMemory.CheckedNeonMemory.
 Include Qs8Rdsum.NeonInnerLoop.CheckedNeonInnerLoop.
 Definition proof_of_test_neon_entail_wit_1 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_1 := Qs8Rdsum.NeonInit.proof_of_test_neon_entail_wit_1.
 Definition proof_of_test_neon_entail_wit_2 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_2 := Qs8Rdsum.NeonInit.proof_of_test_neon_entail_wit_2.
 Definition proof_of_test_neon_entail_wit_17 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_17 := Qs8Rdsum.NeonInit.proof_of_test_neon_entail_wit_17.
 Definition proof_of_test_neon_entail_wit_18 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_18 := Qs8Rdsum.NeonInit.proof_of_test_neon_entail_wit_18.
 Definition proof_of_test_neon_entail_wit_3 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_3 := Qs8Rdsum.NeonInnerInit.proof_of_test_neon_entail_wit_3.
 Definition proof_of_test_neon_entail_wit_19 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_19 := Qs8Rdsum.NeonInnerInit.proof_of_test_neon_entail_wit_19.
End CheckedNeon.
Module ExactCheckedNeon : Qs8Rdsum.neon_unit_goal.VC_Correct := CheckedNeon.
