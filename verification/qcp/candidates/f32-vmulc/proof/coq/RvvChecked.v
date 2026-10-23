From QcpRvv32 Require Import rvv_arrays_strategy_proof rvv_store_strategy_proof rvv_loop_strategy_proof.
From VMulc Require Import vmulc_strategy_proof rvv_unit_goal RvvCalls RvvMemory.
Module KernelChecked : VC_Correct.
Include CheckedRvvArray.
Include CheckedRvvStoreStrategy.
Include CheckedRvvLoopStrategy.
Include CheckedVmulcStrategy.
Include KernelCalls.
Include CheckedRvvLoopMemory.
End KernelChecked.
Print Assumptions KernelChecked.proof_of_test_rvv_entail_wit_4.
