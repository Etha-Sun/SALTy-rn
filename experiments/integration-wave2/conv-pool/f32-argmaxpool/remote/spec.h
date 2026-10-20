#ifndef F32_ARGMAXPOOL_SPEC_H
#define F32_ARGMAXPOOL_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t output_pixels,
    size_t pooling_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    uint32_t* index,
    size_t input_increment,
    size_t output_increment,
    size_t index_increment);
void test_rvv(
    size_t output_pixels,
    size_t pooling_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    uint32_t* index,
    size_t input_increment,
    size_t output_increment,
    size_t index_increment);
/* Contiguous output pixels and pointer table; no input offset. k<=INT_MAX
   avoids the original signed loop-counter conversion. All floats allowed. */

/*@ requires pixels: 0<pixels<=SIZE_MAX/32;
    requires kernel: 0<k<=INT_MAX;
    requires channels: 0<channels<=SIZE_MAX/32;
    requires table_extent: pixels*k<=SIZE_MAX/16;
    requires output_extent: pixels*channels+3<=SIZE_MAX/8;
    requires table: \valid_read(input+(0..pixels*k-1));
    requires left: \valid(left+(0..pixels*channels+2));
    requires right: \valid(right+(0..pixels*channels+2));
    requires outputs: \separated(left+(0..pixels*channels+2),right+(0..pixels*channels+2),input+(0..pixels*k-1));
    requires rows: \forall integer j;0<=j<pixels*k ==> \valid_read(input[j]+(0..channels+2));
    requires inputs: \forall integer j;0<=j<pixels*k ==> \separated(input[j]+(0..channels+2),left+(0..pixels*channels+2),right+(0..pixels*channels+2));
    requires li: \valid(li+(0..pixels*channels-1));
    requires ri: \valid(ri+(0..pixels*channels-1));
    requires index_outputs: \separated(li+(0..pixels*channels-1),ri+(0..pixels*channels-1),left+(0..pixels*channels+2),right+(0..pixels*channels+2),input+(0..pixels*k-1));
    requires index_inputs: \forall integer j;0<=j<pixels*k ==> \separated(input[j]+(0..channels+2),li+(0..pixels*channels-1),ri+(0..pixels*channels-1));
    terminates \true;
    assigns left[0..pixels*channels+2],right[0..pixels*channels+2],li[0..pixels*channels-1],ri[0..pixels*channels-1];
    ensures equal: \result==1;
*/
int equivalent(size_t pixels,size_t k,size_t channels,const float **input,float *left,float *right,uint32_t *li,uint32_t *ri);
#endif
