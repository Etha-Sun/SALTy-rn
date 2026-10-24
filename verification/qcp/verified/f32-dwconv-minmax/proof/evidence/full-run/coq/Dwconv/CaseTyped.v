From Dwconv Require Import StateObservation ProgramTrace PublicModel.
Require Import Dwconv.neon_unit_goal Dwconv.NeonKernelChecked.
Module ActualUnit0 : Dwconv.neon_unit_goal.VC_Correct := Dwconv.NeonKernelChecked.CheckedNeonKernel.
Require Import Dwconv.rvv_unit_goal Dwconv.RvvKernelChecked.
Module ActualUnit1 : Dwconv.rvv_unit_goal.VC_Correct := Dwconv.RvvKernelChecked.CheckedRvvKernel.
Require Import Dwconv.control_goal Dwconv.ControlChecked.
Module ActualUnit2 : Dwconv.control_goal.VC_Correct := Dwconv.ControlChecked.CheckedControl.
Require Import Dwconv.read_table_goal Dwconv.ReadTableChecked.
Module ActualUnit3 : Dwconv.read_table_goal.VC_Correct := Dwconv.ReadTableChecked.CheckedReadTable.
Require Import Dwconv.memory_goal Dwconv.MemoryChecked.
Module ActualUnit4 : Dwconv.memory_goal.VC_Correct := Dwconv.MemoryChecked.CheckedMemory.
Require Import Dwconv.map_probe_goal Dwconv.MapProbeChecked.
Module ActualUnit5 : Dwconv.map_probe_goal.VC_Correct := Dwconv.MapProbeChecked.CheckedMapProbe.
Require Import Dwconv.output_read_goal Dwconv.OutputReadChecked.
Module ActualUnit6 : Dwconv.output_read_goal.VC_Correct := Dwconv.OutputReadChecked.CheckedOutputRead.
Require Import Dwconv.written_read_goal Dwconv.WrittenReadChecked.
Module ActualUnit7 : Dwconv.written_read_goal.VC_Correct := Dwconv.WrittenReadChecked.CheckedWrittenRead.
Require Import Dwconv.observation_goal Dwconv.ObservationChecked.
Module ActualUnit8 : Dwconv.observation_goal.VC_Correct := Dwconv.ObservationChecked.CheckedObservation.
Require Import Dwconv.public_compare_goal Dwconv.CompareChecked.
Module ActualUnit9 : Dwconv.public_compare_goal.VC_Correct := Dwconv.CompareChecked.CheckedCompare.
Require Import Dwconv.public_wrapper_goal Dwconv.WrapperChecked.
Module ActualUnit10 : Dwconv.public_wrapper_goal.VC_Correct := Dwconv.WrapperChecked.CheckedWrapper.
Require Import Dwconv.dw_maps_strategy_goal Dwconv.MapStrategyChecked.
Module ActualStrategy0 : Dwconv.dw_maps_strategy_goal.dw_maps_Strategy_Correct := Dwconv.MapStrategyChecked.CheckedMaps.
Require Import Dwconv.dw_output_strategy_goal Dwconv.OutputStrategyChecked.
Module ActualStrategy1 : Dwconv.dw_output_strategy_goal.dw_output_Strategy_Correct := Dwconv.OutputStrategyChecked.CheckedOutputStrategy.
