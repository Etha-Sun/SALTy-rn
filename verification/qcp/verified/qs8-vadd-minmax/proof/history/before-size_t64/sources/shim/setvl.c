#include "setvl.h"
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && emp
 Ensure __return==qa_vl(n) && 0<=__return && __return<=32 && __return<=n && (n==0 || 0<__return) && emp */
{if(n<32)return n;return 32;}
