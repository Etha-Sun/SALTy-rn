From QcpVadd Require Import array_read_checked.
From NanBridge Require Import bridge_checked.
From VaddComparator Require Import comparator_checked.
From VLRelu.read Require Import array_read_goal.
From VLRelu.bridge Require Import bridge_goal.
From VLRelu.comparator Require Import comparator_goal.
From VLRelu.wrapper Require Import wrapper_goal.
From VLRelu Require Import WrapperChecked.
Module ReadGate : VLRelu.read.array_read_goal.VC_Correct := QcpVadd.array_read_checked.CheckedArrayRead.
Module BridgeGate : VLRelu.bridge.bridge_goal.VC_Correct := NanBridge.bridge_checked.Checked.
Module CompareGate : VLRelu.comparator.comparator_goal.VC_Correct := VaddComparator.comparator_checked.CheckedComparator.
Module CallerGate : VLRelu.wrapper.wrapper_goal.VC_Correct := VLRelu.WrapperChecked.CheckedWrapper.
