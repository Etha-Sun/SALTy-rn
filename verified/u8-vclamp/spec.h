#ifndef GENERATED_SPEC_H
#define GENERATED_SPEC_H
#include "shim.h"

/*@
  requires 0 < batch <= SIZE_MAX-7;
  requires \valid_read(input+(0..batch+7-1));
  requires \valid(output+(0..batch-1));
  requires \separated(output+(0..batch-1),input+(0..batch+7-1));
  requires \valid_read(params);
  requires \separated(output+(0..batch-1),params);
  requires 0 <= params->scalar.min <= params->scalar.max <= 255;
  terminates \true;
  assigns output[0..batch-1];
*/
void test_neon(
    size_t batch,
    const uint8_t* input,
    uint8_t* output,
    const struct xnn_u8_minmax_params* restrict params) XNN_OOB_READS;

/*@
  requires 0 < batch <= SIZE_MAX-7;
  requires \valid_read(input+(0..batch+7-1));
  requires \valid(output+(0..batch-1));
  requires \separated(output+(0..batch-1),input+(0..batch+7-1));
  requires \valid_read(params);
  requires \separated(output+(0..batch-1),params);
  requires 0 <= params->scalar.min <= params->scalar.max <= 255;
  terminates \true;
  assigns output[0..batch-1];
*/
void test_rvv(
    size_t batch,
    const uint8_t* input,
    uint8_t* output,
    const struct xnn_u8_minmax_params* restrict params) XNN_OOB_READS;

/*@
  requires 0 < n <= SIZE_MAX/1-7;
  requires \valid_read(input+(0..n+7-1));
  requires \valid(left+(0..n-1));
  requires \valid(right+(0..n-1));
  requires \separated(left+(0..n-1),input+(0..n+7-1));
  requires \separated(right+(0..n-1),input+(0..n+7-1));
  requires \separated(left+(0..n-1),right+(0..n-1));
  requires 0 <= lower <= upper <= 255;
  terminates \true;
  assigns left[0..n-1],right[0..n-1];
  ensures equal: \result == 1;
*/
int equivalent(size_t n,const uint8_t *input,uint8_t *left,uint8_t *right,uint32_t lower,uint32_t upper);
#endif
