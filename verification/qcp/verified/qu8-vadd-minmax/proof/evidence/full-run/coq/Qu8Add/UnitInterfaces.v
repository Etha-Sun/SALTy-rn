Require Import Qu8Add.scalar_goal Qu8Add.ScalarChecked.
Module ActualUnit0 : Qu8Add.scalar_goal.VC_Correct := Qu8Add.ScalarChecked.CheckedScalar.
Require Import Qu8Add.neon_arithmetic_goal Qu8Add.NeonArithmeticChecked.
Module ActualUnit1 : Qu8Add.neon_arithmetic_goal.VC_Correct := Qu8Add.NeonArithmeticChecked.CheckedNeonArithmetic.
Require Import Qu8Add.neon_load_goal Qu8Add.NeonLoadChecked.
Module ActualUnit2 : Qu8Add.neon_load_goal.VC_Correct := Qu8Add.NeonLoadChecked.CheckedNeonLoad.
Require Import Qu8Add.neon_store_goal Qu8Add.NeonStoreChecked.
Module ActualUnit3 : Qu8Add.neon_store_goal.VC_Correct := Qu8Add.NeonStoreChecked.CheckedNeonStore.
Require Import Qu8Add.neon_ext_goal Qu8Add.NeonExtChecked.
Module ActualUnit4 : Qu8Add.neon_ext_goal.VC_Correct := Qu8Add.NeonExtChecked.CheckedNeonExt.
Require Import Qu8Add.rvv_active_goal Qu8Add.RvvActiveChecked.
Module ActualUnit5 : Qu8Add.rvv_active_goal.VC_Correct := Qu8Add.RvvActiveChecked.CheckedRvvActive.
Require Import Qu8Add.setvl_goal Qu8Add.SetvlChecked.
Module ActualUnit6 : Qu8Add.setvl_goal.VC_Correct := Qu8Add.SetvlChecked.CheckedSetvl.
Require Import Qu8Add.unsigned_scalar_goal Qu8Add.UnsignedScalarChecked.
Module ActualUnit7 : Qu8Add.unsigned_scalar_goal.VC_Correct := Qu8Add.UnsignedScalarChecked.CheckedUnsignedScalar.
Require Import Qu8Add.unsigned_tail_goal Qu8Add.UnsignedTailChecked.
Module ActualUnit8 : Qu8Add.unsigned_tail_goal.VC_Correct := Qu8Add.UnsignedTailChecked.CheckedUnsignedTail.
Require Import Qu8Add.neon_composed_goal Qu8Add.NeonComposedChecked.
Module ActualUnit9 : Qu8Add.neon_composed_goal.VC_Correct := Qu8Add.NeonComposedChecked.CheckedNeonComposed.
Require Import Qu8Add.rvv_load_goal Qu8Add.RvvLoadChecked.
Module ActualUnit10 : Qu8Add.rvv_load_goal.VC_Correct := Qu8Add.RvvLoadChecked.CheckedRvvLoad.
Require Import Qu8Add.rvv_store_goal Qu8Add.RvvStoreChecked.
Module ActualUnit11 : Qu8Add.rvv_store_goal.VC_Correct := Qu8Add.RvvStoreChecked.CheckedRvvStore.
Require Import Qu8Add.rvv___riscv_vwsubu_vx_u16m4_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit12 : Qu8Add.rvv___riscv_vwsubu_vx_u16m4_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector0.
Require Import Qu8Add.rvv___riscv_vsext_vf2_i32m8_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit13 : Qu8Add.rvv___riscv_vsext_vf2_i32m8_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector1.
Require Import Qu8Add.rvv___riscv_vmul_vx_i32m8_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit14 : Qu8Add.rvv___riscv_vmul_vx_i32m8_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector2.
Require Import Qu8Add.rvv___riscv_vmacc_vx_i32m8_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit15 : Qu8Add.rvv___riscv_vmacc_vx_i32m8_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector3.
Require Import Qu8Add.rvv___riscv_vmv_v_x_i32m8_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit16 : Qu8Add.rvv___riscv_vmv_v_x_i32m8_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector4.
Require Import Qu8Add.rvv___riscv_vssra_vx_i32m8_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit17 : Qu8Add.rvv___riscv_vssra_vx_i32m8_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector5.
Require Import Qu8Add.rvv___riscv_vsll_vx_i32m8_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit18 : Qu8Add.rvv___riscv_vsll_vx_i32m8_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector6.
Require Import Qu8Add.rvv___riscv_vnclip_wx_i16m4_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit19 : Qu8Add.rvv___riscv_vnclip_wx_i16m4_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector7.
Require Import Qu8Add.rvv___riscv_vsadd_vx_i16m4_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit20 : Qu8Add.rvv___riscv_vsadd_vx_i16m4_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector8.
Require Import Qu8Add.rvv___riscv_vmax_vx_i16m4_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit21 : Qu8Add.rvv___riscv_vmax_vx_i16m4_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector9.
Require Import Qu8Add.rvv___riscv_vnclipu_wx_u8m2_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit22 : Qu8Add.rvv___riscv_vnclipu_wx_u8m2_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector10.
Require Import Qu8Add.rvv___riscv_vmaxu_vx_u8m2_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit23 : Qu8Add.rvv___riscv_vmaxu_vx_u8m2_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector11.
Require Import Qu8Add.rvv___riscv_vminu_vx_u8m2_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit24 : Qu8Add.rvv___riscv_vminu_vx_u8m2_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector12.
Require Import Qu8Add.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit25 : Qu8Add.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector13.
Require Import Qu8Add.rvv___riscv_vreinterpret_v_i16m4_u16m4_goal Qu8Add.RvvVectorsChecked.
Module ActualUnit26 : Qu8Add.rvv___riscv_vreinterpret_v_i16m4_u16m4_goal.VC_Correct := Qu8Add.RvvVectorsChecked.CheckedVector14.
Require Import Qu8Add.neon_unit_goal Qu8Add.NeonKernelChecked.
Module ActualUnit27 : Qu8Add.neon_unit_goal.VC_Correct := Qu8Add.NeonKernelChecked.CheckedNeonKernel.
Require Import Qu8Add.rvv_unit_goal Qu8Add.RvvKernelChecked.
Module ActualUnit28 : Qu8Add.rvv_unit_goal.VC_Correct := Qu8Add.RvvKernelChecked.CheckedRvvKernel.
Require Import Qu8Add.width64_goal Qu8Add.Width64Checked.
Module ActualUnit29 : Qu8Add.width64_goal.VC_Correct := Qu8Add.Width64Checked.CheckedWidth.
Require Import Qu8Add.wrapper_goal Qu8Add.WrapperChecked.
Module ActualUnit30 : Qu8Add.wrapper_goal.VC_Correct := Qu8Add.WrapperChecked.CheckedWrapper.
Require Import Qu8Add.u8_arrays_strategy_goal Qu8Add.U8ArraysStrategy.
Module ActualStrategy0 : Qu8Add.u8_arrays_strategy_goal.u8_arrays_Strategy_Correct := Qu8Add.U8ArraysStrategy.CheckedU8Arrays.
Require Import Qu8Add.unsigned_tail_strategy_goal Qu8Add.unsigned_tail_strategy_proof.
Module ActualStrategy1 : Qu8Add.unsigned_tail_strategy_goal.unsigned_tail_Strategy_Correct := Qu8Add.unsigned_tail_strategy_proof.CheckedUnsignedTailStrategy.
Require Import Qu8Add.u8_neon_memory_strategy_goal Qu8Add.NeonMemoryStrategy.
Module ActualStrategy2 : Qu8Add.u8_neon_memory_strategy_goal.u8_neon_memory_Strategy_Correct := Qu8Add.NeonMemoryStrategy.CheckedNeonMemoryStrategy.
Require Import Qu8Add.rvv_store_strategy_goal Qu8Add.rvv_store_strategy_proof.
Module ActualStrategy3 : Qu8Add.rvv_store_strategy_goal.rvv_store_Strategy_Correct := Qu8Add.rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Require Import Qu8Add.rvv_kernel_strategy_goal Qu8Add.rvv_kernel_strategy_proof.
Module ActualStrategy4 : Qu8Add.rvv_kernel_strategy_goal.rvv_kernel_Strategy_Correct := Qu8Add.rvv_kernel_strategy_proof.CheckedRvvKernelStrategy.
Require Import Qu8Add.rvv_unit_goal_source_identity.
