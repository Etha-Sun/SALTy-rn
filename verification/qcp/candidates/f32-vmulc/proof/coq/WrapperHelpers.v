From VMulcWrapper Require Import WrapperRead_goal WrapperNan_goal WrapperCompare_goal.
Require Import QcpVadd.array_read_checked NanBridge.bridge_checked VaddComparator.comparator_checked.
Module Read : WrapperRead_goal.VC_Correct := QcpVadd.array_read_checked.CheckedArrayRead.
Module Nan : WrapperNan_goal.VC_Correct := NanBridge.bridge_checked.Checked.
Module Compare : WrapperCompare_goal.VC_Correct := VaddComparator.comparator_checked.CheckedComparator.
