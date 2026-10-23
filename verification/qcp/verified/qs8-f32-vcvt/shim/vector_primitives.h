#ifndef QS8_F32_VECTOR_PRIMITIVES_H
#define QS8_F32_VECTOR_PRIMITIVES_H
#include "formal_types.h"
int16x8_t vdupq_n_s16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure store(&(__return.s0),short,x) * store(&(__return.s1),short,x) * store(&(__return.s2),short,x) * store(&(__return.s3),short,x) * store(&(__return.s4),short,x) * store(&(__return.s5),short,x) * store(&(__return.s6),short,x) * store(&(__return.s7),short,x) */
;
#endif
