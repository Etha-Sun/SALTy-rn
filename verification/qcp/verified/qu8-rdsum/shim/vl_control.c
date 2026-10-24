#include "vl_model.h"
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp
 Ensure __return==rd_vl(n) && 0<=__return && __return<=32 && emp */
{if(n<32)return n;return 32;}
void qcp_assert(int c)
/*@ Require c!=0 && emp Ensure emp */
{}
