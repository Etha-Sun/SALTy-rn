#ifndef INTEGER_CASE_SPEC_H
#define INTEGER_CASE_SPEC_H
#include "shim.h"
void test_neon(size_t rows,size_t channels,const uint8_t *input,size_t input_stride,const uint8_t *zero,uint32_t *output,const struct xnn_qs8_rsum_params *params);
void test_rvv(size_t rows,size_t channels,const uint8_t *input,size_t input_stride,const uint8_t *zero,uint32_t *output,const struct xnn_qs8_rsum_params *params);
/*@
  requires 0<rows<=INT_MAX;
  requires 0<channels<=SIZE_MAX-15;
  requires channels+15<=input_stride<=SIZE_MAX/7;
  requires (rows-1)*input_stride<=SIZE_MAX-channels-15;
  requires \valid_read(input+(0..(rows-1)*input_stride+channels+15-1));
  requires \valid_read(zero+(0..31));
  requires \forall integer j;0<=j<32 ==> zero[j]==0;
  requires \valid_read(initial+(0..channels-1));
  requires \valid_read(params);
  requires \valid(left+(0..channels-1));
  requires \valid(right+(0..channels-1));
  requires \separated(left+(0..channels-1),right+(0..channels-1));
  requires \separated(left+(0..channels-1),input+(0..(rows-1)*input_stride+channels+15-1));
  requires \separated(left+(0..channels-1),zero+(0..31));
  requires \separated(left+(0..channels-1),initial+(0..channels-1));
  requires \separated(left+(0..channels-1),params);
  requires \separated(right+(0..channels-1),input+(0..(rows-1)*input_stride+channels+15-1));
  requires \separated(right+(0..channels-1),zero+(0..31));
  requires \separated(right+(0..channels-1),initial+(0..channels-1));
  requires \separated(right+(0..channels-1),params);
  terminates \true;
  assigns left[0..channels-1],right[0..channels-1];
  ensures equal: \result==1;
*/
int equivalent(size_t rows,size_t channels,const uint8_t *input,size_t input_stride,const uint8_t *zero,const uint32_t *initial,uint32_t *left,uint32_t *right,const struct xnn_qs8_rsum_params *params);
#endif
