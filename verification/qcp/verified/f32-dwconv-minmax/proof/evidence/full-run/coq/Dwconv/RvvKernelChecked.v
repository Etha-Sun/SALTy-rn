From Dwconv Require Import MapStrategyChecked OutputStrategyChecked RvvNonMemoryChecked RvvKernelMemory.
Module CheckedRvvKernel : Dwconv.rvv_unit_goal.VC_Correct.
Include Dwconv.MapStrategyChecked.CheckedMaps.
Include Dwconv.OutputStrategyChecked.CheckedOutputStrategy.
Include Dwconv.RvvNonMemoryChecked.CheckedRvvNonMemory.
Include Dwconv.RvvKernelMemory.CheckedRvvMemory.
End CheckedRvvKernel.
