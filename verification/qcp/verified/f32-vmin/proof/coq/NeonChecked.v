From FMin Require Import neon_unit_goal NeonPure NeonCalls NeonMemory.
Module CheckedNeon : FMin.neon_unit_goal.VC_Correct.
Include neon_bridge_strategy_proof.CheckedNeonBridge.
Include neon_tail_strategy_proof.CheckedNeonTail.
Include float_array_strategy_proof.CheckedFloatArray.
Include CheckedNeonPure.
Include CheckedNeonCalls.
Include CheckedNeonMemory.
End CheckedNeon.
