#ifndef F32_CONV_HWC2CHW_SPEC_H
#define F32_CONV_HWC2CHW_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params);
void test_rvv(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params);
/* Canonical full output plane, padding_top=1, contiguous CHW outputs.
   w fits signed index arithmetic; other padding/stride profiles remain unproved. */

/*@ requires h: 0<h<=SIZE_MAX/64;
    requires w: 0<w<=INT_MAX/16;
    requires channels: 0<channels<=SIZE_MAX/64;
    requires input_extent: 3*h*w+3<=SIZE_MAX/8;
    requires weights_extent: ((channels+3)/4)*112<=SIZE_MAX/8;
    requires output_extent: channels*((h+1)/2)*((w+1)/2)<=SIZE_MAX/8;
    requires channel_stride_extent: ((h+1)/2)*((w+1)/2)<=SIZE_MAX/32;
    requires input: \valid_read(input+(0..3*h*w+2));
    requires zero: \valid_read(zero+(0..3*w+2));
    requires weights: \valid_read(weights+(0..((channels+3)/4)*112-1));
    requires left: \valid(left+(0..channels*((h+1)/2)*((w+1)/2)-1));
    requires right: \valid(right+(0..channels*((h+1)/2)*((w+1)/2)-1));
    requires disjoint: \separated(input+(0..3*h*w+2),zero+(0..3*w+2),weights+(0..((channels+3)/4)*112-1),left+(0..channels*((h+1)/2)*((w+1)/2)-1),right+(0..channels*((h+1)/2)*((w+1)/2)-1));
    terminates \true;
    assigns left[0..channels*((h+1)/2)*((w+1)/2)-1],right[0..channels*((h+1)/2)*((w+1)/2)-1],errno;
    ensures equal: \result==1;
*/
int equivalent(size_t h,size_t w,size_t channels,const float *input,const float *weights,const float *zero,float *left,float *right,float lower,float upper);
#endif
