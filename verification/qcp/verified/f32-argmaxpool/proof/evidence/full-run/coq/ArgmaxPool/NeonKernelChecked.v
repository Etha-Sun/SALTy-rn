From ArgmaxPool Require Import neon_unit_goal NeonBaseChecked NeonCallsChecked NeonMemoryChecked.
Module CheckedNeonKernel <: ArgmaxPool.neon_unit_goal.VC_Correct.
Include ArgmaxPool.NeonBaseChecked.CheckedNeonBase.
Include ArgmaxPool.NeonCallsChecked.CheckedNeonCalls.
Include ArgmaxPool.NeonMemoryChecked.CheckedNeonMemory.
End CheckedNeonKernel.
Module ExactSecond : ArgmaxPool.neon_unit_goal.VC_Correct := CheckedNeonKernel.
