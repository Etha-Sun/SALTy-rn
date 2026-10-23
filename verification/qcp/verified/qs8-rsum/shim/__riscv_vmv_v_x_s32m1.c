#include "vector_primitives.h"
#include "scalar_primitives.h"
vint32m1_t __riscv_vmv_v_x_s32m1(int32_t x,size_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=vl && vl<=4 && emp Ensure store(&(__return.s0),int,rs_splat_s32(x,0,vl)) * store(&(__return.s1),int,rs_splat_s32(x,1,vl)) * store(&(__return.s2),int,rs_splat_s32(x,2,vl)) * store(&(__return.s3),int,rs_splat_s32(x,3,vl)) */
{
vint32m1_t r;
r.s0=rsum_splat_s32(x,0,vl);
r.s1=rsum_splat_s32(x,1,vl);
r.s2=rsum_splat_s32(x,2,vl);
r.s3=rsum_splat_s32(x,3,vl);
return r;
}
