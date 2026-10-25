Require Import Qs8Mul.qm_mull_high_goal Qs8Mul.AdapterChecked_qm_mull_high.
Module ActualUnit0 : Qs8Mul.qm_mull_high_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_mull_high.Checked.
Require Import Qs8Mul.qm_mull_low_goal Qs8Mul.AdapterChecked_qm_mull_low.
Module ActualUnit1 : Qs8Mul.qm_mull_low_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_mull_low.Checked.
Require Import Qs8Mul.qm_add_reinterpret_goal Qs8Mul.AdapterChecked_qm_add_reinterpret.
Module ActualUnit2 : Qs8Mul.qm_add_reinterpret_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_add_reinterpret.Checked.
Require Import Qs8Mul.qm_narrow_pair_goal Qs8Mul.AdapterChecked_qm_narrow_pair.
Module ActualUnit3 : Qs8Mul.qm_narrow_pair_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_narrow_pair.Checked.
Require Import Qs8Mul.qm_store4_goal Qs8Mul.AdapterChecked_qm_store4.
Module ActualUnit4 : Qs8Mul.qm_store4_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_store4.Checked.
Require Import Qs8Mul.qm_store2_goal Qs8Mul.AdapterChecked_qm_store2.
Module ActualUnit5 : Qs8Mul.qm_store2_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_store2.Checked.
Require Import Qs8Mul.qm_store1_goal Qs8Mul.AdapterChecked_qm_store1.
Module ActualUnit6 : Qs8Mul.qm_store1_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_store1.Checked.
Require Import Qs8Mul.qm_ext_self_goal Qs8Mul.AdapterChecked_qm_ext_self.
Module ActualUnit7 : Qs8Mul.qm_ext_self_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_ext_self.Checked.
Require Import Qs8Mul.qm_get32_goal Qs8Mul.AdapterChecked_qm_get32.
Module ActualUnit8 : Qs8Mul.qm_get32_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_get32.Checked.
Require Import Qs8Mul.qm_store32_goal Qs8Mul.AdapterChecked_qm_store32.
Module ActualUnit9 : Qs8Mul.qm_store32_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_store32.Checked.
Require Import Qs8Mul.qm_sext_sub_goal Qs8Mul.AdapterChecked_qm_sext_sub.
Module ActualUnit10 : Qs8Mul.qm_sext_sub_goal.VC_Correct := Qs8Mul.AdapterChecked_qm_sext_sub.Checked.
Require Import Qs8Mul.control_goal Qs8Mul.AdapterChecked_control.
Module ActualUnit11 : Qs8Mul.control_goal.VC_Correct := Qs8Mul.AdapterChecked_control.Checked.
Require Import Qs8Mul.qm_scale_is_nan_goal Qs8Mul.ScalarNanChecked.
Module ActualUnit12 : Qs8Mul.qm_scale_is_nan_goal.VC_Correct := Qs8Mul.ScalarNanChecked.CheckedScalarNan.
Require Import Qs8Mul.store_body_goal Qs8Mul.AdapterChecked_store_body.
Module ActualUnit13 : Qs8Mul.store_body_goal.VC_Correct := Qs8Mul.AdapterChecked_store_body.Checked.
Require Import Qs8Mul.public_unit_goal Qs8Mul.WrapperChecked.
Module ActualUnit14 : Qs8Mul.public_unit_goal.VC_Correct := Qs8Mul.WrapperChecked.CheckedWrapper.
Require Import Qs8Mul.type_width_goal Qs8Mul.Width64Checked.
Module ActualUnit15 : Qs8Mul.type_width_goal.VC_Correct := Qs8Mul.Width64Checked.CheckedWidth.
Require Import Qs8Mul.vl_control_goal Qs8Mul.VlControlChecked.
Module ActualUnit16 : Qs8Mul.vl_control_goal.VC_Correct := Qs8Mul.VlControlChecked.CheckedVlControl.
Require Import Qs8Mul.float_borrow_unit_goal Qs8Mul.FloatBorrowChecked.
Module ActualUnit17 : Qs8Mul.float_borrow_unit_goal.VC_Correct := Qs8Mul.FloatBorrowChecked.CheckedFloatBorrow.
Require Import Qs8Mul.load_into_unit_goal Qs8Mul.LoadIntoChecked.
Module ActualUnit18 : Qs8Mul.load_into_unit_goal.VC_Correct := Qs8Mul.LoadIntoChecked.Checked.
Require Import Qs8Mul.record_input_consumers_goal Qs8Mul.RecordInputConsumersChecked.
Module ActualUnit19 : Qs8Mul.record_input_consumers_goal.VC_Correct := Qs8Mul.RecordInputConsumersChecked.Checked.
Require Import Qs8Mul.record_fp_consumers_goal Qs8Mul.RecordFPConsumersChecked.
Module ActualUnit20 : Qs8Mul.record_fp_consumers_goal.VC_Correct := Qs8Mul.RecordFPConsumersChecked.Checked.
Require Import Qs8Mul.record_compute_goal Qs8Mul.RecordComputeChecked.
Module ActualUnit21 : Qs8Mul.record_compute_goal.VC_Correct := Qs8Mul.RecordComputeChecked.Checked.
Require Import Qs8Mul.neon_unit_goal Qs8Mul.NeonChecked.
Module ActualUnit22 : Qs8Mul.neon_unit_goal.VC_Correct := Qs8Mul.NeonChecked.CheckedNeon.
Require Import Qs8Mul.rvv_unit_goal Qs8Mul.RvvChecked.
Module ActualUnit23 : Qs8Mul.rvv_unit_goal.VC_Correct := Qs8Mul.RvvChecked.CheckedRvv.
Require Import Qs8Mul.byte_store_strategy_goal Qs8Mul.byte_store_strategy_proof.
Module ActualStrategy0 : Qs8Mul.byte_store_strategy_goal.byte_store_Strategy_Correct := Qs8Mul.byte_store_strategy_proof.CheckedByteStoreStrategy.
Require Import Qs8Mul.rvv_prefix_store_strategy_goal Qs8Mul.rvv_prefix_store_strategy_proof.
Module ActualStrategy1 : Qs8Mul.rvv_prefix_store_strategy_goal.rvv_prefix_store_Strategy_Correct := Qs8Mul.rvv_prefix_store_strategy_proof.CheckedRvvPrefixStore.
