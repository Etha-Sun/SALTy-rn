From ExpMinusMax Require Export rvv_unit_goal RvvFinalNonMemoryChecked RvvMemory RvvWhichChecked.
Module CheckedRvvKernel:ExpMinusMax.rvv_unit_goal.VC_Correct.
 Include RvvFinalNonMemoryChecked.CheckedFinalRvvNonMemory.
 Include RvvMemory.CheckedRvvMemory.
 Include RvvWhichChecked.CheckedRvvWhich.
End CheckedRvvKernel.
Module ExactSecond:ExpMinusMax.rvv_unit_goal.VC_Correct:=CheckedRvvKernel.
