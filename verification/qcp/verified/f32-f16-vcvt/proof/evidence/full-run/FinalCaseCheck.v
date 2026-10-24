From F32F16 Require Import CaseTyped CaseAssumptions0 CaseAssumptions1 CaseAssumptions2 CaseAssumptions3 CaseAssumptions4 CaseAssumptions5 CaseAssumptions6 CaseAssumptions7 CaseAssumptions8 CaseAssumptions9 CaseAssumptions10 CaseAssumptions11 CaseAssumptions12 CaseAssumptions13 CaseAssumptions14 CaseAssumptions15.
Require Import F32F16.bits_goal F32F16.BitsChecked.
Module ActualUnit0 : F32F16.bits_goal.VC_Correct := F32F16.BitsChecked.CheckedBits.
Require Import F32F16.scalar_goal F32F16.ScalarChecked.
Module ActualUnit1 : F32F16.scalar_goal.VC_Correct := F32F16.ScalarChecked.CheckedScalar.
Require Import F32F16.integer_goal F32F16.IntegerChecked.
Module ActualUnit2 : F32F16.integer_goal.VC_Correct := F32F16.IntegerChecked.CheckedInteger.
Require Import F32F16.literals_goal F32F16.LiteralsChecked.
Module ActualUnit3 : F32F16.literals_goal.VC_Correct := F32F16.LiteralsChecked.CheckedLiterals.
Require Import F32F16.memory_neon_goal F32F16.MemoryNeonChecked.
Module ActualUnit4 : F32F16.memory_neon_goal.VC_Correct := F32F16.MemoryNeonChecked.CheckedMemoryNeon.
Require Import F32F16.store_arrays_goal F32F16.StoreArraysChecked.
Module ActualUnit5 : F32F16.store_arrays_goal.VC_Correct := F32F16.StoreArraysChecked.CheckedStoreArrays.
Require Import F32F16.active_goal F32F16.VectorChecked.
Module ActualUnit6 : F32F16.active_goal.VC_Correct := F32F16.VectorChecked.Checked_active.
Require Import F32F16.vdupq_n_u32_goal F32F16.VectorChecked.
Module ActualUnit7 : F32F16.vdupq_n_u32_goal.VC_Correct := F32F16.VectorChecked.Checked_vdupq_n_u32.
Require Import F32F16.vdupq_n_f32_goal F32F16.VectorChecked.
Module ActualUnit8 : F32F16.vdupq_n_f32_goal.VC_Correct := F32F16.VectorChecked.Checked_vdupq_n_f32.
Require Import F32F16.vdupq_n_u16_goal F32F16.VectorChecked.
Module ActualUnit9 : F32F16.vdupq_n_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vdupq_n_u16.
Require Import F32F16.vabsq_f32_goal F32F16.VectorChecked.
Module ActualUnit10 : F32F16.vabsq_f32_goal.VC_Correct := F32F16.VectorChecked.Checked_vabsq_f32.
Require Import F32F16.vreinterpretq_u32_f32_goal F32F16.VectorChecked.
Module ActualUnit11 : F32F16.vreinterpretq_u32_f32_goal.VC_Correct := F32F16.VectorChecked.Checked_vreinterpretq_u32_f32.
Require Import F32F16.vreinterpretq_f32_u32_goal F32F16.VectorChecked.
Module ActualUnit12 : F32F16.vreinterpretq_f32_u32_goal.VC_Correct := F32F16.VectorChecked.Checked_vreinterpretq_f32_u32.
Require Import F32F16.vmovn_u32_goal F32F16.VectorChecked.
Module ActualUnit13 : F32F16.vmovn_u32_goal.VC_Correct := F32F16.VectorChecked.Checked_vmovn_u32.
Require Import F32F16.qcp_f16_vshrn_13_goal F32F16.VectorChecked.
Module ActualUnit14 : F32F16.qcp_f16_vshrn_13_goal.VC_Correct := F32F16.VectorChecked.Checked_qcp_f16_vshrn_13.
Require Import F32F16.qcp_f16_vshrn_16_goal F32F16.VectorChecked.
Module ActualUnit15 : F32F16.qcp_f16_vshrn_16_goal.VC_Correct := F32F16.VectorChecked.Checked_qcp_f16_vshrn_16.
Require Import F32F16.vaddq_u32_goal F32F16.VectorChecked.
Module ActualUnit16 : F32F16.vaddq_u32_goal.VC_Correct := F32F16.VectorChecked.Checked_vaddq_u32.
Require Import F32F16.vandq_u32_goal F32F16.VectorChecked.
Module ActualUnit17 : F32F16.vandq_u32_goal.VC_Correct := F32F16.VectorChecked.Checked_vandq_u32.
Require Import F32F16.vmaxq_u32_goal F32F16.VectorChecked.
Module ActualUnit18 : F32F16.vmaxq_u32_goal.VC_Correct := F32F16.VectorChecked.Checked_vmaxq_u32.
Require Import F32F16.vcgtq_u32_goal F32F16.VectorChecked.
Module ActualUnit19 : F32F16.vcgtq_u32_goal.VC_Correct := F32F16.VectorChecked.Checked_vcgtq_u32.
Require Import F32F16.vmulq_f32_goal F32F16.VectorChecked.
Module ActualUnit20 : F32F16.vmulq_f32_goal.VC_Correct := F32F16.VectorChecked.Checked_vmulq_f32.
Require Import F32F16.vaddq_f32_goal F32F16.VectorChecked.
Module ActualUnit21 : F32F16.vaddq_f32_goal.VC_Correct := F32F16.VectorChecked.Checked_vaddq_f32.
Require Import F32F16.vandq_u16_goal F32F16.VectorChecked.
Module ActualUnit22 : F32F16.vandq_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vandq_u16.
Require Import F32F16.vand_u16_goal F32F16.VectorChecked.
Module ActualUnit23 : F32F16.vand_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vand_u16.
Require Import F32F16.vaddq_u16_goal F32F16.VectorChecked.
Module ActualUnit24 : F32F16.vaddq_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vaddq_u16.
Require Import F32F16.vadd_u16_goal F32F16.VectorChecked.
Module ActualUnit25 : F32F16.vadd_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vadd_u16.
Require Import F32F16.vorrq_u16_goal F32F16.VectorChecked.
Module ActualUnit26 : F32F16.vorrq_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vorrq_u16.
Require Import F32F16.vorr_u16_goal F32F16.VectorChecked.
Module ActualUnit27 : F32F16.vorr_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vorr_u16.
Require Import F32F16.vbslq_u16_goal F32F16.VectorChecked.
Module ActualUnit28 : F32F16.vbslq_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vbslq_u16.
Require Import F32F16.vbsl_u16_goal F32F16.VectorChecked.
Module ActualUnit29 : F32F16.vbsl_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vbsl_u16.
Require Import F32F16.vcombine_u16_goal F32F16.VectorChecked.
Module ActualUnit30 : F32F16.vcombine_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vcombine_u16.
Require Import F32F16.vget_low_u16_goal F32F16.VectorChecked.
Module ActualUnit31 : F32F16.vget_low_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_vget_low_u16.
Require Import F32F16.qcp_f16_reinterpret_u32_u16_goal F32F16.VectorChecked.
Module ActualUnit32 : F32F16.qcp_f16_reinterpret_u32_u16_goal.VC_Correct := F32F16.VectorChecked.Checked_qcp_f16_reinterpret_u32_u16.
Require Import F32F16.__riscv_vfabs_v_f32m8_goal F32F16.VectorChecked.
Module ActualUnit33 : F32F16.__riscv_vfabs_v_f32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vfabs_v_f32m8.
Require Import F32F16.__riscv_vadd_vx_u32m8_goal F32F16.VectorChecked.
Module ActualUnit34 : F32F16.__riscv_vadd_vx_u32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vadd_vx_u32m8.
Require Import F32F16.__riscv_vand_vx_u32m8_goal F32F16.VectorChecked.
Module ActualUnit35 : F32F16.__riscv_vand_vx_u32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vand_vx_u32m8.
Require Import F32F16.__riscv_vmaxu_vx_u32m8_goal F32F16.VectorChecked.
Module ActualUnit36 : F32F16.__riscv_vmaxu_vx_u32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vmaxu_vx_u32m8.
Require Import F32F16.__riscv_vmsgtu_vx_u32m8_b4_goal F32F16.VectorChecked.
Module ActualUnit37 : F32F16.__riscv_vmsgtu_vx_u32m8_b4_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vmsgtu_vx_u32m8_b4.
Require Import F32F16.__riscv_vfmul_vf_f32m8_goal F32F16.VectorChecked.
Module ActualUnit38 : F32F16.__riscv_vfmul_vf_f32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vfmul_vf_f32m8.
Require Import F32F16.__riscv_vfadd_vv_f32m8_goal F32F16.VectorChecked.
Module ActualUnit39 : F32F16.__riscv_vfadd_vv_f32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vfadd_vv_f32m8.
Require Import F32F16.qcp_f16_rvv_shrn_0_goal F32F16.VectorChecked.
Module ActualUnit40 : F32F16.qcp_f16_rvv_shrn_0_goal.VC_Correct := F32F16.VectorChecked.Checked_qcp_f16_rvv_shrn_0.
Require Import F32F16.qcp_f16_rvv_shrn_13_goal F32F16.VectorChecked.
Module ActualUnit41 : F32F16.qcp_f16_rvv_shrn_13_goal.VC_Correct := F32F16.VectorChecked.Checked_qcp_f16_rvv_shrn_13.
Require Import F32F16.qcp_f16_rvv_shrn_16_goal F32F16.VectorChecked.
Module ActualUnit42 : F32F16.qcp_f16_rvv_shrn_16_goal.VC_Correct := F32F16.VectorChecked.Checked_qcp_f16_rvv_shrn_16.
Require Import F32F16.__riscv_vand_vx_u16m4_goal F32F16.VectorChecked.
Module ActualUnit43 : F32F16.__riscv_vand_vx_u16m4_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vand_vx_u16m4.
Require Import F32F16.__riscv_vadd_vv_u16m4_goal F32F16.VectorChecked.
Module ActualUnit44 : F32F16.__riscv_vadd_vv_u16m4_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vadd_vv_u16m4.
Require Import F32F16.__riscv_vmerge_vxm_u16m4_goal F32F16.VectorChecked.
Module ActualUnit45 : F32F16.__riscv_vmerge_vxm_u16m4_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vmerge_vxm_u16m4.
Require Import F32F16.__riscv_vor_vv_u16m4_goal F32F16.VectorChecked.
Module ActualUnit46 : F32F16.__riscv_vor_vv_u16m4_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vor_vv_u16m4.
Require Import F32F16.__riscv_vreinterpret_v_f32m8_u32m8_goal F32F16.VectorChecked.
Module ActualUnit47 : F32F16.__riscv_vreinterpret_v_f32m8_u32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vreinterpret_v_f32m8_u32m8.
Require Import F32F16.__riscv_vreinterpret_v_u32m8_f32m8_goal F32F16.VectorChecked.
Module ActualUnit48 : F32F16.__riscv_vreinterpret_v_u32m8_f32m8_goal.VC_Correct := F32F16.VectorChecked.Checked___riscv_vreinterpret_v_u32m8_f32m8.
Require Import F32F16.qcp_f16_vext_u16_2_goal F32F16.VectorChecked.
Module ActualUnit49 : F32F16.qcp_f16_vext_u16_2_goal.VC_Correct := F32F16.VectorChecked.Checked_qcp_f16_vext_u16_2.
Require Import F32F16.memory_rvv_load_goal F32F16.MemoryRvvLoadChecked.
Module ActualUnit50 : F32F16.memory_rvv_load_goal.VC_Correct := F32F16.MemoryRvvLoadChecked.Checked_memory_rvv_load.
Require Import F32F16.rvv_control_goal F32F16.RvvControlChecked.
Module ActualUnit51 : F32F16.rvv_control_goal.VC_Correct := F32F16.RvvControlChecked.Checked_rvv_control.
Require Import F32F16.memory_rvv_store_goal F32F16.UShortStoreChecked.
Module ActualUnit52 : F32F16.memory_rvv_store_goal.VC_Correct := F32F16.UShortStoreChecked.CheckedUShortStore.
Require Import F32F16.neon_unit_goal F32F16.NeonChecked.
Module ActualUnit53 : F32F16.neon_unit_goal.VC_Correct := F32F16.NeonChecked.CheckedNeon.
Require Import F32F16.rvv_unit_goal F32F16.RvvChecked.
Module ActualUnit54 : F32F16.rvv_unit_goal.VC_Correct := F32F16.RvvChecked.CheckedRvv.
Require Import F32F16.wrapper_unit_goal F32F16.WrapperChecked.
Module ActualUnit55 : F32F16.wrapper_unit_goal.VC_Correct := F32F16.WrapperChecked.CheckedWrapper.
Require Import F32F16.f16_memory_strategy_goal F32F16.F16Strategy.
Module ActualStrategy0 : F32F16.f16_memory_strategy_goal.f16_memory_Strategy_Correct := F32F16.F16Strategy.CheckedF16Strategy.
Require Import F32F16.f16_ushort_store_strategy_goal F32F16.UShortStoreStrategy.
Module ActualStrategy1 : F32F16.f16_ushort_store_strategy_goal.f16_ushort_store_Strategy_Correct := F32F16.UShortStoreStrategy.CheckedUShortStoreStrategy.
Require Import F32F16.f16_kernel_strategy_goal F32F16.KernelStrategies.
Module ActualStrategy2 : F32F16.f16_kernel_strategy_goal.f16_kernel_Strategy_Correct := F32F16.KernelStrategies.CheckedF16KernelStrategy.
Require Import F32F16.f16_neon_load_strategy_goal F32F16.KernelStrategies.
Module ActualStrategy3 : F32F16.f16_neon_load_strategy_goal.f16_neon_load_Strategy_Correct := F32F16.KernelStrategies.CheckedF16NeonLoadStrategy.
Require Import F32F16.f16_public_strategy_goal F32F16.KernelStrategies.
Module ActualStrategy4 : F32F16.f16_public_strategy_goal.f16_public_Strategy_Correct := F32F16.KernelStrategies.CheckedF16PublicStrategy.
Require Import QcpNeon.neon_bridge_strategy_goal QcpNeon.neon_bridge_strategy_proof.
Module ActualStrategy5 : QcpNeon.neon_bridge_strategy_goal.neon_bridge_Strategy_Correct := QcpNeon.neon_bridge_strategy_proof.CheckedNeonBridge.
Require Import QcpNeonLoop.neon_tail_strategy_goal QcpNeonLoop.neon_tail_strategy_proof.
Module ActualStrategy6 : QcpNeonLoop.neon_tail_strategy_goal.neon_tail_Strategy_Correct := QcpNeonLoop.neon_tail_strategy_proof.CheckedNeonTail.
Require Import QcpVadd.float_array_strategy_goal QcpVadd.float_array_strategy_proof.
Module ActualStrategy7 : QcpVadd.float_array_strategy_goal.float_array_Strategy_Correct := QcpVadd.float_array_strategy_proof.CheckedFloatArray.
Require Import QcpRvv32.rvv_arrays_strategy_goal QcpRvv32.rvv_arrays_strategy_proof.
Module ActualStrategy8 : QcpRvv32.rvv_arrays_strategy_goal.rvv_arrays_Strategy_Correct := QcpRvv32.rvv_arrays_strategy_proof.CheckedRvvArray.
Require Import QcpRvv32.rvv_store_strategy_goal QcpRvv32.rvv_store_strategy_proof.
Module ActualStrategy9 : QcpRvv32.rvv_store_strategy_goal.rvv_store_Strategy_Correct := QcpRvv32.rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Require Import QcpRvv32.rvv_loop_strategy_goal QcpRvv32.rvv_loop_strategy_proof.
Module ActualStrategy10 : QcpRvv32.rvv_loop_strategy_goal.rvv_loop_Strategy_Correct := QcpRvv32.rvv_loop_strategy_proof.CheckedRvvLoopStrategy.
Require Import VaddComparator.comparator_strategy_goal VaddComparator.comparator_strategy_proof.
Module ActualStrategy11 : VaddComparator.comparator_strategy_goal.comparator_Strategy_Correct := VaddComparator.comparator_strategy_proof.CheckedComparatorStrategies.
Require Import VaddWrapper.wrapper_strategy_goal VaddWrapper.wrapper_strategy_proof.
Module ActualStrategy12 : VaddWrapper.wrapper_strategy_goal.wrapper_Strategy_Correct := VaddWrapper.wrapper_strategy_proof.CheckedWrapperStrategy.
