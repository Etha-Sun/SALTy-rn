#ifndef F32_RADDSTOREEXPMINUSMAX_SPEC_H
#define F32_RADDSTOREEXPMINUSMAX_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t batch,
    const float* input,
    const float* max,
    float* output,
    float* sum,
    const void* params);
void test_rvv(size_t batch,const float *input,const float *max,float *output,float *sum,const void *params);
/* Both element outputs and the final reduction are observed; no ULP tolerance. */

/*@ requires length: 0<n<=SIZE_MAX/16-3;
    requires input: \valid_read(input+(0..n+2));
    requires left: \valid(left+(0..n-1));
    requires right: \valid(right+(0..n-1));
    requires sum_left: \valid(sum_left);
    requires sum_right: \valid(sum_right);
    requires disjoint: \separated(input+(0..n+2),left+(0..n-1),right+(0..n-1),sum_left,sum_right);
    terminates \true;
    assigns left[0..n-1],right[0..n-1],*sum_left,*sum_right,errno;
    ensures equal: \result==1;
*/
int equivalent(size_t n,const float *input,float maximum,float *left,float *right,float *sum_left,float *sum_right);
#endif
