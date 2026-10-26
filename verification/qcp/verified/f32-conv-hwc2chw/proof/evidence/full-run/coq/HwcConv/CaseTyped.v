Require Import HwcConv.support_unit_goal HwcConv.SupportChecked.
Module ActualUnit0 : HwcConv.support_unit_goal.VC_Correct := HwcConv.SupportChecked.CheckedSupport.
Module IndependentUnit0 : HwcConv.support_unit_goal.VC_Correct := ActualUnit0.
Require Import HwcConv.assert_unit_goal HwcConv.AssertChecked.
Module ActualUnit1 : HwcConv.assert_unit_goal.VC_Correct := HwcConv.AssertChecked.CheckedAssert.
Module IndependentUnit1 : HwcConv.assert_unit_goal.VC_Correct := ActualUnit1.
Require Import HwcConv.copy_float_unit_goal HwcConv.FloatCopyChecked.
Module ActualUnit2 : HwcConv.copy_float_unit_goal.VC_Correct := HwcConv.FloatCopyChecked.CheckedFloatCopy.
Module IndependentUnit2 : HwcConv.copy_float_unit_goal.VC_Correct := ActualUnit2.
Require Import HwcConv.nan_helpers_unit_goal HwcConv.NanHelpersChecked.
Module ActualUnit3 : HwcConv.nan_helpers_unit_goal.VC_Correct := HwcConv.NanHelpersChecked.CheckedNanHelpers.
Module IndependentUnit3 : HwcConv.nan_helpers_unit_goal.VC_Correct := ActualUnit3.
Require Import HwcConv.neon3_unit_goal HwcConv.Neon3Checked.
Module ActualUnit4 : HwcConv.neon3_unit_goal.VC_Correct := HwcConv.Neon3Checked.CheckedNeon3.
Module IndependentUnit4 : HwcConv.neon3_unit_goal.VC_Correct := ActualUnit4.
Require Import HwcConv.read_scalar_unit_goal HwcConv.ReadChecked.
Module ActualUnit5 : HwcConv.read_scalar_unit_goal.VC_Correct := HwcConv.ReadChecked.CheckedRead.
Module IndependentUnit5 : HwcConv.read_scalar_unit_goal.VC_Correct := ActualUnit5.
Require Import HwcConv.store_half_unit_goal HwcConv.StoreHalfChecked.
Module ActualUnit6 : HwcConv.store_half_unit_goal.VC_Correct := HwcConv.StoreHalfChecked.CheckedStoreHalf.
Module IndependentUnit6 : HwcConv.store_half_unit_goal.VC_Correct := ActualUnit6.
Require Import HwcConv.neon_pixel_unit_goal HwcConv.NeonPixelFull396Checked.
Module ActualUnit7 : HwcConv.neon_pixel_unit_goal.VC_Correct := HwcConv.NeonPixelFull396Checked.Checked.
Module IndependentUnit7 : HwcConv.neon_pixel_unit_goal.VC_Correct := ActualUnit7.
Require Import HwcConv.rvv_fma3_unit_goal HwcConv.HwcRvv336FullChecked.
Module ActualUnit8 : HwcConv.rvv_fma3_unit_goal.VC_Correct := HwcConv.HwcRvv336FullChecked.CheckedRvvRowsFma3.
Module IndependentUnit8 : HwcConv.rvv_fma3_unit_goal.VC_Correct := ActualUnit8.
Require Import HwcConv.pixel9_unit_goal HwcConv.HwcRvvPixel9FullChecked.
Module ActualUnit9 : HwcConv.pixel9_unit_goal.VC_Correct := HwcConv.HwcRvvPixel9FullChecked.CheckedPixel9.
Module IndependentUnit9 : HwcConv.pixel9_unit_goal.VC_Correct := ActualUnit9.
Require Import HwcConv.neon_unit_goal HwcConv.Main443KernelChecked.
Module ActualUnit10 : HwcConv.neon_unit_goal.VC_Correct := HwcConv.Main443KernelChecked.CheckedMain.
Module IndependentUnit10 : HwcConv.neon_unit_goal.VC_Correct := ActualUnit10.
Require Import HwcConv.rvv_unit_goal HwcConv.HwcRvvMain401Checked.
Module ActualUnit11 : HwcConv.rvv_unit_goal.VC_Correct := HwcConv.HwcRvvMain401Checked.CheckedMain401.
Module IndependentUnit11 : HwcConv.rvv_unit_goal.VC_Correct := ActualUnit11.
Require Import HwcConv.public_mode_goal HwcConv.PublicModeChecked.
Module ActualUnit12 : HwcConv.public_mode_goal.VC_Correct := HwcConv.PublicModeChecked.Checked.
Module IndependentUnit12 : HwcConv.public_mode_goal.VC_Correct := ActualUnit12.
Require Import HwcConv.hc_maps_strategy_goal HwcConv.hc_maps_strategy_proof.
Module ActualStrategy0 : HwcConv.hc_maps_strategy_goal.hc_maps_Strategy_Correct := HwcConv.hc_maps_strategy_proof.CheckedMaps.
Module IndependentStrategy0 : HwcConv.hc_maps_strategy_goal.hc_maps_Strategy_Correct := ActualStrategy0.
