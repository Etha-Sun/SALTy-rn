Require Import ArgmaxPool.neon_unit_goal ArgmaxPool.FinalNeonKernel.
Module ActualUnit0 : ArgmaxPool.neon_unit_goal.VC_Correct := ArgmaxPool.FinalNeonKernel.Confirmed.
Require Import ArgmaxPool.annotated_goal ArgmaxPool.APBlockMainChecked.
Module ActualUnit1 : ArgmaxPool.annotated_goal.VC_Correct := ArgmaxPool.APBlockMainChecked.CheckedMain.
Require Import ArgmaxPool.block32_goal ArgmaxPool.APBlock32Checked.
Module ActualUnit2 : ArgmaxPool.block32_goal.VC_Correct := ArgmaxPool.APBlock32Checked.FullBlock.
Require Import ArgmaxPool.rvv_update_into_goal ArgmaxPool.RvvUpdateIntoChecked.
Module ActualUnit3 : ArgmaxPool.rvv_update_into_goal.VC_Correct := ArgmaxPool.RvvUpdateIntoChecked.CheckedRvvUpdateInto.
Require Import ArgmaxPool.borrowed_consumers_goal ArgmaxPool.BorrowedConsumersChecked.
Module ActualUnit4 : ArgmaxPool.borrowed_consumers_goal.VC_Correct := ArgmaxPool.BorrowedConsumersChecked.ExactBorrowedConsumers.
Require Import ArgmaxPool.rvv_record_consumers_goal ArgmaxPool.RvvRecordConsumersChecked.
Module ActualUnit5 : ArgmaxPool.rvv_record_consumers_goal.VC_Correct := ArgmaxPool.RvvRecordConsumersChecked.Exact.
Require Import ArgmaxPool.read_previous_goal ArgmaxPool.ReadPreviousChecked.
Module ActualUnit6 : ArgmaxPool.read_previous_goal.VC_Correct := ArgmaxPool.ReadPreviousChecked.CheckedReadPrevious.
Require Import ArgmaxPool.read_table_goal ArgmaxPool.ReadTableChecked.
Module ActualUnit7 : ArgmaxPool.read_table_goal.VC_Correct := ArgmaxPool.ReadTableChecked.CheckedReadTable.
Require Import ArgmaxPool.control_unit_goal ArgmaxPool.KernelControlChecked.
Module ActualUnit8 : ArgmaxPool.control_unit_goal.VC_Correct := ArgmaxPool.KernelControlChecked.ExactControl.
Require Import ArgmaxPool.public_caller_goal ArgmaxPool.PublicCallerFull.
Module ActualUnit9 : ArgmaxPool.public_caller_goal.VC_Correct := ArgmaxPool.PublicCallerFull.CheckedPublicBody.
