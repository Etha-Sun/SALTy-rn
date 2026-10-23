From QcpRvv32 Require Import rvv_arrays_strategy_proof rvv_store_strategy_proof rvv_loop_strategy_proof.
From VLRelu Require Import RvvStrategy rvv_unit_goal RvvCalls RvvMemory.
Module KernelChecked : rvv_unit_goal.VC_Correct.
Include CheckedRvvArray.
Include CheckedRvvStoreStrategy.
Include CheckedRvvLoopStrategy.
Include CheckedRvvVlreluStrategy.
Include KernelCalls.
Include CheckedRvvLoopMemory.
End KernelChecked.
