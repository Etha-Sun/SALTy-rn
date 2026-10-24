#include "output_vector.h"
uint32x2_t vld1_s32(const uint32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+2<=count && p==base+idx*4 && UIntArray::full(base,count,L) Ensure UIntArray::full(base,count,L) * store(&(__return.s0),unsigned int,L[idx+0]) * store(&(__return.s1),unsigned int,L[idx+1]) */
{
uint32x2_t r;
r.s0=rdsum_get_i32(p,0) /*@ where base=base,count=count,idx=idx,L=L */;
r.s1=rdsum_get_i32(p,1) /*@ where base=base,count=count,idx=idx,L=L */;
return r;
}
