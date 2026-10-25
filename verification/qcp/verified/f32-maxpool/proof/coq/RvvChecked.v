From MaxPool Require Import RvvNonMemory RvvMemory.
Module CheckedRvv : MaxPool.rvv_unit_goal.VC_Correct.
Include MaxPool.RvvNonMemory.CheckedRvvNonMemory.
Include MaxPool.RvvMemory.CheckedRvvMemory.
End CheckedRvv.
