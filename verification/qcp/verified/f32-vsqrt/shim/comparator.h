#include "model.h"
/*@ Import Coq Require Import VaddComparator.ComparatorLogic */
/*@ Extern Coq (outputs_related : list fp32 -> list fp32 -> Prop) (same_value : fp32 -> fp32 -> Prop) */
int compare_outputs(size_t n,const float*left,const float*right)
/*@ With (L:list fp32)(R:list fp32) Require 0<n && n<=4611686018427387903 && outputs_related(L,R) && FloatArray::full(left,n,L)*FloatArray::full(right,n,R) Ensure __return==1 && FloatArray::full(left,n,L)*FloatArray::full(right,n,R) */;
