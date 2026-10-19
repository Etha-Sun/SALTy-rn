#ifndef VCMUL_SPEC_H
#define VCMUL_SPEC_H
#include "complex_fp.h"
void test_neon(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
void test_rvv(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
/* Real and imaginary halves each contain n floats; the original NEON tail
   loads at most three extra float elements. Numeric-or-both-NaN observation. */
/*@ requires length: 0<n<=SIZE_MAX/16-3;
    requires a_memory: \valid_read(a+(0..2*n+2));
    requires b_memory: \valid_read(b+(0..2*n+2));
    requires left_memory: \valid(left+(0..2*n-1));
    requires right_memory: \valid(right+(0..2*n-1));
    requires a_disjoint: \separated(a+(0..2*n+2),left+(0..2*n-1),right+(0..2*n-1));
    requires b_disjoint: \separated(b+(0..2*n+2),left+(0..2*n-1),right+(0..2*n-1));
    terminates \true;
    assigns left[0..2*n-1],right[0..2*n-1];
    ensures equal: \result==1;
*/
int equivalent(size_t n,const float *a,const float *b,float *left,float *right);
#endif
