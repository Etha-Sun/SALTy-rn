Require Import Qs8Add.scalar_goal Qs8Add.ScalarChecked.
Module ActualUnit0 : Qs8Add.scalar_goal.VC_Correct := Qs8Add.ScalarChecked.CheckedScalar.
Require Import Qs8Add.neon_arithmetic_goal Qs8Add.NeonArithmeticChecked.
Module ActualUnit1 : Qs8Add.neon_arithmetic_goal.VC_Correct := Qs8Add.NeonArithmeticChecked.CheckedNeonArithmetic.
Require Import Qs8Add.neon_load_goal Qs8Add.NeonLoadChecked.
Module ActualUnit2 : Qs8Add.neon_load_goal.VC_Correct := Qs8Add.NeonLoadChecked.CheckedNeonLoad.
Require Import Qs8Add.neon_store_goal Qs8Add.NeonStoreChecked.
Module ActualUnit3 : Qs8Add.neon_store_goal.VC_Correct := Qs8Add.NeonStoreChecked.CheckedNeonStore.
Require Import Qs8Add.neon_ext_goal Qs8Add.NeonExtChecked.
Module ActualUnit4 : Qs8Add.neon_ext_goal.VC_Correct := Qs8Add.NeonExtChecked.CheckedNeonExt.
Require Import Qs8Add.rvv_active_goal Qs8Add.RvvActiveChecked.
Module ActualUnit5 : Qs8Add.rvv_active_goal.VC_Correct := Qs8Add.RvvActiveChecked.CheckedRvvActive.
Require Import Qs8Add.setvl_goal Qs8Add.SetvlChecked.
Module ActualUnit6 : Qs8Add.setvl_goal.VC_Correct := Qs8Add.SetvlChecked.CheckedSetvl.
Require Import Qs8Add.signed_tail_goal Qs8Add.SignedTailChecked.
Module ActualUnit7 : Qs8Add.signed_tail_goal.VC_Correct := Qs8Add.SignedTailChecked.CheckedSignedTail.
Require Import Qs8Add.neon_composed_goal Qs8Add.NeonComposedChecked.
Module ActualUnit8 : Qs8Add.neon_composed_goal.VC_Correct := Qs8Add.NeonComposedChecked.CheckedNeonComposed.
Require Import Qs8Add.rvv_load_goal Qs8Add.RvvLoadChecked.
Module ActualUnit9 : Qs8Add.rvv_load_goal.VC_Correct := Qs8Add.RvvLoadChecked.CheckedRvvLoad.
Require Import Qs8Add.rvv_store_goal Qs8Add.RvvStoreChecked.
Module ActualUnit10 : Qs8Add.rvv_store_goal.VC_Correct := Qs8Add.RvvStoreChecked.CheckedRvvStore.
Require Import Qs8Add.rvv___riscv_vwsub_vx_i16m4_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit11 : Qs8Add.rvv___riscv_vwsub_vx_i16m4_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector0.
Require Import Qs8Add.rvv___riscv_vsext_vf2_i32m8_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit12 : Qs8Add.rvv___riscv_vsext_vf2_i32m8_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector1.
Require Import Qs8Add.rvv___riscv_vmul_vx_i32m8_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit13 : Qs8Add.rvv___riscv_vmul_vx_i32m8_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector2.
Require Import Qs8Add.rvv___riscv_vmacc_vx_i32m8_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit14 : Qs8Add.rvv___riscv_vmacc_vx_i32m8_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector3.
Require Import Qs8Add.rvv___riscv_vmv_v_x_i32m8_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit15 : Qs8Add.rvv___riscv_vmv_v_x_i32m8_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector4.
Require Import Qs8Add.rvv___riscv_vssra_vx_i32m8_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit16 : Qs8Add.rvv___riscv_vssra_vx_i32m8_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector5.
Require Import Qs8Add.rvv___riscv_vsll_vx_i32m8_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit17 : Qs8Add.rvv___riscv_vsll_vx_i32m8_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector6.
Require Import Qs8Add.rvv___riscv_vnclip_wx_i16m4_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit18 : Qs8Add.rvv___riscv_vnclip_wx_i16m4_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector7.
Require Import Qs8Add.rvv___riscv_vsadd_vx_i16m4_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit19 : Qs8Add.rvv___riscv_vsadd_vx_i16m4_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector8.
Require Import Qs8Add.rvv___riscv_vnclip_wx_i8m2_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit20 : Qs8Add.rvv___riscv_vnclip_wx_i8m2_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector9.
Require Import Qs8Add.rvv___riscv_vmax_vx_i8m2_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit21 : Qs8Add.rvv___riscv_vmax_vx_i8m2_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector10.
Require Import Qs8Add.rvv___riscv_vmin_vx_i8m2_goal Qs8Add.RvvVectorsChecked.
Module ActualUnit22 : Qs8Add.rvv___riscv_vmin_vx_i8m2_goal.VC_Correct := Qs8Add.RvvVectorsChecked.CheckedVector11.
Require Import Qs8Add.neon_unit_goal Qs8Add.NeonKernelChecked.
Module ActualUnit23 : Qs8Add.neon_unit_goal.VC_Correct := Qs8Add.NeonKernelChecked.CheckedNeonKernel.
Require Import Qs8Add.rvv_unit_goal Qs8Add.RvvKernelChecked.
Module ActualUnit24 : Qs8Add.rvv_unit_goal.VC_Correct := Qs8Add.RvvKernelChecked.CheckedRvvKernel.
Require Import Qs8Add.width64_goal Qs8Add.Width64Checked.
Module ActualUnit25 : Qs8Add.width64_goal.VC_Correct := Qs8Add.Width64Checked.CheckedWidth.
Require Import Qs8Add.wrapper_goal Qs8Add.WrapperChecked.
Module ActualUnit26 : Qs8Add.wrapper_goal.VC_Correct := Qs8Add.WrapperChecked.CheckedWrapper.
Require Import Qs8Add.s8_arrays_strategy_goal Qs8Add.S8ArraysStrategy.
Module ActualStrategy0 : Qs8Add.s8_arrays_strategy_goal.s8_arrays_Strategy_Correct := Qs8Add.S8ArraysStrategy.CheckedS8Arrays.
Require Import Qs8Add.signed_tail_strategy_goal Qs8Add.signed_tail_strategy_proof.
Module ActualStrategy1 : Qs8Add.signed_tail_strategy_goal.signed_tail_Strategy_Correct := Qs8Add.signed_tail_strategy_proof.CheckedSignedTailStrategy.
Require Import Qs8Add.s8_neon_memory_strategy_goal Qs8Add.NeonMemoryStrategy.
Module ActualStrategy2 : Qs8Add.s8_neon_memory_strategy_goal.s8_neon_memory_Strategy_Correct := Qs8Add.NeonMemoryStrategy.CheckedNeonMemoryStrategy.
Require Import Qs8Add.rvv_store_strategy_goal Qs8Add.rvv_store_strategy_proof.
Module ActualStrategy3 : Qs8Add.rvv_store_strategy_goal.rvv_store_Strategy_Correct := Qs8Add.rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Require Import Qs8Add.rvv_kernel_strategy_goal Qs8Add.rvv_kernel_strategy_proof.
Module ActualStrategy4 : Qs8Add.rvv_kernel_strategy_goal.rvv_kernel_Strategy_Correct := Qs8Add.rvv_kernel_strategy_proof.CheckedRvvKernelStrategy.
Require Import Qs8Add.neon_unit_goal_source_identity.
Require Import Qs8Add.rvv_unit_goal_source_identity.
