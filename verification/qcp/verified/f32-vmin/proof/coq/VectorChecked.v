From FMin Require Import vector_primitives_goal VectorScalarChecked VectorNeonChecked VectorMinChecked VectorAddChecked VectorMergeChecked.
Module CheckedVector : vector_primitives_goal.VC_Correct.
Include CheckedVectorScalar.
Include CheckedVectorNeon.
Include CheckedVectorMin.
Include CheckedVectorAdd.
Include CheckedVectorMerge.
End CheckedVector.
