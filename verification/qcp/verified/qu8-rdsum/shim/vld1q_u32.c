#include "output_vector.h"
uint32x4_t vld1q_u32(const uint32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+4<=count && p==base+idx*4 && UIntArray::full(base,count,L) Ensure UIntArray::full(base,count,L) * store(&(__return.s0),unsigned int,L[idx+0]) * store(&(__return.s1),unsigned int,L[idx+1]) * store(&(__return.s2),unsigned int,L[idx+2]) * store(&(__return.s3),unsigned int,L[idx+3]) */
{
uint32x4_t r;
r.s0=rdsum_get_i32(p,0) /*@ where base=base,count=count,idx=idx,L=L */;
r.s1=rdsum_get_i32(p,1) /*@ where base=base,count=count,idx=idx,L=L */;
r.s2=rdsum_get_i32(p,2) /*@ where base=base,count=count,idx=idx,L=L */;
r.s3=rdsum_get_i32(p,3) /*@ where base=base,count=count,idx=idx,L=L */;
return r;
}
