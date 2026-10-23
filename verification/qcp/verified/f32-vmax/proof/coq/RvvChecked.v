From FMax Require Import rvv_unit_goal RvvCalls RvvMemory rvv_fmax_strategy_proof.
Module CheckedRvv : FMax.rvv_unit_goal.VC_Correct.
Include rvv_arrays_strategy_proof.CheckedRvvArray.
Include rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Include rvv_loop_strategy_proof.CheckedRvvLoopStrategy.
Include CheckedRvvFmaxStrategy.
Include CheckedRvvCalls.
Include CheckedRvvLoopMemory.
End CheckedRvv.
