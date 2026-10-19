#ifndef INTEGER_CASE_SPEC_H
#define INTEGER_CASE_SPEC_H
#include "shim.h"
void test_neon(size_t batch, const int8_t* input, float* output, const struct xnn_qs8_f32_cvt_params* restrict params);
void test_rvv(size_t batch, const int8_t* input, float* output, const struct xnn_qs8_f32_cvt_params* restrict params);
/*@
  requires n>0;
  requires n<=SIZE_MAX/4-7;
  requires \valid_read(input+(0..n+7-1));
  requires \valid(left+(0..n-1));
  requires \valid(right+(0..n-1));
  requires \valid_read(params);
  requires \separated(left+(0..n-1),right+(0..n-1));
  requires \separated(left+(0..n-1),input+(0..n+7-1));
  requires \separated(left+(0..n-1),params);
  requires \separated(right+(0..n-1),input+(0..n+7-1));
  requires \separated(right+(0..n-1),params);
  requires params->scalar.zero_point != INT32_MIN;
  terminates \true;
  assigns left[0..n-1],right[0..n-1];
  ensures equal: \result==1;
*/
int equivalent(size_t n, const int8_t *input, float *left, float *right, const struct xnn_qs8_f32_cvt_params* params);
#endif
