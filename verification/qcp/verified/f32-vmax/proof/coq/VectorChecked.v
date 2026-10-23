From FMax Require Import vector_primitives_goal VectorScalarChecked VectorNeonChecked VectorMaxChecked VectorAddChecked VectorMergeChecked.
Module CheckedVector : vector_primitives_goal.VC_Correct.
Include CheckedVectorScalar.
Include CheckedVectorNeon.
Include CheckedVectorMax.
Include CheckedVectorAdd.
Include CheckedVectorMerge.
End CheckedVector.
