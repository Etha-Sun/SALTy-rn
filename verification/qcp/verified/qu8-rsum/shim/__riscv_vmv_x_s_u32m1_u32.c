#include "vector_primitives.h"
#include "scalar_primitives.h"
uint32_t __riscv_vmv_x_s_u32m1_u32(vuint32m1_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)  Require 0<=a0 && a0<=4294967295 && 0<=a1 && a1<=4294967295 && 0<=a2 && a2<=4294967295 && 0<=a3 && a3<=4294967295 && store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3) Ensure __return==a0 && emp */
{
return a.s0;
}
