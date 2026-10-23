#ifndef RSUM_ARRAY_MODEL_H
#define RSUM_ARRAY_MODEL_H
#include "formal_types.h"
/*@ Import Coq Require Import Qs8Rsum.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (rs_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "byte_arrays.strategies" */
int8_t rsum_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==rs_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
#endif
