From QcpRvv32 Require Import rvv_arrays_strategy_proof rvv_store_strategy_proof rvv_loop_strategy_proof.
From ByvalueRvv Require Import macro_unit_goal MacroKernelMemory MacroKernelCalls.
Module KernelChecked : VC_Correct.
Include CheckedRvvArray.
Include CheckedRvvStoreStrategy.
Include CheckedRvvLoopStrategy.
Include CheckedRvvLoopMemory.
Include KernelCalls.
End KernelChecked.
