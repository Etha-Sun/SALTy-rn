#ifndef GENERATED_SPEC_H
#define GENERATED_SPEC_H
#include "shim.h"

/*@
  requires 0 < batch <= SIZE_MAX-15;
  requires \valid_read(input+(0..batch+15-1));
  requires \valid(output);
  requires \separated(output,input+(0..batch+15-1));
  requires params != \null;
  terminates \true;
  assigns *output;
*/
void test_neon(
    size_t batch,
    const uint8_t* input,
    uint32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS;

/*@
  requires 0 < batch <= SIZE_MAX-15;
  requires \valid_read(input+(0..batch+15-1));
  requires \valid(output);
  requires \separated(output,input+(0..batch+15-1));
  requires params != \null;
  terminates \true;
  assigns *output;
*/
void test_rvv(
    size_t batch,
    const uint8_t* input,
    uint32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS;

/*@
  requires 0 < n <= SIZE_MAX/1-15;
  requires \valid_read(input+(0..n+15-1));
  terminates \true;
  assigns \nothing;
  ensures equal: \result == 1;
*/
int equivalent(size_t n,const uint8_t *input,uint32_t initial);
#endif
