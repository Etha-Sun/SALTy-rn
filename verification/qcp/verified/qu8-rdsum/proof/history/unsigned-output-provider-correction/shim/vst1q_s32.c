#include "output_vector.h"
void vst1q_s32(uint32_t *p,uint32x4_t a)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require 0<=idx && idx+4<=count && p==base+idx*4 && 0<=a0 && a0<=4294967295 && 0<=a1 && a1<=4294967295 && 0<=a2 && a2<=4294967295 && 0<=a3 && a3<=4294967295 && UIntArray::full(base,count,L) * store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3) Ensure UIntArray::full(base,count,replace_Znth(idx+3,a3,replace_Znth(idx+2,a2,replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L))))) */
{
rdsum_put_i32(p,0,a.s0) /*@ where base=base,count=count,idx=idx,L=L */;
rdsum_put_i32(p,1,a.s1) /*@ where base=base,count=count,idx=idx,L=replace_Znth(idx+0,a0,L) */;
rdsum_put_i32(p,2,a.s2) /*@ where base=base,count=count,idx=idx,L=replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L)) */;
rdsum_put_i32(p,3,a.s3) /*@ where base=base,count=count,idx=idx,L=replace_Znth(idx+2,a2,replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L))) */;
}
