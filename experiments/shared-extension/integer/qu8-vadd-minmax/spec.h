#ifndef INTEGER_CASE_SPEC_H
#define INTEGER_CASE_SPEC_H
#include "shim.h"
void test_neon(size_t batch, const uint8_t* input_a, const uint8_t* input_b, uint8_t* output, const struct xnn_qu8_add_minmax_params* restrict params);
void test_rvv(size_t batch, const uint8_t* input_a, const uint8_t* input_b, uint8_t* output, const struct xnn_qu8_add_minmax_params* restrict params);
/*@
  requires n>0;
  requires n<=SIZE_MAX/1-7;
  requires \valid_read(input_a+(0..n+7-1));
  requires \valid_read(input_b+(0..n+7-1));
  requires \valid(left+(0..n-1));
  requires \valid(right+(0..n-1));
  requires \valid_read(params);
  requires \separated(left+(0..n-1),right+(0..n-1));
  requires \separated(left+(0..n-1),input_a+(0..n+7-1));
  requires \separated(left+(0..n-1),input_b+(0..n+7-1));
  requires \separated(left+(0..n-1),params);
  requires \separated(right+(0..n-1),input_a+(0..n+7-1));
  requires \separated(right+(0..n-1),input_b+(0..n+7-1));
  requires \separated(right+(0..n-1),params);
  requires params->scalar.shift != INT32_MIN;
  terminates \true;
  assigns left[0..n-1],right[0..n-1];
  ensures equal: \result==1;
*/
int equivalent(size_t n, const uint8_t *input_a, const uint8_t *input_b, uint8_t *left, uint8_t *right, const struct xnn_qu8_add_minmax_params* params);
#endif
