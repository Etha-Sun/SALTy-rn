#include "vector_primitives.h"
#include "scalar_primitives.h"
int32_t vaddvq_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)  Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) Ensure __return==rs_add_s32(rs_add_s32(rs_add_s32(rs_add_s32(0,a0),a1),a2),a3) && emp */
{
int32_t r=0;
r=rsum_add_s32(r,a.s0);
r=rsum_add_s32(r,a.s1);
r=rsum_add_s32(r,a.s2);
r=rsum_add_s32(r,a.s3);
return r;
}
