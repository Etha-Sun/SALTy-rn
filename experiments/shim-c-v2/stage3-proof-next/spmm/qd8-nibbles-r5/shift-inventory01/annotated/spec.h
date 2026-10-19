#ifndef QD8_F32_QC4W_GEMM_MINMAX_SPEC_H
#define QD8_F32_QC4W_GEMM_MINMAX_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* restrict a,
    size_t a_stride,
    const void* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_qc4w_minmax_params* restrict params,
    const struct xnn_qd8_quantization_params* restrict quantization_params);
void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* restrict a,
    size_t a_stride,
    const void* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_qc4w_minmax_params* restrict params,
    const struct xnn_qd8_quantization_params* restrict quantization_params);
/* Original mr=1; fixed NR16 qc4w packed ABI, kc rounded to two bytes.
   Packed int32/float read alignment/effective type requires model bridging. */

/*@ requires nc: 0<nc<=SIZE_MAX/64;
    requires k: 0<k<=SIZE_MAX/64;
    requires weight_extent: ((nc+15)/16)*(192+((k+1)/2)*16)<=SIZE_MAX/8;
    requires input: \valid_read(input+(0..((k+1)/2)*2+6));
    requires packed_alignment: (uintptr_t)weights%4==0;
    requires weights: \valid_read((const unsigned char*)weights+(0..((nc+15)/16)*(192+((k+1)/2)*16)-1));
    requires left: \valid(left+(0..nc-1));
    requires right: \valid(right+(0..nc-1));
    requires disjoint: \separated(input+(0..((k+1)/2)*2+6),(const unsigned char*)weights+(0..((nc+15)/16)*(192+((k+1)/2)*16)-1),left+(0..nc-1),right+(0..nc-1));
    terminates \true;
    assigns left[0..nc-1],right[0..nc-1],errno;
    ensures equal: \result==1;
*/
int equivalent(size_t nc,size_t k,const int8_t *input,const void *weights,float *left,float *right,int32_t zero_point,float inv_scale,float lower,float upper);
#endif
