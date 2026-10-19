#ifndef INTEGER_CASE_SPEC_H
#define INTEGER_CASE_SPEC_H
#include "shim.h"
void test_neon(size_t batch, const float* input, uint16_t* output, const void* params);
void test_rvv(size_t batch, const float* input, uint16_t* output, const void* params);
/*@
  requires n>0;
  requires n<=SIZE_MAX/4-3;
  requires \valid_read(input+(0..n+3-1));
  requires \valid(left+(0..n-1));
  requires \valid(right+(0..n-1));
  requires \separated(left+(0..n-1),right+(0..n-1));
  requires \separated(left+(0..n-1),input+(0..n+3-1));
  requires \separated(right+(0..n-1),input+(0..n+3-1));
  terminates \true;
  assigns left[0..n-1],right[0..n-1];
  ensures equal: \result==1;
*/
int equivalent(size_t n, const float *input, uint16_t *left, uint16_t *right, const void* params);
#endif
