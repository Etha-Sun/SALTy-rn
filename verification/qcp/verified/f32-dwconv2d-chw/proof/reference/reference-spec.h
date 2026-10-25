#ifndef F32_DWCONV2D_CHW_SPEC_H
#define F32_DWCONV2D_CHW_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params);
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params);
/* The original padding_top assertion fixes it to 1. Contiguous CHW plane. */

/*@ requires h: 0<h<=SIZE_MAX/32;
    requires w: 0<w<=SIZE_MAX/32;
    requires extent: h*w+3<=SIZE_MAX/8;
    requires input: \valid_read(input+(0..h*w+2));
    requires zero: \valid_read(zero+(0..w+2));
    requires weights: \valid_read(weights+(0..9));
    requires left: \valid(left+(0..h*w-1));
    requires right: \valid(right+(0..h*w-1));
    requires disjoint: \separated(input+(0..h*w+2),zero+(0..w+2),weights+(0..9),left+(0..h*w-1),right+(0..h*w-1));
    terminates \true;
    assigns left[0..h*w-1],right[0..h*w-1],errno;
    ensures equal: \result==1;
*/
int equivalent(size_t h,size_t w,const float *input,const float *weights,const float *zero,float *left,float *right,float lower,float upper);
#endif
