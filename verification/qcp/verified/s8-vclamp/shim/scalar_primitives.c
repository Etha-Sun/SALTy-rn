#include "types_def.h"
/*@ Extern Coq (s8_min:Z -> Z -> Z) (s8_max:Z -> Z -> Z)
               (s8_narrow:Z -> Z) */

int8_t qcp_s8_min(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
    Ensure __return == s8_min(a,b) && emp */
{
  if(a<b)return a;
  return b;
}
int8_t qcp_s8_max(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
    Ensure __return == s8_max(a,b) && emp */
{
  if(a>b)return a;
  return b;
}
int8_t qcp_s8_narrow(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
    Ensure __return == s8_narrow(x) && emp */
{ return (int8_t)x; }
size_t __riscv_vsetvl_e8m8(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp
    Ensure ((n<128 && __return==n) || (128<=n && __return==128)) && emp */
{
  if(n<128)return n;
  return 128;
}
