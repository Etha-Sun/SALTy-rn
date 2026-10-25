Require Import X32Transpose.control_goal X32Transpose.ControlChecked.
Module ActualUnit0 : X32Transpose.control_goal.VC_Correct := X32Transpose.ControlChecked.CheckedControl.
Require Import X32Transpose.scalar_goal X32Transpose.ScalarChecked.
Module ActualUnit1 : X32Transpose.scalar_goal.VC_Correct := X32Transpose.ScalarChecked.CheckedScalar.
Require Import X32Transpose.strided_store_goal X32Transpose.StridedStoreChecked.
Module ActualUnit2 : X32Transpose.strided_store_goal.VC_Correct := X32Transpose.StridedStoreChecked.CheckedStridedStore.
Require Import X32Transpose.width_goal X32Transpose.WidthChecked.
Module ActualUnit3 : X32Transpose.width_goal.VC_Correct := X32Transpose.WidthChecked.CheckedWidth.
Require Import X32Transpose.observe_goal X32Transpose.ObserveChecked.
Module ActualUnit4 : X32Transpose.observe_goal.VC_Correct := X32Transpose.ObserveChecked.CheckedObserve.
Require Import X32Transpose.caller_goal X32Transpose.CallerChecked.
Module ActualUnit5 : X32Transpose.caller_goal.VC_Correct := X32Transpose.CallerChecked.CheckedCaller.
Require Import X32Transpose.neon_unit_goal X32Transpose.NeonChecked.
Module ActualUnit6 : X32Transpose.neon_unit_goal.VC_Correct := X32Transpose.NeonChecked.CheckedNeon.
Require Import X32Transpose.rvv_unit_goal X32Transpose.RvvChecked.
Module ActualUnit7 : X32Transpose.rvv_unit_goal.VC_Correct := X32Transpose.RvvChecked.CheckedRvv.
