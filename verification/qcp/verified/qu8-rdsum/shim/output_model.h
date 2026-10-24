#ifndef RDSUM_OUTPUT_MODEL_H
#define RDSUM_OUTPUT_MODEL_H
#include "formal_types.h"
/*@ Extern Coq (UIntArray::full:Z -> Z -> list Z -> Assertion)
 (UIntArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (UIntArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (replace_Znth:{A} -> Z -> A -> list A -> list A) */
uint32_t rdsum_get_i32(const uint32_t *p,size_t i)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && UIntArray::full(base,count,L)
 Ensure __return==L[idx+i] && 0<=__return && __return<=4294967295 && UIntArray::full(base,count,L) */;
void rdsum_put_i32(uint32_t *p,size_t i,uint32_t v)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && 0<=v && v<=4294967295 && UIntArray::full(base,count,L)
 Ensure UIntArray::full(base,count,replace_Znth(idx+i,v,L)) */;
#endif
