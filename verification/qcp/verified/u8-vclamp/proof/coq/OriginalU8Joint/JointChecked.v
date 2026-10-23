From OriginalU8NeonGate Require Import NeonChecked.
From FullU8 Require Import full10_goal.
From U8Public Require Import public_unit_goal CallerGate.
Module NEON : FullU8.full10_goal.VC_Correct := OriginalU8NeonGate.NeonChecked.Checked.
Module Public : U8Public.public_unit_goal.VC_Correct := U8Public.CallerGate.Checked.
Print Assumptions NEON.proof_of_test_neon_entail_wit_2.
Print Assumptions Public.proof_of_equivalent_return_wit_1.
