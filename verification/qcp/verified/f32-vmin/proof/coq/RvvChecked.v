From FMin Require Import rvv_unit_goal RvvCalls RvvMemory rvv_fmin_strategy_proof.
Module CheckedRvv : FMin.rvv_unit_goal.VC_Correct.
Include QcpRvv32.rvv_arrays_strategy_proof.CheckedRvvArray.
Include QcpRvv32.rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Include QcpRvv32.rvv_loop_strategy_proof.CheckedRvvLoopStrategy.
Include FMin.RvvStrategy.CheckedRvvFminStrategy.
Include CheckedRvvCalls.
Include CheckedRvvLoopMemory.
End CheckedRvv.
