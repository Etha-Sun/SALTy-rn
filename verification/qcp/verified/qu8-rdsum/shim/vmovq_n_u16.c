#include "vector_primitives.h"
uint16x8_t vmovq_n_u16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure store(&(__return.s0),unsigned short,x) * store(&(__return.s1),unsigned short,x) * store(&(__return.s2),unsigned short,x) * store(&(__return.s3),unsigned short,x) * store(&(__return.s4),unsigned short,x) * store(&(__return.s5),unsigned short,x) * store(&(__return.s6),unsigned short,x) * store(&(__return.s7),unsigned short,x) */
{
uint16x8_t r;
r.s0=x;
r.s1=x;
r.s2=x;
r.s3=x;
r.s4=x;
r.s5=x;
r.s6=x;
r.s7=x;
return r;
}
