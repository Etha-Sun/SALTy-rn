#ifndef TRANSPOSE_SPEC_H
#define TRANSPOSE_SPEC_H
#include "u32_shim.h"
void test_neon(const uint32_t*,uint32_t*,size_t,size_t,size_t,size_t);
void test_rvv(const uint32_t*,uint32_t*,size_t,size_t,size_t,size_t);
/* Input/output strides are measured in uint32 elements at this interface.
   One readable input pad word permits the original NEON odd-width load.
   Whole output allocations start equal, so unused stride slots are observed too. */
/*@ requires width: 0 < w <= SIZE_MAX/32;
    requires height: 0 < h <= SIZE_MAX/32;
    requires input_stride: w <= is <= SIZE_MAX/8;
    requires output_stride: h <= os <= SIZE_MAX/8;
    requires input_extent: h*is+1 <= SIZE_MAX/8;
    requires output_extent: w*os <= SIZE_MAX/8;
    requires input_memory: \valid_read(input+(0..h*is));
    requires left_memory: \valid(left+(0..w*os-1));
    requires right_memory: \valid(right+(0..w*os-1));
    requires disjoint: \separated(input+(0..h*is),left+(0..w*os-1),right+(0..w*os-1));
    requires initial: \forall integer i; 0<=i<w*os ==> left[i]==right[i];
    terminates \true;
    assigns left[0..w*os-1],right[0..w*os-1];
    ensures equal: \result == 1;
*/
int equivalent(size_t w,size_t h,size_t is,size_t os,const uint32_t *input,uint32_t *left,uint32_t *right);
#endif
