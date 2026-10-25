Require Import MaxPool.type_width_goal MaxPool.WidthChecked.
Module ActualUnit0 : MaxPool.type_width_goal.VC_Correct := MaxPool.WidthChecked.CheckedWidth.
Require Import MaxPool.count_goal MaxPool.CountChecked.
Module ActualUnit1 : MaxPool.count_goal.VC_Correct := MaxPool.CountChecked.CheckedCount.
Require Import MaxPool.assert_goal MaxPool.AssertChecked.
Module ActualUnit2 : MaxPool.assert_goal.VC_Correct := MaxPool.AssertChecked.CheckedAssert.
Require Import MaxPool.read_table_goal MaxPool.ReadTableChecked.
Module ActualUnit3 : MaxPool.read_table_goal.VC_Correct := MaxPool.ReadTableChecked.CheckedReadTable.
Require Import MaxPool.compare_goal MaxPool.CompareChecked.
Module ActualUnit4 : MaxPool.compare_goal.VC_Correct := MaxPool.CompareChecked.CheckedCompare.
Require Import MaxPool.load_views_goal MaxPool.LoadViewsChecked.
Module ActualUnit5 : MaxPool.load_views_goal.VC_Correct := MaxPool.LoadViewsChecked.CheckedLoadViews.
Require Import MaxPool.caller_goal MaxPool.CallerChecked.
Module ActualUnit6 : MaxPool.caller_goal.VC_Correct := MaxPool.CallerChecked.CheckedCaller.
Require Import MaxPool.neon_unit_goal MaxPool.NeonChecked.
Module ActualUnit7 : MaxPool.neon_unit_goal.VC_Correct := MaxPool.NeonChecked.CheckedNeon.
Require Import MaxPool.rvv_unit_goal MaxPool.RvvChecked.
Module ActualUnit8 : MaxPool.rvv_unit_goal.VC_Correct := MaxPool.RvvChecked.CheckedRvv.
Require Import MaxPool.propagate_goal MaxPool.NanArrayChecked.
Module ActualUnit9 : MaxPool.propagate_goal.VC_Correct := MaxPool.NanArrayChecked.CheckedNanArray.
Require Import MaxPool.nan_wrappers_goal MaxPool.NanWrappersChecked.
Module ActualUnit10 : MaxPool.nan_wrappers_goal.VC_Correct := MaxPool.NanWrappersChecked.CheckedNanWrappers.
