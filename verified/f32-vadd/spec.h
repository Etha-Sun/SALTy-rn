#ifndef GENERATED_SPEC_H
#define GENERATED_SPEC_H
#include "shim.h"

/*@
  requires 0 < batch <= SIZE_MAX-12;
  requires batch % sizeof(float) == 0;
  requires \valid_read(input_a+(0..batch/sizeof(float)+3-1));
  requires \valid_read(input_b+(0..batch/sizeof(float)+3-1));
  requires \valid(output+(0..batch/sizeof(float)-1));
  requires \separated(output+(0..batch/sizeof(float)-1),input_a+(0..batch/sizeof(float)+3-1));
  requires \separated(output+(0..batch/sizeof(float)-1),input_b+(0..batch/sizeof(float)+3-1));
  requires params != \null;
  terminates \true;
  assigns output[0..batch/sizeof(float)-1];
*/
void test_neon(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params) XNN_OOB_READS;

/*@
  requires 0 < batch <= SIZE_MAX-12;
  requires batch % sizeof(float) == 0;
  requires \valid_read(input_a+(0..batch/sizeof(float)+3-1));
  requires \valid_read(input_b+(0..batch/sizeof(float)+3-1));
  requires \valid(output+(0..batch/sizeof(float)-1));
  requires \separated(output+(0..batch/sizeof(float)-1),input_a+(0..batch/sizeof(float)+3-1));
  requires \separated(output+(0..batch/sizeof(float)-1),input_b+(0..batch/sizeof(float)+3-1));
  requires params != \null;
  terminates \true;
  assigns output[0..batch/sizeof(float)-1];
*/
void test_rvv(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params);

/*@
  requires 0 < n <= SIZE_MAX/4-3;
  requires \valid_read(input_a+(0..n+3-1));
  requires \valid_read(input_b+(0..n+3-1));
  requires \valid(left+(0..n-1));
  requires \valid(right+(0..n-1));
  requires \separated(left+(0..n-1),input_a+(0..n+3-1));
  requires \separated(right+(0..n-1),input_a+(0..n+3-1));
  requires \separated(left+(0..n-1),input_b+(0..n+3-1));
  requires \separated(right+(0..n-1),input_b+(0..n+3-1));
  requires \separated(left+(0..n-1),right+(0..n-1));
  terminates \true;
  assigns left[0..n-1],right[0..n-1];
  ensures equal: \result == 1;
*/
int equivalent(size_t n,const float *input_a,const float *input_b,float *left,float *right);
#endif
