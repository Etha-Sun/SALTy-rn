#include "vl.h"
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==rs_vl(n) && emp */
{if(n<32)return n;return 32;}
size_t __riscv_vsetvlmax_e32m8(void)
/*@ Require emp Ensure __return==32 && emp */
{return 32;}
size_t __riscv_vsetvlmax_e32m1(void)
/*@ Require emp Ensure __return==4 && emp */
{return 4;}
