From VCMul Require Import rvv_unit_goal NeonStrategy RvvPure RvvCalls RvvMemory.
Module CheckedOriginalRvv : VCMul.rvv_unit_goal.VC_Correct.
Include VCMul.NeonStrategy.CheckedNeonStrategy.
Include VCMul.RvvPure.CheckedRvvPure.
Include VCMul.RvvCalls.CheckedRvvCalls.
Include VCMul.RvvMemory.CheckedRvvMemory.
End CheckedOriginalRvv.
