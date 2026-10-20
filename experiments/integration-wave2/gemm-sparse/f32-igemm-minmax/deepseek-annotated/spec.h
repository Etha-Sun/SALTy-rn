#ifndef F32_IGEMM_MINMAX_SPEC_H
#define F32_IGEMM_MINMAX_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t mr,
    size_t nc,
    size_t kc,
    size_t ks,
    const float** restrict a,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    size_t a_offset,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params);
void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    size_t ks,
    const float** restrict a,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    size_t a_offset,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params);
/* mr=1 is the original assertion; NR8 packed weights; a_offset=0, zero=NULL. */

/*@ requires nc: 0<nc<=SIZE_MAX/32;
    requires k: 0<k<=SIZE_MAX/32;
    requires positions: 0<positions<=SIZE_MAX/32;
    requires weights_extent: ((nc+7)/8)*(1+positions*k)*8<=SIZE_MAX/8;
    requires a: \valid_read(a+(0..positions-1));
    requires w: \valid_read(w+(0..((nc+7)/8)*(1+positions*k)*8-1));
    requires left: \valid(left+(0..nc-1));
    requires right: \valid(right+(0..nc-1));
    requires rows: \forall integer j;0<=j<positions ==> \valid_read(a[j]+(0..k-1));
    requires disjoint: \separated(a+(0..positions-1),w+(0..((nc+7)/8)*(1+positions*k)*8-1),left+(0..nc-1),right+(0..nc-1));
    requires row_outputs: \forall integer j;0<=j<positions ==> \separated(a[j]+(0..k-1),left+(0..nc-1),right+(0..nc-1));
    terminates \true;
    assigns left[0..nc-1],right[0..nc-1],errno;
    ensures equal: \result==1;
*/
int equivalent(size_t nc,size_t k,size_t positions,const float **a,const float *w,float *left,float *right,float lower,float upper);
#endif
