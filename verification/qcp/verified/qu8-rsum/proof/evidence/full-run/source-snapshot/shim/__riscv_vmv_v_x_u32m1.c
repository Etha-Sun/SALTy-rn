#include "vector_primitives.h"
#include "scalar_primitives.h"
vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t vl)
/*@ Require 0<=x && x<=4294967295 && 0<=vl && vl<=4 && emp Ensure store(&(__return.s0),unsigned int,rs_splat_u32(x,0,vl)) * store(&(__return.s1),unsigned int,rs_splat_u32(x,1,vl)) * store(&(__return.s2),unsigned int,rs_splat_u32(x,2,vl)) * store(&(__return.s3),unsigned int,rs_splat_u32(x,3,vl)) */
{
vuint32m1_t r;
r.s0=rsum_splat_u32(x,0,vl);
r.s1=rsum_splat_u32(x,1,vl);
r.s2=rsum_splat_u32(x,2,vl);
r.s3=rsum_splat_u32(x,3,vl);
return r;
}
