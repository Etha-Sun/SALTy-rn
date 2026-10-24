#include "output_vector.h"
void vst1_s32(int32_t *p,int32x2_t a)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) Require 0<=idx && idx+2<=count && p==base+idx*4 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && IntArray::full(base,count,L) * store(&(a.s0),int,a0) * store(&(a.s1),int,a1) Ensure IntArray::full(base,count,replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L))) */
{
rdsum_put_i32(p,0,a.s0) /*@ where base=base,count=count,idx=idx,L=L */;
rdsum_put_i32(p,1,a.s1) /*@ where base=base,count=count,idx=idx,L=replace_Znth(idx+0,a0,L) */;
}
