Require Import Sqrt.store_adapters_goal Sqrt.StoreAdaptersChecked.
Module ActualUnit0 : Sqrt.store_adapters_goal.VC_Correct := Sqrt.StoreAdaptersChecked.CheckedStoreAdapters.
Require Import Sqrt.rvv_store_goal Sqrt.RvvStoreChecked.
Module ActualUnit1 : Sqrt.rvv_store_goal.VC_Correct := Sqrt.RvvStoreChecked.CheckedRvvStore.
Require Import Sqrt.assert_unit_goal Sqrt.AssertChecked.
Module ActualUnit2 : Sqrt.assert_unit_goal.VC_Correct := Sqrt.AssertChecked.CheckedAssert.
Require Import Sqrt.array_read_goal Sqrt.ReadChecked.
Module ActualUnit3 : Sqrt.array_read_goal.VC_Correct := Sqrt.ReadChecked.CheckedRead.
Require Import Sqrt.bridge_goal Sqrt.BridgeChecked.
Module ActualUnit4 : Sqrt.bridge_goal.VC_Correct := Sqrt.BridgeChecked.CheckedBridge.
Require Import Sqrt.comparator_goal Sqrt.ComparatorChecked.
Module ActualUnit5 : Sqrt.comparator_goal.VC_Correct := Sqrt.ComparatorChecked.CheckedComparator.
Require Import Sqrt.wrapper_unit_goal Sqrt.WrapperChecked.
Module ActualUnit6 : Sqrt.wrapper_unit_goal.VC_Correct := Sqrt.WrapperChecked.CheckedWrapper.
Require Import Sqrt.neon_unit_goal Sqrt.NeonChecked.
Module ActualUnit7 : Sqrt.neon_unit_goal.VC_Correct := Sqrt.NeonChecked.CheckedNeon.
Require Import Sqrt.rvv_unit_goal Sqrt.RvvChecked.
Module ActualUnit8 : Sqrt.rvv_unit_goal.VC_Correct := Sqrt.RvvChecked.CheckedRvv.
Require Import Sqrt.sqrt_store_strategy_goal Sqrt.sqrt_store_strategy_proof.
Module ActualStrategy0 : Sqrt.sqrt_store_strategy_goal.sqrt_store_Strategy_Correct := Sqrt.sqrt_store_strategy_proof.CheckedSqrtStoreStrategy.
Require Import Sqrt.sqrt_arrays_strategy_goal Sqrt.sqrt_arrays_strategy_proof.
Module ActualStrategy1 : Sqrt.sqrt_arrays_strategy_goal.sqrt_arrays_Strategy_Correct := Sqrt.sqrt_arrays_strategy_proof.CheckedSqrtArrays.
Require Import Sqrt.sqrt_public_strategy_goal Sqrt.sqrt_public_strategy_proof.
Module ActualStrategy2 : Sqrt.sqrt_public_strategy_goal.sqrt_public_Strategy_Correct := Sqrt.sqrt_public_strategy_proof.CheckedSqrtPublic.
Require Import QcpNeon.neon_bridge_strategy_goal QcpNeon.neon_bridge_strategy_proof.
Module ActualStrategy3 : QcpNeon.neon_bridge_strategy_goal.neon_bridge_Strategy_Correct := QcpNeon.neon_bridge_strategy_proof.CheckedNeonBridge.
Require Import QcpNeonLoop.neon_tail_strategy_goal QcpNeonLoop.neon_tail_strategy_proof.
Module ActualStrategy4 : QcpNeonLoop.neon_tail_strategy_goal.neon_tail_Strategy_Correct := QcpNeonLoop.neon_tail_strategy_proof.CheckedNeonTail.
Require Import QcpVadd.float_array_strategy_goal QcpVadd.float_array_strategy_proof.
Module ActualStrategy5 : QcpVadd.float_array_strategy_goal.float_array_Strategy_Correct := QcpVadd.float_array_strategy_proof.CheckedFloatArray.
Require Import QcpRvv32.rvv_arrays_strategy_goal QcpRvv32.rvv_arrays_strategy_proof.
Module ActualStrategy6 : QcpRvv32.rvv_arrays_strategy_goal.rvv_arrays_Strategy_Correct := QcpRvv32.rvv_arrays_strategy_proof.CheckedRvvArray.
Require Import QcpRvv32.rvv_store_strategy_goal QcpRvv32.rvv_store_strategy_proof.
Module ActualStrategy7 : QcpRvv32.rvv_store_strategy_goal.rvv_store_Strategy_Correct := QcpRvv32.rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Require Import QcpRvv32.rvv_loop_strategy_goal QcpRvv32.rvv_loop_strategy_proof.
Module ActualStrategy8 : QcpRvv32.rvv_loop_strategy_goal.rvv_loop_Strategy_Correct := QcpRvv32.rvv_loop_strategy_proof.CheckedRvvLoopStrategy.
Require Import VaddComparator.comparator_strategy_goal VaddComparator.comparator_strategy_proof.
Module ActualStrategy9 : VaddComparator.comparator_strategy_goal.comparator_Strategy_Correct := VaddComparator.comparator_strategy_proof.CheckedComparatorStrategies.
Require Import VaddWrapper.wrapper_strategy_goal VaddWrapper.wrapper_strategy_proof.
Module ActualStrategy10 : VaddWrapper.wrapper_strategy_goal.wrapper_Strategy_Correct := VaddWrapper.wrapper_strategy_proof.CheckedWrapperStrategy.
