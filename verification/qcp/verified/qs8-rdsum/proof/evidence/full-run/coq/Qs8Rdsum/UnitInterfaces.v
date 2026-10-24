From Qs8Rdsum Require Import FrontendBridge LoopCompatibility ControlLoopFacts MemoryAliasFacts.
Require Import Qs8Rdsum.scalar_primitives_goal Qs8Rdsum.ScalarChecked.
Module ActualUnit0 : Qs8Rdsum.scalar_primitives_goal.VC_Correct := Qs8Rdsum.ScalarChecked.CheckedScalar.
Require Import Qs8Rdsum.control_primitives_goal Qs8Rdsum.ControlChecked.
Module ActualUnit1 : Qs8Rdsum.control_primitives_goal.VC_Correct := Qs8Rdsum.ControlChecked.CheckedControl.
Require Import Qs8Rdsum.vector_scalar_goal Qs8Rdsum.VectorScalarChecked.
Module ActualUnit2 : Qs8Rdsum.vector_scalar_goal.VC_Correct := Qs8Rdsum.VectorScalarChecked.Checked.
Require Import Qs8Rdsum.vmovq_n_s16_goal Qs8Rdsum.VectorChecked.
Module ActualUnit3 : Qs8Rdsum.vmovq_n_s16_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit0.
Require Import Qs8Rdsum.vdupq_n_s32_goal Qs8Rdsum.VectorChecked.
Module ActualUnit4 : Qs8Rdsum.vdupq_n_s32_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit1.
Require Import Qs8Rdsum.vaddw_s8_goal Qs8Rdsum.VectorChecked.
Module ActualUnit5 : Qs8Rdsum.vaddw_s8_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit2.
Require Import Qs8Rdsum.rdsum_wadd16_low_goal Qs8Rdsum.VectorChecked.
Module ActualUnit6 : Qs8Rdsum.rdsum_wadd16_low_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit3.
Require Import Qs8Rdsum.rdsum_wadd16_high_goal Qs8Rdsum.VectorChecked.
Module ActualUnit7 : Qs8Rdsum.rdsum_wadd16_high_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit4.
Require Import Qs8Rdsum.vaddq_s32_goal Qs8Rdsum.VectorChecked.
Module ActualUnit8 : Qs8Rdsum.vaddq_s32_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit5.
Require Import Qs8Rdsum.rdsum_addlow2_goal Qs8Rdsum.VectorChecked.
Module ActualUnit9 : Qs8Rdsum.rdsum_addlow2_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit6.
Require Import Qs8Rdsum.rdsum_selfext2_goal Qs8Rdsum.VectorChecked.
Module ActualUnit10 : Qs8Rdsum.rdsum_selfext2_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit7.
Require Import Qs8Rdsum.rdsum_lane0_goal Qs8Rdsum.VectorChecked.
Module ActualUnit11 : Qs8Rdsum.rdsum_lane0_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit8.
Require Import Qs8Rdsum.__riscv_vmv_v_x_i16m4_goal Qs8Rdsum.VectorChecked.
Module ActualUnit12 : Qs8Rdsum.__riscv_vmv_v_x_i16m4_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit9.
Require Import Qs8Rdsum.__riscv_vmv_v_x_i32m8_goal Qs8Rdsum.VectorChecked.
Module ActualUnit13 : Qs8Rdsum.__riscv_vmv_v_x_i32m8_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit10.
Require Import Qs8Rdsum.__riscv_vwadd_wv_i16m4_goal Qs8Rdsum.VectorChecked.
Module ActualUnit14 : Qs8Rdsum.__riscv_vwadd_wv_i16m4_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit11.
Require Import Qs8Rdsum.__riscv_vwadd_wv_i32m8_goal Qs8Rdsum.VectorChecked.
Module ActualUnit15 : Qs8Rdsum.__riscv_vwadd_wv_i32m8_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit12.
Require Import Qs8Rdsum.__riscv_vadd_vv_i32m8_goal Qs8Rdsum.VectorChecked.
Module ActualUnit16 : Qs8Rdsum.__riscv_vadd_vv_i32m8_goal.VC_Correct := Qs8Rdsum.VectorChecked.Unit13.
Require Import Qs8Rdsum.read_byte_goal Qs8Rdsum.ReadByteChecked.
Module ActualUnit17 : Qs8Rdsum.read_byte_goal.VC_Correct := Qs8Rdsum.ReadByteChecked.CheckedReadByte.
Require Import Qs8Rdsum.load_scalar_goal Qs8Rdsum.LoadScalarChecked.
Module ActualUnit18 : Qs8Rdsum.load_scalar_goal.VC_Correct := Qs8Rdsum.LoadScalarChecked.CheckedLoadScalar.
Require Import Qs8Rdsum.output_scalar_goal Qs8Rdsum.OutputScalarChecked.
Module ActualUnit19 : Qs8Rdsum.output_scalar_goal.VC_Correct := Qs8Rdsum.OutputScalarChecked.CheckedOutputScalar.
Require Import Qs8Rdsum.output_active_goal Qs8Rdsum.OutputActiveChecked.
Module ActualUnit20 : Qs8Rdsum.output_active_goal.VC_Correct := Qs8Rdsum.OutputActiveChecked.CheckedOutputActive.
Require Import Qs8Rdsum.vl_control_goal Qs8Rdsum.VlChecked.
Module ActualUnit21 : Qs8Rdsum.vl_control_goal.VC_Correct := Qs8Rdsum.VlChecked.CheckedVl.
Require Import Qs8Rdsum.public_compare_goal Qs8Rdsum.CompareChecked.
Module ActualUnit22 : Qs8Rdsum.public_compare_goal.VC_Correct := Qs8Rdsum.CompareChecked.CheckedCompare.
Require Import Qs8Rdsum.wrapper_unit_goal Qs8Rdsum.WrapperChecked.
Module ActualUnit23 : Qs8Rdsum.wrapper_unit_goal.VC_Correct := Qs8Rdsum.WrapperChecked.CheckedWrapper.
Require Import Qs8Rdsum.vld1_s8_goal Qs8Rdsum.LoadsChecked.
Module ActualUnit24 : Qs8Rdsum.vld1_s8_goal.VC_Correct := Qs8Rdsum.LoadsChecked.Unit0.
Require Import Qs8Rdsum.__riscv_vle8_v_i8m2_goal Qs8Rdsum.LoadsChecked.
Module ActualUnit25 : Qs8Rdsum.__riscv_vle8_v_i8m2_goal.VC_Correct := Qs8Rdsum.LoadsChecked.Unit1.
Require Import Qs8Rdsum.vld1_s32_goal Qs8Rdsum.OutputsChecked.
Module ActualUnit26 : Qs8Rdsum.vld1_s32_goal.VC_Correct := Qs8Rdsum.OutputsChecked.Unit0.
Require Import Qs8Rdsum.vst1_s32_goal Qs8Rdsum.OutputsChecked.
Module ActualUnit27 : Qs8Rdsum.vst1_s32_goal.VC_Correct := Qs8Rdsum.OutputsChecked.Unit1.
Require Import Qs8Rdsum.vld1q_s32_goal Qs8Rdsum.OutputsChecked.
Module ActualUnit28 : Qs8Rdsum.vld1q_s32_goal.VC_Correct := Qs8Rdsum.OutputsChecked.Unit2.
Require Import Qs8Rdsum.vst1q_s32_goal Qs8Rdsum.OutputsChecked.
Module ActualUnit29 : Qs8Rdsum.vst1q_s32_goal.VC_Correct := Qs8Rdsum.OutputsChecked.Unit3.
Require Import Qs8Rdsum.__riscv_vle32_v_i32m8_goal Qs8Rdsum.OutputsChecked.
Module ActualUnit30 : Qs8Rdsum.__riscv_vle32_v_i32m8_goal.VC_Correct := Qs8Rdsum.OutputsChecked.Unit4.
Require Import Qs8Rdsum.__riscv_vse32_v_i32m8_goal Qs8Rdsum.OutputsChecked.
Module ActualUnit31 : Qs8Rdsum.__riscv_vse32_v_i32m8_goal.VC_Correct := Qs8Rdsum.OutputsChecked.Unit5.
Require Import Qs8Rdsum.neon_unit_goal Qs8Rdsum.NeonChecked.
Module ActualUnit32 : Qs8Rdsum.neon_unit_goal.VC_Correct := Qs8Rdsum.NeonChecked.CheckedNeon.
Require Import Qs8Rdsum.rvv_unit_goal Qs8Rdsum.RvvChecked.
Module ActualUnit33 : Qs8Rdsum.rvv_unit_goal.VC_Correct := Qs8Rdsum.RvvChecked.CheckedRvv.
Require Import Qs8Rdsum.type_width_goal Qs8Rdsum.Width64Checked.
Module ActualUnit34 : Qs8Rdsum.type_width_goal.VC_Correct := Qs8Rdsum.Width64Checked.CheckedWidth.
