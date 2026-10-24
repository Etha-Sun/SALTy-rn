#ifndef RDSUM_OUTPUT_MODEL_H
#define RDSUM_OUTPUT_MODEL_H
#include "formal_types.h"
/*@ Extern Coq (IntArray::full:Z -> Z -> list Z -> Assertion)
 (IntArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (IntArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (replace_Znth:{A} -> Z -> A -> list A -> list A) */
int32_t rdsum_get_i32(const int32_t *p,size_t i)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && IntArray::full(base,count,L)
 Ensure __return==L[idx+i] && -2147483648<=__return && __return<=2147483647 && IntArray::full(base,count,L) */;
void rdsum_put_i32(int32_t *p,size_t i,int32_t v)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && -2147483648<=v && v<=2147483647 && IntArray::full(base,count,L)
 Ensure IntArray::full(base,count,replace_Znth(idx+i,v,L)) */;
#endif
