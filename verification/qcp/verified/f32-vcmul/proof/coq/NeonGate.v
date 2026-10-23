From QcpNeon Require Import neon_bridge_strategy_proof.
From QcpNeonLoop Require Import neon_tail_strategy_proof.
From QcpVadd Require Import float_array_strategy_proof.
From VCMul Require Import neon_unit_goal NeonStrategy NeonPure NeonCalls NeonMemory.
Module CheckedOriginalNeon : VCMul.neon_unit_goal.VC_Correct.
Include QcpNeon.neon_bridge_strategy_proof.CheckedNeonBridge.
Include QcpNeonLoop.neon_tail_strategy_proof.CheckedNeonTail.
Include QcpVadd.float_array_strategy_proof.CheckedFloatArray.
Include VCMul.NeonStrategy.CheckedNeonStrategy.
Include VCMul.NeonPure.CheckedNeonPure.
Include VCMul.NeonCalls.CheckedNeonCalls.
Include VCMul.NeonMemory.CheckedNeonMemory.
End CheckedOriginalNeon.
