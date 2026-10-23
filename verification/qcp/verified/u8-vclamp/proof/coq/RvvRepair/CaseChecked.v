From OriginalU8NeonGate Require Import NeonChecked.
From FullU8 Require Import full10_goal.
From U8Public Require Import public_unit_goal CallerGate.
From FullU8 Require Import CheckedCodec.
From RvvRepair Require Import unit_goal ControllerChecked.
From ActiveCodecVC Require Import CheckedActive.
From VLCodecVC Require Import CheckedVL.
From MemoryCodecVC Require Import CheckedMemory.
From GettersCodecVC Require Import CheckedGetters.
From StoreCodecVC Require Import CheckedStore.
From VectorRepair Require Import VectorVleGate VectorVminGate VectorVmaxGate.
Module RepairedCase.
Module RVV : RvvRepair.unit_goal.VC_Correct := RvvRepair.ControllerChecked.Checked.
Module Codec : PackedCodecVC.unit_goal.VC_Correct := FullU8.CheckedCodec.Checked.
Module Active : ActiveCodecVC.unit_goal.VC_Correct := ActiveCodecVC.CheckedActive.Checked.
Module VL : VLCodecVC.unit_goal.VC_Correct := VLCodecVC.CheckedVL.Checked.
Module Memory : MemoryCodecVC.unit_goal.VC_Correct := MemoryCodecVC.CheckedMemory.Checked.
Module Getters : GettersCodecVC.unit_goal.VC_Correct := GettersCodecVC.CheckedGetters.Checked.
Module Store : StoreCodecVC.unit_goal.VC_Correct := StoreCodecVC.CheckedStore.Checked.
Module Vle : VectorVle.unit_goal.VC_Correct := VectorRepair.VectorVleGate.FullChecked.
Module Vmin : VectorVmin.unit_goal.VC_Correct := VectorRepair.VectorVminGate.FullChecked.
Module Vmax : VectorVmax.unit_goal.VC_Correct := VectorRepair.VectorVmaxGate.FullChecked.
Module NEON : FullU8.full10_goal.VC_Correct := OriginalU8NeonGate.NeonChecked.Checked.
Module Public : U8Public.public_unit_goal.VC_Correct := U8Public.CallerGate.Checked.
End RepairedCase.
Print Assumptions RepairedCase.RVV.proof_of_test_rvv_entail_wit_2_1.
Print Assumptions RepairedCase.RVV.proof_of_test_rvv_entail_wit_2_2.
Print Assumptions RepairedCase.RVV.proof_of_test_rvv_entail_wit_4_1.
Print Assumptions RepairedCase.RVV.proof_of_test_rvv_entail_wit_4_2.
Print Assumptions RepairedCase.NEON.proof_of_test_neon_entail_wit_2.
Print Assumptions RepairedCase.Public.proof_of_equivalent_return_wit_1.
