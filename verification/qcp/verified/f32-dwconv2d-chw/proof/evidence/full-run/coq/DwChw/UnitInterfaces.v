Require Import DwChw.borrow_unit_goal DwChw.BorrowChecked.
Module ActualUnit0 : DwChw.borrow_unit_goal.VC_Correct := DwChw.BorrowChecked.CheckedBorrow.
Require Import DwChw.propagating_unit_goal DwChw.PropagatingChecked.
Module ActualUnit1 : DwChw.propagating_unit_goal.VC_Correct := DwChw.PropagatingChecked.CheckedPropagating.
Require Import DwChw.support_unit_goal DwChw.SupportChecked.
Module ActualUnit2 : DwChw.support_unit_goal.VC_Correct := DwChw.SupportChecked.CheckedSupport.
Require Import DwChw.neon_borrow_unit_goal DwChw.NeonBorrowChecked.
Module ActualUnit3 : DwChw.neon_borrow_unit_goal.VC_Correct := DwChw.NeonBorrowChecked.CheckedNeonBorrow.
Require Import DwChw.rvv_extended_unit_goal DwChw.RvvExtendedChecked.
Module ActualUnit4 : DwChw.rvv_extended_unit_goal.VC_Correct := DwChw.RvvExtendedChecked.CheckedRvvExtended.
Require Import DwChw.store8_unit_goal DwChw.Store8Checked.
Module ActualUnit5 : DwChw.store8_unit_goal.VC_Correct := DwChw.Store8Checked.CheckedStore8.
Require Import DwChw.read_scalar_unit_goal DwChw.ReadChecked.
Module ActualUnit6 : DwChw.read_scalar_unit_goal.VC_Correct := DwChw.ReadChecked.CheckedRead.
Require Import DwChw.pixel_unit_goal DwChw.VectorPixelChecked.
Module ActualUnit7 : DwChw.pixel_unit_goal.VC_Correct := DwChw.VectorPixelChecked.CheckedVectorPixel.
Require Import DwChw.neon_pixel_unit_goal DwChw.NeonPixelChecked.
Module ActualUnit8 : DwChw.neon_pixel_unit_goal.VC_Correct := DwChw.NeonPixelChecked.CheckedNeonPixel.
Require Import DwChw.public_caller_goal DwChw.PublicCallChecked.
Module ActualUnit9 : DwChw.public_caller_goal.VC_Correct := DwChw.PublicCallChecked.CheckedPublicCaller.
Require Import DwChw.neon_unit_goal DwChw.NeonChecked.
Module ActualUnit10 : DwChw.neon_unit_goal.VC_Correct := DwChw.NeonChecked.CheckedNeon.
Require Import DwChw.rvv_unit_goal DwChw.RvvChecked.
Module ActualUnit11 : DwChw.rvv_unit_goal.VC_Correct := DwChw.RvvChecked.CheckedRvv.
Require Import DwChw.type_width_goal DwChw.Width64Checked.
Module ActualUnit12 : DwChw.type_width_goal.VC_Correct := DwChw.Width64Checked.CheckedWidth.
Require Import DwChw.float_store_strategy_goal DwChw.float_store_strategy_proof.
Module ActualStrategy0 : DwChw.float_store_strategy_goal.float_store_Strategy_Correct := DwChw.float_store_strategy_proof.CheckedFloatStoreStrategy.
Require Import DwChw.dw_maps_strategy_goal DwChw.dw_maps_strategy_proof.
Module ActualStrategy1 : DwChw.dw_maps_strategy_goal.dw_maps_Strategy_Correct := DwChw.dw_maps_strategy_proof.CheckedMaps.
Require Import DwChw.dw_output_strategy_goal DwChw.dw_output_strategy_proof.
Module ActualStrategy2 : DwChw.dw_output_strategy_goal.dw_output_Strategy_Correct := DwChw.dw_output_strategy_proof.CheckedOutput.
