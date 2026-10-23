#include "vector_primitives.h"
#include "scalar_primitives.h"
int16x8_t vmovq_n_s16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure store(&(__return.s0),short,x) * store(&(__return.s1),short,x) * store(&(__return.s2),short,x) * store(&(__return.s3),short,x) * store(&(__return.s4),short,x) * store(&(__return.s5),short,x) * store(&(__return.s6),short,x) * store(&(__return.s7),short,x) */
{
int16x8_t r;
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
