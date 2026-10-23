Require Import ByValue.shim_unit_goal ByValue.shim_checked.
Require Import ByvalueRvv.shim_goal ByvalueRvv.shim_checked.
Require Import QcpRvv32.rvv_load_goal QcpRvv32.rvv_load_checked.
Require Import QcpRvv32.rvv_add_goal QcpRvv32.rvv_add_checked.
Require Import QcpRvv32.rvv_store_goal QcpRvv32.rvv_store_checked.
Require Import VMulc.rvv_unit_goal VMulc.RvvChecked.
Require Import VMulc.neon_unit_goal VMulc.NeonChecked.
Require Import VMulc.primitives_goal VMulc.primitives_checked.
Require Import VMulcWrapper.WrapperRead_goal VMulcWrapper.WrapperHelpers.
Require Import VMulcWrapper.WrapperNan_goal VMulcWrapper.WrapperHelpers.
Require Import VMulcWrapper.WrapperCompare_goal VMulcWrapper.WrapperHelpers.
Require Import VMulcWrapper.Wrapper_goal VMulcWrapper.WrapperChecked.
Module CaseUnit0 : ByValue.shim_unit_goal.VC_Correct := ByValue.shim_checked.CheckedShim.
Module CaseUnit1 : ByvalueRvv.shim_goal.VC_Correct := ByvalueRvv.shim_checked.Checked.
Module CaseUnit2 : QcpRvv32.rvv_load_goal.VC_Correct := QcpRvv32.rvv_load_checked.CheckedRvvLoad.
Module CaseUnit3 : QcpRvv32.rvv_add_goal.VC_Correct := QcpRvv32.rvv_add_checked.CheckedRvvAdd.
Module CaseUnit4 : QcpRvv32.rvv_store_goal.VC_Correct := QcpRvv32.rvv_store_checked.CheckedRvvStore.
Module CaseUnit5 : VMulc.rvv_unit_goal.VC_Correct := VMulc.RvvChecked.KernelChecked.
Module CaseUnit6 : VMulc.neon_unit_goal.VC_Correct := VMulc.NeonChecked.CheckedOriginalNeon.
Module CaseUnit7 : VMulc.primitives_goal.VC_Correct := VMulc.primitives_checked.CheckedBroadcast.
Module CaseUnit8 : VMulcWrapper.WrapperRead_goal.VC_Correct := VMulcWrapper.WrapperHelpers.Read.
Module CaseUnit9 : VMulcWrapper.WrapperNan_goal.VC_Correct := VMulcWrapper.WrapperHelpers.Nan.
Module CaseUnit10 : VMulcWrapper.WrapperCompare_goal.VC_Correct := VMulcWrapper.WrapperHelpers.Compare.
Module CaseUnit11 : VMulcWrapper.Wrapper_goal.VC_Correct := VMulcWrapper.WrapperChecked.CheckedWrapper.
Print Assumptions VMulcWrapper.WrapperChecked.CheckedWrapper.proof_of_equivalent_return_wit_1.
