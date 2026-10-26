From HwcConv Require Import neon_unit_goal hc_maps_strategy_proof Main443NonSpatialChecked Main443CallsChecked Main443MemoryChecked.
Module CheckedMain : HwcConv.neon_unit_goal.VC_Correct.
Include HwcConv.hc_maps_strategy_proof.CheckedMaps.
Include HwcConv.Main443NonSpatialChecked.CheckedNonSpatial.
Include HwcConv.Main443CallsChecked.CheckedCalls.
Include HwcConv.Main443MemoryChecked.CheckedMemory.
End CheckedMain.
Module IndependentMain : HwcConv.neon_unit_goal.VC_Correct := CheckedMain.
