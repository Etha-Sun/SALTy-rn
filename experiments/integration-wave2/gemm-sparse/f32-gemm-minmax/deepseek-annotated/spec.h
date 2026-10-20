#ifndef F32_GEMM_MINMAX_SPEC_H
#define F32_GEMM_MINMAX_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params);
void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params);
/* Canonical contiguous row layout; NR8 packed weights; all 4 input/output
   rows allocated even when mr<4. Observation includes only active mr*nc. */

/*@ requires mr: 1<=mr<=4;
    requires nc: 0<nc<=SIZE_MAX/32;
    requires k: 0<k<=SIZE_MAX/32;
    requires weights_extent: ((nc+7)/8)*(k+1)*8<=SIZE_MAX/8;
    requires output_extent: 4*nc<=SIZE_MAX/8;
    requires a: \valid_read(a+(0..4*k-1));
    requires w: \valid_read(w+(0..((nc+7)/8)*(k+1)*8-1));
    requires left: \valid(left+(0..4*nc-1));
    requires right: \valid(right+(0..4*nc-1));
    requires disjoint: \separated(a+(0..4*k-1),w+(0..((nc+7)/8)*(k+1)*8-1),left+(0..4*nc-1),right+(0..4*nc-1));
    terminates \true;
    assigns left[0..4*nc-1],right[0..4*nc-1],errno;
    ensures equal: \result==1;
*/
int equivalent(size_t mr,size_t nc,size_t k,const float *a,const float *w,float *left,float *right,float lower,float upper);
#endif
