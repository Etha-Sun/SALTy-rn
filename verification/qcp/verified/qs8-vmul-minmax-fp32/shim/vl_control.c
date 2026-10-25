#include "vl_control.h"
size_t qm_setvl_positive(size_t n)
/*@ Require 0<n && emp
 Ensure qm_vl_allowed(n,__return) && 1<=__return && __return<=32 && __return<=n && emp */
{
 size_t vl=__riscv_vsetvl_e8m2(n);
 return vl;
}
