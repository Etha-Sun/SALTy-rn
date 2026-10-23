From QcpVadd Require Import array_read_checked.
From NanBridge Require Import bridge_checked.
From VaddComparator Require Import comparator_checked.
From VCMul.read Require Import array_read_goal.
From VCMul.bridge Require Import bridge_goal.
From VCMul.comparator Require Import comparator_goal.
From VCMul.wrapper Require Import wrapper_goal.
From VCMul Require Import WrapperChecked.
Module ReadGate : VCMul.read.array_read_goal.VC_Correct := QcpVadd.array_read_checked.CheckedArrayRead.
Module BridgeGate : VCMul.bridge.bridge_goal.VC_Correct := NanBridge.bridge_checked.Checked.
Module CompareGate : VCMul.comparator.comparator_goal.VC_Correct := VaddComparator.comparator_checked.CheckedComparator.
Module CallerGate : VCMul.wrapper.wrapper_goal.VC_Correct := VCMul.WrapperChecked.CheckedWrapper.
