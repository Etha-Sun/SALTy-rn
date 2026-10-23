#ifndef QCP_S8_ARRAY_MODEL_H
#define QCP_S8_ARRAY_MODEL_H
#include "formal_types.h"
/*@ Import Coq Require Import Qu8Cvt.MemoryModel */
/*@ Extern Coq (UCharArray::full:Z -> Z -> list Z -> Assertion)
 (UCharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::undef_full:Z -> Z -> Assertion)
 (UCharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (UCharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (cvt_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "char_arrays.strategies" */
#endif
