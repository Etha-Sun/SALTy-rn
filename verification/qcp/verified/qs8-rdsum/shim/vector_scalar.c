#include "vector_scalar.h"
int16_t rdsum_wadd16(int16_t a,int8_t b)
/*@ Require -32768<=a && a<=32767 && -128<=b && b<=127 && emp Ensure __return==rd_wadd16(a,b) && -32768<=__return && __return<=32767 && emp */
{int32_t sum=(int32_t)a+(int32_t)b;return rsum_narrow16(sum);}
int16_t rdsum_active_wadd16(int16_t a,int8_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -128<=b && b<=127 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_active_wadd16(a,b,i,vl) && -32768<=__return && __return<=32767 && emp */
{if(i<vl)return rdsum_wadd16(a,b);return 0;}
int32_t rdsum_active_wadd32(int32_t a,int16_t b,size_t i,size_t vl)
/*@ Require -2147483648<=a && a<=2147483647 && -32768<=b && b<=32767 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_active_wadd32(a,b,i,vl) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return rsum_add_s32(a,b);return 0;}
int32_t rdsum_active_add32(int32_t a,int32_t b,size_t i,size_t vl)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_active_wadd32(a,b,i,vl) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return rsum_add_s32(a,b);return 0;}
int16_t rdsum_splat16(int16_t x,size_t i,size_t vl)
/*@ Require -32768<=x && x<=32767 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_splat(x,i,vl) && -32768<=__return && __return<=32767 && emp */
{if(i<vl)return x;return 0;}
int32_t rdsum_splat32(int32_t x,size_t i,size_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_splat(x,i,vl) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return x;return 0;}
