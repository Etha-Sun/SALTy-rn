From Qu8Rdsum Require Import FrontendBridge LoopCompatibility ControlLoopFacts MemoryAliasFacts.
Require Import Qu8Rdsum.scalar_primitives_goal Qu8Rdsum.ScalarChecked.
Module ActualUnit0 : Qu8Rdsum.scalar_primitives_goal.VC_Correct := Qu8Rdsum.ScalarChecked.CheckedScalar.
Require Import Qu8Rdsum.control_primitives_goal Qu8Rdsum.ControlChecked.
Module ActualUnit1 : Qu8Rdsum.control_primitives_goal.VC_Correct := Qu8Rdsum.ControlChecked.CheckedControl.
Require Import Qu8Rdsum.vector_scalar_goal Qu8Rdsum.VectorScalarChecked.
Module ActualUnit2 : Qu8Rdsum.vector_scalar_goal.VC_Correct := Qu8Rdsum.VectorScalarChecked.Checked.
Require Import Qu8Rdsum.vmovq_n_u16_goal Qu8Rdsum.VectorChecked.
Module ActualUnit3 : Qu8Rdsum.vmovq_n_u16_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit0.
Require Import Qu8Rdsum.vdupq_n_u32_goal Qu8Rdsum.VectorChecked.
Module ActualUnit4 : Qu8Rdsum.vdupq_n_u32_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit1.
Require Import Qu8Rdsum.vaddw_u8_goal Qu8Rdsum.VectorChecked.
Module ActualUnit5 : Qu8Rdsum.vaddw_u8_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit2.
Require Import Qu8Rdsum.rdsum_wadd8_low16_goal Qu8Rdsum.VectorChecked.
Module ActualUnit6 : Qu8Rdsum.rdsum_wadd8_low16_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit3.
Require Import Qu8Rdsum.rdsum_wadd16_low_goal Qu8Rdsum.VectorChecked.
Module ActualUnit7 : Qu8Rdsum.rdsum_wadd16_low_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit4.
Require Import Qu8Rdsum.rdsum_wadd16_high_goal Qu8Rdsum.VectorChecked.
Module ActualUnit8 : Qu8Rdsum.rdsum_wadd16_high_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit5.
Require Import Qu8Rdsum.vaddq_u32_goal Qu8Rdsum.VectorChecked.
Module ActualUnit9 : Qu8Rdsum.vaddq_u32_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit6.
Require Import Qu8Rdsum.rdsum_addlow2_goal Qu8Rdsum.VectorChecked.
Module ActualUnit10 : Qu8Rdsum.rdsum_addlow2_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit7.
Require Import Qu8Rdsum.rdsum_selfext2_goal Qu8Rdsum.VectorChecked.
Module ActualUnit11 : Qu8Rdsum.rdsum_selfext2_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit8.
Require Import Qu8Rdsum.rdsum_lane0_goal Qu8Rdsum.VectorChecked.
Module ActualUnit12 : Qu8Rdsum.rdsum_lane0_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit9.
Require Import Qu8Rdsum.__riscv_vmv_v_x_u16m4_goal Qu8Rdsum.VectorChecked.
Module ActualUnit13 : Qu8Rdsum.__riscv_vmv_v_x_u16m4_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit10.
Require Import Qu8Rdsum.__riscv_vmv_v_x_u32m8_goal Qu8Rdsum.VectorChecked.
Module ActualUnit14 : Qu8Rdsum.__riscv_vmv_v_x_u32m8_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit11.
Require Import Qu8Rdsum.__riscv_vwaddu_wv_u16m4_goal Qu8Rdsum.VectorChecked.
Module ActualUnit15 : Qu8Rdsum.__riscv_vwaddu_wv_u16m4_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit12.
Require Import Qu8Rdsum.__riscv_vwaddu_wv_u32m8_goal Qu8Rdsum.VectorChecked.
Module ActualUnit16 : Qu8Rdsum.__riscv_vwaddu_wv_u32m8_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit13.
Require Import Qu8Rdsum.__riscv_vadd_vv_u32m8_goal Qu8Rdsum.VectorChecked.
Module ActualUnit17 : Qu8Rdsum.__riscv_vadd_vv_u32m8_goal.VC_Correct := Qu8Rdsum.VectorChecked.Unit14.
Require Import Qu8Rdsum.read_byte_goal Qu8Rdsum.ReadByteChecked.
Module ActualUnit18 : Qu8Rdsum.read_byte_goal.VC_Correct := Qu8Rdsum.ReadByteChecked.CheckedReadByte.
Require Import Qu8Rdsum.load_scalar_goal Qu8Rdsum.LoadScalarChecked.
Module ActualUnit19 : Qu8Rdsum.load_scalar_goal.VC_Correct := Qu8Rdsum.LoadScalarChecked.CheckedLoadScalar.
Require Import Qu8Rdsum.output_scalar_goal Qu8Rdsum.OutputScalarChecked.
Module ActualUnit20 : Qu8Rdsum.output_scalar_goal.VC_Correct := Qu8Rdsum.OutputScalarChecked.CheckedOutputScalar.
Require Import Qu8Rdsum.output_active_goal Qu8Rdsum.OutputActiveChecked.
Module ActualUnit21 : Qu8Rdsum.output_active_goal.VC_Correct := Qu8Rdsum.OutputActiveChecked.CheckedOutputActive.
Require Import Qu8Rdsum.vl_control_goal Qu8Rdsum.VlChecked.
Module ActualUnit22 : Qu8Rdsum.vl_control_goal.VC_Correct := Qu8Rdsum.VlChecked.CheckedVl.
Require Import Qu8Rdsum.public_compare_goal Qu8Rdsum.CompareChecked.
Module ActualUnit23 : Qu8Rdsum.public_compare_goal.VC_Correct := Qu8Rdsum.CompareChecked.CheckedCompare.
Require Import Qu8Rdsum.wrapper_unit_goal Qu8Rdsum.WrapperChecked.
Module ActualUnit24 : Qu8Rdsum.wrapper_unit_goal.VC_Correct := Qu8Rdsum.WrapperChecked.CheckedWrapper.
Require Import Qu8Rdsum.vld1_u8_goal Qu8Rdsum.LoadsChecked.
Module ActualUnit25 : Qu8Rdsum.vld1_u8_goal.VC_Correct := Qu8Rdsum.LoadsChecked.Unit0.
Require Import Qu8Rdsum.vld1q_u8_goal Qu8Rdsum.LoadsChecked.
Module ActualUnit26 : Qu8Rdsum.vld1q_u8_goal.VC_Correct := Qu8Rdsum.LoadsChecked.Unit1.
Require Import Qu8Rdsum.__riscv_vle8_v_u8m2_goal Qu8Rdsum.LoadsChecked.
Module ActualUnit27 : Qu8Rdsum.__riscv_vle8_v_u8m2_goal.VC_Correct := Qu8Rdsum.LoadsChecked.Unit2.
Require Import Qu8Rdsum.vld1_u32_goal Qu8Rdsum.OutputsChecked.
Module ActualUnit28 : Qu8Rdsum.vld1_u32_goal.VC_Correct := Qu8Rdsum.OutputsChecked.Unit0.
Require Import Qu8Rdsum.vst1_u32_goal Qu8Rdsum.OutputsChecked.
Module ActualUnit29 : Qu8Rdsum.vst1_u32_goal.VC_Correct := Qu8Rdsum.OutputsChecked.Unit1.
Require Import Qu8Rdsum.vld1q_u32_goal Qu8Rdsum.OutputsChecked.
Module ActualUnit30 : Qu8Rdsum.vld1q_u32_goal.VC_Correct := Qu8Rdsum.OutputsChecked.Unit2.
Require Import Qu8Rdsum.vst1q_u32_goal Qu8Rdsum.OutputsChecked.
Module ActualUnit31 : Qu8Rdsum.vst1q_u32_goal.VC_Correct := Qu8Rdsum.OutputsChecked.Unit3.
Require Import Qu8Rdsum.__riscv_vle32_v_u32m8_goal Qu8Rdsum.OutputsChecked.
Module ActualUnit32 : Qu8Rdsum.__riscv_vle32_v_u32m8_goal.VC_Correct := Qu8Rdsum.OutputsChecked.Unit4.
Require Import Qu8Rdsum.__riscv_vse32_v_u32m8_goal Qu8Rdsum.OutputsChecked.
Module ActualUnit33 : Qu8Rdsum.__riscv_vse32_v_u32m8_goal.VC_Correct := Qu8Rdsum.OutputsChecked.Unit5.
Require Import Qu8Rdsum.neon_unit_goal Qu8Rdsum.NeonChecked.
Module ActualUnit34 : Qu8Rdsum.neon_unit_goal.VC_Correct := Qu8Rdsum.NeonChecked.CheckedNeon.
Require Import Qu8Rdsum.rvv_unit_goal Qu8Rdsum.RvvChecked.
Module ActualUnit35 : Qu8Rdsum.rvv_unit_goal.VC_Correct := Qu8Rdsum.RvvChecked.CheckedRvv.
Require Import Qu8Rdsum.type_width_goal Qu8Rdsum.Width64Checked.
Module ActualUnit36 : Qu8Rdsum.type_width_goal.VC_Correct := Qu8Rdsum.Width64Checked.CheckedWidth.
