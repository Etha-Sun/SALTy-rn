From MaxPool Require Import NeonNonMemory NeonMemory.
Module CheckedNeon : MaxPool.neon_unit_goal.VC_Correct.
Include MaxPool.NeonNonMemory.CheckedNeonNonMemory.
Include MaxPool.NeonMemory.CheckedNeonMemory.
End CheckedNeon.
