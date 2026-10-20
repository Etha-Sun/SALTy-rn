#ifndef F32_DWCONV_MINMAX_SPEC_H
#define F32_DWCONV_MINMAX_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params);
void test_rvv(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params);
/* Contiguous outputs and 3 pointers/pixel; no offsets; fixed NR4 packed weights. */

/*@ requires pixels: 0<pixels<=SIZE_MAX/32;
    requires channels: 0<channels<=SIZE_MAX/32;
    requires extent: pixels*channels<=SIZE_MAX/8;
    requires table_extent: 3*pixels<=SIZE_MAX/16;
    requires weights_extent: ((channels+3)/4)*16<=SIZE_MAX/8;
    requires table: \valid_read(input+(0..3*pixels-1));
    requires weights: \valid_read(weights+(0..((channels+3)/4)*16-1));
    requires left: \valid(left+(0..pixels*channels-1));
    requires right: \valid(right+(0..pixels*channels-1));
    requires disjoint: \separated(input+(0..3*pixels-1),weights+(0..((channels+3)/4)*16-1),left+(0..pixels*channels-1),right+(0..pixels*channels-1));
    requires rows: \forall integer j;0<=j<3*pixels ==> \valid_read(input[j]+(0..channels+2));
    requires row_outputs: \forall integer j;0<=j<3*pixels ==> \separated(input[j]+(0..channels+2),left+(0..pixels*channels-1),right+(0..pixels*channels-1));
    terminates \true;
    assigns left[0..pixels*channels-1],right[0..pixels*channels-1],errno;
    ensures equal: \result==1;
*/
int equivalent(size_t pixels,size_t channels,const float **input,const float *weights,float *left,float *right,float lower,float upper);
#endif
