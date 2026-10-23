Require Import QcpVadd.array_read_goal QcpVadd.array_read_checked.
Require Import NanBridge.bridge_goal NanBridge.bridge_checked.
Require Import VaddComparator.comparator_goal VaddComparator.comparator_checked.
Require Import VaddWrapper.wrapper_goal VaddWrapper.wrapper_checked.
Require Import ByValue.neon_unit_goal ByValue.neon_full_checked.
Require Import ByValue.shim_unit_goal ByValue.shim_checked.
Require Import ByvalueRvv.macro_unit_goal ByvalueRvv.MacroKernelChecked.
Require Import ByvalueRvv.shim_goal ByvalueRvv.shim_checked.
Require Import QcpRvv32.rvv_load_goal QcpRvv32.rvv_load_checked.
Require Import QcpRvv32.rvv_add_goal QcpRvv32.rvv_add_checked.
Require Import QcpRvv32.rvv_store_goal QcpRvv32.rvv_store_checked.

Module Check_QcpVadd_array_read : QcpVadd.array_read_goal.VC_Correct := QcpVadd.array_read_checked.CheckedArrayRead.
Module Check_NanBridge_bridge : NanBridge.bridge_goal.VC_Correct := NanBridge.bridge_checked.Checked.
Module Check_VaddComparator_comparator : VaddComparator.comparator_goal.VC_Correct := VaddComparator.comparator_checked.CheckedComparator.
Module Check_VaddWrapper_wrapper : VaddWrapper.wrapper_goal.VC_Correct := VaddWrapper.wrapper_checked.CheckedWrapper.
Module Check_ByValue_neon_unit : ByValue.neon_unit_goal.VC_Correct := ByValue.neon_full_checked.CheckedOriginalNeon.
Module Check_ByValue_shim_unit : ByValue.shim_unit_goal.VC_Correct := ByValue.shim_checked.CheckedShim.
Module Check_ByvalueRvv_macro_unit : ByvalueRvv.macro_unit_goal.VC_Correct := ByvalueRvv.MacroKernelChecked.KernelChecked.
Module Check_ByvalueRvv_shim : ByvalueRvv.shim_goal.VC_Correct := ByvalueRvv.shim_checked.Checked.
Module Check_QcpRvv32_rvv_load : QcpRvv32.rvv_load_goal.VC_Correct := QcpRvv32.rvv_load_checked.CheckedRvvLoad.
Module Check_QcpRvv32_rvv_add : QcpRvv32.rvv_add_goal.VC_Correct := QcpRvv32.rvv_add_checked.CheckedRvvAdd.
Module Check_QcpRvv32_rvv_store : QcpRvv32.rvv_store_goal.VC_Correct := QcpRvv32.rvv_store_checked.CheckedRvvStore.
