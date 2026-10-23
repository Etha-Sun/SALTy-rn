#include "vector_primitives.h"
#include "scalar_primitives.h"
int32_t __riscv_vmv_x_s_s32m1_s32(vint32m1_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)  Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) Ensure __return==a0 && emp */
{
return a.s0;
}
